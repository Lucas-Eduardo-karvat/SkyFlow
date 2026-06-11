package com.projeto_reserva.SkyFlow.mongodb.repository;

import com.projeto_reserva.SkyFlow.mongodb.document.Avaliacao;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Repository Spring Data MongoDB para a coleção "avaliacoes".
 *
 * Herda automaticamente do MongoRepository:
 *   save(), findById(), findAll(), deleteById(), count(), etc.
 *
 * Os métodos abaixo usam dois mecanismos:
 *   1. Derived queries: Spring gera a query MongoDB a partir do nome do método
 *   2. @Query: MongoDB Query Language (MQL) em formato JSON
 */
@Repository
public interface AvaliacaoRepository extends MongoRepository<Avaliacao, String> {

    /**
     * Busca por ID do voo (chave de integração PostgreSQL ↔ MongoDB).
     * Spring gera: db.avaliacoes.find({ "vooId": ?0 })
     */
    List<Avaliacao> findByVooId(Long vooId);

    /**
     * Busca por companhia.
     * Spring gera: db.avaliacoes.find({ "companhia": ?0 })
     */
    List<Avaliacao> findByCompanhia(String companhia);

    /**
     * Busca por sentimento (positivo / neutro / negativo).
     */
    List<Avaliacao> findBySentimento(String sentimento);

    /**
     * Busca avaliações com nota maior ou igual ao valor informado.
     * Usa @Query com MQL explícito: { "nota": { "$gte": valor } }
     */
    @Query("{ 'nota': { $gte: ?0 } }")
    List<Avaliacao> findByNotaMinimaOuMaior(Integer nota);

    /**
     * Busca avaliações de uma companhia ordenadas por nota decrescente.
     * Útil para exibir os melhores feedbacks de cada companhia.
     */
    List<Avaliacao> findByCompanhiaOrderByNotaDesc(String companhia);

    /**
     * Conta avaliações por sentimento.
     * Usado no dashboard sem precisar do Aggregation Pipeline completo.
     */
    long countBySentimento(String sentimento);
}
