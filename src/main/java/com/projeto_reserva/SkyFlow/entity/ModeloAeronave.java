package com.projeto_reserva.SkyFlow.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "modelo_aeronave", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"fabricante", "nome_modelo"})
})
@Data
@NoArgsConstructor
public class ModeloAeronave {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_modelo")
    private Long id;

    @Column(nullable = false, length = 50)
    private String fabricante;

    @Column(name = "nome_modelo", nullable = false, length = 50)  // tirou o unique = true daqui
    private String nomeModelo;

    @Column(name = "capacidade_assentos", nullable = false)
    private Integer capacidadeAssentos;
}
