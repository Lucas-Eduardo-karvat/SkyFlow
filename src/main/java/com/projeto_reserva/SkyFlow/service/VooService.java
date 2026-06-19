package com.projeto_reserva.SkyFlow.service;

import com.projeto_reserva.SkyFlow.model.Voo;
import com.projeto_reserva.SkyFlow.mongo.model.Avaliacao;
import com.projeto_reserva.SkyFlow.mongo.repository.AvaliacaoRepository;
import com.projeto_reserva.SkyFlow.repository.VooRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VooService {

    private final VooRepository vooRepository;
    private final AvaliacaoRepository avaliacaoRepository;

    public VooService(VooRepository vooRepository,
                      AvaliacaoRepository avaliacaoRepository) {

        this.vooRepository = vooRepository;
        this.avaliacaoRepository = avaliacaoRepository;
    }

    public Voo buscarVoo(Long id) {
        return vooRepository.findById(id).orElse(null);
    }

    public List<Avaliacao> buscarAvaliacoes(Long vooId) {
        return avaliacaoRepository.findByVooId(vooId);
    }
    public List<Voo> listarVoos() {
    return vooRepository.findAll();
}
}