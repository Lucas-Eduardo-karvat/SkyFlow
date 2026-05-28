package com.projeto_reserva.SkyFlow.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "moeda")
@Data
@NoArgsConstructor
public class Moeda {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_moeda")
    private Long id;

    @Column(name = "codigo_iso", nullable = false, unique = true, length = 3)
    private String codigoIso;

    @Column(nullable = false, length = 50)
    private String nome;

    @Column(nullable = false, length = 5)
    private String simbolo;
}
