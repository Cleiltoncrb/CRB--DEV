package br.com.oncar.carro;

import br.com.oncar.cliente.Cliente;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@Table(name = "tb_carro")
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Carro {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String placa;
    private String modelo;
    private String anofabricacao;

    @ManyToOne
    @JoinColumn(name = "cliente_id")
    private Cliente cliente;

    public Carro(CadastrarCarro carro) {
        this.placa = carro.placa();
        this.modelo = carro.modelo();
        this.anofabricacao = carro.anofabricacao();
    }

    public void atualizarCarro(AtualizarCarro dados) {
        if (dados.placa() != null) {
            this.placa = dados.placa();
        }
        if (dados.modelo() != null) {
            this.modelo = dados.modelo();
        }
        if (dados.anofabricacao() != null) {
            this.anofabricacao = dados.anofabricacao();
        }
    }
}
