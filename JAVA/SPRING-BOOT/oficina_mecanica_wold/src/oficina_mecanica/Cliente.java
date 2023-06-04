package oficina_mecanica;

public class Cliente {
	private String nome;
	private String cpf;
	private String endereco;
	private String profissao;
	private int contato;
	private Veiculo veiculoDoCliente;
	
	
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
		System.out.println("Nome do Cliente: " + nome);
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
	public int getContato() {
		return contato;
	}
	public void setContato(int contato) {
		this.contato = contato;
	}
	public Veiculo getVeiculoDoCliente() {
		return veiculoDoCliente;
	}
	public void setVeiculoDoCliente(Veiculo veiculoDoCliente) {
		this.veiculoDoCliente = veiculoDoCliente;
	}
	
}
