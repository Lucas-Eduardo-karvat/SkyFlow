package com.projeto_reserva.SkyFlow.repository;

import com.projeto_reserva.SkyFlow.entity.Assento;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public interface AssentoRepository extends JpaRepository<Assento, Long> {
    List<Assento> findByAeronaveId(Long idAeronave);
    List<Assento> findByAeronaveIdAndClasseId(Long idAeronave, Long idClasse);
    Optional<Assento> findByAeronaveIdAndNumeroAssento(Long idAeronave, String numeroAssento);
}
