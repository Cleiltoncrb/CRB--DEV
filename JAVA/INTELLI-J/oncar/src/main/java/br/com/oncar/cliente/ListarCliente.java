package br.com.oncar.cliente;

public record ListarCliente(
        Long id, String nome, String email, String cpf, String telefone) {

    public ListarCliente(Cliente cliente) {
        this(cliente.getId(),
                cliente.getNome(),
                cliente.getEmail(),
                cliente.getCpf(),
                cliente.getTelefone());
//                carro.getPlaca());
    }
}
