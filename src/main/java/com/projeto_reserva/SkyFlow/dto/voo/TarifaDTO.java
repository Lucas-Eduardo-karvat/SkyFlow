package com.projeto_reserva.SkyFlow.dto.voo;

import java.math.BigDecimal;

public record TarifaDTO(
    Long id,
    String classe,
    BigDecimal precoPorKm,
    BigDecimal precoTotal,
    Integer quantidadeDisponivel,
    String moeda,
    String simboloMoeda
) {}
