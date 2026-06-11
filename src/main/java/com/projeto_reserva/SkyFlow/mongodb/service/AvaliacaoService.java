package com.projeto_reserva.SkyFlow.mongodb.service;

import com.projeto_reserva.SkyFlow.mongodb.document.Avaliacao;
import com.projeto_reserva.SkyFlow.mongodb.dto.AvaliacaoRequestDTO;
import com.projeto_reserva.SkyFlow.mongodb.dto.AvaliacaoResponseDTO;
import com.projeto_reserva.SkyFlow.mongodb.dto.EstatisticaCompanhiaDTO;
import com.projeto_reserva.SkyFlow.mongodb.repository.AvaliacaoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.aggregation.*;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Service de Avaliações — camada de negócio do módulo MongoDB.
 *
 * RESPONSABILIDADES:
 *   1. CRUD de avaliações via AvaliacaoRepository (Spring Data MongoDB)
 *   2. Classificação automática de sentimento pela nota
 *   3. Aggregation Pipeline para estatísticas por companhia
 *
 * ═══════════════════════════════════════════════════════════════
 * AGGREGATION PIPELINE — Como funciona
 * ═══════════════════════════════════════════════════════════════
 * O MongoDB Aggregation Pipeline funciona como uma esteira:
 * cada estágio recebe documentos do anterior, transforma e passa adiante.
 *
 * Pipeline implementado (calcularEstatisticasPorCompanhia):
 *
 *   ESTÁGIO 1 → $group
 *   Agrupa todos os documentos por "companhia" e calcula:
 *     - notaMedia:       $avg de "nota"
 *     - totalAvaliacoes: $sum: 1  (conta cada documento)
 *     - positivoCount:   $sum condicional ($cond) se sentimento == "positivo"
 *     - neutroCount:     $sum condicional se sentimento == "neutro"
 *     - negativoCount:   $sum condicional se sentimento == "negativo"
 *
 *   ESTÁGIO 2 → $sort
 *   Ordena o resultado por notaMedia decrescente (ranking de companhias).
 *
 *   ESTÁGIO 3 → $project
 *   Formata a saída: renomeia _id → "companhia" e exclui _id.
 *
 * Equivalente em MongoDB Shell:
 * ────────────────────────────────────────────────────────────
 * db.avaliacoes.aggregate([
 *   {
 *     $group: {
 *       _id: "$companhia",
 *       notaMedia:        { $avg: "$nota" },
 *       totalAvaliacoes:  { $sum: 1 },
 *       positivoCount:    { $sum: { $cond: [{ $eq: ["$sentimento","positivo"] }, 1, 0] } },
 *       neutroCount:      { $sum: { $cond: [{ $eq: ["$sentimento","neutro"]   }, 1, 0] } },
 *       negativoCount:    { $sum: { $cond: [{ $eq: ["$sentimento","negativo"] }, 1, 0] } }
 *     }
 *   },
 *   { $sort: { notaMedia: -1 } },
 *   {
 *     $project: {
 *       companhia:       "$_id",
 *       notaMedia:       1,
 *       totalAvaliacoes: 1,
 *       positivoCount:   1,
 *       neutroCount:     1,
 *       negativoCount:   1,
 *       _id:             0
 *     }
 *   }
 * ])
 * ────────────────────────────────────────────────────────────
 */
@Service
@RequiredArgsConstructor
public class AvaliacaoService {

    // Repository Spring Data — operações CRUD simples
    private final AvaliacaoRepository avaliacaoRepository;

    // MongoTemplate — necessário para construir o Aggregation Pipeline
    private final MongoTemplate mongoTemplate;

    // ─────────────────────────────────────────────────────────────
    // CRUD BÁSICO
    // ─────────────────────────────────────────────────────────────

