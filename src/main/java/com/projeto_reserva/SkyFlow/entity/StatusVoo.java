package com.projeto_reserva.SkyFlow.entity;


import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "status_voo")
@Data
@NoArgsConstructor
public class StatusVoo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_status_voo")
    private Long id;

    @Column(nullable = false, unique = true, length = 20)
    private String descricao;

}