package sitaxe_variaveris_e_fluxo;

public class Desafio_01 {

	public static void main(String[] args) {
		
		double salario = 12001;
		int idade = 32;
		double dozePorCento = salario + (salario * 0.12);
		double vintePorCento = salario + (salario * 0.20);
		double aposentado = salario - (salario * 0.20);


		if (salario > 10000 && idade > 30) {

			System.out.println("Salário antigo ( R$ " + salario
					+ " ) Recebeu adicional 12%, por ter mais de 30 anos de idade, salário atualizado: ( R$ "
					+ dozePorCento + " )");

		}
		if (salario > 12000 && idade > 50) {

			System.out.println("Salário antigo ( R$ " + salario
					+ " )Recebeu adicional de 20%, por ter mais de 50 anos de idade: ( R$ " + vintePorCento + " )");

		}
		if (idade > 65) {

			System.out.println("Salário antigo ( R$ " + salario
					+ " ) voce está aposentado, recebeu um desconto de 20% valora atualizado: ( R$ " + aposentado
					+ " )");

		}

	}

}
