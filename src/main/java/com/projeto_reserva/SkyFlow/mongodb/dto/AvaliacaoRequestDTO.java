package com.projeto_reserva.SkyFlow.mongodb.dto;

import jakarta.validation.constraints.*;
import lombok.Data;

/**
 * DTO de ENTRADA — dados recebidos do front-end ao criar uma avaliação.
 *
 * Validações garantem que dados inconsistentes nunca cheguem à Service.
 * Seguindo o princípio de nunca expor a entidade/documento diretamente na API.
 */
@Data
public class AvaliacaoRequestDTO {

    @NotNull(message = "O ID do voo é obrigatório")
    private Long vooId;

    @NotBlank(message = "O código do voo é obrigatório")
    @Size(max = 10, message = "Código do voo deve ter no máximo 10 caracteres")
    private String codigoVoo;

    @NotBlank(message = "O nome da companhia é obrigatório")
    @Size(max = 100, message = "Nome da companhia deve ter no máximo 100 caracteres")
    private String companhia;

    @NotNull(message = "A nota é obrigatória")
    @Min(value = 1, message = "Nota mínima é 1")
    @Max(value = 5, message = "Nota máxima é 5")
    private Integer nota;

    @Size(max = 1000, message = "Comentário pode ter no máximo 1000 caracteres")
    private String comentario;

    private String nomePassageiro;
}
