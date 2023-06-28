package br.com.oncar.cliente;

import br.com.oncar.carro.DadosCarroCliente;


public record DadosAtualizacaoCliente(

    Long id,
    String nome,
    String email,
    String telefone,
    String cpf,
    String endereco,
    DadosCarroCliente carro){
}
