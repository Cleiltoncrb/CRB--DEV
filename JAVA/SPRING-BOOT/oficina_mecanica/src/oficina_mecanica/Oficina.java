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

	// ----------------- CONSTRUTOR OFICINA ----------------------------
	public Oficina(int valor) {
		System.out.println("\n\n#############################################");
		System.out.print("#                                           #");
		Oficina.nomeFantasia = "\n# OFICINA MECÂNICA - ";
		Oficina.desconto = valor;
		System.out.println(nomeFantasia + " Com " + desconto + "% de desconto   #");
		System.out.println("#                                           #");
		System.out.println("#############################################\n\n");
	}

	// ----------------- CALCULAR ORÇAMENTO ------------------------------
	public void calculaOrcamento() {

		Estoque estoque = new Estoque();
		Estoque estoque2 = new Estoque();

		double produto = estoque.cadastraEstoque("Amortecedor", 120.32, 2);
		double produto2 = estoque2.cadastraEstoque("Correia dentada", 140.55, 1);

		DecimalFormat formataCasasAposVirgula = new DecimalFormat("R$ #.##"); // formatar apenas duas casas decimais

		System.out.println("--------------ORÇAMENTO----------------");

		System.out.println("(" + estoque.getNomeProduto() + ") --> " + estoque.getQuantidadeProduto() + " x "
				+ formataCasasAposVirgula.format(estoque.getValorProduto()) + " = "
				+ formataCasasAposVirgula.format(produto));

		System.out.println("(" + estoque2.getNomeProduto() + ") --> " + estoque2.getQuantidadeProduto() + " x "
				+ formataCasasAposVirgula.format(estoque2.getValorProduto()) + " = "
				+ formataCasasAposVirgula.format(produto2));

		this.orcamento = produto + produto2;

		System.out.println("\nOrçamento SEM desconto: " + formataCasasAposVirgula.format(orcamento));
		orcamento -= orcamento * (Oficina.getDesconto() / 100);
		System.out.println(
				"Orçamento FINAL com " + desconto + "% de desconto: " + formataCasasAposVirgula.format(orcamento));
		System.out.println("---------------------------------------\n\n");
	}

	// ----------------- GERAR ORDEM DE SERVIÇO --------------------------------
	public void geraOrdemDeServiço() {

		Random random = new Random();
		int numeroAleatorio = random.nextInt(999999);
		this.ordemDeServico = numeroAleatorio;

		System.out.println("Ordem de Serviço Nº " + getOrdemDeServico());

	}

	// ----------------- AGENDAR SERVIÇO --------------------------------
	public void agendaServico(String dataString) {

		DateTimeFormatter formato = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		LocalDate data = LocalDate.parse(dataString, formato);
		System.out.println("-------------AGENDAMENTO---------------");
		System.out.println("Serviço foi agendado para " + formato.format(data));
		geraOrdemDeServiço();
		System.out.println("---------------------------------------\n\n");

	}

	// ----------------- APROVA ORÇAMENTO --------------------------------
	public void aprovaOrcamento(double valorEsperado) {

		if (this.orcamento <= valorEsperado) {
			System.out.println("Orçamento aprovado pelo cliente.\n\n");
			agendaServico("11/05/2023");

		} else {
			System.out.println(" $$$$  CLIENTE NÃO APROVOU O ORÇAMENTO!!!  $$$$ ");
		}

	}

	// ----------------- GET & SET ---------------------------------------
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
