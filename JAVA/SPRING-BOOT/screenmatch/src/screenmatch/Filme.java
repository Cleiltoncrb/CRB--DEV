package screenmatch;

public class Filme {

	String nome;
	int anoDeLancamento;
	boolean incluidoNoPlano;
	private double somaDasAvaliacoes;
	private int totlDeAvaliacoes;
	int duracaoEmMinutos;
	
	
	public int getTotlDeAvaliacoes() {
		return this.totlDeAvaliacoes;
	}

	void exibeFichaTecnica() {

		System.out.println("Nome do filme: " + nome);
		System.out.println("Ano de lançamento " + anoDeLancamento);

	}

	void avalia(double nota) {
		this.somaDasAvaliacoes += nota;
		this.totlDeAvaliacoes++;
	}

	double pegaMedia() {
		return somaDasAvaliacoes / totlDeAvaliacoes;
	}

}
