package com.projeto_reserva.SkyFlow.repository;

import com.projeto_reserva.SkyFlow.entity.TrechoVoo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface TrechoVooRepository extends JpaRepository<TrechoVoo, Long> {
    List<TrechoVoo> findByVooId(Long idVoo);
    List<TrechoVoo> findByAeroportoOrigemId(Long idAeroporto);
    List<TrechoVoo> findByAeroportoDestinoId(Long idAeroporto);
}
