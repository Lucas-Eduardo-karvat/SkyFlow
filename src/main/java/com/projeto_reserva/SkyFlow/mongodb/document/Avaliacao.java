package com.projeto_reserva.SkyFlow.mongodb.document;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

import java.time.LocalDate;

/**
 * Documento MongoDB — coleção "avaliacoes".
 *
 * JUSTIFICATIVA DE USO DO MONGODB PARA AVALIAÇÕES:
 * ─────────────────────────────────────────────────
 * 1. Schema flexível: avaliações podem ter campos variáveis
 *    (tags, anexos, respostas) sem precisar de ALTER TABLE.
 * 2. Alta taxa de escrita: muitos passageiros enviando feedbacks
 *    simultaneamente — MongoDB escala horizontalmente com sharding.
 * 3. Aggregation Pipeline nativo: cálculo de média, contagem e
 *    ranking de sentimento sem JOINs complexos.
 * 4. Não exige consistência transacional rígida (ACID) como reservas
 *    financeiras — consistência eventual é aceitável aqui.
 *
 * MODELO CAP: AP (Availability + Partition Tolerance)
 * ─────────────────────────────────────────────────────
 * Priorizamos disponibilidade e tolerância a partições de rede.
 * Uma avaliação pode demorar milissegundos para ser visível em
 * todos os nós (consistência eventual) — comportamento aceitável
 * para feedbacks, diferente de reservas (que usam PostgreSQL com ACID).
 */
@Data
@NoArgsConstructor
@Document(collection = "avaliacoes")
public class Avaliacao {

    /** _id gerado automaticamente pelo MongoDB (ObjectId em hex de 24 chars) */
    @Id
    private String id;

    /**
     * ID do voo no PostgreSQL.
     * Referência fraca entre os dois bancos — não há FK real,
     * mas o vooId permite cruzar dados quando necessário.
     * Indexado para buscas rápidas por voo.
     */
    @Indexed
    @Field("vooId")
    private Long vooId;

    /** Código do voo (ex: "AD1234") — redundância intencional para evitar JOIN */
    @Field("codigoVoo")
    private String codigoVoo;

    /**
     * Nome da companhia aérea (ex: "Azul", "LATAM", "Gol").
     * Indexado — é o campo de agrupamento do Aggregation Pipeline.
     */
    @Indexed
    @Field("companhia")
    private String companhia;

    /**
     * Nota de 1 a 5 dada pelo passageiro.
     * Usada pelo pipeline para calcular a média ($avg).
     */
    @Field("nota")
    private Integer nota;

    /** Texto livre — estrutura não-relacional que justifica o MongoDB */
    @Field("comentario")
    private String comentario;

    /**
     * Sentimento classificado automaticamente pela AvaliacaoService:
     *   nota >= 4  →  "positivo"
     *   nota == 3  →  "neutro"
     *   nota <= 2  →  "negativo"
     */
    @Field("sentimento")
    private String sentimento;

    /** Data de registro da avaliação */
    @Field("data")
    private LocalDate data;

    /** Nome do passageiro (opcional, para exibição no front) */
    @Field("nomePassageiro")
    private String nomePassageiro;
}
