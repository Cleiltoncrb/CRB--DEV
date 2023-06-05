public class Dessafios {

    public static void main(String[] args) {

        double temperaturaFahrenheit = 0;

        double temperaturaCelsius = 23.8889;
        int temperaturaFinal = 0;
         /*
         formula de Fahrenheit p/ Celsius (75 °F − 32) × 5/9 = 23 °C
         formula de Celsius p/ Fahrenheit (temperatura * 1.8) + 32
          */
        temperaturaFahrenheit = (temperaturaCelsius *1.8) + 32;
        System.out.println(temperaturaFahrenheit);
        temperaturaFinal = (int) temperaturaFahrenheit;
        System.out.println(temperaturaFinal);


        int dia = 3;
        String nomeDia;

        switch (dia) {
            case 1:
                nomeDia = "domingo";
                break;
            case 2:
                nomeDia = "segunda-feira";
                break;
            case 3:
                nomeDia = "terça-feira";
                break;
            case 4:
                nomeDia = "quarta-feira";
                break;
            case 5:
                nomeDia = "quinta-feira";
                break;
            case 6:
                nomeDia = "sexta-feira";
                break;
            case 7:
                nomeDia = "sábado";
                break;
            default:
                nomeDia = "Dia inválido";
                break;
        }

        System.out.println("O dia " + dia + " é " + nomeDia);
    }
}
