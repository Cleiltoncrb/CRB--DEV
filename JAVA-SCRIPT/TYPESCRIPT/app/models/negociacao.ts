export class Negociacao {

    constructor(
        private readonly _data: Date,
        public readonly quantidade: number,
        public readonly valor: number
    ) { }


    get volume(): number {
        return this.quantidade * this.valor;
    }

    get data(): Date {
        const date = new Date(this._data.getTime());
        return date;
    }
}