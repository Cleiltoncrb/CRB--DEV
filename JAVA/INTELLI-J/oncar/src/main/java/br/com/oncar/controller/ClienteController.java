package br.com.oncar.controller;

import br.com.oncar.carro.CarroCliente;
import br.com.oncar.carro.CarroRepository;
import br.com.oncar.carro.DadosCarroCliente;
import br.com.oncar.cliente.Cliente;
import br.com.oncar.cliente.ClienteRepository;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.beans.Transient;

@Controller
@RequestMapping("/cliente")
public class ClienteController {
    @Autowired
    private ClienteRepository repositoryCliente;

    @Autowired
    private CarroRepository repositoryCarro;

    @GetMapping
    public String carregapaginacliente() {

        return "oficina/cadastroCliente";
    }

    @GetMapping("/listagemCliente")
    public String carregalistagemliente() {

        return "oficina/listagemCliente";
    }


    @PostMapping
    @Transactional
    public String cadastrarCliente(String nome, String cpf, String email, String telefone, String endereco, String placa, String modelo, String anofabricacao) {

        System.out.println("\n\n\n -- VERIFICAR DADOS -- \n\n\n");

        Cliente cliente = new Cliente(nome, cpf, email, telefone, endereco);
        CarroCliente carroCliente = new CarroCliente(placa, modelo, anofabricacao);

        System.out.println(carroCliente);


        repositoryCarro.save(carroCliente);
        repositoryCliente.save(cliente);


        return "redirect:/cliente/listagemCliente";
    }
}