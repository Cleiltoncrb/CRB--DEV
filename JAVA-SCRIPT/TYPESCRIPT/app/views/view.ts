export abstract class View<Tipo> {

    protected elemento: HTMLElement;

    constructor(seletor: string) {
        this.elemento = document.querySelector(seletor);
    }

    public update(model: Tipo): void {
        const template = this.template(model);
        this.elemento.innerHTML = template;

    }
    protected abstract template(model: Tipo): string;
}

