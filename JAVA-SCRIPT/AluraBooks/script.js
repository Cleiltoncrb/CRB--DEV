async function buscaEndereco(cep) {
    var mensagemErro = document.getElementById('erro');
    mensagemErro.innerHTML = "";
    try {
        var consultaCEP = await fetch(`https://viacep.com.br/ws/${cep}/json/`);
        var consultaCEPConvertida = await consultaCEP.json();

        if (consultaCEPConvertida.erro) {
            throw Error('CEP não existente!');
        }
        var cidade = document.getElementById('cidade');
        var logradouro = document.getElementById('endereco');
        var estado = document.getElementById('estado');

        cidade.value = consultaCEPConvertida.localidade;
        logradouro.value = consultaCEPConvertida.logradouro;
        estado.value = consultaCEPConvertida.uf;

        console.log(consultaCEPConvertida);
        return consultaCEPConvertida;
    } catch (erro) {
        mensagemErro.innerHTML = `<p>CEP inválido. Tente novamente!</p>`
        console.log(erro);
    }
}

var cep = document.getElementById('cep');
cep.addEventListener("focusout", () => buscaEndereco(cep.value));


// async function buscaEndereco(cep) {
//     var mensagemErro = document.getElementById('erro');
//     mensagemErro.innerHTML = "";
//     try {
//         var consultaCEP = await fetch(`https://viacep.com.br/ws/${cep}/json/`);
//         var consultaCEPConvertida = await consultaCEP.json();
//         if (consultaCEPConvertida.erro) {
//             throw Error('CEP não existente!');
//         }
//         var cidade = document.getElementById('cidade');
//         var logradouro = document.getElementById('endereco');
//         var estado = document.getElementById('estado');

//         cidade.value = consultaCEPConvertida.localidade;
//         logradouro.value = consultaCEPConvertida.logradouro;
//         estado.value = consultaCEPConvertida.uf;

//         console.log(consultaCEPConvertida);
//         return consultaCEPConvertida;
//     } catch (erro) {
//         mensagemErro.innerHTML = `<p>CEP inválido. Tente novamente!</p>`
//         console.log(erro);
//     }
// }

// var cep = document.getElementById('cep');
// cep.addEventListener("focusout", () => buscaEndereco(cep.value));



// let ceps = ['72255203', '01001001'];
// let conjutoCeps = ceps.map(valores => buscaEndereco(valores));
// console.log(conjutoCeps);
// Promise.all(conjutoCeps).then(respostas => console.log(respostas));



// var consultaCEP = fetch('https://viacep.com.br/ws/72255203/json/')
//     .then(resposta => resposta.json())
//     .then(r => {
//         if(r.erro){
//             throw Error('Este CEP não existe!');
//         }else{
//             console.log(r);
//         }
//         })
//     .catch(erro => console.log(erro))
//     .finally(mensagem => console.log('Processamento concludo!'));

// console.log(consultaCEP)