    /**
     * Salva nova avaliação no MongoDB.
     * O sentimento é classificado automaticamente antes de persistir.
     */
    public AvaliacaoResponseDTO salvar(AvaliacaoRequestDTO dto) {
        Avaliacao avaliacao = new Avaliacao();
        avaliacao.setVooId(dto.getVooId());
        avaliacao.setCodigoVoo(dto.getCodigoVoo());
        avaliacao.setCompanhia(dto.getCompanhia());
        avaliacao.setNota(dto.getNota());
        avaliacao.setComentario(dto.getComentario());
        avaliacao.setNomePassageiro(dto.getNomePassageiro());
        avaliacao.setData(LocalDate.now());

        // Classifica sentimento automaticamente com base na nota
        avaliacao.setSentimento(classificarSentimento(dto.getNota()));

        Avaliacao salva = avaliacaoRepository.save(avaliacao);
        return toResponseDTO(salva);
    }

    /** Lista todas as avaliações */
    public List<AvaliacaoResponseDTO> listarTodas() {
        return avaliacaoRepository.findAll()
                .stream()
                .map(this::toResponseDTO)
                .collect(Collectors.toList());
    }

    /**
     * Busca avaliações de um voo específico.
     * Ponto de integração: vooId vem do PostgreSQL, avaliação fica no MongoDB.
     */
    public List<AvaliacaoResponseDTO> buscarPorVoo(Long vooId) {
        return avaliacaoRepository.findByVooId(vooId)
                .stream()
                .map(this::toResponseDTO)
                .collect(Collectors.toList());
    }

    /** Busca avaliações de uma companhia */
    public List<AvaliacaoResponseDTO> buscarPorCompanhia(String companhia) {
        return avaliacaoRepository.findByCompanhia(companhia)
                .stream()
                .map(this::toResponseDTO)
                .collect(Collectors.toList());
    }

    /** Remove uma avaliação pelo _id do MongoDB */
    public void deletar(String id) {
        avaliacaoRepository.deleteById(id);
    }

    // ─────────────────────────────────────────────────────────────
    // AGGREGATION PIPELINE — estatísticas gerais por companhia
    // ─────────────────────────────────────────────────────────────

    public List<EstatisticaCompanhiaDTO> calcularEstatisticasPorCompanhia() {

        // ── ESTÁGIO 1: $group ──────────────────────────────────────
        // Agrupa por "companhia" e calcula os acumuladores.
        // ConditionalOperators.when() gera o $cond do MongoDB.
        GroupOperation groupStage = Aggregation.group("companhia")
                // $avg: "$nota"
                .avg("nota").as("notaMedia")
                // $sum: 1  →  conta cada documento do grupo
                .count().as("totalAvaliacoes")
                // $sum condicional: +1 se sentimento == "positivo", senão +0
                .sum(
                    ConditionalOperators
                        .when(Criteria.where("sentimento").is("positivo"))
                        .then(1).otherwise(0)
                ).as("positivoCount")
                // $sum condicional: +1 se sentimento == "neutro"
                .sum(
                    ConditionalOperators
                        .when(Criteria.where("sentimento").is("neutro"))
                        .then(1).otherwise(0)
                ).as("neutroCount")
                // $sum condicional: +1 se sentimento == "negativo"
                .sum(
                    ConditionalOperators
                        .when(Criteria.where("sentimento").is("negativo"))
                        .then(1).otherwise(0)
                ).as("negativoCount");

        // ── ESTÁGIO 2: $sort ───────────────────────────────────────
        // Ordena por notaMedia decrescente → ranking de melhor para pior
        SortOperation sortStage = Aggregation.sort(
                Sort.by(Sort.Direction.DESC, "notaMedia")
        );

        // ── ESTÁGIO 3: $project ────────────────────────────────────
        // Renomeia _id para "companhia" e exclui o _id da saída final
        ProjectionOperation projectStage = Aggregation.project()
                .and("_id").as("companhia")
                .and("notaMedia").as("notaMedia")
                .and("totalAvaliacoes").as("totalAvaliacoes")
                .and("positivoCount").as("positivoCount")
                .and("neutroCount").as("neutroCount")
                .and("negativoCount").as("negativoCount")
                .andExclude("_id");

        // Monta e executa o pipeline na coleção "avaliacoes"
        Aggregation pipeline = Aggregation.newAggregation(
                groupStage,
                sortStage,
                projectStage
        );

        AggregationResults<EstatisticaCompanhiaDTO> resultado =
                mongoTemplate.aggregate(pipeline, "avaliacoes", EstatisticaCompanhiaDTO.class);

        return resultado.getMappedResults();
    }

