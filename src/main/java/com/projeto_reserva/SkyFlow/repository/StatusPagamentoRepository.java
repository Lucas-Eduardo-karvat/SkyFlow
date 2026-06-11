package com.projeto_reserva.SkyFlow.repository;

import com.projeto_reserva.SkyFlow.entity.StatusPagamento;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.Optional;

@Repository
public interface StatusPagamentoRepository extends JpaRepository<StatusPagamento, Long> {
    Optional<StatusPagamento> findByDescricao(String descricao);
}
