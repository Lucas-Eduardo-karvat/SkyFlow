package com.projeto_reserva.SkyFlow.dto.avaliacao;

import java.time.LocalDateTime;

public record AvaliacaoVooDTO(
    String id,                  // ID do MongoDB
    Long idVoo,
    String codigoVoo,
    Long idPassageiro,
    String nomePassageiro,
    Integer nota,               // 1 a 5
    String comentario,
    LocalDateTime dataAvaliacao
) {}
