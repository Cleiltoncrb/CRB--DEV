package br.com.oncar.cliente;

import br.com.oncar.carro.AtualizarCarro;
import br.com.oncar.carro.Carro;
import jakarta.persistence.*;
import lombok.*;

import java.util.ArrayList;
import java.util.List;

import static jakarta.persistence.CascadeType.ALL;


@Entity
@Table(name = "tb_cliente")
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
    private Boolean ativo;


    @OneToMany(cascade = ALL, mappedBy = "cliente")
    private List<Carro> carro = new ArrayList<>();

    public Cliente(CadastrarCliente dados) {

        this.ativo = true;
        this.nome = dados.nome();
        this.email = dados.email();
        this.cpf = dados.cpf();
        this.telefone = dados.telefone();
        this.endereco = dados.endereco();

    }

    public void atualizarCliente(AtualizarCliente cliente) {

        if (cliente.nome() != null) {
            this.nome = cliente.nome();
        }
        if (cliente.email() != null) {
            this.email = cliente.email();
        }
        if (cliente.cpf() != null) {
            this.cpf = cliente.cpf();

        }
        if (cliente.telefone() != null) {
            this.telefone = cliente.telefone();
        }
        if (cliente.endereco() != null) {
            this.endereco = cliente.endereco();
        }
    }
}
