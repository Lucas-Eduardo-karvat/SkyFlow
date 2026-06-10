package com.projeto_reserva.SkyFlow.dto.passageiro;

public record CadastroPassageiroDTO(
    String nome,
    String documento,
    String email,
    String telefone,
    Long idCidadeEndereco,
    String logradouro,
    String numero,
    String complemento,
    String cep
) {}
