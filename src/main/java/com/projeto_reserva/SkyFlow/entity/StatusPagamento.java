package com.projeto_reserva.SkyFlow.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "status_pagamento")
@Data
@NoArgsConstructor
public class StatusPagamento {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_status_pagamento")
    private Long id;

    @Column(nullable = false, unique = true, length = 20)
    private String descricao;
}
