package com.projeto_reserva.SkyFlow.repository;

import com.projeto_reserva.SkyFlow.entity.MetodoPagamento;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.Optional;

@Repository
public interface MetodoPagamentoRepository extends JpaRepository<MetodoPagamento, Long> {
    Optional<MetodoPagamento> findByDescricao(String descricao);
}
