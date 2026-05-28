package com.projeto_reserva.SkyFlow.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "assento")
@Data
@NoArgsConstructor
public class Assento {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_assento")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "id_aeronave", nullable = false)
    private Aeronave aeronave;

    @ManyToOne
    @JoinColumn(name = "id_classe", nullable = false)
    private TipoClasse tipoClasse;

    @Column(name = "numero_assento", nullable = false, length = 10)
    private String numeroAssento;
}
