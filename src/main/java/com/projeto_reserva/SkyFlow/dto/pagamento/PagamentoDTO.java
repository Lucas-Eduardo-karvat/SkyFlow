package com.projeto_reserva.SkyFlow.dto.pagamento;

import java.math.BigDecimal;
import java.time.OffsetDateTime;

public record PagamentoDTO(
    Long id,
    String codigoReserva,
    String metodoPagamento,
    String statusPagamento,
    BigDecimal valorPago,
    OffsetDateTime dataPagamento
) {}
