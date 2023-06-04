package oficina_mecanica;

public class Estoque {
	private double retrovisor;
	private double pastilhaDeFreio;
	private double amortecedor;
	private double discoDeFreio;
	private double oleo;
	private double filtroDeOleo;
	private double filtroDeAr;
	private double filtroDeCombustivel;
	private double total;
	
	
	
	public double getRetorvisor() {
		return retrovisor;
	}
	public void setRetorvisor(double retrovisor) {
		this.retrovisor = retrovisor;
	}
	public double getPastilhaDeFreio() {
		return pastilhaDeFreio;
	}
	public void setPastilhaDeFreio(double pastilhaDeFreio) {
		this.pastilhaDeFreio = pastilhaDeFreio;
		System.out.println("Valor da Pastilha de Freio: R$ " + pastilhaDeFreio);
		this.total += pastilhaDeFreio;
	}
	public double getAmortecedor() {
		return amortecedor;
	}
	public void setAmortecedor(double amortecedor) {
		this.amortecedor = amortecedor;
		System.out.println("Valor do Amortecedor: R$ " + amortecedor);
		this.total += amortecedor;
	}
	public double getDiscoDeFreio() {
		return discoDeFreio;
	}
	public void setDiscoDeFreio(double discoDeFreio) {
		this.discoDeFreio = discoDeFreio;
		System.out.println("Valor do Disco de Freio: R$ " + discoDeFreio);
		this.total += discoDeFreio;
	}
	public double getOleo() {
		return oleo;
	}
	public void setOleo(double oleo) {
		this.oleo = oleo;
	}
	public double getFiltroDeOleo() {
		return filtroDeOleo;
	}
	public void setFiltroDeOleo(double filtroDeOleo) {
		this.filtroDeOleo = filtroDeOleo;
	}
	public double getFiltroDeAr() {
		return filtroDeAr;
	}
	public void setFiltroDeAr(double filtroDeAr) {
		this.filtroDeAr = filtroDeAr;
	}
	public double getFiltroDeCombustivel() {
		return filtroDeCombustivel;
	}
	public void setFiltroDeCombustivel(double filtroDeCombustivel) {
		this.filtroDeCombustivel = filtroDeCombustivel;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}

}
