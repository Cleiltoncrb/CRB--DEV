package oficina_mecanica;

import java.text.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Random;
//import java.io.*;

public class Oficina {
	private double orcamento;
	private LocalDate agendamento;
	private int ordemDeServico;
	private static String nomeFantasia;
	private static int desconto;
	

	public Oficina(int valor) {
		Oficina.nomeFantasia = "\n\n  Oficina Mecânica -";
		Oficina.desconto = valor;
		System.out.println(nomeFantasia + " Com " + desconto + "% de desconto \n\n");

	}

	public void calculaOrcamento() {
		Estoque estoque = new Estoque();

		// formatar apenas duas casas decimais
		DecimalFormat formataCasasAposVirgula = new DecimalFormat("R$ #.##");

		double item1 = estoque.cadastraEstoque("Amortecedor", 120.32, 2);

		System.out.println("--------------ORÇAMENTO----------------");

		System.out.println("(" + estoque.getNomeProduto() + "), a unidade custa "
				+ formataCasasAposVirgula.format(estoque.getValorProduto()) + " QTD " + estoque.getQuantidadeProduto()
				+ "x");

		double item2 = estoque.cadastraEstoque("Correia dentada", 140.55, 1);
		System.out.println("(" + estoque.getNomeProduto() + "), a unidade custa "
				+ formataCasasAposVirgula.format(estoque.getValorProduto()) + " QTD " + estoque.getQuantidadeProduto()
				+ "x");

		this.orcamento = item1 + item2;

		System.out.println("\nOrçamento SEM desconto: " + formataCasasAposVirgula.format(orcamento));
		orcamento -= orcamento * (Oficina.getDesconto() / 100);
		System.out.println(
				"Orçamento FINAL com " + desconto + "% de desconto: " + formataCasasAposVirgula.format(orcamento));

	}

	public void agendarServico(String dataString) {

		DateTimeFormatter formato = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		LocalDate data = LocalDate.parse(dataString, formato);
		System.out.println("\n\n-------------AGENDAMENTO---------------");
		System.out.println("Serviço foi agendado para " + formato.format(data));
	}

	public void gerarOrdemDeServiço() {

		Random random = new Random();
		int numeroAleatorio = random.nextInt(10000);
		this.ordemDeServico = numeroAleatorio;

		System.out.println("Ordem de Serviço Nº " + getOrdemDeServico());

	}

	public double getOrcamento() {

		return orcamento;
	}

	public void setOrcamento(double orcamento) {

		this.orcamento = orcamento;

	}

	

	public static String getNomeFantasia() {
		return nomeFantasia;
	}

	public static void setNomeFantasia(String nomeFantasia) {
		Oficina.nomeFantasia = nomeFantasia;
	}

	public static double getDesconto() {
		return desconto;
	}

	public static void setDesconto(int desconto) {
		Oficina.desconto = desconto;
	}

	public int getOrdemDeServico() {
		return ordemDeServico;
	}

	public void setOrdemDeServico(int ordemDeServico) {
		this.ordemDeServico = ordemDeServico;
	}

	public LocalDate getAgendamento() {
		return agendamento;
	}

	public void setAgendamento(LocalDate agendamento) {
		this.agendamento = agendamento;
	}

	

}
