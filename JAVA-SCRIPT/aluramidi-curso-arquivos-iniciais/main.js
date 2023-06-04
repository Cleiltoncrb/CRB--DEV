


function tocaSom(seletorAudio) {
    //document.querySelector(idElementoAudio).play();
    const elemento = document.querySelector(seletorAudio);
    
    if (elemento != null && elemento.localName === 'audio') {    
            elemento.play();  
    }else{
            console.log("Elemento não encontrado ou seletor invalido");
    }
}

const listaDeTeclas = document.querySelectorAll('.tecla');

// repetição
for (let contador = 0; contador < listaDeTeclas.length; contador++) {

    const tecla = listaDeTeclas[contador];
    const instrumento = tecla.classList[1];
    const idAudio = `#som_${instrumento}`; //template string

    tecla.onclick = function () {
        tocaSom(idAudio);
    }

    tecla.onkeydown = function name(evento) {

        console.log(evento);

        if (evento.code === 'Space' || evento.code === 'Enter') {
            tecla.classList.add('ativa');
        }
        // console.log(evento.code === 'Space');
        // console.log(evento.code === 'Enter');
    }

    tecla.onkeyup = function () {
        tecla.classList.remove('ativa');
    }
}
