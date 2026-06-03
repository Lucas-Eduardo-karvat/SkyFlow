package com.projeto_reserva.SkyFlow.Controller;

import com.projeto_reserva.SkyFlow.entity.Cidade;
import com.projeto_reserva.SkyFlow.entity.Estado;
import com.projeto_reserva.SkyFlow.entity.Pais;
import com.projeto_reserva.SkyFlow.repository.CidadeRepository;
import com.projeto_reserva.SkyFlow.repository.EstadoRepository;
import com.projeto_reserva.SkyFlow.repository.PaisRepository;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/localizacao")
public class LocalizacaoController {

    private final PaisRepository paisRepository;
    private final EstadoRepository estadoRepository;
    private final CidadeRepository cidadeRepository;

    public LocalizacaoController(PaisRepository paisRepository,
                                  EstadoRepository estadoRepository,
                                  CidadeRepository cidadeRepository) {
        this.paisRepository = paisRepository;
        this.estadoRepository = estadoRepository;
        this.cidadeRepository = cidadeRepository;
    }

    // Lista todos os países
    @GetMapping("/paises")
    public List<Pais> listarPaises() {
        return paisRepository.findAll();
    }

    // Lista estados de um país
    @GetMapping("/paises/{id}/estados")
    public List<Estado> listarEstados(@PathVariable Long id) {
        return estadoRepository.findByPaisId(id);
    }

    // Lista cidades de um estado
    @GetMapping("/estados/{id}/cidades")
    public List<Cidade> listarCidades(@PathVariable Long id) {
        return cidadeRepository.findByEstadoId(id);
    }
    
}