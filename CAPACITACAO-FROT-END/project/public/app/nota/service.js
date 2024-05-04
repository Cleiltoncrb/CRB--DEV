import { handleStatus } from "../utils/promise-helpers.js";
import { partialize, pipe } from "../utils/operators.js";

const API = 'http://localhost:3000/notas';

const getItemsFromNotas = notas => notas.$flatMap(nota => nota.itens);
const filterItemsByCode = (code, items) => items.filter(item => item.codigo == code);
const sumItemsValues = items => items.reduce((total, item) => total + item.valor, 0);

export const notasService = {
 listAll(){
    return fetch(API)
    .then(handleStatus)
    .catch(error => {
      console.log(error);
      return Promise.reject('Não foi possível obter as notars fiscais!');
    });
  }, 

  sumItems(code){
    const filterItems = partialize(filterItemsByCode, code);

    const sumItems = pipe(
      getItemsFromNotas, 
      filterItems, 
      sumItemsValues
      );

    return this.listAll()
    .then(sumItems);
  }
}
