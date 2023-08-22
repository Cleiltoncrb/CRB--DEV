import { NegociacaoController } from "./controllers/negociacao-controller.js";

const controller = new NegociacaoController();
const form = document.querySelector('.form');
if (form) {
    form.addEventListener('submit', event => {
        event.preventDefault();
        controller.adiociona();
    });
}else{
    throw Error("Não foi possivel inicializar. Verifique se existe FORM.");
    
}


