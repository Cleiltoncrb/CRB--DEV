import java.util.Collections;
import java.util.Scanner;

import static java.lang.System.*;

public class Principal {
    public static void main(String[] args) {

        Scanner leitura = new Scanner(in);

        out.println("\n##########################");
        out.println("Digite o limite do cartão: ");
        double limite = leitura.nextDouble();
        CartaoDeCredito cartao = new CartaoDeCredito(limite);

        String menu = """
                        **********-- COMPRAS --*************
                        1 - COMPRAR
                        2 - SAIR
                        """;

        int sair = 1;
        while(sair != 0) {
            out.println(menu);
            sair = leitura.nextInt();
            switch (sair) {

                case 1:
                    out.println("Digite a descrição da compra:");
                    String descricao = leitura.next();

                    out.println("Digite o valor da compra:");
                    double valor = leitura.nextDouble();

                    Compra compra = new Compra(descricao, valor);
                    boolean compraRealizada = cartao.lancaCompra(compra);

                    if (compraRealizada) {
                        out.println("Compra realizada!");
                        //out.println("Digite 0 para sair ou 1 para continuar");
                        //sair = leitura.nextInt();
                    } else {
                        out.println("Saldo insuficiente!");
                        //sair = 0;
                    }
                    Collections.sort(cartao.getCompras());
                    for (Compra c : cartao.getCompras()) {
                        out.println(c.getDescricao() + " - " +c.getValor());
                    }
                    out.println("\n*********--SALDO NO CARTÃO--**************");
                    out.println("\nSALDO = " +cartao.getSaldo());
                    break;
                case 2:
                    sair = 0;
                    out.println("\n ATÉ LOGO!!");
                    break;

                default:
                    out.println("\nOPÇÃO INVALIDA!! \n");
                    break;
            }
        }

    }


}
