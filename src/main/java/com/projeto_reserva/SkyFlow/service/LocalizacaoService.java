package com.projeto_reserva.SkyFlow.service;

import com.projeto_reserva.SkyFlow.dto.localizacao.CidadeDTO;
import com.projeto_reserva.SkyFlow.dto.localizacao.EstadoDTO;
import com.projeto_reserva.SkyFlow.dto.localizacao.PaisDTO;
import com.projeto_reserva.SkyFlow.repository.CidadeRepository;
import com.projeto_reserva.SkyFlow.repository.EstadoRepository;
import com.projeto_reserva.SkyFlow.repository.PaisRepository;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class LocalizacaoService {

    private final PaisRepository paisRepository;
    private final EstadoRepository estadoRepository;
    private final CidadeRepository cidadeRepository;

    public LocalizacaoService(PaisRepository paisRepository,
                               EstadoRepository estadoRepository,
                               CidadeRepository cidadeRepository) {
        this.paisRepository = paisRepository;
        this.estadoRepository = estadoRepository;
        this.cidadeRepository = cidadeRepository;
    }

    public List<PaisDTO> listarPaises() {
        return paisRepository.findAll()
                .stream()
                .map(p -> new PaisDTO(p.getId(), p.getNome(), p.getSigla()))
                .toList();
    }

    public List<EstadoDTO> listarEstadosPorPais(Long idPais) {
        return estadoRepository.findByPaisId(idPais)
                .stream()
                .map(e -> new EstadoDTO(e.getId(), e.getNome(), e.getSigla()))
                .toList();
    }

    public List<CidadeDTO> listarCidadesPorEstado(Long idEstado) {
        return cidadeRepository.findByEstadoId(idEstado)
                .stream()
                .map(c -> new CidadeDTO(c.getId(), c.getNome()))
                .toList();
    }
}
