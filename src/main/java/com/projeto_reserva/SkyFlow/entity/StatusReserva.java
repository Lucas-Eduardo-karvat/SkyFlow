package com.projeto_reserva.SkyFlow.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "status_reserva")
@Data
@NoArgsConstructor
public class StatusReserva {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_status_reserva")
    private Long id;

    @Column(nullable = false, unique = true, length = 30) // era 20
    private String descricao;
}
