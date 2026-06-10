package com.projeto_reserva.SkyFlow.dto.voo;

import java.util.List;

public record VooDetalheDTO(
    Long id,
    String codigoVoo,
    String companhia,
    String status,
    List<TrechoVooDTO> trechos,
    List<TarifaDTO> tarifas
) {}
