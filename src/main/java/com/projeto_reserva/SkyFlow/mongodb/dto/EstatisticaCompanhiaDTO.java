package com.projeto_reserva.SkyFlow.mongodb.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

/**
 * DTO de SAÍDA do Aggregation Pipeline MongoDB.
 *
 * Retornado pelo endpoint GET /avaliacoes/estatisticas.
 *
 * Cada campo corresponde a um acumulador calculado no estágio $group:
 *   companhia       → _id do grupo (campo pelo qual agrupamos)
 *   notaMedia       → $avg: "$nota"
 *   totalAvaliacoes → $sum: 1
 *   positivoCount   → $sum condicional (sentimento == "positivo")
 *   neutroCount     → $sum condicional (sentimento == "neutro")
 *   negativoCount   → $sum condicional (sentimento == "negativo")
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class EstatisticaCompanhiaDTO {

    private String companhia;
    private Double notaMedia;
    private Long   totalAvaliacoes;
    private Long   positivoCount;
    private Long   neutroCount;
    private Long   negativoCount;
}
