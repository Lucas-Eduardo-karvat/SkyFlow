package com.projeto_reserva.SkyFlow.mongodb.dto;

import lombok.Data;
import java.time.LocalDate;

/**
 * DTO de SAÍDA — dados retornados pelo backend ao front-end.
 *
 * Nunca retornamos o documento MongoDB diretamente na resposta da API.
 * Este DTO controla exatamente o que o front recebe.
 */
@Data
public class AvaliacaoResponseDTO {

    private String id;
    private Long vooId;
    private String codigoVoo;
    private String companhia;
    private Integer nota;
    private String comentario;
    private String sentimento;
    private LocalDate data;
    private String nomePassageiro;
}
