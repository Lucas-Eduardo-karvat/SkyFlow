package com.projeto_reserva.SkyFlow.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "metodo_pagamento")
@Data
@NoArgsConstructor
public class MetodoPagamento {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_metodo")
    private Long id;

    @Column(nullable = false, unique = true, length = 30)
    private String descricao;
}
