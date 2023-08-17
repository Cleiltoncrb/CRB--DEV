import { Negociacao } from "../models/negociacao.js";

export class NegociacaoController {
    private inputData: Date;
    private inputQuantidade: number;
    private inputValor: number;

    constructor() {
        this.inputData = document.querySelector('#data');
        this.inputQuantidade = document.querySelector('#quantidade');
        this.inputValor = document.querySelector('#valor');
    }

    adiociona() {
        const negociacao = new Negociacao(
            this.inputData.value,
            this.inputQuantidade.value,
            this.inputValor.value
        );
        console.log(negociacao);
    }
}
