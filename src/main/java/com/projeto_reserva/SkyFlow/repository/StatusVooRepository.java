package com.projeto_reserva.SkyFlow.repository;

import com.projeto_reserva.SkyFlow.entity.StatusVoo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.Optional;

@Repository
public interface StatusVooRepository extends JpaRepository<StatusVoo, Long> {
    Optional<StatusVoo> findByDescricao(String descricao);
}
