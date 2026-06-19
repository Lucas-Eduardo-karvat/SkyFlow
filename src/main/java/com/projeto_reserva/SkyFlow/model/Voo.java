package com.projeto_reserva.SkyFlow.model;

import jakarta.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "voos")
public class Voo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "numero_voo")
    private String numeroVoo;

    @ManyToOne
    @JoinColumn(name = "origem_id")
    private Aeroporto origem;

    @ManyToOne
    @JoinColumn(name = "destino_id")
    private Aeroporto destino;

    @ManyToOne
    @JoinColumn(name = "aeronave_id")
    private Aeronave aeronave;

    @Column(name = "data_partida")
    private LocalDateTime dataPartida;

    @Column(name = "data_chegada")
    private LocalDateTime dataChegada;

    private BigDecimal preco;

    private String status;

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    public Voo() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNumeroVoo() {
        return numeroVoo;
    }

    public void setNumeroVoo(String numeroVoo) {
        this.numeroVoo = numeroVoo;
    }

    public Aeroporto getOrigem() {
        return origem;
    }

    public void setOrigem(Aeroporto origem) {
        this.origem = origem;
    }

    public Aeroporto getDestino() {
        return destino;
    }

    public void setDestino(Aeroporto destino) {
        this.destino = destino;
    }

    public Aeronave getAeronave() {
        return aeronave;
    }

    public void setAeronave(Aeronave aeronave) {
        this.aeronave = aeronave;
    }

    public LocalDateTime getDataPartida() {
        return dataPartida;
    }

    public void setDataPartida(LocalDateTime dataPartida) {
        this.dataPartida = dataPartida;
    }

    public LocalDateTime getDataChegada() {
        return dataChegada;
    }

    public void setDataChegada(LocalDateTime dataChegada) {
        this.dataChegada = dataChegada;
    }

    public BigDecimal getPreco() {
        return preco;
    }

    public void setPreco(BigDecimal preco) {
        this.preco = preco;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
}