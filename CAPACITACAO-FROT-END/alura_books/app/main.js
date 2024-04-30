let livros = [];
const endpointDaAPI = 'https://guilhermeonrails.github.io/casadocodigo/livros.json';
getBuscarLivrosDaAPI();

async function getBuscarLivrosDaAPI() {
 const resporta = await fetch(endpointDaAPI);
 livros = await resporta.json();
 let livrosComDesconto = aplicarDesconto(livros);
 exibirOsLivrosNaTela(livrosComDesconto);
}


// // Array de objetos representando os livros
// const livross = [
//   { nome: 'Livro A', preco: 40 },
//   { nome: 'Livro B', preco: 60 },
//   { nome: 'Livro C', preco: 80 }
// ];

// // Aplicando o desconto de 20% em cada livro
// const desconto = 0.2;
// const livrosComDescontos = livross.map(livro => ({
//   ...livro,
//   preco: (livro.preco - livro.preco * desconto).toFixed(2)
// }));

// // Exibindo os novos preços
// livrosComDesconto.forEach(livro => console.log(`${livro.nome}: R$ ${livro.preco}`));