    // ─────────────────────────────────────────────────────────────
    // AGGREGATION PIPELINE — filtrado por sentimento ($match + $group)
    // ─────────────────────────────────────────────────────────────

    /**
     * Pipeline com $match antes do $group.
     * Demonstra filtragem prévia no MongoDB antes de agregar.
     *
     * Ex: /avaliacoes/estatisticas/negativo
     * → mostra quais companhias têm mais avaliações negativas
     *
     * Equivalente MongoDB Shell:
     * db.avaliacoes.aggregate([
     *   { $match: { sentimento: "negativo" } },
     *   { $group: { _id: "$companhia", totalAvaliacoes: { $sum: 1 }, notaMedia: { $avg: "$nota" } } },
     *   { $sort: { totalAvaliacoes: -1 } }
     * ])
     */
    public List<EstatisticaCompanhiaDTO> calcularEstatisticasPorSentimento(String sentimento) {

        // $match — filtra só documentos com o sentimento informado
        MatchOperation matchStage = Aggregation.match(
                Criteria.where("sentimento").is(sentimento)
        );

        // $group — agrupa por companhia dentro do filtro
        GroupOperation groupStage = Aggregation.group("companhia")
                .count().as("totalAvaliacoes")
                .avg("nota").as("notaMedia");

        // $sort — mais reclamadas/elogiadas primeiro
        SortOperation sortStage = Aggregation.sort(
                Sort.by(Sort.Direction.DESC, "totalAvaliacoes")
        );

        ProjectionOperation projectStage = Aggregation.project()
                .and("_id").as("companhia")
                .and("notaMedia").as("notaMedia")
                .and("totalAvaliacoes").as("totalAvaliacoes")
                .andExclude("_id");

        Aggregation pipeline = Aggregation.newAggregation(
                matchStage, groupStage, sortStage, projectStage
        );

        AggregationResults<EstatisticaCompanhiaDTO> resultado =
                mongoTemplate.aggregate(pipeline, "avaliacoes", EstatisticaCompanhiaDTO.class);

        return resultado.getMappedResults();
    }

    // ─────────────────────────────────────────────────────────────
    // MÉTODOS AUXILIARES PRIVADOS
    // ─────────────────────────────────────────────────────────────

    /**
     * Classifica o sentimento automaticamente pela nota.
     *   nota 4 ou 5 → positivo
     *   nota 3      → neutro
     *   nota 1 ou 2 → negativo
     */
    private String classificarSentimento(Integer nota) {
        if (nota >= 4) return "positivo";
        if (nota == 3) return "neutro";
        return "negativo";
    }

    /** Converte documento MongoDB → DTO de saída da API */
    private AvaliacaoResponseDTO toResponseDTO(Avaliacao av) {
        AvaliacaoResponseDTO dto = new AvaliacaoResponseDTO();
        dto.setId(av.getId());
        dto.setVooId(av.getVooId());
        dto.setCodigoVoo(av.getCodigoVoo());
        dto.setCompanhia(av.getCompanhia());
        dto.setNota(av.getNota());
        dto.setComentario(av.getComentario());
        dto.setSentimento(av.getSentimento());
        dto.setData(av.getData());
        dto.setNomePassageiro(av.getNomePassageiro());
        return dto;
    }
}
