package com.projeto_reserva.SkyFlow.repository;

import com.projeto_reserva.SkyFlow.entity.Aeroporto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public interface AeroportoRepository extends JpaRepository<Aeroporto, Long> {
    Optional<Aeroporto> findByCodigoIata(String codigoIata);
    List<Aeroporto> findByCidadeId(Long idCidade);
}
