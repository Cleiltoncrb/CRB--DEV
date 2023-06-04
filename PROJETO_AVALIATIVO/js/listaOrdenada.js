/*
        Entrada: arquivo grades
        Arquivo com a lista de alunos e notas no seguinte formato:
        Aluno: Materia1 Nota1 Materia2 Nota2 Materia3 Nota3 ....
        
        Assuma:
        • Entre o nome do aluno e a primeira matéria há um “: “ (dois pontos e um espaço);
        • O aluno pode ter nome composto;
        • Entre matérias e notas há um “ “ (espaço);
        • As notas vão de 0.0 a 10.0;
        • Apenas uma linha por Aluno;
        • Para um mesmo aluno, as matérias não se repetem.
        
 
        #################################  Exemplo:  #################################
 
        Paulo Moreira: História 8.9 Português 8.2 Inglês 9 Matemática 9.5 Geografia 8.8 Artes 7 Religião 5
        Ana Ferreira: História 9.5 Português 9.5 Inglês 9.2 Matemática 8 Geografia 7.5 Artes 9 Religião 9
        Fulano de Tal: História 5 Português 4 Inglês 4 Matemática 7.3 Geografia 10.0 Artes 7.0 Religião 2
        Beltrano da Silva: Português 2.5 Inglês 9.9 Matemática 5 Geografia 7 Artes 5.5 Religião 6.2
        Pedro de Lara: História 7.3 Inglês 9.0 Matemática 7.3 Geografia 7.8 Artes 9.2 Religião 9.9
        Elaborar um programa que:
        1. Imprime no console os alunos ordenados alfabeticamente, um por linha, com suas maiores e
        menores notas e as respectivas matérias de cada uma dessas notas. Caso a maior ou a menor nota
        aconteça em mais de uma matéria, listar todas ordenadas alfabeticamente.
        Formato:
        Aluno : maior nota M em (Matéria1, Matéria2, ..) e menor nota m em (Matéria3, Matéria4, ..)
        2. Imprime no console as matérias ordenadas alfabeticamente, uma por linha, com suas maiores e
        menores notas e os respectivos alunos que obtiveram cada uma dessas notas. Caso a maior ou a
        menor nota foram obtidas por mais de um aluno, listar todos alfabeticamente.
        Formato:
        Materia : maior nota M obtida por (Aluno1, Aluno2, ..) e menor nota m obtida por (Aluno3, Aluno4, ..)
        OBS: Não utilizar função de sort pronta, escreva seu próprio subprograma de ordenação.
 
 
        
        #################################  Exemplo de saída para o exemplo de entrada:  #################################
 
        Lista de estudantes e suas maiores e menores notas:
        Ana Ferreira : maior nota 9.5 em (História, Português) e menor nota 7.5 em (Geografia)
        Beltrano da Silva : maior nota 9.9 em (Inglês) e menor nota 2.5 em (Português)
        Fulano de Tal : maior nota 10.0 em (Geografia) e menor nota 2.0 em (Religião)
        Paulo Moreira : maior nota 9.5 em (Matemática) e menor nota 5.0 em (Religião)
        Pedro de Lara : maior nota 9.9 em (Religião) e menor nota 7.0 em (Geografia)
        ------------------------------------------------------------------------------------------
        ------------------------------------------------------------------------------------------
        Lista de matérias e suas maiores e menores notas:
        Artes : maior nota 9.2 obtida por (Ana Ferreira, Pedro de Lara) e menor nota 5.5 obtida por (Beltrano da Silva)
        Geografia : maior nota 10.0 obtida por (Fulano de Tal) e menor nota 7.0 obtida por (Beltrano da Silva, Pedro de Lara)
        História : maior nota 9.5 obtida por (Ana Ferreira) e menor nota 5.0 obtida por (Fulano de Tal)
        Inglês : maior nota 9.9 obtida por (Beltrano da Silva) e menor nota 4.0 obtida por (Fulano de Tal)
        Matemática : maior nota 9.5 obtida por (Paulo Moreira) e menor nota 5.0 obtida por (Beltrano da Silva)
        Português : maior nota 9.5 obtida por (Ana Ferreira) e menor nota 2.5 obtida por (Beltrano da Silva)
        Religião : maior nota 9.9 obtida por (Pedro de Lara) e menor nota 2.0 obtida por (Fulano de Tal)
        
        
        */



