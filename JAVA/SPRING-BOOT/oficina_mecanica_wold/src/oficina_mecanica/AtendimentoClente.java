package oficina_mecanica;

public class AtendimentoClente {

	public static void main(String[] args) {

		Oficina oficina = new Oficina(10);
		Estoque estoque = new Estoque();
		Cliente cliente = new Cliente();
		Veiculo veiculo = new Veiculo();
		

		oficina.setProprietarioDoVeiculo(cliente);
		oficina.setEstoqueDaOficina(estoque);
		cliente.setVeiculoDoCliente(veiculo);

		oficina.getProprietarioDoVeiculo().setNome("Portugal");
		oficina.getProprietarioDoVeiculo().getVeiculoDoCliente().setPlacaDoVeiculo("RRT0E55");
		oficina.getEstoqueDaOficina().setAmortecedor(141.44);
		oficina.getEstoqueDaOficina().setPastilhaDeFreio(50.30);
		oficina.getEstoqueDaOficina().setDiscoDeFreio(250.60);
		oficina.calculaDesconto();
		oficina.setAgendamento("23/11/2015");
		oficina.agendarServico();


	}

}
