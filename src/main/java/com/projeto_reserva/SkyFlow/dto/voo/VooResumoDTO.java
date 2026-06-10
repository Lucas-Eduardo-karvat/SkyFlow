package com.projeto_reserva.SkyFlow.dto.voo;

import java.time.OffsetDateTime;
import java.util.List;

public record VooResumoDTO(
    Long id,
    String codigoVoo,
    String companhia,
    String status,
    AeroportoDTO origem,       // primeiro trecho
    AeroportoDTO destino,      // último trecho
    OffsetDateTime dataPartida,
    OffsetDateTime dataChegada,
    Integer numeroDeTrechos,
    List<TarifaDTO> tarifas
) {}
