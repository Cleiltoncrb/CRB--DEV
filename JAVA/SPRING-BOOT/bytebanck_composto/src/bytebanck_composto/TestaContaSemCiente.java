package bytebanck_composto;

public class TestaContaSemCiente {

	public static void main(String[] args) {
		Conta contaDaMarcela = new Conta();
		System.out.println(contaDaMarcela.getSaldo()); // imprime 0.0
		
		contaDaMarcela.titular = new Cliente();
		System.err.println(contaDaMarcela.titular); // imprime sujeira da memória
		
		contaDaMarcela.titular.nome = "Marcela";
		System.out.println(contaDaMarcela.titular.nome); // imprime Marcelad
		

	}

}




