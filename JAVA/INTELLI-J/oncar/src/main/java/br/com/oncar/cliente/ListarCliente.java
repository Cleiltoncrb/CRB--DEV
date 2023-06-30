package br.com.oncar.cliente;

import br.com.oncar.carro.Carro;

public record ListarCliente(
        Long id, String nome, String email, String cpf, String telefone) {

    public ListarCliente(Cliente cliente) {
        this(cliente.getId(),
                cliente.getNome(),
                cliente.getEmail(),
                cliente.getCpf(),
                cliente.getTelefone());
    }
}
