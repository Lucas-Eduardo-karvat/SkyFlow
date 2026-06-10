package com.projeto_reserva.SkyFlow.service;

import com.projeto_reserva.SkyFlow.dto.reserva.CriarReservaDTO;
import com.projeto_reserva.SkyFlow.dto.reserva.ReservaDTO;
import com.projeto_reserva.SkyFlow.entity.*;
import com.projeto_reserva.SkyFlow.repository.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.math.BigDecimal;
import java.time.OffsetDateTime;
import java.util.List;
import java.util.Random;

@Service
public class ReservaService {

    private final ReservaRepository reservaRepository;
    private final TarifaRepository tarifaRepository;
    private final PassageiroRepository passageiroRepository;
    private final AssentoRepository assentoRepository;
    private final TrechoVooRepository trechoVooRepository;
    private final ReservaAssentoRepository reservaAssentoRepository;
    private final StatusReservaRepository statusReservaRepository;
    private final HistoricoReservaRepository historicoReservaRepository;

    public ReservaService(ReservaRepository reservaRepository,
                          TarifaRepository tarifaRepository,
                          PassageiroRepository passageiroRepository,
                          AssentoRepository assentoRepository,
                          TrechoVooRepository trechoVooRepository,
                          ReservaAssentoRepository reservaAssentoRepository,
                          StatusReservaRepository statusReservaRepository,
                          HistoricoReservaRepository historicoReservaRepository) {
        this.reservaRepository = reservaRepository;
        this.tarifaRepository = tarifaRepository;
        this.passageiroRepository = passageiroRepository;
        this.assentoRepository = assentoRepository;
        this.trechoVooRepository = trechoVooRepository;
        this.reservaAssentoRepository = reservaAssentoRepository;
        this.statusReservaRepository = statusReservaRepository;
        this.historicoReservaRepository = historicoReservaRepository;
    }

    @Transactional
    public ReservaDTO criar(CriarReservaDTO dto) {
        // 1. Busca entidades necessárias
        Passageiro passageiro = passageiroRepository.findById(dto.idPassageiro())
                .orElseThrow(() -> new RuntimeException("Passageiro não encontrado"));

        Tarifa tarifa = tarifaRepository.findById(dto.idTarifa())
                .orElseThrow(() -> new RuntimeException("Tarifa não encontrada"));

        Assento assento = assentoRepository.findById(dto.idAssento())
                .orElseThrow(() -> new RuntimeException("Assento não encontrado"));

        TrechoVoo trecho = trechoVooRepository.findById(dto.idTrecho())
                .orElseThrow(() -> new RuntimeException("Trecho não encontrado"));

        // 2. Verifica disponibilidade
        if (tarifa.getQuantidadeDisponivel() <= 0) {
            throw new RuntimeException("Não há vagas disponíveis para essa tarifa");
        }

        if (reservaAssentoRepository.existsByTrechoIdAndAssentoId(trecho.getId(), assento.getId())) {
            throw new RuntimeException("Assento já ocupado nesse trecho");
        }

        // 3. Busca status inicial
        StatusReserva statusAguardando = statusReservaRepository
                .findByDescricao("AGUARDANDO_PAGAMENTO")
                .orElseThrow(() -> new RuntimeException("Status não encontrado"));

        // 4. Calcula valor final
        BigDecimal valorFinal = tarifa.getPrecoPorKm()
                .multiply(trecho.getDistanciaKm())
                .multiply(tarifa.getTipoClasse().getMultiplicadorValor());

        // 5. Cria a reserva
        Reserva reserva = new Reserva();
        reserva.setPassageiro(passageiro);
        reserva.setTarifa(tarifa);
        reserva.setStatusReserva(statusAguardando);
        reserva.setCodigoReserva(gerarCodigo());
        reserva.setDataReserva(OffsetDateTime.now());
        reserva.setValorFinal(valorFinal);
        reservaRepository.save(reserva);

        // 6. Vincula assento ao trecho
        ReservaAssento reservaAssento = new ReservaAssento();
        reservaAssento.setReserva(reserva);
        reservaAssento.setTrecho(trecho);
        reservaAssento.setAssento(assento);
        reservaAssentoRepository.save(reservaAssento);

        // 7. Diminui quantidade disponível da tarifa
        tarifa.setQuantidadeDisponivel(tarifa.getQuantidadeDisponivel() - 1);
        tarifaRepository.save(tarifa);

        // 8. Registra no histórico
        HistoricoReserva historico = new HistoricoReserva();
        historico.setIdReserva(reserva.getId());
        historico.setIdStatusNovo(statusAguardando.getId());
        historico.setDataAlteracao(OffsetDateTime.now());
        historico.setDetalhes("Reserva criada");
        historicoReservaRepository.save(historico);

        return toDTO(reserva, assento, trecho);
    }

