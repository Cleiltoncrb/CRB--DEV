public class Condicional {
    public static void main(String[] args) {

        int anoDeLancamento = 2022;
        boolean incluidoNoPlano = false;
        double notaDoFilme = 8.1;
        String tipoPlano = "normal";

        if (anoDeLancamento >= 2022){
            System.out.println("Lancamento que os clientes estão curtindo!");
        }else{
            System.out.println("Filmes retô que vale a pena assistir!");
        }
        System.out.println(tipoPlano);

        if (incluidoNoPlano == true || tipoPlano.equals("normal")) {
            System.out.println("Filme Liberado!");
        }else{
            System.out.println("Deve pagar a locação");
        }

    }
}
