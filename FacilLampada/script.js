//pegando os elementos do DOM
const lamp = document.getElementById("lamp");
const onButton = document.getElementById("onButton");
const offButton = document.getElementById("offButton");
const repairButton = document.getElementById("repairButton");

//variaveis
let clickCount = 0;  //contador de cliques para acender a lâmpada
let isBroken = false;  //lampada quebrada após 3 cliques

//função para verificar se a lâmpada está quebrada
function isLampBroken() {
    return lamp.classList.contains("broken");
}

//acender a lampada
function turnOn() {
    if (isLampBroken()) return;
    lamp.classList.remove("off", "broken");
    lamp.classList.add("on");
    clickCount++;

    //3 cliques para quebrar
    if (clickCount >= 3) {
        breakLamp();
    }
}

//apagar lampada
function turnOff() {
    if (isLampBroken()) return; //não liga se estiver quebrada
    lamp.classList.remove("on", "broken");
    lamp.classList.add("off");
}

//quebrar lampada
function breakLamp() {
    lamp.classList.remove("on", "off");
    lamp.classList.add("broken");
    isBroken = true;
    repairButton.style.display = "block"; //mostra o botão de consertar
}

//consertar
function repairLamp() {
    lamp.classList.remove("broken");
    lamp.classList.add("off"); 
    isBroken = false;
    clickCount = 0;  //reseta o contador de cliques
    repairButton.style.display = "none"; //esconde o botão de consertar
}

onButton.addEventListener("click", turnOn);

offButton.addEventListener("click", turnOff);

repairButton.addEventListener("click", repairLamp);
