package oficina_mecanica;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class ProdutoController {
	
	List<Estoque> produtos = new ArrayList<>();

	public void adicionar(Estoque cp) {
	    produtos.add(cp);
	}

	public void listaProdutos() {
	    produtos.forEach((p) -> {
	    	System.out.println("------------LISTA DE PRODUTOS-----------------");
	        System.out.println("Nome: " + p.getNomeProduto());
	        System.out.println("Quantidade: " + p.getQuantidadeProduto());
	        System.out.println("Valor: " + p.getValorProduto());
	        System.out.println("----------------------------------------------\n");
	    });
	}
	
	
	
	@SuppressWarnings("resource")
	public void cadastraProduto() {
		
		Scanner selecionado = new Scanner(System.in);
	    Scanner nomeProduto = new Scanner(System.in);
	    Scanner quantidadeProduto = new Scanner(System.in);
	    Scanner valorProduto = new Scanner(System.in);
	    ProdutoController produtoController = new ProdutoController();
	    Estoque estoque = new Estoque();

	    String nome = "";
	    int quantidade = 0;
	    double valor = 0;
	    boolean opcao = true;

	    while (opcao) {
	    	
	    	System.out.println("\n  1 - Cadastrar produto?\n  2 - Listar produtos\n  3 - Sair\n\n");
            int numero = selecionado.nextInt();
	    	

	        switch (numero) {

	            case 1:
	                System.out.println("Nome do produto: ");
	                nome = nomeProduto.nextLine();
	                estoque.setNomeProduto(nome);

	                System.out.println("Quantidade do produto: ");
	                quantidade = quantidadeProduto.nextInt();
	                estoque.setQuantidadeProduto(quantidade);

	                System.out.println("Valor do produto: ");
	                valor = valorProduto.nextDouble();
	                estoque.setValorProduto(valor);

	                produtoController.adicionar(estoque);
	                estoque = new Estoque();
	                break;

	            case 2:
	            	produtoController.listaProdutos();
	                break;
	            case 3:
	            	System.out.println("Até logo!!!");
	            	opcao = false;
	            	break;
	            default:
	            	System.out.println("Opção Invalida tente novamente!");
	        }
	    }
	}
}
