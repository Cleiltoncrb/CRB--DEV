let OrdenarPorPreco = document.getElementById("btnOrdenarPorPreco");
OrdenarPorPreco.addEventListener("click", ordenarLivrosPorPreco);

function ordenarLivrosPorPreco() {
  let lirvosOrdenados = livros.sort((a, b) => a.preco - b.preco);
  exibirOsLivrosNaTela(lirvosOrdenados);
}
