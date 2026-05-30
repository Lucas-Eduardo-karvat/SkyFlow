package com.projeto_reserva.SkyFlow.repository;

import com.projeto_reserva.SkyFlow.entity.Pais;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.Optional;

@Repository
public interface PaisRepository extends JpaRepository<Pais, Long> {
    Optional<Pais> findBySigla(String sigla);
    Optional<Pais> findByNome(String nome);
}
