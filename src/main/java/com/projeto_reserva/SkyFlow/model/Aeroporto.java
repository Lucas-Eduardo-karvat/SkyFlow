package com.projeto_reserva.SkyFlow.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "aeroportos")
public class Aeroporto {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "codigo_iata")
    private String codigoIata;

    private String nome;

    private String cidade;

    private String estado;

    private String pais;

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @JsonIgnore
    @OneToMany(mappedBy = "origem")
    private List<Voo> voosOrigem;

    @JsonIgnore
    @OneToMany(mappedBy = "destino")
    private List<Voo> voosDestino;

    public Aeroporto() {
    }

    public Long getId() {
        return id;
    }

    public String getCodigoIata() {
        return codigoIata;
    }

    public String getNome() {
        return nome;
    }

    public String getCidade() {
        return cidade;
    }

    public String getEstado() {
        return estado;
    }

    public String getPais() {
        return pais;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public List<Voo> getVoosOrigem() {
        return voosOrigem;
    }

    public List<Voo> getVoosDestino() {
        return voosDestino;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setCodigoIata(String codigoIata) {
        this.codigoIata = codigoIata;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public void setVoosOrigem(List<Voo> voosOrigem) {
        this.voosOrigem = voosOrigem;
    }

    public void setVoosDestino(List<Voo> voosDestino) {
        this.voosDestino = voosDestino;
    }
}