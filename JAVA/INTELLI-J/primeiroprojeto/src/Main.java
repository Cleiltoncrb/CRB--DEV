public class Main {
    public static void main(String[] args) {
        System.out.println("Esse é o Screen Match");
        System.out.println("Filme: Top Gun: Maverick");

        int anoDeLancamento = 2022;
        System.out.println("Ano de lançamento:" + anoDeLancamento);
        boolean incluidoNoPlano = true;
        double notaDoFilme = 8.1;

        double media = (9.8 + 6.3 + 8) / 3;
        System.out.println(media);
        String sinopse;
        sinopse = "Filme de aventura com galã dos anos 80";
        System.out.println(sinopse);

        int classificacao = (int) (media /2);

        System.out.println(classificacao);













        /*
        String nome = "Maria";
        int idade = 30;
        double valor = 55.9999;
        System.out.println(String.format("Meu nome é %s, eu tenho %d anos e hoje gastei %.2f reais", nome, idade, valor));

        método format(), da classe String.
        Esse método permite formatar um texto utilizando diversos placeholders, que são representados pelo caractere % seguido de uma letra
        que indica o tipo de dado que será inserido no placeholder.
        Por exemplo,
        %s indica que uma String será inserida no placeholder,
        %d indica um valor inteiro e
        %f indica um valor decimal.
        */
    }
}