package com.projeto_reserva.SkyFlow.repository;

import com.projeto_reserva.SkyFlow.entity.HistoricoReserva;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface HistoricoReservaRepository extends JpaRepository<HistoricoReserva, Long> {
    List<HistoricoReserva> findByReservaIdOrderByDataAlteracaoDesc(Long idReserva);
}
