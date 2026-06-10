package com.projeto_reserva.SkyFlow.controller;

import com.projeto_reserva.SkyFlow.dto.reserva.CancelarReservaDTO;
import com.projeto_reserva.SkyFlow.dto.reserva.CriarReservaDTO;
import com.projeto_reserva.SkyFlow.dto.reserva.ReservaDTO;
import com.projeto_reserva.SkyFlow.service.ReservaService;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/reservas")
public class ReservaController {

    private final ReservaService reservaService;

    public ReservaController(ReservaService reservaService) {
        this.reservaService = reservaService;
    }

    // Cria uma nova reserva
    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public ReservaDTO criar(@RequestBody CriarReservaDTO dto) {
        return reservaService.criar(dto);
    }

    // Busca reserva pelo código (ex: A3F9KZ)
    @GetMapping("/{codigoReserva}")
    public ReservaDTO buscarPorCodigo(@PathVariable String codigoReserva) {
        return reservaService.buscarPorCodigo(codigoReserva);
    }

    // Lista todas as reservas de um passageiro
    @GetMapping("/passageiro/{idPassageiro}")
    public List<ReservaDTO> listarPorPassageiro(@PathVariable Long idPassageiro) {
        return reservaService.listarPorPassageiro(idPassageiro);
    }

    // Cancela uma reserva
    @PatchMapping("/{codigoReserva}/cancelar")
    public ReservaDTO cancelar(
            @PathVariable String codigoReserva,
            @RequestBody(required = false) CancelarReservaDTO dto) {
        String motivo = dto != null ? dto.motivo() : null;
        return reservaService.cancelar(codigoReserva, motivo);
    }
}
