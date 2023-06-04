
/* ###########  MINHAS FUNÇÕES ########### */

function pulaLinha(){ // Fumção para pular linha
	document.write("<br><hr><br>")
}

function mostrarNaTela(frase) {
	pulaLinha();
	document.write("************************** MOSTRANDO FRASE NA TELA **************************");
	pulaLinha();
	document.write(frase);
}
function exibeTitulo(titulo) {
	document.write("<big>" + titulo + "</big>");
}

function exibeParagrafo(paragrafo) {
	document.write("<p>" + paragrafo + "</p>");
}

function exibirIdade(idadeA, idadeB){
	var diferenca = idadeA - idadeB;
	mostra("Nossa diferença de idade é: " + diferenca);
}
function geracoesAnterior(anoFinal, anoInicial){
	var quantidadeGeracoes = Math.trunc((anoFinal - anoInicial)/28);
	document.write("<b><u>" + quantidadeGeracoes + "</u></b>");
}
