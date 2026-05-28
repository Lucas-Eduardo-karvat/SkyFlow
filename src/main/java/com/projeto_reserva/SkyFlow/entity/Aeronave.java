package com.projeto_reserva.SkyFlow.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "aeronave")
@Data
@NoArgsConstructor
public class Aeronave {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_aeronave")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "id_companhia", nullable = false)
    private Companhia companhia;

    @ManyToOne
    @JoinColumn(name = "id_modelo", nullable = false)
    private ModeloAeronave modelo;

    @Column(name = "codigo_registro", nullable = false, unique = true, length = 20)
    private String codigoRegistro;

    @Column(nullable = false)
    private Boolean ativo = true;
}
