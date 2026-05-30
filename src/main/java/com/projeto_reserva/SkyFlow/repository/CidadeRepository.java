package com.projeto_reserva.SkyFlow.repository;

import com.projeto_reserva.SkyFlow.entity.Cidade;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface CidadeRepository extends JpaRepository<Cidade, Long> {
    List<Cidade> findByEstadoId(Long idEstado);
    List<Cidade> findByNomeContainingIgnoreCase(String nome);
}
