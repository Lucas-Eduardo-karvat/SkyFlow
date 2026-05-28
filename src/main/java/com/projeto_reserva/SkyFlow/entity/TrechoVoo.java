package com.projeto_reserva.SkyFlow.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.math.BigDecimal;
import java.time.OffsetDateTime;

@Entity
@Table(name = "trecho_voo")
@Data
@NoArgsConstructor
public class TrechoVoo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_trecho")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "id_voo", nullable = false)
    private Voo voo;

    @ManyToOne
    @JoinColumn(name = "id_aeronave", nullable = false)
    private Aeronave aeronave;

    @ManyToOne
    @JoinColumn(name = "id_aeroporto_origem", nullable = false)
    private Aeroporto aeroportoOrigem;

    @ManyToOne
    @JoinColumn(name = "id_aeroporto_destino", nullable = false)
    private Aeroporto aeroportoDestino;

    @Column(name = "ordem_trecho", nullable = false)
    private Integer ordemTrecho;

    @Column(name = "distancia_km", nullable = false, precision = 7, scale = 2)
    private BigDecimal distanciaKm;

    @Column(name = "data_partida", nullable = false)
    private OffsetDateTime dataPartida;

    @Column(name = "data_chegada", nullable = false)
    private OffsetDateTime dataChegada;
}
