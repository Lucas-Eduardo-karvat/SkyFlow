package com.projeto_reserva.SkyFlow.service;

import com.projeto_reserva.SkyFlow.dto.pagamento.PagamentoDTO;
import com.projeto_reserva.SkyFlow.dto.pagamento.RegistrarPagamentoDTO;
import com.projeto_reserva.SkyFlow.entity.*;
import com.projeto_reserva.SkyFlow.repository.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.time.OffsetDateTime;
import java.util.List;

@Service
public class PagamentoService {

    private final PagamentoRepository pagamentoRepository;
    private final ReservaRepository reservaRepository;
    private final MetodoPagamentoRepository metodoPagamentoRepository;
    private final StatusPagamentoRepository statusPagamentoRepository;
    private final StatusReservaRepository statusReservaRepository;
    private final HistoricoReservaRepository historicoReservaRepository;

    public PagamentoService(PagamentoRepository pagamentoRepository,
                             ReservaRepository reservaRepository,
                             MetodoPagamentoRepository metodoPagamentoRepository,
                             StatusPagamentoRepository statusPagamentoRepository,
                             StatusReservaRepository statusReservaRepository,
                             HistoricoReservaRepository historicoReservaRepository) {
        this.pagamentoRepository = pagamentoRepository;
        this.reservaRepository = reservaRepository;
        this.metodoPagamentoRepository = metodoPagamentoRepository;
        this.statusPagamentoRepository = statusPagamentoRepository;
        this.statusReservaRepository = statusReservaRepository;
        this.historicoReservaRepository = historicoReservaRepository;
    }

    @Transactional
    public PagamentoDTO registrar(RegistrarPagamentoDTO dto) {
        Reserva reserva = reservaRepository.findById(dto.idReserva())
                .orElseThrow(() -> new RuntimeException("Reserva não encontrada"));

        // Só permite pagamento em reservas aguardando pagamento
        if (!reserva.getStatusReserva().getDescricao().equals("AGUARDANDO_PAGAMENTO")) {
            throw new RuntimeException("Reserva não está aguardando pagamento");
        }

        // Verifica se valor pago é suficiente
        if (dto.valorPago().compareTo(reserva.getValorFinal()) < 0) {
            throw new RuntimeException("Valor pago menor que o valor da reserva");
        }

        MetodoPagamento metodo = metodoPagamentoRepository.findById(dto.idMetodoPagamento())
                .orElseThrow(() -> new RuntimeException("Método de pagamento não encontrado"));

        StatusPagamento statusAprovado = statusPagamentoRepository
                .findByDescricao("APROVADO")
                .orElseThrow(() -> new RuntimeException("Status de pagamento não encontrado"));

        // Registra o pagamento
        Pagamento pagamento = new Pagamento();
        pagamento.setReserva(reserva);
        pagamento.setMetodoPagamento(metodo);
        pagamento.setStatusPagamento(statusAprovado);
        pagamento.setValorPago(dto.valorPago());
        pagamento.setDataPagamento(OffsetDateTime.now());
        pagamentoRepository.save(pagamento);

        // Atualiza status da reserva para CONFIRMADA
        StatusReserva statusAnterior = reserva.getStatusReserva();
        StatusReserva statusConfirmada = statusReservaRepository
                .findByDescricao("CONFIRMADA")
                .orElseThrow(() -> new RuntimeException("Status de reserva não encontrado"));

        reserva.setStatusReserva(statusConfirmada);
        reservaRepository.save(reserva);

        // Registra no histórico
        HistoricoReserva historico = new HistoricoReserva();
        historico.setIdReserva(reserva.getId());
        historico.setIdStatusAnterior(statusAnterior.getId());
        historico.setIdStatusNovo(statusConfirmada.getId());
        historico.setDataAlteracao(OffsetDateTime.now());
        historico.setDetalhes("Pagamento registrado via " + metodo.getDescricao());
        historicoReservaRepository.save(historico);

        return toDTO(pagamento);
    }

    public List<PagamentoDTO> listarPorReserva(Long idReserva) {
        return pagamentoRepository.findByReservaId(idReserva)
                .stream()
                .map(this::toDTO)
                .toList();
    }

    private PagamentoDTO toDTO(Pagamento p) {
        return new PagamentoDTO(
                p.getId(),
                p.getReserva().getCodigoReserva(),
                p.getMetodoPagamento().getDescricao(),
                p.getStatusPagamento().getDescricao(),
                p.getValorPago(),
                p.getDataPagamento()
        );
    }
}
