
const form = document.getElementById("novoItem");
const lista = document.getElementById("lista");
const itens = JSON.parse(localStorage.getItem("itens")) || [];

//console.log(itens);

itens.forEach((elemento) => {
    criarElemento(elemento);
})

form.addEventListener("submit", (evento) => {
    evento.preventDefault();

    const nome = evento.target.elements['nome'];
    const quantidade = evento.target.elements['quantidade'];

    const existe = itens.find(elemento => elemento.nome === nome.value);

    const itemAtual = {
        "nome": nome.value,
        "quantidade": quantidade.value
    }

    if (existe) {
        itemAtual.id = existe.id;

        atualizarElemento(itemAtual);
        itens[itens.findIndex(elemento => elemento.id === existe.id)] = itemAtual;

    } else {
        itemAtual.id = itens[itens.length - 1] ? itens[itens.length - 1].id + 1 : 0;
        criarElemento(itemAtual);
        itens.push(itemAtual);
    }

    localStorage.setItem("itens", JSON.stringify(itens));


    nome.value = "";
    quantidade.value = "";

})

function criarElemento(item) {

    const novoItem = document.createElement("li");
    novoItem.classList.add("item");

    numeroItem = document.createElement("strong");
    numeroItem.innerHTML = item.quantidade;
    numeroItem.dataset.id = item.id;
    novoItem.appendChild(numeroItem);

    novoItem.innerHTML += item.nome;

    novoItem.appendChild(botaoDeleta(item.id));

    lista.appendChild(novoItem);

}

function atualizarElemento(item) {
    document.querySelector("[data-id='" + item.id + "']").innerHTML = item.quantidade;

}

function botaoDeleta(id) {
    const elementoBotao = document.createElement("button");
    elementoBotao.innerText = "X";

    elementoBotao.addEventListener("click", function () {
        deletaElemento(this.parentNode, id);
    })

    return elementoBotao;
}

function deletaElemento(tag, id) {
    tag.remove();
    itens.splice(itens.findIndex(elemento => elemento.id === id), 1);
    localStorage.setItem("itens", JSON.stringify(itens));
    //console.log(itens);
}

