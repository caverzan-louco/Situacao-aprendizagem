// Variável de controle para parar o loop
let stopLoop = false;
let currentFunction = null;  // Variável para armazenar a função corrente

function red() { 
    if (stopLoop) return;

    var cor = document.getElementById("red");
    cor.style.backgroundColor = "red";

    currentFunction = "red";  // Salva a função corrente

    setTimeout(function() {
        if (stopLoop) return;
        cor.style.backgroundColor = "rgb(63, 22, 22)";
        green();  // Retorna diretamente ao verde
    }, 7000);
}

function yellow() {
    if (stopLoop) return;

    var cor = document.getElementById("yellow");
    cor.style.backgroundColor = "yellow";

    currentFunction = "yellow";  // Salva a função corrente

    setTimeout(function() {
        if (stopLoop) return;
        cor.style.backgroundColor = "rgb(70, 70, 20)";
        red();
    }, 2000);
}

function green() {
    if (stopLoop) return;

    var cor = document.getElementById("green");
    cor.style.backgroundColor = "rgb(46, 228, 61)";

    currentFunction = "green";  // Salva a função corrente

    setTimeout(function() {
        if (stopLoop) return;
        cor.style.backgroundColor = "rgb(23, 66, 23)";
        yellow();
    }, 5000);
}

// Função para apagar todas as cores e acender apenas o vermelho
function resetColors() {
    // Interrompe o loop de cores
    stopLoop = true;

    // Apaga todas as cores
    document.getElementById("red").style.backgroundColor = "rgb(63, 22, 22)";
    document.getElementById("yellow").style.backgroundColor = "rgb(70, 70, 20)";
    document.getElementById("green").style.backgroundColor = "rgb(23, 66, 23)";

    // Acende apenas o vermelho
    var cor = document.getElementById("red");
    cor.style.backgroundColor = "red";

    // Após 7 segundos, apaga o vermelho e reinicia o ciclo começando pelo verde
    setTimeout(function() {
        // Apaga o vermelho
        cor.style.backgroundColor = "rgb(63, 22, 22)";

        // Reinicia o loop com a cor verde
        stopLoop = false;  // Reinicia o ciclo
        green();  // Inicia o loop do zero, começando pelo verde
    }, 7000);
}

// Adiciona o evento de clique ao botão
document.getElementById("resetButton").addEventListener("click", resetColors);

// Inicializa com a cor verde
green();
