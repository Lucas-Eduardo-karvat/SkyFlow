package com.projeto_reserva.SkyFlow.dto.avaliacao;

public record CriarAvaliacaoDTO(
    Long idPassageiro,
    Integer nota,       // 1 a 5
    String comentario
) {}
