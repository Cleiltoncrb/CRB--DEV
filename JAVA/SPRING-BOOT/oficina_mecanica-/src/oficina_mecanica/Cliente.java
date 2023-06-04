package oficina_mecanica;

public class Cliente {
	private String nome;
	private String cpf;
	private String endereco;
	private String profissao;
	private String contato;
	private Veiculo veiculoDoCliente;

	public void cadastraCliente(String nomePassado, String cpfPassado, String enderecoPassado, String profissaoPassado,
			String contatoPassado, Veiculo veiculoDoCliente) {
		// String[] dadosCliente = { nomePassado, cpfPassado, enderecoPassado,
		// profissaoPassado, contatoPassado };
		// System.out.println("Meu array é: " + Arrays.toString(dadosCliente));

		this.nome = nomePassado;
		this.cpf = cpfPassado;
		this.endereco = enderecoPassado;
		this.profissao = profissaoPassado;
		this.contato = contatoPassado;
		this.veiculoDoCliente = veiculoDoCliente;

	}

	public void listarCliente() {

		System.out.println("-----------DADOS DO CLIENTE------------");
		System.out.println("Nome: " + this.getNome());
		System.out.println("Cpf: " + this.getCpf());
		System.out.println("Endereço: " + this.getEndereco());
		System.out.println("Profissão: " + this.getProfissao());
		System.out.println("Contato: " + this.getContato());
		System.out.println("Contato: " + this.getContato());
		veiculoDoCliente.listarVeiculoCliente();
		System.out.println("---------------------------------------\n\n");

	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public String getProfissao() {
		return profissao;
	}

	public void setProfissao(String profissao) {
		this.profissao = profissao;
	}

	public String getContato() {
		return contato;
	}

	public void setContato(String contato) {
		this.contato = contato;
	}

}
