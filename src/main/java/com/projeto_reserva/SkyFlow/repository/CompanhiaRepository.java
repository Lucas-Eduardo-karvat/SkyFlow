package com.projeto_reserva.SkyFlow.repository;

import com.projeto_reserva.SkyFlow.entity.Companhia;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.Optional;

@Repository
public interface CompanhiaRepository extends JpaRepository<Companhia, Long> {
    Optional<Companhia> findByCodigoIcao(String codigoIcao);
}
