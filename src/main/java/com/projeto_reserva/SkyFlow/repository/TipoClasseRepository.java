package com.projeto_reserva.SkyFlow.repository;

import com.projeto_reserva.SkyFlow.entity.TipoClasse;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.Optional;

@Repository
public interface TipoClasseRepository extends JpaRepository<TipoClasse, Long> {
    Optional<TipoClasse> findByNomeClasse(String nomeClasse);
}
