package br.com.oncar.cliente;

import br.com.oncar.carro.CarroCliente;

import jakarta.persistence.*;
import lombok.*;

import java.util.ArrayList;
import java.util.List;


@Table(name = "tb_cliente")
@Entity(name = "Cliente")
@Getter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of = "id")
@ToString
public class Cliente {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nome;
    private String email;
    private String cpf;
    private String telefone;
    private String endereco;


//    @OneToMany
//    private List<CarroCliente> carro = new ArrayList<>();

//    public Cliente(DadosCadastroCliente dados) {
//
//        this.nome = dados.nome();
//        this.email = dados.email();
//        this.telefone = dados.telefone();
//        this.cpf = dados.cpf();
//        this.endereco = dados.endereco();
//    }

    public Cliente(String nome, String cpf, String email, String telefone, String endereco){
        this.nome = nome;
        this.cpf = cpf;
        this.email = email;
        this.telefone = telefone;
        this.endereco = endereco;
    }

    public void atualizarInformacoesCliente(DadosAtualizacaoCliente dados) {

            this.nome = dados.nome();

            this.email = dados.email();

           this.telefone = dados.telefone();

            this.cpf = dados.cpf();


//            this.carro.atualizarInformacoesCarro(dados.carro());

    }
}
