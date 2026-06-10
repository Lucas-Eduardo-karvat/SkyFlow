package com.projeto_reserva.SkyFlow.service;

import com.projeto_reserva.SkyFlow.dto.voo.*;
import com.projeto_reserva.SkyFlow.entity.*;
import com.projeto_reserva.SkyFlow.repository.*;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class VooService {

    private final VooRepository vooRepository;
    private final TrechoVooRepository trechoVooRepository;
    private final TarifaRepository tarifaRepository;
    private final AssentoRepository assentoRepository;
    private final ReservaAssentoRepository reservaAssentoRepository;
    private final AeroportoRepository aeroportoRepository;

    public VooService(VooRepository vooRepository,
                      TrechoVooRepository trechoVooRepository,
                      TarifaRepository tarifaRepository,
                      AssentoRepository assentoRepository,
                      ReservaAssentoRepository reservaAssentoRepository,
                      AeroportoRepository aeroportoRepository) {
        this.vooRepository = vooRepository;
        this.trechoVooRepository = trechoVooRepository;
        this.tarifaRepository = tarifaRepository;
        this.assentoRepository = assentoRepository;
        this.reservaAssentoRepository = reservaAssentoRepository;
        this.aeroportoRepository = aeroportoRepository;
    }

    public List<VooResumoDTO> listarTodos() {
        return vooRepository.findAll()
                .stream()
                .map(this::toResumoDTO)
                .toList();
    }

    public VooDetalheDTO buscarPorId(Long id) {
        Voo voo = vooRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Voo não encontrado"));
        return toDetalheDTO(voo);
    }

    public VooDetalheDTO buscarPorCodigo(String codigoVoo) {
        Voo voo = vooRepository.findByCodigoVoo(codigoVoo)
                .orElseThrow(() -> new RuntimeException("Voo não encontrado"));
        return toDetalheDTO(voo);
    }

    public List<VooResumoDTO> buscarPorOrigem(String codigoIataOrigem) {
        Aeroporto origem = aeroportoRepository.findByCodigoIata(codigoIataOrigem)
                .orElseThrow(() -> new RuntimeException("Aeroporto de origem não encontrado"));

        return trechoVooRepository.findByAeroportoOrigemId(origem.getId())
                .stream()
                .map(TrechoVoo::getVoo)
                .distinct()
                .map(this::toResumoDTO)
                .toList();
    }

    public List<VooResumoDTO> buscarPorOrigemEDestino(String codigoIataOrigem, String codigoIataDestino) {
        Aeroporto origem = aeroportoRepository.findByCodigoIata(codigoIataOrigem)
                .orElseThrow(() -> new RuntimeException("Aeroporto de origem não encontrado"));
        Aeroporto destino = aeroportoRepository.findByCodigoIata(codigoIataDestino)
                .orElseThrow(() -> new RuntimeException("Aeroporto de destino não encontrado"));

        List<Long> voosComOrigem = trechoVooRepository.findByAeroportoOrigemId(origem.getId())
                .stream().map(t -> t.getVoo().getId()).toList();

        List<Long> voosComDestino = trechoVooRepository.findByAeroportoDestinoId(destino.getId())
                .stream().map(t -> t.getVoo().getId()).toList();

        return vooRepository.findAll()
                .stream()
                .filter(v -> voosComOrigem.contains(v.getId()) && voosComDestino.contains(v.getId()))
                .map(this::toResumoDTO)
                .toList();
    }

    public List<AssentoDTO> listarAssentosPorTrecho(Long idTrecho, Long idAeronave) {
        return assentoRepository.findByAeronaveId(idAeronave)
                .stream()
                .map(a -> {
                    boolean ocupado = reservaAssentoRepository
                            .existsByTrechoIdAndAssentoId(idTrecho, a.getId());
                    return new AssentoDTO(
                            a.getId(),
                            a.getNumeroAssento(),
                            a.getTipoClasse().getNomeClasse(),
                            !ocupado
                    );
                })
                .toList();
    }

    // -------------------------------------------------------------------------
    // Conversores privados
    // -------------------------------------------------------------------------

    private VooResumoDTO toResumoDTO(Voo voo) {
        List<TrechoVoo> trechos = trechoVooRepository
                .findByVooIdOrderByOrdemTrechoAsc(voo.getId());

        TrechoVoo primeiro = trechos.isEmpty() ? null : trechos.get(0);
        TrechoVoo ultimo   = trechos.isEmpty() ? null : trechos.get(trechos.size() - 1);

        List<TarifaDTO> tarifas = tarifaRepository.findByVooId(voo.getId())
                .stream()
                .map(this::toTarifaDTO)
                .toList();

        return new VooResumoDTO(
                voo.getId(),
                voo.getCodigoVoo(),
                voo.getCompanhia().getNome(),
                voo.getStatusVoo().getDescricao(),
                primeiro != null ? toAeroportoDTO(primeiro.getAeroportoOrigem()) : null,
                ultimo   != null ? toAeroportoDTO(ultimo.getAeroportoDestino())  : null,
                primeiro != null ? primeiro.getDataPartida()  : null,
                ultimo   != null ? ultimo.getDataChegada()    : null,
                trechos.size(),
                tarifas
        );
    }

    private VooDetalheDTO toDetalheDTO(Voo voo) {
        List<TrechoVooDTO> trechos = trechoVooRepository
                .findByVooIdOrderByOrdemTrechoAsc(voo.getId())
                .stream()
                .map(this::toTrechoDTO)
                .toList();

        List<TarifaDTO> tarifas = tarifaRepository.findByVooId(voo.getId())
                .stream()
                .map(this::toTarifaDTO)
                .toList();

        return new VooDetalheDTO(
                voo.getId(),
                voo.getCodigoVoo(),
                voo.getCompanhia().getNome(),
                voo.getStatusVoo().getDescricao(),
                trechos,
                tarifas
        );
    }

    private TrechoVooDTO toTrechoDTO(TrechoVoo t) {
        return new TrechoVooDTO(
                t.getId(),
                t.getOrdemTrecho(),
                toAeroportoDTO(t.getAeroportoOrigem()),
                toAeroportoDTO(t.getAeroportoDestino()),
                t.getDataPartida(),
                t.getDataChegada(),
                t.getDistanciaKm(),
                t.getAeronave().getCodigoRegistro(),
                t.getAeronave().getModelo().getNomeModelo()
        );
    }

    private AeroportoDTO toAeroportoDTO(Aeroporto a) {
        return new AeroportoDTO(
                a.getId(),
                a.getCodigoIata(),
                a.getNome(),
                a.getCidade().getNome(),
                a.getCidade().getEstado().getNome(),
                a.getCidade().getEstado().getPais().getNome()
        );
    }

    private TarifaDTO toTarifaDTO(Tarifa t) {
        // preço total estimado: preco_por_km * distância média de 1000km como base
        // o cálculo real deve ser feito com a distância total dos trechos
        return new TarifaDTO(
                t.getId(),
                t.getTipoClasse().getNomeClasse(),
                t.getPrecoPorKm(),
                null, // preço total calculado no momento da reserva
                t.getQuantidadeDisponivel(),
                t.getMoeda().getNome(),
                t.getMoeda().getSimbolo()
        );
    }
}
