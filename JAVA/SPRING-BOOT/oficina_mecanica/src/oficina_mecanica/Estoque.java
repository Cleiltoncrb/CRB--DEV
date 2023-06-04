package oficina_mecanica;

public class Estoque {

	private String nomeProduto;
	private int quantidadeProduto;
	private double valorProduto;

	// ----------------- CADASTRA PRODUTO NO ESTOQUE ------------------------------
	public double cadastraEstoque(String nomeProdutoPassado, double valorProdutoPassado, int quantidadeProdutoPassado) {

		double multiplicacaoProdutoQuantidade = 0;

		this.nomeProduto = nomeProdutoPassado;
		this.valorProduto = valorProdutoPassado;
		this.quantidadeProduto = quantidadeProdutoPassado;

		multiplicacaoProdutoQuantidade = valorProdutoPassado * quantidadeProdutoPassado;

		return (multiplicacaoProdutoQuantidade);
	}

	// ----------------- DECREMENTA ESTOQUE ---------------------------------------
	public void tiraDoEstoque(int quantidade) {

		if (quantidadeProduto != 0) {
			this.quantidadeProduto = getQuantidadeProduto() - quantidade;
		} else {
			System.out.println("Não tem a quantidade necessário do produto em estoque.");
		}
	}

// ----------------- GET & SET ---------------------------------------	

	public String getNomeProduto() {
		return nomeProduto;
	}

	public void setNomeProduto(String nomeProduto) {
		this.nomeProduto = nomeProduto;
	}

	public int getQuantidadeProduto() {
		return quantidadeProduto;
	}

	public void setQuantidadeProduto(int quantidadeProduto) {
		this.quantidadeProduto += quantidadeProduto;
	}

	public double getValorProduto() {
		return valorProduto;
	}

	public void setValorProduto(double valorProduto) {
		this.valorProduto = valorProduto;
	}

}
