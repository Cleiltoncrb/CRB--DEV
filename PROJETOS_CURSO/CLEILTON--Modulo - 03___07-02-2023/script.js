

function gerar(){

	let num = document.getElementById('num');
	let tab = document.getElementById('tab');

	if (num.value.length == 0) {
		alert('ERRO!!! Digite um número.');

	}else{
		let n = Number(num.value);
		let c = 1;

		while (c <= 10){
			let option = document.createElement('option');
			option.text = `${c} X ${n} = ${c*n}`;
			option.value = `tab ${c}`;
			tab.appendChild(option);
			c++;
		}
	}

}


/*
	<script>
		for (var i = 1; i < 11; i++) {
			document.write(valor + " x " + i + " = " + (valor * i) + "<br>");

			//Things[i]
		}

		document.write("<h3> TABUADA DE " +5 + "</h3>")
		document.write("5 vezes 1 = " + 5 * 1+ "<br>");
		document.write("5 vezes 2 = " + 5 * 2+ "<br>");
		document.write("5 vezes 3 = " + 5 * 3+ "<br>");
		document.write("5 vezes 4 = " + 5 * 4+ "<br>");
		document.write("5 vezes 5 = " + 5 * 5+ "<br>");
		document.write("5 vezes 6 = " + 5 * 6+ "<br>");
		document.write("5 vezes 7 = " + 5 * 7+ "<br>");
		document.write("5 vezes 8 = " + 5 * 8+ "<br>");
		document.write("5 vezes 9 = " + 5 * 9+ "<br>");
		document.write("5 vezes 10 = " + 5 * 10+ "<br>");

		document.write("<br>");
		document.write("<br>");

		document.write("<h3> TABUADA DE " +8 + "</h3>")
		document.write("8 vezes 1 = " + 8 * 1+ "<br>");
		document.write("8 vezes 2 = " + 8 * 2+ "<br>");
		document.write("8 vezes 3 = " + 8 * 3+ "<br>");
		document.write("8 vezes 4 = " + 8 * 4+ "<br>");
		document.write("8 vezes 5 = " + 8 * 5+ "<br>");
		document.write("8 vezes 6 = " + 8 * 6+ "<br>");
		document.write("8 vezes 7 = " + 8 * 7+ "<br>");
		document.write("8 vezes 8 = " + 8 * 8+ "<br>");
		document.write("8 vezes 9 = " + 8 * 9+ "<br>");
		document.write("8 vezes 10 = " + 8 * 10+ "<br>");

		document.write("<br>");
		document.write("<br>");

		var numeroTabuada = 3;
		document.write("<h3> TABUADA DE " +numeroTabuada + "</h3>")
		document.write(numeroTabuada +" vezes 1 = " + numeroTabuada * 1+ "<br>");
		document.write(numeroTabuada +" vezes 2 = " + numeroTabuada * 2+ "<br>");
		document.write(numeroTabuada +" vezes 3 = " + numeroTabuada * 3+ "<br>");
		document.write(numeroTabuada +" vezes 4 = " + numeroTabuada * 4+ "<br>");
		document.write(numeroTabuada +" vezes 5 = " + numeroTabuada * 5+ "<br>");
		document.write(numeroTabuada +" vezes 6 = " + numeroTabuada * 6+ "<br>");
		document.write(numeroTabuada +" vezes 7 = " + numeroTabuada * 7+ "<br>");
		document.write(numeroTabuada +" vezes 8 = " + numeroTabuada * 8+ "<br>");
		document.write(numeroTabuada +" vezes 9 = " + numeroTabuada * 9+ "<br>");
		document.write(numeroTabuada +" vezes 10 = " + numeroTabuada * 10+ "<br>");

	</script>

	*/