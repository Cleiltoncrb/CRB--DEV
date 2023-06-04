package bytebanck;

public class TesteReferencias {

	public static void main(String[] args) {

		Conta primeiraConta = new Conta();
		
		primeiraConta.saldo = 300;
		System.out.println("\nSaldo da Primeira conta: " + primeiraConta.saldo);

		Conta segundaConta = primeiraConta;

		System.out.println("\nSaldo da Segunda conta: " + segundaConta.saldo);
		
		segundaConta.saldo += 100; // atribuiiu mais 100 no valor de saldo
		System.out.println("\nSaldo da Segunda conta: " + segundaConta.saldo);
		
		System.out.println("\nSaldo atualizado da Primeira conta: " + primeiraConta.saldo);
		
		if (primeiraConta == segundaConta) {
			System.out.println("\n**** São a mesmissima conta!! ****");
			
		}
		
		System.err.println(primeiraConta);
		System.err.println(segundaConta);

	}

}
