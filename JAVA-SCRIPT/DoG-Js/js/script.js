// CONSTANTE PARA SALVAR OS ITENS NO LOCAL STORAGE
const itens = JSON.parse(localStorage.getItem("itens")) || [];

const dogSelecionado = document.getElementById("dogSelecionado");

// FUNÇÃO PARA CONECTAR EM QUALQUER API
function fazGet(url) {
    let request = new XMLHttpRequest();
    request.open('GET', url, false);
    request.send();
    return request.responseText;
}

// FUNÇÃO QUE RETORNA O VALOR ESCOLHIDO NO HTML
function getSelectValue() {
    let guardavalor = dogSelecionado.value;
    consultaApiPorNomeSelecionado(guardavalor);
}

// FUNÇÃO PARA RETORAR IMAGENS ALEATORIAS DA API
function consultaApiRandom() {

    var dog = "DoG-Js";

    for (let index = 01; index <= 6; index++) {
        let requeste = fazGet("https://dog.ceo/api/breeds/image/random");
        let response = JSON.parse(requeste);
        let imagemDog = response.message;
        let teste = dog + index;

        document.getElementById(teste).innerHTML = `<img src=${imagemDog} class="Style_DoG_Js" />`;
    }
}

// FUNÇÃO PARA RETORNAR DADOS DA API DE ACORDO COM O PARAMETRO PASSADO
function consultaApiPorNomeSelecionado(opcao) {

    var dogImg = "dogImg";

    let requeste = fazGet(`https://dog.ceo/api/breed/${opcao}/images/random/3`);
    let response = JSON.parse(requeste);
    var imagemDog = response.message;

    for (let index = 0; index <= 2; index++) {

        let imagens = dogImg + index; 
        let identificador = document.getElementById(imagens);

        identificador.innerHTML =
            `   <img id='img-${index}' src="${imagemDog[index]}" class="opc"/>
                <input id='btn-add-img-${index}' data-img='${index}' type="submit" value="salvar &#9989;" class="dog_botao">
            `;
       
        let btnAddImg = document.getElementById(`btn-add-img-${index}`);
        
        btnAddImg.onclick = adicionarImagem;
    }
}

function adicionarImagem(e){
    e.preventDefault();
    let index = e.target.getAttribute('data-img');
    let img = document.getElementById(`img-${index}`);
    let url = img.src;
    let id = Math.round(Math.random() * 10000);
    
    addImagem(id, url);
    listarElementosLocalStorage();
}

function addImagem(id, url){
    const itemAtual = {
        "id": id,
        "raca": dogSelecionado.value,
        "imagem": url
    }
    itens.push(itemAtual);
    localStorage.setItem("itens", JSON.stringify(itens));
}

// FUNÇÃO PARA LISTAR OS ELEMENTOS QUE ESTÃO NO LOCAL STORAGE
function listarElementosLocalStorage() {

    let contextoImagens = document.getElementById('listaImagens');
    contextoImagens.innerHTML = "";
    
    for (let i = 0; i < itens.length; i++) {

        let valor = itens[i].imagem;
        let html = ` <div class="opc2 item" id="listaIMG${i}">
                        <img src=${valor} class="opc2"/>
                        <input id="btn-del-dog-${i}" data-dogid='${itens[i].id}' type="submit" value="&#10060;" class="dog_botao2">
                    </div>`;
        
        contextoImagens.insertAdjacentHTML('afterBegin', html);
        
        document.getElementById(`btn-del-dog-${i}`).onclick = excluir;
    }
}

function excluir(e){
    let id = e.target.getAttribute('data-dogid');
    excluirElemento(id);
}

// FUNÇÃO PARA EXCLUIR DADOS DO LOCAL STORAGE
function excluirElemento(id) {
    const index = itens.findIndex(item => item.id == id);
    itens.splice(index, 1);

    localStorage.setItem('itens', JSON.stringify(itens));

    listarElementosLocalStorage();
}

consultaApiRandom();
listarElementosLocalStorage();