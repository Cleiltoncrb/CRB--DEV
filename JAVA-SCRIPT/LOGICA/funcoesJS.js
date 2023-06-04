
/* ###########  MINHAS FUNÇÕES ########### */

function pulaLinha() { // Fumção para pular linha
	document.write("<br>")
}

/* ######################################################################################## */

function mostrarNaTela(frase) {
	//pulaLinha();
	//document.write("************************** MOSTRANDO RESULTADO NA TELA **************************");
	//pulaLinha();
	document.write(frase);
	//pulaLinha();
	//return(frase);
}

/* ######################################################################################## */

function exibeTitulo(titulo) {
	document.write("<big>" + titulo + "</big>");
}

/* ######################################################################################## */

function exibeParagrafo(paragrafo) {
	document.write("<p>" + paragrafo + "</p>");
}

/* ######################################################################################## */

function exibirIdade(idadeA, idadeB) {
	var diferenca = idadeA - idadeB;
	mostrarNaTela("Nossa diferença de idade é: " + diferenca);
}

/* ######################################################################################## */

function geracoesAnterior(anoFinal, anoInicial) {
	var quantidadeGeracoes = Math.trunc((anoFinal - anoInicial) / 28);
	document.write("<b><u>" + quantidadeGeracoes + "</u></b>");
}

/* ######################################################################################## */

function calcularIMC(pesoInformado, alturaInformada) {

	var nome = prompt("Informe o seu nome");
	var alturaInformada = prompt(nome + ", informe sua altura");
	var pesoInformado = prompt(nome + ", informe seu peso");

	var imc = (pesoInformado / (alturaInformada * alturaInformada));
	imc = parseFloat(imc.toFixed(2)); // função para deixar apenas duas casas decimais após a virgual

	mostrarNaTela(nome + ", o seu IMC é: " + imc);

	if (imc < 18.5) {

		mostrarNaTela("Você está abaixo do recomendado");

	}

	if (imc > 35) {

		mostrarNaTela("Você está acima do recomendado");
	}

	if (imc >= 18.5 && imc <= 35) {

		mostrarNaTela("Seu IMC está excelente!");

	}
	return imc
}

/* ######################################################################################## */

function imprimeNota(nome, nota, materia) {
	// função para mostrar nota de uma determinada matéria 

	if (nota > 7) {
		mostrarNaTela("Aluno " + nome + " ficou com a nota " + nota + " em " + materia);
		document.write("<b>APROVADO!!!</b>");

	} else {
		mostrarNaTela("Aluno " + nome + " ficou com a nota " + nota + " em " + materia);
		document.write("<br><b>RECUPERAÇÃO!!!</b>");

	}

	//return nota;
}

/* ######################################################################################## */

function geraCodigo() {

	return "GH1022";
}

/* ######################################################################################## */

function funcaoQualquer() {

	var n2 = 5590;

	return n2;
}

/* ######################################################################################## */

function calculImc(peso, altura) {
	var imc = (peso / Math.pow(altura, 2));
	imc = parseFloat(imc.toFixed(2));

	mostrarNaTela("O peso é: " + peso + "<br> A altura é: " + altura + "<br>Portanto o IMC é " + imc);
	mostrarNaTela("<br>Portanto o IMC é " + imc);
	//return imc = parseFloat(imc.toFixed(2))

}

/* ######################################################################################## */

function nomeSobrenome(nome, sobrenome) {
	var nomeCompleto = nome + " " + sobrenome;
	return nomeCompleto;

}

/* ######################################################################################## */

function timeFutebol() {

	var vitorias = parseInt(prompt("Entre com o número de vitórias: "));
	var empates = parseInt(prompt("Entre com o número de empates: "));
	var pontos = (vitorias * 3) + empates;

	if (pontos > 28) {
		mostrarNaTela("Seu time está melhor do que o ano passado!");
	}
	if (pontos < 28) {
		mostrarNaTela("Seu time está pior do que o ano passado!");
	}
	if (pontos == 28) {
		mostrarNaTela("Seu time está igual ao ano passado!");
	}

	return pontos;
}

/* ######################################################################################## */

function convidados() {

	var convidados = parseInt(prompt("Número de convidados"));
	var vips = parseInt(prompt("Número de convidados VIP's"));

	var total = convidados + vips;

	return mostrarNaTela("O total de convidados é: " + total);

}

