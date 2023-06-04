package oficina_mecanica;

public class Veiculo {
	private String marcaVeiculo;
	private String modeloVeiculo;
	private String corVeiculo;
	private int anoFabricacaoVeiculo;
	private String placaDoVeiculoVeiculo;
	
	
	public void cadastrarVeiculoCliente(String marcaPassada, String modeloPassada, String corPassada,
			int anoFabricacaoPassada, String placaDoVeiculoPassada) {

		this.marcaVeiculo = marcaPassada;
		this.modeloVeiculo = modeloPassada;
		this.corVeiculo = corPassada;
		this.anoFabricacaoVeiculo = anoFabricacaoPassada;
		this.placaDoVeiculoVeiculo = placaDoVeiculoPassada;
		
	}

	public void listarVeiculoCliente() {

		System.out.println("Veículo: " + this.modeloVeiculo);
		System.out.println("Placa: " + this.placaDoVeiculoVeiculo);
	}

	public String getMarcaVeiculo() {
		return marcaVeiculo;
	}

	public void setMarcaVeiculo(String marcaVeiculo) {
		this.marcaVeiculo = marcaVeiculo;
	}

	public String getModeloVeiculo() {
		return modeloVeiculo;
	}

	public void setModeloVeiculo(String modeloVeiculo) {
		this.modeloVeiculo = modeloVeiculo;
	}

	public String getCorVeiculo() {
		return corVeiculo;
	}

	public void setCorVeiculo(String corVeiculo) {
		this.corVeiculo = corVeiculo;
	}

	public int getAnoFabricacaoVeiculo() {
		return anoFabricacaoVeiculo;
	}

	public void setAnoFabricacaoVeiculo(int anoFabricacaoVeiculo) {
		this.anoFabricacaoVeiculo = anoFabricacaoVeiculo;
	}

	public String getPlacaDoVeiculoVeiculo() {
		return placaDoVeiculoVeiculo;
	}

	public void setPlacaDoVeiculoVeiculo(String placaDoVeiculoVeiculo) {
		this.placaDoVeiculoVeiculo = placaDoVeiculoVeiculo;
	}

}
