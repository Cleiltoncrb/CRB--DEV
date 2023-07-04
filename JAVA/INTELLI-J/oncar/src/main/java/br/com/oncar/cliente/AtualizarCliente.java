package br.com.oncar.cliente;

public record AtualizarCliente(
    Long id,
    String nome,
    String email,
    String cpf,
    String telefone,
    String endereco
    ){
}
