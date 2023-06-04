package bytebanck;

public class CriaConta {

	public static void main(String[] args) {

		Conta primeiraConta = new Conta();
		primeiraConta.saldo = 200;
		
		//System.out.println(primeiraConta.saldo);
		
		primeiraConta.saldo += 100;
		
		//System.out.println(primeiraConta.saldo);
		
		Conta segundaConta = new Conta();
		
		segundaConta.saldo = 50;
		
		System.out.println("Saldo da Primeira Conta: " + primeiraConta.saldo);
		System.out.println("Saldo da Segunda Conta: " + segundaConta.saldo);
		
		
		if (primeiraConta == segundaConta) {
			System.out.println("\n**** São a mesma conta!! ****");
			
		}else {
			System.out.println("Contas diferentes!!");
		}
		
		System.err.println(primeiraConta);
		System.err.println(segundaConta);

	}

}
