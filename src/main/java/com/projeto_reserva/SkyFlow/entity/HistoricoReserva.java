package com.projeto_reserva.SkyFlow.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.time.OffsetDateTime;

@Entity
@Table(name = "historico_reserva")
@Data
@NoArgsConstructor
public class HistoricoReserva {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_historico")
    private Long id;

    @Column(name = "id_reserva", nullable = false)
    private Long idReserva;

    @Column(name = "id_status_anterior")
    private Long idStatusAnterior;

    @Column(name = "id_status_novo", nullable = false)
    private Long idStatusNovo;

    @Column(name = "data_alteracao", nullable = false)
    private OffsetDateTime dataAlteracao;

    @Column(name = "usuario_alteracao", length = 50)
    private String usuarioAlteracao;

    @Column(columnDefinition = "TEXT")
    private String detalhes;
}
