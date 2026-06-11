package com.projeto_reserva.SkyFlow.repository;

import com.projeto_reserva.SkyFlow.entity.Voo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public interface VooRepository extends JpaRepository<Voo, Long> {
    Optional<Voo> findByCodigoVoo(String codigoVoo);
    List<Voo> findByCompanhiaId(Long idCompanhia);
    List<Voo> findByStatusVooId(Long idStatusVoo);
}
