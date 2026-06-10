package com.projeto_reserva.SkyFlow.dto.reserva;

public record CriarReservaDTO(
    Long idPassageiro,
    Long idTarifa,
    Long idAssento,
    Long idTrecho
) {}
