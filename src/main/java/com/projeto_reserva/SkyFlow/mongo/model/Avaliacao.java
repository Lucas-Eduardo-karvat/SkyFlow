package com.projeto_reserva.SkyFlow.mongo.model;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Data
@Document(collection = "avaliacoes")
public class Avaliacao {

    @Id
    private String id;

    private Long vooId;

    private Integer nota;

    private String comentario;

    private String sentimento;

}