/* ######################################################################################## */

function sorteio(n) {

	var numeroPensado = Math.round(Math.random() * n);
	var numeroInformado = parseInt(prompt("INFORME SEU NÚEMRO DA SORTE, ENTRE ( 0 e " + n + " ):"));
	if (numeroInformado == numeroPensado) {
		mostrarNaTela("Você acertou!");

	} else {
		mostrarNaTela("Você errou, o número da SORTE é!!!: " + numeroPensado)
	}
	return numeroPensado;
}

/* ######################################################################################## */

function possoDirigir() {

	var idade = parseInt(prompt("Qual é sua idade"));
	var temCarteira = prompt("Tem carteira? Responda S ou N");

	if (idade >= 18 && temCarteira.toUpperCase().trim() == "S") {
		//(idade >= 18 && ((temCarteira == "S" || temCarteira == "s"))){
		mostrarNaTela("Pode dirigir");
	} else {
		mostrarNaTela("Não pode dirigir");
	}

}

/* ######################################################################################## */

function validacao() {
	var quantidadeCarbono1 = parseInt(prompt("Quantidade de carbono substância 1"));
	var quantidadeCarbono2 = parseInt(prompt("Quantidade de carbono substância 2"));

	quantidadeCarbono2 = quantidadeCarbono2 + 2;

	if (quantidadeCarbono1 == quantidadeCarbono2) {

		mostrarNaTela("Acho que são substâncias parecidas: " + quantidadeCarbono1 + " -- " + quantidadeCarbono2);
	} else {

		mostrarNaTela("São substâncias bem diferentes: " + quantidadeCarbono1 + " -- " + quantidadeCarbono2);
	}
}

/* ######################################################################################## */

function anoCopa() {

	var limite = parseInt(prompt("Entre com o ano limite"));
	var anoCopa = 2000;

	while (anoCopa <= limite) {
		mostrarNaTela("Teve copa em: " + anoCopa);
		anoCopa += 4;
	}

	mostrarNaTela("FIM");
}

/* ######################################################################################## */

function sorteia() {

	return Math.round(Math.random() * 10);
}

/* ######################################################################################## */

function repeteDez() {

	var numeroPensado = sorteia();

	var chute = parseInt(prompt("Já pensei. Qual você acha que é?"));

	if (chute == numeroPensado) {

		mostrarNaTela("Uau! Você acertou, pois eu pensei no " + numeroPensado);
	} else {
		var i = 0;
		while (i < 100) {
			mostrarNaTela("Já era, você errou! " + " ==> <b>( i )</b> VALE = " + i);
			i += 2;
		}
	}
}

/* ######################################################################################## */

function numerosPares() {

	var numeroPensado = sorteia();

	var chute = parseInt(prompt("Já pensei. Qual você acha que é?"));

	if (chute == numeroPensado) {

		mostrarNaTela("Uau! Você acertou, pois eu pensei no " + numeroPensado);
	} else {
		var i = 0;
		while (i <= chute) {

			if (i % 2 == 0) {
				mostrarNaTela(i)
			}
			i += 1;
		}
	}
}

/* ######################################################################################## */

function login() {
	var loginCadastrado = "alura";
	var senhaCadastrada = "alura321";

	var maximoTentativas = 3;
	var tentativaAtual = 1;

	while (tentativaAtual <= maximoTentativas) {

		var loginInformado = prompt("Informe seu login: ");
		var senhaInformada = prompt("Informe sua senha: ");

		if (loginCadastrado == loginInformado && senhaCadastrada == senhaInformada) {

			alert("Bem-vindo ao sistema, " + loginInformado);

			tentativaAtual = maximoTentativas; // acertou, então faço o gasto de todas as tentativas para sair do loop. Lá embaixo vai incrementar + 1! 

		} else {

			if (tentativaAtual == 3) {
				alert("Número permitido de tentativas ultrapassado!");
			} else {
				alert("Login inválido. Tente novamente");
			}
		}

		// vai para a próxima tentativa
		tentativaAtual = tentativaAtual + 1;
	}

	/* 
	
	var loginCadastrado = "alura";
	var senhaCadastrada = "alura321";
	var cont = 0;
    
	while (cont<3){
	var loginInformado = prompt("Informe seu login");
	var senhaInformada = prompt("Informe sua senha");
  
	if( loginCadastrado == loginInformado && senhaCadastrada == senhaInformada ) {

		alert("Bem-vindo ao sistema " + loginInformado);
		cont = 4;
	} else {

		alert("Login inválido. Tente novamente");
		cont++;
	}
	}
	
	*/


}
/* ######################################################################################## */

