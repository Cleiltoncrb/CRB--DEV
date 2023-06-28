package br.com.oncar.carro;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;

public record DadosCarroCliente(

        String placa,
        String modelo,
        String anodefabricacao
) {
}