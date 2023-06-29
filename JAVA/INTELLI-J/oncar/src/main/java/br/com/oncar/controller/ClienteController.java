package br.com.oncar.controller;

import br.com.oncar.carro.Carro;
import br.com.oncar.repository.CarroRepository;
import br.com.oncar.carro.CadastrarCarro;
import br.com.oncar.cliente.Cliente;
import br.com.oncar.repository.ClienteRepository;

import br.com.oncar.cliente.CadastrarCliente;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/oncar")
public class ClienteController {
    @Autowired
    private ClienteRepository clienteRepository;

    @Autowired
    private CarroRepository carroRepositoryarro;

    @GetMapping("/cadastrarcliente")
    public String carregapaginacliente() {
        return "oficina/cadastroCliente";
    }

    @GetMapping("/listarCliente")

    public String listarCliente(Model model) {
        model.addAttribute("lista", clienteRepository.findAll());
        return "oficina/listarCliente";
    }

    @PostMapping
    @Transactional
    public String cadastrarCliente(CadastrarCliente cliente, CadastrarCarro carro) {
        clienteRepository.save(new Cliente(cliente));
        carroRepositoryarro.save(new Carro(carro));
        return "redirect:/oncar/listarCliente";
    }


}