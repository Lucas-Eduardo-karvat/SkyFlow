package com.projeto_reserva.SkyFlow.dto.pagamento;

import java.math.BigDecimal;

public record RegistrarPagamentoDTO(
    Long idReserva,
    Long idMetodoPagamento,
    BigDecimal valorPago
) {}
