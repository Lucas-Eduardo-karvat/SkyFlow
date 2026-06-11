package com.projeto_reserva.SkyFlow.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.math.BigDecimal;

@Entity
@Table(name = "tarifa")
@Data
@NoArgsConstructor
public class Tarifa {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_tarifa")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "id_voo", nullable = false)
    private Voo voo;

    @ManyToOne
    @JoinColumn(name = "id_classe", nullable = false)
    private TipoClasse tipoClasse;

    @ManyToOne
    @JoinColumn(name = "id_moeda", nullable = false)
    private Moeda moeda;

    @Column(name = "preco_por_km", nullable = false, precision = 10, scale = 4)
    private BigDecimal precoPorKm;

    @Column(name = "quantidade_disponivel", nullable = false)
    private Integer quantidadeDisponivel;
}
