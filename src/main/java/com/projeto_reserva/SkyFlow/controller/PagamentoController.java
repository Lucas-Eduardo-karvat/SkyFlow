package com.projeto_reserva.SkyFlow.controller;

import com.projeto_reserva.SkyFlow.dto.pagamento.PagamentoDTO;
import com.projeto_reserva.SkyFlow.dto.pagamento.RegistrarPagamentoDTO;
import com.projeto_reserva.SkyFlow.service.PagamentoService;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/pagamentos")
public class PagamentoController {

    private final PagamentoService pagamentoService;

    public PagamentoController(PagamentoService pagamentoService) {
        this.pagamentoService = pagamentoService;
    }

    // Registra um pagamento para uma reserva
    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public PagamentoDTO registrar(@RequestBody RegistrarPagamentoDTO dto) {
        return pagamentoService.registrar(dto);
    }

    // Lista pagamentos de uma reserva
    @GetMapping("/reserva/{idReserva}")
    public List<PagamentoDTO> listarPorReserva(@PathVariable Long idReserva) {
        return pagamentoService.listarPorReserva(idReserva);
    }
}
