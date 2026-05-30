package com.projeto_reserva.SkyFlow.repository;

import com.projeto_reserva.SkyFlow.entity.StatusReserva;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.Optional;

@Repository
public interface StatusReservaRepository extends JpaRepository<StatusReserva, Long> {
    Optional<StatusReserva> findByDescricao(String descricao);
}
