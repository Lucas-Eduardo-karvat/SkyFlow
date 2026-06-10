package com.projeto_reserva.SkyFlow.dto.avaliacao;

import java.time.LocalDateTime;

public record AvaliacaoCompanhiaDTO(
    String id,                  // ID do MongoDB
    Long idCompanhia,
    String nomeCompanhia,
    Long idPassageiro,
    String nomePassageiro,
    Integer nota,               // 1 a 5
    String comentario,
    LocalDateTime dataAvaliacao
) {}
