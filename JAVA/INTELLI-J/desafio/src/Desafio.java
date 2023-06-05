import java.util.Scanner;

public class Desafio {
    public static void main(String[] args) {
        String nome = "Cleilton";
        String tipoConta = "Corrente";
        double saldo = 1599.99;
        int opcao = 0;

        System.out.println("\n###############################");
        System.out.println("  Nome do cliente: " + nome);
        System.out.println("  Tipo conta: " + tipoConta);
        System.out.println("  Saldo atual: " + saldo);
        System.out.println("###############################\n");

        String menu = """
                ** Digite a opção desejada **
                1 - Consultar saldo
                2 - Tranferir valor
                3 - Receber valor
                4 - Sair
                """;

        Scanner leitura = new Scanner(System.in);
        while (opcao != 4){
            System.out.println(menu);
            opcao = leitura.nextInt();

            switch (opcao){
                case 1:
                System.out.println("\nO saldo atualizado é: " + saldo + "\n");
                break;
                case 2:
                    System.out.println("Qual o valor que deseja tranferir? ");
                    double valor = leitura.nextDouble();
                    if(valor > saldo){
                        System.out.println("\nNão há saldo suficente para realizar tranferência\n");
                    }else{
                        saldo -= valor;
                        System.out.println("\nNovo saldo: " + saldo + "\n");
                    }
                    break;
                case 3:
                    System.out.println("Valor recebido: ");
                    double valor1 = leitura.nextDouble();
                    saldo += valor1;
                    System.out.println("\nNovo saldo: " + saldo + "\n");
                    break;
                case 4:
                    opcao = 4;
                    System.out.println("\n ATÉ LOGO!!");
                    break;
                default:
                    System.out.println("Opção inválida");
                    break;
            }
        }

    }
}
