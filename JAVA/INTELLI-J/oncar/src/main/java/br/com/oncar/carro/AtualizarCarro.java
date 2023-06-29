package br.com.oncar.carro;

public record AtualizarCarro(
        Long id,
        String placa,
        String modelo,
        String anofabricacao
) {
}
