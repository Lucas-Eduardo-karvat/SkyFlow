package com.projeto_reserva.SkyFlow.service;

import com.projeto_reserva.SkyFlow.dto.passageiro.CadastroPassageiroDTO;
import com.projeto_reserva.SkyFlow.dto.passageiro.PassageiroDTO;
import com.projeto_reserva.SkyFlow.entity.Cidade;
import com.projeto_reserva.SkyFlow.entity.Passageiro;
import com.projeto_reserva.SkyFlow.repository.CidadeRepository;
import com.projeto_reserva.SkyFlow.repository.PassageiroRepository;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class PassageiroService {

    private final PassageiroRepository passageiroRepository;
    private final CidadeRepository cidadeRepository;

    public PassageiroService(PassageiroRepository passageiroRepository,
                              CidadeRepository cidadeRepository) {
        this.passageiroRepository = passageiroRepository;
        this.cidadeRepository = cidadeRepository;
    }

    public PassageiroDTO cadastrar(CadastroPassageiroDTO dto) {
        // Verifica se documento ou email já existem
        if (passageiroRepository.findByDocumento(dto.documento()).isPresent()) {
            throw new RuntimeException("Documento já cadastrado");
        }
        if (passageiroRepository.findByEmail(dto.email()).isPresent()) {
            throw new RuntimeException("Email já cadastrado");
        }

        Cidade cidade = cidadeRepository.findById(dto.idCidadeEndereco())
                .orElseThrow(() -> new RuntimeException("Cidade não encontrada"));

        Passageiro passageiro = new Passageiro();
        passageiro.setNome(dto.nome());
        passageiro.setDocumento(dto.documento());
        passageiro.setEmail(dto.email());
        passageiro.setTelefone(dto.telefone());
        passageiro.setCidadeEndereco(cidade);
        passageiro.setLogradouro(dto.logradouro());
        passageiro.setNumero(dto.numero());
        passageiro.setComplemento(dto.complemento());
        passageiro.setCep(dto.cep());

        Passageiro salvo = passageiroRepository.save(passageiro);
        return toDTO(salvo);
    }

    public PassageiroDTO buscarPorId(Long id) {
        Passageiro passageiro = passageiroRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Passageiro não encontrado"));
        return toDTO(passageiro);
    }

    public PassageiroDTO buscarPorDocumento(String documento) {
        Passageiro passageiro = passageiroRepository.findByDocumento(documento)
                .orElseThrow(() -> new RuntimeException("Passageiro não encontrado"));
        return toDTO(passageiro);
    }

    public List<PassageiroDTO> listarTodos() {
        return passageiroRepository.findAll()
                .stream()
                .map(this::toDTO)
                .toList();
    }

    private PassageiroDTO toDTO(Passageiro p) {
        return new PassageiroDTO(
                p.getId(),
                p.getNome(),
                p.getDocumento(),
                p.getEmail(),
                p.getTelefone(),
                p.getCidadeEndereco().getNome(),
                p.getCidadeEndereco().getEstado().getNome(),
                p.getCidadeEndereco().getEstado().getPais().getNome()
        );
    }
}
