const botoes = document.querySelectorAll(".btn");
botoes.forEach((btn) => btn.addEventListener("click", filtrarLivros));

function filtrarLivros() {
  const elementoBtn = document.getElementById(this.id);
  const categoria = elementoBtn.value;
  let livrosFiltrados =
    categoria == "disponivel"
      ? filtrarPorDisponibilidade()
      : filtrarPorCategoria(categoria);
  exibirOsLivrosNaTela(livrosFiltrados);

  if (categoria == "disponivel") {
    const valorTotal = calcularValorTatolaDeLivrosDisponiveis(livrosFiltrados);
    exibirValorTotalDosLivrosDisponiveisNaTela(valorTotal);
  }
}

function filtrarPorCategoria(categoria) {
  return livros.filter((livro) => livro.categoria == categoria);
}

function filtrarPorDisponibilidade() {
  return livros.filter((livro) => livro.quantidade > 0);
}

function exibirValorTotalDosLivrosDisponiveisNaTela(valorTotal) {
  elementoComValorTotalDeLivrosDisponiveis.innerHTML = `
    <div class="livros__disponiveis">
      <p>Todos os livros disponíveis por R$ <span id="valor">${valorTotal}</span></p>
    </div>
  
  `;
}

function essaPalavraEUmPalindromo(palavra) {
  var separandoAsLetrasDaPalavra = palavra.split("");
  var palavraInvertida = separandoAsLetrasDaPalavra.reverse("");

  palavraInvertida = palavraInvertida.join("");

  if (palavra == palavraInvertida) {
    console.log("A palavra < " + palavra + " > é uma palíndromo");
  } else {
    console.log("A palavra < " + palavra + " > NÃO é uma palíndromo");
  }

  console.log(palavra);
  console.table(separandoAsLetrasDaPalavra);
  console.log(palavraInvertida);
}
essaPalavraEUmPalindromo("rever");
