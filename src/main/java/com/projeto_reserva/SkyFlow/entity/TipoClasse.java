package com.projeto_reserva.SkyFlow.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.math.BigDecimal;

@Entity
@Table(name = "tipo_classe")
@Data
@NoArgsConstructor
public class TipoClasse {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_classe")
    private Long id;

    @Column(name = "nome_classe", nullable = false, unique = true, length = 50)
    private String nomeClasse;

    @Column(name = "multiplicador_valor", nullable = false, precision = 5, scale = 2)
    private BigDecimal multiplicadorValor = BigDecimal.ONE;
}
