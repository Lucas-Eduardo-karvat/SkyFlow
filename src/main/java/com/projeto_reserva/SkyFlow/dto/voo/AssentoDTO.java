package com.projeto_reserva.SkyFlow.dto.voo;

public record AssentoDTO(
    Long id,
    String numeroAssento,
    String classe,
    boolean disponivel
) {}
