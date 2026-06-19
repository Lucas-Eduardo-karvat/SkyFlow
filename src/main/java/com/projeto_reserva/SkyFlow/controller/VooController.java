package com.projeto_reserva.SkyFlow.controller;

import com.projeto_reserva.SkyFlow.dto.VooComAvaliacoesDTO;
import com.projeto_reserva.SkyFlow.model.Voo;
import com.projeto_reserva.SkyFlow.mongo.model.Avaliacao;
import com.projeto_reserva.SkyFlow.service.VooService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/voos")
public class VooController {

    private final VooService vooService;

    public VooController(VooService vooService) {
        this.vooService = vooService;
    }

    @GetMapping("/{id}/avaliacoes")
    public VooComAvaliacoesDTO buscarVooComAvaliacoes(@PathVariable Long id) {

        Voo voo = vooService.buscarVoo(id);

        List<Avaliacao> avaliacoes = vooService.buscarAvaliacoes(id);

        VooComAvaliacoesDTO dto = new VooComAvaliacoesDTO();

        dto.setVoo(voo);
        dto.setAvaliacoes(avaliacoes);

        return dto;

    }

    @GetMapping
    public List<Voo> listarVoos() {
        return vooService.listarVoos();
    }

}