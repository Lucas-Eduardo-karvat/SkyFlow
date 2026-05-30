package com.projeto_reserva.SkyFlow.repository;

import com.projeto_reserva.SkyFlow.entity.ReservaAssento;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface ReservaAssentoRepository extends JpaRepository<ReservaAssento, Long> {
    List<ReservaAssento> findByReservaId(Long idReserva);
    List<ReservaAssento> findByTrechoId(Long idTrecho);
    boolean existsByTrechoIdAndAssentoId(Long idTrecho, Long idAssento);
}
