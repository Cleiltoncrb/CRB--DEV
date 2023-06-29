package br.com.oncar.cliente;


public record CadastrarCliente(
        String nome,
        String cpf,
        String email,
        String telefone,
        String endereco
) {
}
