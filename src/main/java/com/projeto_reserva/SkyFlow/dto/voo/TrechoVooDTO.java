package com.projeto_reserva.SkyFlow.dto.voo;

import java.math.BigDecimal;
import java.time.OffsetDateTime;

public record TrechoVooDTO(
    Long id,
    Integer ordemTrecho,
    AeroportoDTO aeroportoOrigem,
    AeroportoDTO aeroportoDestino,
    OffsetDateTime dataPartida,
    OffsetDateTime dataChegada,
    BigDecimal distanciaKm,
    String aeronave,
    String modeloAeronave
) {}
