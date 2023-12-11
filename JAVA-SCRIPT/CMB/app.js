
var tamanhoArquivo = (1048576 * 5); // byte(B): para megabyte(MB):


if (document.getElementById("upload")) {
  var valido = upload;
  valido.addEventListener("change", function (e) {
    var size = upload.files[0].size;
    if (size < tamanhoArquivo) { //5MB         
      
    } else {
      alert('O arquivo deve conter até (5MB)'); //Acima do limite
      upload.value = ""; //Limpa o campo          
    }
    e.preventDefault();
  });
}

if (document.getElementById("upload1")) {
  var valido = upload1;
  valido.addEventListener("change", function (e) {
    var size = upload1.files[0].size;
    if (size < (tamanhoArquivo)) { //5MB         
      
    } else {
      alert('O arquivo deve conter até (5MB)'); //Acima do limite
      upload1.value = ""; //Limpa o campo          
    }
    e.preventDefault();
  });
}

if (document.getElementById("upload2")) {
  var valido = upload2;
  valido.addEventListener("change", function (e) {
    var size = upload2.files[0].size;
    if (size < tamanhoArquivo) { //5MB         
      
    } else {
      alert('O arquivo deve conter até (5MB)'); //Acima do limite
      upload2.value = ""; //Limpa o campo          
    }
    e.preventDefault();
  });
}

if (document.getElementById("upload3")) {
  var valido = upload3;
  valido.addEventListener("change", function (e) {
    var size = upload3.files[0].size;
    if (size < tamanhoArquivo) { //5MB         
      
    } else {
      alert('O arquivo deve conter até (5MB)'); //Acima do limite
      upload3.value = ""; //Limpa o campo          
    }
    e.preventDefault();
  });
}

if (document.getElementById("upload4")) {
  var valido = upload4;
  valido.addEventListener("change", function (e) {
    var size = upload4.files[0].size;
    if (size < tamanhoArquivo) { //5MB         
      
    } else {
      alert('O arquivo deve conter até (5MB)'); //Acima do limite
      upload4.value = ""; //Limpa o campo          
    }
    e.preventDefault();
  });
}



