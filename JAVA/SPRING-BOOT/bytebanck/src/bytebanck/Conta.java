package bytebanck;

public class Conta {
	// atributos da conta
	double saldo;
	int agencia;
	int numero;
	String titular;

	// vamos escrever os comportamentos/métodos

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
}
