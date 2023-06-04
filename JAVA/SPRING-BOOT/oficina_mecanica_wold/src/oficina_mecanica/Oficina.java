package oficina_mecanica;

import java.text.*;
import java.util.*;
//import java.io.*;

public class Oficina {
	private double orcamento;
	private Date agendamento;
	private double ordemDeServico;
	private Cliente proprietarioDoVeiculo;
	private Estoque estoqueDaOficina;
	private static String nomeFantasia;
	private static int desconto;

	public Oficina(int valor) {
		Oficina.nomeFantasia = "\n\n  Oficina Mecânica - SAI";
		Oficina.desconto = valor;
		System.out.println(nomeFantasia + " Com " + desconto + "% de desconto \n\n");

	}

	public void calculaDesconto() {

		DecimalFormat formataCasasAposVirgula = new DecimalFormat("R$ #.##"); // formatar apenas duas casas decimais

		orcamento = estoqueDaOficina.getTotal();
		System.out.println("Orçamento sem desconto: " + formataCasasAposVirgula.format(orcamento));
		orcamento -= orcamento * (Oficina.getDesconto() / 100);
		System.out.println("Orçamento FINAL com " + desconto + "% de desconto: " + formataCasasAposVirgula.format(orcamento));

	}

	public void agendarServico() {

		System.out.println("Serviço Agendada para " + this.agendamento);
	}

	public double getOrcamento() {

		return orcamento;
	}

	// public void setOrcamento(double orcamento) {
	// this.orcamento = orcamento;

	// }

	public Date getAgendamento() {
		return agendamento;
	}

	public void setAgendamento(String dataString) {

		SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
		Date data = formato.parse(dataString);

		this.agendamento = formato.get ;

		// Date date = new GregorianCalendar(year, month - 1, day).getTime();
		// System.out.println(date);
	}

	public double getServico() {
		return ordemDeServico;
	}

	public void setServico(double servico) {
		this.ordemDeServico = servico;
	}

	public Cliente getProprietarioDoVeiculo() {
		return proprietarioDoVeiculo;
	}

	public void setProprietarioDoVeiculo(Cliente proprietarioDoVeiculo) {
		this.proprietarioDoVeiculo = proprietarioDoVeiculo;
	}

	public Estoque getEstoqueDaOficina() {
		return estoqueDaOficina;
	}

	public void setEstoqueDaOficina(Estoque estoqueDaOficina) {
		this.estoqueDaOficina = estoqueDaOficina;
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

}