// Dados passados para manipulação (Um array de strings para separa e ordenar)
let entrada = `Paulo Moreira: História 9.5 Português 8.2 Inglês 9 Matemática 9.5 Geografia 8.8 Artes 7 Religião 5
                        Ana Ferreira: História 9.5 Português 9.5 Inglês 9.2 Matemática 8 Geografia 7.5 Artes 9.2 Religião 9
                        Fulano de Tal: História 5 Português 4 Inglês 4 Matemática 9.5 Geografia 10.0 Artes 7.0 Religião 2
                        Beltrano da Silva: História 7.1 Português 2 Inglês 9.9 Matemática 5 Geografia 7 Artes 5.5 Religião 2
                        Pedro de Lara: História 7.3 Português 4.2 Inglês 9.0 Matemática 7.3 Geografia 7.8 Artes 9.2 Religião 9.9`;

let linhaResultadoIndividual = entrada.split('\n'); // Faz um divisão pela quebra de linha  " \n " formando um array de 5 posições 
let listaNotasAlunos = []; // Array com a lista de alunos 
let listaMateriasOrdenada = []; //  variavel global para ordenar por materias

/*------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
function criarListaOrdenadaPorNomeAluno() {

    let ordenarListaPorNomeAluno = linhaResultadoIndividual; //  variavel que é um array ( ordenarListaPorNomeAluno ) recebe uma lista global para ser utilizada dentro desta função

    for (let i = 0; i < ordenarListaPorNomeAluno.length; i++) { // repetição com o array gerado acima de 5 posições para manipular e jogar em uma estrutura JSON
        // Iniciando uma estrutura JSON com dois objs onde vai ser separado nome dos alunos e as notas novamente utilizanso o método nativa [ spli() ]
        let notaAluno = {
            nomeAluno: ordenarListaPorNomeAluno[i].split(':')[0].trim(), // foi passada a várivel global, onde contem o array de 5 posições ( linhaResultadoIndividual ) guarda o nome em ( nomeAluno ) 
            resultado_MateriaNota: obterListaMateriasNotas(ordenarListaPorNomeAluno[i].split(':')[1]) // guarda as notas na váriavel ( notas )
        };

        listaNotasAlunos.push(notaAluno); // add os valores que estão sendo percorridos pelo array na váriavel Global ( listaNotasAlunos ) para que possamos usa-la quando necessário no prjeto.

    }
}
/*-------------------------Função p/ reodenar a lista de entrada para que seja possivel manipular as máterias na primeira posição -----------------------------------*/
function criarListaOrdenadaPorMateria() {

    let ordenarListaPorMateria = listaNotasAlunos; //  variavel que é um array ( ordenarListaPorMateria ) recebe uma lista global para ser utilizada dentro desta função

    for (let i = 0; i < ordenarListaPorMateria.length; i++) { // percorrer a lista para encontar as materia

        for (let j = 0; j < ordenarListaPorMateria[i].resultado_MateriaNota.length; j++) { // "FOR" para encontrar a matéria na posição i e jogar em uma estrutura JSON ordenando por materia

            let materiasOrdenadas = { // objeto JSON para guardar 2 itens [materia e nomeAlunoNota]
                materia: ordenarListaPorMateria[i].resultado_MateriaNota[j].materia, // item materia que recebe o valor que está no primeiro "FOR"    
                resultado_nomeAlunoNota: [],
            }

            let alunoNotaOrdenada = { // ojeto JSON para guardar dois itens 
                nomeNotaAluno: ordenarListaPorMateria[i].nomeAluno,
                nota: ordenarListaPorMateria[i].resultado_MateriaNota[j].nota,
            }

            let encontrei = false; // váriavel de controle para a condição IF 

            for (let k = 0; k < listaMateriasOrdenada.length; k++) {
                if (listaMateriasOrdenada[k].materia == materiasOrdenadas.materia) {
                    listaMateriasOrdenada[k].resultado_nomeAlunoNota.push(alunoNotaOrdenada);
                    encontrei = true;
                }

            }
            if (!encontrei) {
                materiasOrdenadas.resultado_nomeAlunoNota.push(alunoNotaOrdenada);
                listaMateriasOrdenada.push(materiasOrdenadas);
            }
        }
    }
}


