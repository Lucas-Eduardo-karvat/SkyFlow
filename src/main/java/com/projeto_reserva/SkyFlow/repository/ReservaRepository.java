package com.projeto_reserva.SkyFlow.repository;

import com.projeto_reserva.SkyFlow.entity.Reserva;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public interface ReservaRepository extends JpaRepository<Reserva, Long> {
    Optional<Reserva> findByCodigoReserva(String codigoReserva);
    List<Reserva> findByPassageiroId(Long idPassageiro);
    List<Reserva> findByStatusReservaId(Long idStatusReserva);
}
