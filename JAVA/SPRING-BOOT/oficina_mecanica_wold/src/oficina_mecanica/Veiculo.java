package oficina_mecanica;

public class Veiculo {
	private String marca;
	private String modelo;
	private String cor;
	private int anoFabricacao;
	private String placaDoVeiculo;
	
	
	public String getMarca() {
		return marca;
	}
	public void setMarca(String marca) {
		this.marca = marca;
	}
	public String getModelo() {
		return modelo;
	}
	public void setModelo(String modelo) {
		this.modelo = modelo;
	}
	public String getCor() {
		return cor;
	}
	public void setCor(String cor) {
		this.cor = cor;
	}
	public int getAnoFabricacao() {
		return anoFabricacao;
	}
	public void setAnoFabricacao(int anoFabricacao) {
		this.anoFabricacao = anoFabricacao;
	}
	public String getPlacaDoVeiculo() {
		return placaDoVeiculo;
	}
	public void setPlacaDoVeiculo(String placaDoVeiculo) {
		this.placaDoVeiculo = placaDoVeiculo;
		System.out.println("Placa do Veiculo: " + placaDoVeiculo);
	}
}
