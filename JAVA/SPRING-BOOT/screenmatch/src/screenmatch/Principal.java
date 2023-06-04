package screenmatch;

public class Principal {

	public static void main(String[] args) {

		Filme meuFilme = new Filme();
		meuFilme.nome = "O Poderoso Chefão";
		meuFilme.anoDeLancamento = 1970;
		meuFilme.duracaoEmMinutos = 180;

		meuFilme.exibeFichaTecnica();
		meuFilme.avalia(8);
		meuFilme.avalia(5);
		meuFilme.avalia(10);
		
		//System.out.println(meuFilme.s;
		System.out.println("Total de avaliações: " + meuFilme.getTotlDeAvaliacoes());
		
		//System.out.println(meuFilme.pegaMedia());
		
		

	}

}
