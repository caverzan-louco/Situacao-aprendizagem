//pegando os elementos do DOM
const lamp = document.getElementById("lamp");
const onButton = document.getElementById("onButton");
const offButton = document.getElementById("offButton");
const repairButton = document.getElementById("repairButton");

//variaveis
let clickCount = 0;  //contador de cliques para acender a lâmpada - quantas vezes foi clicado
let isBroken = false;  //lampada quebrada após 3 cliques

//função para verificar se a lâmpada está quebrada
function isLampBroken() {
    return lamp.classList.contains("broken"); //se tiver a classe "broken" ela retorna verdadeira
}

//acender a lampada
function turnOn() {
    if (isLampBroken()) return; //se estiver quebrada não faz nada 
    lamp.classList.remove("off", "broken"); //remove as classes que indicam que a lâmpada está desligada ou quebrada
    lamp.classList.add("on"); //adiciona a classe "on" para indicar que está acesa
    clickCount++; //adiciona o contador de clicks para quebrar a lâmpada (3)
    //classList - utilizado para alterar aparência e comportamento dos elementos 

    //verifica quantas vezes foi acesa e quebra após 3 cliques
    if (clickCount >= 3) { //verifica se o número de cliques é maior ou igual a 3
        breakLamp(); //se for verdadeiro a lâmpada quebra 
    }
}

//apagar lampada
function turnOff() {
    if (isLampBroken()) return; //não liga se estiver quebrada
    lamp.classList.remove("on", "broken"); //remove a class "on" e "broken"
    lamp.classList.add("off"); //adicionar a class "off" para indicar que está apagada
}

//quebrar lampada
function breakLamp() {
    lamp.classList.remove("on", "off"); //remove a "on" e "off"
    lamp.classList.add("broken"); //adiciona a class "broken" para indicar que está quebrada
    isBroken = true; //atualiza a varíavel de controle
    repairButton.style.display = "block"; //mostra o botão de consertar
}

//consertar
function repairLamp() {
    lamp.classList.remove("broken"); //remove a class "broken"
    lamp.classList.add("off"); //apagada após concertar
    isBroken = false; //atualiza a varíavel de controle, indicando que a lâmpada não está mais quebrada
    clickCount = 0;  //reseta o contador de cliques
    repairButton.style.display = "none"; //esconde o botão de consertar
}

//adicionando eventos aos botões para que eles executem as funções ao serem clicados 
onButton.addEventListener("click", turnOn); //ouvinte ao botão de ligar a lâmpada, quando clicado a função turnOn() é chamada
//acendendo a lâmpada

offButton.addEventListener("click", turnOff); //adiciona um ouvinte ao botão de desligar, função turnOff chamada (lâmpada desligada)

repairButton.addEventListener("click", repairLamp); //ouvinte ao botão de concertar, função repairLamp() chamada
//após clicar em consertar a função é executada. e reseta a contagem de clicks