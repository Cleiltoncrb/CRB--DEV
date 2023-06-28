package br.com.oncar.carro;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Table(name="tb_carro_cliente")
@Entity(name = "CarroCliente")
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class CarroCliente {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String placa;
    private String modelo;
    private String anofabricacao;

//    public CarroCliente(DadosCarroCliente dados) {
//        this.placa = dados.placa();
//        this.modelo = dados.modelo();
//        this.anofabricacao = dados.anodefabricacao();
//    }

    public CarroCliente(String placa, String modelo, String anofabricacao) {
        this.placa = placa;
        this.modelo = modelo;
        this.anofabricacao = anofabricacao;
    }


    public void atualizarInformacoesCarro(DadosCarroCliente dados) {
        if (dados.placa() != null) {
            this.placa = dados.placa();
        }

        if (dados.modelo() != null) {
            this.modelo = dados.modelo();
        }

        if (dados.anodefabricacao() != null) {
            this.anofabricacao = dados.anodefabricacao();
        }
    }
}
