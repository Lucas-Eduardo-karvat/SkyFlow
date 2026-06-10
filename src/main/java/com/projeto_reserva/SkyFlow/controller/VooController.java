package com.projeto_reserva.SkyFlow.controller;

import com.projeto_reserva.SkyFlow.dto.voo.AssentoDTO;
import com.projeto_reserva.SkyFlow.dto.voo.VooDetalheDTO;
import com.projeto_reserva.SkyFlow.dto.voo.VooResumoDTO;
import com.projeto_reserva.SkyFlow.service.VooService;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/voos")
public class VooController {

    private final VooService vooService;

    public VooController(VooService vooService) {
        this.vooService = vooService;
    }

    // Lista todos os voos
    @GetMapping
    public List<VooResumoDTO> listarTodos() {
        return vooService.listarTodos();
    }

    // Busca voo por ID
    @GetMapping("/{id}")
    public VooDetalheDTO buscarPorId(@PathVariable Long id) {
        return vooService.buscarPorId(id);
    }

    // Busca voo por código (ex: LA1234)
    @GetMapping("/codigo/{codigoVoo}")
    public VooDetalheDTO buscarPorCodigo(@PathVariable String codigoVoo) {
        return vooService.buscarPorCodigo(codigoVoo);
    }

    // Busca voos por origem e destino (ex: ?origem=GRU&destino=JFK)
    @GetMapping("/buscar")
    public List<VooResumoDTO> buscar(
            @RequestParam(required = false) String origem,
            @RequestParam(required = false) String destino) {

        if (origem != null && destino != null) {
            return vooService.buscarPorOrigemEDestino(origem, destino);
        }
        if (origem != null) {
            return vooService.buscarPorOrigem(origem);
        }
        return vooService.listarTodos();
    }

    // Lista assentos disponíveis de um trecho
    @GetMapping("/trechos/{idTrecho}/assentos/{idAeronave}")
    public List<AssentoDTO> listarAssentos(
            @PathVariable Long idTrecho,
            @PathVariable Long idAeronave) {
        return vooService.listarAssentosPorTrecho(idTrecho, idAeronave);
    }
}
