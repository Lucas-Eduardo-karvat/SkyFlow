package com.projeto_reserva.SkyFlow.dto.passageiro;

public record PassageiroDTO(
    Long id,
    String nome,
    String documento,
    String email,
    String telefone,
    String cidade,
    String estado,
    String pais
) {}
