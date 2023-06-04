package bytebanck_encapsulado;

public class Conta {
	// atributos da conta
	private double saldo;
	private int agencia;
	private int numero;
	private Cliente titular;
	private static int total;

	// vamos escrever os comportamentos/métodos

	public Conta(int agencia, int numero) { // esse é um contrutor onde podemos passar parametros indispensaveis

		Conta.total++;
		System.out.println("\n\nO total de contas é: " + Conta.total);

		this.agencia = agencia;
		this.numero = numero;

		System.out.println("\n\nEstou criando uma conta " + this.numero);

	}

	public void deposita(double valor) {

		this.saldo += valor;

	}

	public boolean saca(double valor) {

		if (this.saldo >= valor) {
			this.saldo -= valor;
			return true;

		} else {
			return false;
		}

	}

	public boolean transfere(double valor, Conta destino) {

		if (this.saldo >= valor) {
			this.saldo -= valor;
			destino.deposita(valor);
			return true;
		}
		return false;
	}

	public double getSaldo() {
		return this.saldo;
	}

	public int getNumero() {
		return this.numero;
	}

	public void setNumero(int numero) {
		if (numero <= 0) {
			System.out.println("\n\nNão pode valor menor ou igual a ZERO!!!");
			return;
		}
		this.numero = numero;
	}

	public int getAgencia() {
		return this.agencia;
	}

	public void setAgencia(int agencia) {
		if (agencia <= 0) {
			System.out.println("\n\nNão pode valor menor ou igual a ZERO!!!");
			return;
		}
		this.agencia = agencia;
	}

	public Cliente getTitular() {
		return titular;
	}

	public void setTitular(Cliente titular) {
		this.titular = titular;
	}

	public static int getTotal() {
		return Conta.total;
	}

}
