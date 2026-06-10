package com.projeto_reserva.SkyFlow.dto.voo;

public record AeroportoDTO(
    Long id,
    String codigoIata,
    String nome,
    String cidade,
    String estado,
    String pais
) {}
