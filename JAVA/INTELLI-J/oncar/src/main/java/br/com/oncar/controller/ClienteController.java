package br.com.oncar.controller;

import br.com.oncar.carro.AtualizarCarro;
import br.com.oncar.carro.Carro;
import br.com.oncar.cliente.AtualizarCliente;
import br.com.oncar.cliente.ListarCliente;
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
    private CarroRepository carroRepository;

    @GetMapping("/cadastrarcliente")
    public String carregapaginacliente(Long id, Model model) {

        if (id != null) {
            var cliente = clienteRepository.getReferenceById(id);
            model.addAttribute("cliente", cliente);
        }
        if (id != null) {
            var carro = carroRepository.getReferenceById(id);
            model.addAttribute("carro", carro);
        }

        return "oficina/cadastroCliente";
    }


    @GetMapping("/listarCliente")
    public String listarCliente(Model model) {
        model.addAttribute("listaCLiente", clienteRepository.findAll());
        model.addAttribute("listaCarro", carroRepository.findAll());

        return "oficina/listarCliente";
    }

    @PostMapping
    @Transactional
    public String cadastrarCliente(CadastrarCliente cliente, CadastrarCarro carro) {
        clienteRepository.save(new Cliente(cliente));
        carroRepository.save(new Carro(carro));
        return "redirect:/oncar/listarCliente";
    }

    @PutMapping
    @Transactional
    public String alteraDadosCadastrais(AtualizarCliente cliente, AtualizarCarro carro) {

        var atualizaCliente = clienteRepository.getReferenceById(cliente.id());
        atualizaCliente.atualizarCliente(cliente);

        var atualizaCarro = carroRepository.getReferenceById(carro.id());
        atualizaCarro.atualizarCarro(carro);

        System.out.println("\n\n\n - VAMOS VER CLIENTE - \n\n\n");
        System.out.println(cliente);
        System.out.println("\n\n\n - VAMOS VER CARRO - \n\n\n");
        System.out.println(carro);

        return "redirect:/oncar/listarCliente";
    }

    @DeleteMapping
    @Transactional
    public String removeCliente(Long id) {
        clienteRepository.deleteById(id);
        carroRepository.deleteById(id);

        return "redirect:/oncar/listarCliente";
    }
}
