package com.projeto_reserva.SkyFlow.dto.reserva;

import java.math.BigDecimal;
import java.time.OffsetDateTime;

public record ReservaDTO(
    Long id,
    String codigoReserva,
    String status,
    OffsetDateTime dataReserva,
    BigDecimal valorFinal,
    String nomePassageiro,
    String documentoPassageiro,
    String voo,
    String origemIata,
    String destinoIata,
    String assento,
    String classe
) {}
