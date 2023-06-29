package br.com.oncar.cliente;

import br.com.oncar.carro.CadastrarCarro;


public record AtualizarCliente(
    Long id,
    String nome,
    String email,
    String telefone,
    String cpf,
    String endereco,
    CadastrarCarro carro){
}