    @Transactional
    public ReservaDTO cancelar(String codigoReserva, String motivo) {
        Reserva reserva = reservaRepository.findByCodigoReserva(codigoReserva)
                .orElseThrow(() -> new RuntimeException("Reserva não encontrada"));

        StatusReserva statusAtual = reserva.getStatusReserva();

        // Não permite cancelar reservas já canceladas ou finalizadas
        if (statusAtual.getDescricao().equals("CANCELADA")) {
            throw new RuntimeException("Reserva já está cancelada");
        }
        if (statusAtual.getDescricao().equals("FINALIZADA")) {
            throw new RuntimeException("Não é possível cancelar uma reserva finalizada");
        }

        StatusReserva statusCancelada = statusReservaRepository
                .findByDescricao("CANCELADA")
                .orElseThrow(() -> new RuntimeException("Status não encontrado"));

        // Devolve a vaga na tarifa
        Tarifa tarifa = reserva.getTarifa();
        tarifa.setQuantidadeDisponivel(tarifa.getQuantidadeDisponivel() + 1);
        tarifaRepository.save(tarifa);

        // Registra no histórico
        HistoricoReserva historico = new HistoricoReserva();
        historico.setIdReserva(reserva.getId());
        historico.setIdStatusAnterior(statusAtual.getId());
        historico.setIdStatusNovo(statusCancelada.getId());
        historico.setDataAlteracao(OffsetDateTime.now());
        historico.setDetalhes(motivo != null ? motivo : "Cancelado pelo passageiro");
        historicoReservaRepository.save(historico);

        // Atualiza status
        reserva.setStatusReserva(statusCancelada);
        reservaRepository.save(reserva);

        // Busca assento vinculado para montar o DTO
        ReservaAssento ra = reservaAssentoRepository.findByReservaId(reserva.getId())
                .stream().findFirst()
                .orElseThrow(() -> new RuntimeException("Assento da reserva não encontrado"));

        return toDTO(reserva, ra.getAssento(), ra.getTrecho());
    }

    public ReservaDTO buscarPorCodigo(String codigoReserva) {
        Reserva reserva = reservaRepository.findByCodigoReserva(codigoReserva)
                .orElseThrow(() -> new RuntimeException("Reserva não encontrada"));

        ReservaAssento ra = reservaAssentoRepository.findByReservaId(reserva.getId())
                .stream().findFirst()
                .orElseThrow(() -> new RuntimeException("Assento da reserva não encontrado"));

        return toDTO(reserva, ra.getAssento(), ra.getTrecho());
    }

    public List<ReservaDTO> listarPorPassageiro(Long idPassageiro) {
        return reservaRepository.findByPassageiroId(idPassageiro)
                .stream()
                .map(r -> {
                    ReservaAssento ra = reservaAssentoRepository.findByReservaId(r.getId())
                            .stream().findFirst().orElse(null);
                    if (ra == null) return null;
                    return toDTO(r, ra.getAssento(), ra.getTrecho());
                })
                .filter(r -> r != null)
                .toList();
    }

    // -------------------------------------------------------------------------
    // Helpers privados
    // -------------------------------------------------------------------------

    private String gerarCodigo() {
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        Random random = new Random();
        StringBuilder codigo = new StringBuilder();
        for (int i = 0; i < 6; i++) {
            codigo.append(chars.charAt(random.nextInt(chars.length())));
        }
        // Garante unicidade
        if (reservaRepository.findByCodigoReserva(codigo.toString()).isPresent()) {
            return gerarCodigo();
        }
        return codigo.toString();
    }

    private ReservaDTO toDTO(Reserva r, Assento assento, TrechoVoo trecho) {
        return new ReservaDTO(
                r.getId(),
                r.getCodigoReserva(),
                r.getStatusReserva().getDescricao(),
                r.getDataReserva(),
                r.getValorFinal(),
                r.getPassageiro().getNome(),
                r.getPassageiro().getDocumento(),
                trecho.getVoo().getCodigoVoo(),
                trecho.getAeroportoOrigem().getCodigoIata(),
                trecho.getAeroportoDestino().getCodigoIata(),
                assento.getNumeroAssento(),
                assento.getTipoClasse().getNomeClasse()
        );
    }
}