// Criar função para mostrar numeros primos
function exibirNumerosPrimos(limite) {

	for (var numero = 2; numero <= limite; numero++) {
		if (NumerosPrimo(numero)) mostrarNaTela(numero);
	}
}


function NumerosPrimo(numero) {
	for (var divisor = 2; divisor < numero; divisor++) {
		if (numero % divisor === 0) {
			return false;
		}
	}
	return true;
}


function numeroPrimo(numero) {
	var numeroPrimo = true;
	for (var contador = 2; contador < numero; contador++) {

		if (numero % contador === 0) {
			numeroPrimo = false;
			break;
		}
	}
	if (numeroPrimo == true) {
		return mostrarNaTela("O número " + numero + " é primo");

	} else {
		return mostrarNaTela("O número " + numero + " não é primo");

	}
}

/* ########################--NUMERO PRIMO UTILIZANDO WHILE--############################################### */
function numeroPrimo_while(numero) {
	var numeroP = true;
	var contador = 2;
	while (contador < numero) {

		if (numero % contador === 0) {
			numeroP = false;
			break;
		}
		contador++;
	}
	if (numeroP == true) {
		return mostrarNaTela("O número " + numero + " é primo");

	} else {
		return mostrarNaTela("O número " + numero + " não é primo");

	}

}



/* #########################--TRABALHANDO COM FOR--######################################## */
function treinarFor() {
	for (var i = 0; i < 3; i++) {
		alert("O resultado é " + (2 * i));
		document.write("<br>i vale" + i);
	}

	var i = 0;
	while (i < 2) {
		alert("O resultado é " + (2 * i));
		i++;
		document.write("<br>i vale" + i);
	}

}

function calcularEventos() {
	var totalDeEventos = parseInt(prompt("Informe o total de eventos"));

	var contador = 1;

	var totalGastoComEventos = 0; // inicialização tem que ser fora do laço de repetição While
	while (contador <= totalDeEventos) {
		var gasto = parseFloat(prompt("Informe total gasto com evento"));
		totalGastoComEventos = totalGastoComEventos + gasto;
		contador++;
	}

	var media = (totalGastoComEventos / totalDeEventos);

	mostrarNaTela("A média de gastos é: " + media);

}

function looping() {
	var contador = 1;
	while (contador <= 10) {
		//alert("Contador atual: " + contador);
		contador = contador + 1;
	}

	for (contador = 1; contador <= 10; contador++) {
		mostrarNaTela("Contador atual: " + contador);
	}

	for (var i = 0; i < 10; i++) {
		alert("O resultado é " + (2 * i));
	}

	var i = 0;
	while (i < 10) {
		mostrarNaTela("O resultado é " + (2 * i));
		i++
	}

}

function familiares() {

	var totalFamiliares = parseInt(prompt("Quantidade de familiares? "));
	var numero = 1;
	var totalIdade = 0;

	while (numero <= totalFamiliares) {

		var idade = parseInt(prompt("Informe a idade do familiar: "));
		totalIdade = totalIdade + idade;
		numero++;

	}
	var mediaDasIdades = totalIdade / totalFamiliares;
	mostrarNaTela("A média das idades dos familiares é: " + mediaDasIdades);
	mostrarNaTela("FIM!!");

}


/* ######################################################################################## */

function sorteioNumero() {

	var numeroPensado = Math.round(Math.random() * 10);

	var tentativas = 1;
	while (true) {
		while (tentativas <= 3) {

			var chute = parseInt(prompt("Digite seu chute!"));

			if (chute == numeroPensado) {

				mostrarNaTela("Você ACERTOU, o número pensado era: " + numeroPensado);
				var strin = true;
				break;

			} else {

				mostrarNaTela("Você ERROU!");
			}

			tentativas++;
		}
		if (strin == true) {
			mostrarNaTela("Voce acertou anteste de terminar todas suas tentativas, PARABÉNS!!! ");
			break;
		} else {
			mostrarNaTela("Suas tentarivas esgotaram o numero sorteado era: " + numeroPensado);
			break;
		}
	}
}


