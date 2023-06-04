package sitaxe_variaveris_e_fluxo;

public class TestaConversao {

	public static void main(String[] args) {

		double salario = 1270.50;
		int valor = (int) salario; // cast converter um double para inteiro
		System.out.println(valor);

		int idade = 10 + 20;
		System.out.println(idade);

		int trinta = 10 + 20;
		System.out.println("A idade de Marcos é" + trinta);
		
        double valor1 = 0.2;
        double valor2 = 0.1;
        double total = valor1 + valor2;

        System.out.println(total);

	}

}
