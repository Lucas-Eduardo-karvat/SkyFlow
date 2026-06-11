package com.projeto_reserva.SkyFlow.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "reserva_assento")
@Data
@NoArgsConstructor
public class ReservaAssento {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_reserva_assento")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "id_reserva", nullable = false)
    private Reserva reserva;

    @ManyToOne
    @JoinColumn(name = "id_trecho", nullable = false)
    private TrechoVoo trecho;

    @ManyToOne
    @JoinColumn(name = "id_assento", nullable = false)
    private Assento assento;
}
