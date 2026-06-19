package com.projeto_reserva.SkyFlow.dto;

import com.projeto_reserva.SkyFlow.model.Voo;
import com.projeto_reserva.SkyFlow.mongo.model.Avaliacao;

import java.util.List;

public class VooComAvaliacoesDTO {

    private Voo voo;

    private List<Avaliacao> avaliacoes;

    public Voo getVoo() {
        return voo;
    }

    public void setVoo(Voo voo) {
        this.voo = voo;
    }

    public List<Avaliacao> getAvaliacoes() {
        return avaliacoes;
    }

    public void setAvaliacoes(List<Avaliacao> avaliacoes) {
        this.avaliacoes = avaliacoes;
    }
}