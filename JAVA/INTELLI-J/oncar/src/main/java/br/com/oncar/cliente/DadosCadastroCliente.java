package br.com.oncar.cliente;


import br.com.oncar.carro.DadosCarroCliente;

public record DadosCadastroCliente(

        String nome,

        String cpf,

        String email,

        String telefone,

        String endereco,

        DadosCarroCliente dadosCarroCliente
) {
}
