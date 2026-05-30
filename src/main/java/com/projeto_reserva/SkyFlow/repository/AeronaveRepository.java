package com.projeto_reserva.SkyFlow.repository;

import com.projeto_reserva.SkyFlow.entity.Aeronave;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public interface AeronaveRepository extends JpaRepository<Aeronave, Long> {
    Optional<Aeronave> findByCodigoRegistro(String codigoRegistro);
    List<Aeronave> findByCompanhiaId(Long idCompanhia);
    List<Aeronave> findByAtivo(Boolean ativo);
}
