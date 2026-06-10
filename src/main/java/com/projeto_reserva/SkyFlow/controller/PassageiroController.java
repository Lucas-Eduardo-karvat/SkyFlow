package com.projeto_reserva.SkyFlow.controller;

import com.projeto_reserva.SkyFlow.dto.passageiro.CadastroPassageiroDTO;
import com.projeto_reserva.SkyFlow.dto.passageiro.PassageiroDTO;
import com.projeto_reserva.SkyFlow.service.PassageiroService;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/passageiros")
public class PassageiroController {

    private final PassageiroService passageiroService;

    public PassageiroController(PassageiroService passageiroService) {
        this.passageiroService = passageiroService;
    }

    // Cadastra um novo passageiro
    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public PassageiroDTO cadastrar(@RequestBody CadastroPassageiroDTO dto) {
        return passageiroService.cadastrar(dto);
    }

    // Lista todos os passageiros
    @GetMapping
    public List<PassageiroDTO> listarTodos() {
        return passageiroService.listarTodos();
    }

    // Busca passageiro por ID
    @GetMapping("/{id}")
    public PassageiroDTO buscarPorId(@PathVariable Long id) {
        return passageiroService.buscarPorId(id);
    }

    // Busca passageiro por documento (CPF, passaporte...)
    @GetMapping("/documento/{documento}")
    public PassageiroDTO buscarPorDocumento(@PathVariable String documento) {
        return passageiroService.buscarPorDocumento(documento);
    }
}
