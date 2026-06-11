package com.projeto_reserva.SkyFlow.mongodb.controller;

import com.projeto_reserva.SkyFlow.mongodb.dto.AvaliacaoRequestDTO;
import com.projeto_reserva.SkyFlow.mongodb.dto.AvaliacaoResponseDTO;
import com.projeto_reserva.SkyFlow.mongodb.dto.EstatisticaCompanhiaDTO;
import com.projeto_reserva.SkyFlow.mongodb.service.AvaliacaoService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Controller REST — módulo de Avaliações (MongoDB).
 *
 * BASE URL: /avaliacoes
 *
 * ENDPOINTS:
 *   POST   /avaliacoes                           → Cria avaliação (salva no MongoDB)
 *   GET    /avaliacoes                           → Lista todas
 *   GET    /avaliacoes/voo/{vooId}               → Por voo (integração PostgreSQL ↔ MongoDB)
 *   GET    /avaliacoes/companhia/{companhia}     → Por companhia
 *   GET    /avaliacoes/estatisticas              → Aggregation Pipeline completo
 *   GET    /avaliacoes/estatisticas/{sentimento} → Pipeline filtrado por sentimento
 *   DELETE /avaliacoes/{id}                      → Remove pelo _id do MongoDB
 */
@RestController
@RequestMapping("/avaliacoes")
@CrossOrigin(origins = "*")
@RequiredArgsConstructor
public class AvaliacaoController {

    private final AvaliacaoService avaliacaoService;

    @PostMapping
    public ResponseEntity<AvaliacaoResponseDTO> criar(@Valid @RequestBody AvaliacaoRequestDTO dto) {
        AvaliacaoResponseDTO salva = avaliacaoService.salvar(dto);
        return ResponseEntity.status(HttpStatus.CREATED).body(salva);
    }

    @GetMapping
    public ResponseEntity<List<AvaliacaoResponseDTO>> listarTodas() {
        return ResponseEntity.ok(avaliacaoService.listarTodas());
    }

    @GetMapping("/voo/{vooId}")
    public ResponseEntity<List<AvaliacaoResponseDTO>> buscarPorVoo(@PathVariable Long vooId) {
        return ResponseEntity.ok(avaliacaoService.buscarPorVoo(vooId));
    }

    @GetMapping("/companhia/{companhia}")
    public ResponseEntity<List<AvaliacaoResponseDTO>> buscarPorCompanhia(@PathVariable String companhia) {
        return ResponseEntity.ok(avaliacaoService.buscarPorCompanhia(companhia));
    }

    /** Aggregation Pipeline: nota média + total + sentimentos por companhia */
    @GetMapping("/estatisticas")
    public ResponseEntity<List<EstatisticaCompanhiaDTO>> estatisticas() {
        return ResponseEntity.ok(avaliacaoService.calcularEstatisticasPorCompanhia());
    }

    /** Pipeline filtrado: ex. /avaliacoes/estatisticas/negativo */
    @GetMapping("/estatisticas/{sentimento}")
    public ResponseEntity<List<EstatisticaCompanhiaDTO>> estatisticasPorSentimento(
            @PathVariable String sentimento) {
        return ResponseEntity.ok(avaliacaoService.calcularEstatisticasPorSentimento(sentimento));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deletar(@PathVariable String id) {
        avaliacaoService.deletar(id);
        return ResponseEntity.noContent().build();
    }
}
