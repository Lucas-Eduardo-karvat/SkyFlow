package com.projeto_reserva.SkyFlow.repository;

import com.projeto_reserva.SkyFlow.entity.Moeda;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.Optional;

@Repository
public interface MoedaRepository extends JpaRepository<Moeda, Long> {
    Optional<Moeda> findByCodigoIso(String codigoIso);
}
