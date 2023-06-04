package bytebanck;

public class TestaMetodo {

	public static void main(String[] args) {

		Conta contaDoPaulo = new Conta();

		contaDoPaulo.saldo = 100;

		contaDoPaulo.deposita(50);

		System.out.println(contaDoPaulo.saldo);

		contaDoPaulo.saca(20); // método retorna um boleano true or false
		System.out.println("\nValor na Conta do Paulo = " + contaDoPaulo.saldo);

		Conta contaDaMarcela = new Conta();
		contaDaMarcela.deposita(1000); // invoca o método deposita e coloca 1000 mil reais na conta da Marcela

		System.out.println("\nValor na Conta da Marcela = " + contaDaMarcela.saldo);

		if (contaDaMarcela.transfere(300, contaDoPaulo)) {
			System.out.println("\n\n--- Transferência efetuada com sucesso!!!");

		} else {
			System.out.println("\n\n\nConta não tem o valor solicitado.");
		}

		System.out.println("\nValor na Conta do Paulo = " + contaDoPaulo.saldo);
		System.out.println("\nValor na Conta da Marcela = " + contaDaMarcela.saldo);
		
		contaDoPaulo.titular = "Paulo Silveira";
		System.out.println(contaDoPaulo.titular);

	}
}
