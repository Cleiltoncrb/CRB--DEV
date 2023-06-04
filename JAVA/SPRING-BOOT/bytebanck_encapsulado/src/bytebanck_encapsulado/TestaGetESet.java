package bytebanck_encapsulado;

public class TestaGetESet {

	public static void main(String[] args) {
		Conta conta = new Conta(1337, 24226);

		conta.setNumero(1337);

		System.out.println(conta.getNumero());

		Cliente paulo = new Cliente();

		paulo.setNome("Paulo Silveira");
		conta.setTitular(paulo);

		System.out.println(conta.getTitular().getNome());

		conta.getTitular().setProfissao("Programador");
		System.out.println(conta.getTitular().getProfissao()); // vai imprimir Programador
		// agora em duas linhas
		Cliente titualarDaConta = conta.getTitular();
		titualarDaConta.setProfissao("Estagiário");
		
		

		System.out.println(titualarDaConta); // vai imprimir o endereço de mémoria reservado para o OBJ conta do Tipo Conta  
		System.out.println(paulo);
		System.out.println(conta.getTitular());
		
		System.out.println(conta.getTitular().getProfissao()); // vai imprimir Estagiário

	}

}
