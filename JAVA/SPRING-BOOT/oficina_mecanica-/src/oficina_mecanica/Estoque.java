package oficina_mecanica;

public class Estoque {

	private String nomeProduto;
	private int quantidadeProduto;
	private double valorProduto;

	public double cadastraEstoque(String produtoPassado, double valorProdutoPassado, int quantidadePassado) {

		this.nomeProduto = produtoPassado;
		this.valorProduto = valorProdutoPassado;
		this.quantidadeProduto = quantidadePassado;
		double total = valorProdutoPassado * quantidadePassado;

		return (total);
	}

	public void tiraDoEstoque(int quantidade) {
		this.quantidadeProduto = getQuantidadeProduto() - quantidade;

	}

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
