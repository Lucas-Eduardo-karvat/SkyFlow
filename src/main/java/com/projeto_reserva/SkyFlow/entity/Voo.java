package com.projeto_reserva.SkyFlow.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "voo")
@Data
@NoArgsConstructor
public class Voo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_voo")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "id_companhia", nullable = false)
    private Companhia companhia;

    @ManyToOne
    @JoinColumn(name = "id_status_voo", nullable = false)
    private StatusVoo statusVoo;

    @Column(name = "codigo_voo", nullable = false, unique = true, length = 10)
    private String codigoVoo;
}
