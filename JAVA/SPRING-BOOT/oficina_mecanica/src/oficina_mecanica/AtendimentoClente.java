package oficina_mecanica;

public class AtendimentoClente {

	public static void main(String[] args) {

		Veiculo veiculo = new Veiculo();
		Cliente cliente = new Cliente();
		Oficina oficina = new Oficina(10);
		

		veiculo.cadastrarVeiculoCliente("Fiat", "Pálio", "Preto", 2010, "SGN4D10");
		cliente.cadastraCliente("Majin Boo", "004333222611", "QON 2 bloc E ap 126", "Vendedor", "619653-2345", veiculo);
		oficina.calculaOrcamento();
		oficina.aprovaOrcamento(367);// Cliente informa valor para que ele possa validar o orcamento
	
	
	}
}
