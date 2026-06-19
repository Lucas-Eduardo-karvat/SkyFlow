package com.projeto_reserva.SkyFlow.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.projeto_reserva.SkyFlow.model.Aeronave;

public interface AeronaveRepository extends JpaRepository<Aeronave, Long> {

}