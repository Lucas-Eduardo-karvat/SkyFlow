package com.projeto_reserva.SkyFlow.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "companhias_aereas")
public class CompanhiaAerea {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nome;

    @Column(name = "codigo_iata")
    private String codigoIata;

    private String pais;

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @JsonIgnore
    @OneToMany(mappedBy = "companhia")
    private List<Aeronave> aeronaves;

    public CompanhiaAerea() {
    }

    public Long getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }

    public String getCodigoIata() {
        return codigoIata;
    }

    public String getPais() {
        return pais;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public List<Aeronave> getAeronaves() {
        return aeronaves;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setCodigoIata(String codigoIata) {
        this.codigoIata = codigoIata;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public void setAeronaves(List<Aeronave> aeronaves) {
        this.aeronaves = aeronaves;
    }
}