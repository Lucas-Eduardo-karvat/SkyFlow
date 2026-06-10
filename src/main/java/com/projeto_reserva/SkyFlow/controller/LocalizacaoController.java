package com.projeto_reserva.SkyFlow.controller;

import com.projeto_reserva.SkyFlow.dto.localizacao.CidadeDTO;
import com.projeto_reserva.SkyFlow.dto.localizacao.EstadoDTO;
import com.projeto_reserva.SkyFlow.dto.localizacao.PaisDTO;
import com.projeto_reserva.SkyFlow.service.LocalizacaoService;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/localizacao")
public class LocalizacaoController {

    private final LocalizacaoService localizacaoService;

    public LocalizacaoController(LocalizacaoService localizacaoService) {
        this.localizacaoService = localizacaoService;
    }

    @GetMapping("/paises")
    public List<PaisDTO> listarPaises() {
        return localizacaoService.listarPaises();
    }

    @GetMapping("/paises/{id}/estados")
    public List<EstadoDTO> listarEstados(@PathVariable Long id) {
        return localizacaoService.listarEstadosPorPais(id);
    }

    @GetMapping("/estados/{id}/cidades")
    public List<CidadeDTO> listarCidades(@PathVariable Long id) {
        return localizacaoService.listarCidadesPorEstado(id);
    }
}
