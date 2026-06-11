package com.projeto_reserva.SkyFlow.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "companhia")
@Data
@NoArgsConstructor
public class Companhia {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_companhia")
    private Long id;

    @Column(nullable = false, length = 100)
    private String nome;

    @Column(name = "codigo_icao", nullable = false, unique = true, length = 3)
    private String codigoIcao;
}
