package com.projeto_reserva.SkyFlow.repository;

import com.projeto_reserva.SkyFlow.entity.ModeloAeronave;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public interface ModeloAeronaveRepository extends JpaRepository<ModeloAeronave, Long> {
    List<ModeloAeronave> findByFabricante(String fabricante);
    Optional<ModeloAeronave> findByFabricanteAndNomeModelo(String fabricante, String nomeModelo);
}