/* ##################--USAR HTML E JAVA SCRIPT JUNTO--###################################### */

function verifica() {

	if (input.value == segredo) {
		alert("Você ACERTOU");
	} else {
		alert("Você ERROU!!!")
	}

	input.value = "";
	input.focus();

}

function tchau() {

	alert("Tchau!!!!!");
}

function imprime() {

}


function exibeTexto() { // exibe o texto que está dentro do input

	alert(input.value);
	input.value = "";
	input.focus();

}



/* #######--Matriz 9x9 Substituir as diagonais pela letra A, fazendo um X--#################### */
function imprimeNumero() {

	// declarar a variavel para controlar a impressão da letra "A" quando precisar
	var imprimeValor = "";

	// declarando uma variável para receber o valor da matriz digida pelo usuário
	var matriz = parseInt(input.value);

	// declarar a variável para manipulara a diagonal direitar da matriz
	var controlaDiagonal = matriz;

	pulaLinha();

	// mostar na tela o valor que o usuário digitou
	mostrarNaTela("<h1><b> <hr>VOCÊ ESCOLHEU UMA MATRIZ [ " + matriz + " ] POR [ " + matriz + " ] !!!<hr></b></h1>");

	pulaLinha();

	// for para imprimir linhas da matriz
	for (linha = 1; linha <= matriz; linha++) {
		// for para imprimir colunas da matriz
		for (coluna = 1; coluna <= matriz; coluna++) {
			// variável que foi declarada em branco agora recebe o valor da coluna
			imprimeValor = coluna;

			if (coluna == linha) {
				// quando atende a condição guarda a letra "A" na variável imprimeValor
				imprimeValor = "A";
			}
			if (coluna == controlaDiagonal) {
				// quando atende a condição guarda a letra "A" na variável imprimeValor
				imprimeValor = "A";
				// subitrai um do valor total da matriz que o usuário digitou
				controlaDiagonal--;
			}
			// imprime na tela o valor da coluna enquanto a coluna for menor ou igual a valor digitado pelo usuário
			mostrarNaTela(" " + imprimeValor + " ");
		}
		pulaLinha();
	}

}


/* ######################################################################################## */
//function verifica() {

//var segredo = [5, 7, 10, 2, 3];
//input.focus();
//}


// Se quisermos adicionar mais um item no array de frutas, o que devemos fazer?
// frutas.push("abacate");
// Todo array possui a função push que permite "empurrar" elementos para dentro da lista.


/* ######################################################################################## */

function receitasYan() {

	var ingredientes = [];

	var quantidade = parseInt(prompt("Quantos ingredientes você vai adicionar?"));

	var contador = 1;

	while (contador <= quantidade) {

		var ingrediente = prompt("Informe o ingrediente " + contador);

		var controleSaida = false;

		for (var posicao = 0; posicao < ingredientes.length; posicao++) {

			if (ingredientes[posicao] == ingrediente) {

				controleSaida = true;
				break;
			}
		}

		if (existe == false) {

			ingredientes.push(ingrediente);
			contador++;
		}
	}
}

// console.log(ingredientes);

/* ######################################################################################## */

function sorteiaSegredo() {

	return Math.round(Math.random() * 10);

}

function sorteiaNumeros(quantidade) {

	var segredos = [];

	var numero = 1;

	while (numero <= quantidade) {

		var numeroAleatorio = sorteiaSegredo();
		var achou = false;

		if (numeroAleatorio !== 0) {
			for (var posicao = 0; posicao < segredos.length; posicao++) {

				if (segredos[posicao] == numeroAleatorio) {
					achou = true;
					break;
				}

			}

			if (achou == false) {
				segredos.push(numeroAleatorio);
				numero++;
			}
		}

	}

	return segredos;

}



function verificaSegredo() {

	var achou = false;

	for (var posicao = 0; posicao < segredos.length; posicao++) {

		if (input.value == segredos[posicao]) {

			alert("Você ACERTOU!");
			achou = true;
			break;
		}
	}

	if (achou == false) {

		alert("Você ERROU!");
	}

	input.value = "";
	input.focus();

}


/* ######################################################################################## */



/* ######################################################################################## */






