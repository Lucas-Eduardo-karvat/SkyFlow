package com.projeto_reserva.SkyFlow.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "aeronaves")
public class Aeronave {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String modelo;

    private String fabricante;

    private Integer capacidade;

    @ManyToOne
    @JoinColumn(name = "companhia_id")
    private CompanhiaAerea companhia;

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @JsonIgnore
    @OneToMany(mappedBy = "aeronave")
    private List<Voo> voos;

    public Aeronave() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getFabricante() {
        return fabricante;
    }

    public void setFabricante(String fabricante) {
        this.fabricante = fabricante;
    }

    public Integer getCapacidade() {
        return capacidade;
    }

    public void setCapacidade(Integer capacidade) {
        this.capacidade = capacidade;
    }

    public CompanhiaAerea getCompanhia() {
        return companhia;
    }

    public void setCompanhia(CompanhiaAerea companhia) {
        this.companhia = companhia;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public List<Voo> getVoos() {
        return voos;
    }

    public void setVoos(List<Voo> voos) {
        this.voos = voos;
    }
}