/*---------------função para criar um array com os dados restantes ( Materia e Nota ) --------------------------------------------------------------------------------*/
function obterListaMateriasNotas(materiasNotas) {
    materiasNotas = materiasNotas.trim(); // usando trin() para tirar os espaços e guardar os valores na váriavel materiasNotas
    let listaMateriasNotas = materiasNotas.split(' '); // criando um array utilizando novamente split() para 

    let listaMateriasJson = []; // criando um array para guardar os valores estrururadamente  

    for (let i = 0; i < listaMateriasNotas.length; i += 2) { // utilizando uma rapetição p/ add os valores percorridos no array criado em ( listaMateriasNotas ) para jogar no JSON 
        listaMateriasJson.push({ // criando um nobo JSOn para guardar os valores separadamente em dois objetos " Materia e Nota " para facilitar na utilização dos dados contidos neles
            materia: listaMateriasNotas[i], // obj materia
            nota: listaMateriasNotas[i + 1] // obj nota
        });
    }

    return listaMateriasJson; // esta funlçao terna um array para que chama-la 
}


/*---------------------------- FUNÇÃO QUE RECEBE  PARAMETROS UM A NOTA PASSADA E O OUTRO UMA LISTA PARA SER MANIPULADA ------------------------------------------------*/
function obterMateriasPorNota(notaMateria, notasMaterias) {
    let materias = [];
    let materiasFiltradas = notasMaterias.filter(e => { return e.nota == notaMateria }); // O método filter() cria uma cópia superficial de uma parte de uma determinada matriz, filtrada apenas para os elementos da matriz fornecida que passam no teste implementado pela função fornecida.

    for (let i = 0; i < materiasFiltradas.length; i++) {

        materias.push(materiasFiltradas[i].materia)
    }

    return materias; // retorna um array contendo as materias.
}

/*---------------------------- FUNÇÃO QUE RECEBE  PARAMETROS UM A NOTA PASSADA E O OUTRO UMA LISTA PARA SER MANIPULADA ------------------------------------------------*/
function obterNomePorMateria(notaMateria, notasMaterias) {
    let nomeAlunoResultado = [];
    let nomeFiltrado = notasMaterias.filter(e => { return e.nota == notaMateria }); // O método filter() cria uma cópia superficial de uma parte de uma determinada matriz, filtrada apenas para os elementos da matriz fornecida que passam no teste implementado pela função fornecida.

    for (let i = 0; i < nomeFiltrado.length; i++) {

        nomeAlunoResultado.push(nomeFiltrado[i].nomeNotaAluno)
    }

    return nomeAlunoResultado; // retorna um array contendo as materias.
}

/*------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
function obterResultadoNotasDosAlunos(notasMaterias) {

    var arrayRecebido = notasMaterias;

    let notas = [];

    arrayRecebido.forEach(e => { notas.push(parseFloat(e.nota)) }); //  joga as notas dentro do array json NOTA usando parseFloar para pegar os valores quebrados.

    let notasOrdenadas = bubbleSort(notas); // chamada da função de ordenação

    let maiorNota = notasOrdenadas[notasOrdenadas.length - 1]; // ordena a maior e menor nota
    let menorNota = notasOrdenadas[0];

    let materiasMaiorNota = obterMateriasPorNota(maiorNota, arrayRecebido).join(', ');
    let materiasMenorNota = obterMateriasPorNota(menorNota, arrayRecebido).join(', ');

    return `Maior nota ${maiorNota} em (${materiasMaiorNota}) e menor nota ${menorNota} em (${materiasMenorNota})`;

}


/*------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
function obterResultadoNotasDosMateria(notasMaterias) {

    var arrayRecebido = notasMaterias;
    let notas = [];
    let nomeNotaAluno = [];
   
    arrayRecebido.forEach(e => { notas.push(parseFloat(e.nota)) }); //  joga as notas dentro do array json NOTA usando parseFloar para pegar os valores quebrados.
    arrayRecebido.forEach(e => { nomeNotaAluno.push(e.nomeNotaAluno) }); //  joga as notas dentro do array json NOTA usando parseFloar para pegar os valores quebrados.

    let notasOrdenadas = bubbleSort(notas); // chamada da função de ordenação

    let maiorNota = notasOrdenadas[notasOrdenadas.length - 1]; // ordena a maior e menor nota
    let menorNota = notasOrdenadas[0];

    let materiasMaiorNota = obterNomePorMateria(maiorNota, arrayRecebido).join(', ');
    let materiasMenorNota = obterNomePorMateria(menorNota, arrayRecebido).join(', ');

    return `Maior nota ${maiorNota} obtida por (${materiasMaiorNota}) e menor nota ${menorNota} obtida por (${materiasMenorNota})`;
}


/*----------------------- FUNÇÃO QUE VAI IMPRIMIR O RESULTADO FINAL DO ORDENAÇÃO POR ALUNOS ----------------------------------------------------------------------*/
function mostrarResultadoFinalAlunos(listaNotasAlunos) {

    var arrayRecebido = listaNotasAlunos;

    let resultadoFinal = [];
    for (let i = 0; i < arrayRecebido.length; i++) {

        let resultadoAluno = arrayRecebido[i].nomeAluno + ": " + obterResultadoNotasDosAlunos(arrayRecebido[i].resultado_MateriaNota);
        resultadoFinal.push(resultadoAluno);

    }
    let resultadoFinalSort = bubbleSort(resultadoFinal);

    resultadoFinalSort.forEach(e => { console.log(e) });

}

/*----------------------- FUNÇÃO QUE VAI IMPRIMIR O RESULTADO FINAL DO ORDENAÇÃO POR MATERIA ----------------------------------------------------------------------*/
function mostrarResultadoFinalMateria(listaMateriasOrdenada) {

    var arrayRecebido = listaMateriasOrdenada;
    let resultadoFinal = [];

    for (let i = 0; i < arrayRecebido.length; i++) {

        let resultadoMateria = arrayRecebido[i].materia + ": " + obterResultadoNotasDosMateria(arrayRecebido[i].resultado_nomeAlunoNota);
        resultadoFinal.push(resultadoMateria);

    }
    let resultadoFinalSort = bubbleSort(resultadoFinal);

    resultadoFinalSort.forEach(e => { console.log(e) });

}

/* função de ordenação Bubble Sort é um algoritmo de ordenação que pode ser aplicado em Arrays e Listas dinâmicas. 
Se o objetivo é ordenar os valores em forma decrescente, então, a posição atual é comparada com a próxima posição e, 
se a posição atual for maior que a posição posterior, é realizada a troca dos valores nessa posição. */
function bubbleSort(array) {

    for (let i = 0; i <= array.length - 1; i++) {
        for (let j = 0; j < (array.length - i - 1); j++) {

            if (array[j] > array[j + 1]) {
                let temp = array[j];
                array[j] = array[j + 1];
                array[j + 1] = temp;
            }
        }
    }

    return array; // retorna um array para quem chama essa função
}

function imprimeA() {
    console.log(listaNotasAlunos);
}
function imprimeM() {
    console.log(listaMateriasOrdenada);
}
