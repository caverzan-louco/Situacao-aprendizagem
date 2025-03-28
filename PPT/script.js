// Obtém os elementos do DOM
const score1 = document.getElementById('score1'); // Pontuação do jogador
const score2 = document.getElementById('score2'); // Pontuação do bot
const resultText = document.querySelector('[name="result"]'); // Texto do resultado
const jogadorImage = document.querySelector('[name="jogador"]'); // Imagem do jogador
const botImage = document.querySelector('[name="bot"]'); // Imagem do bot

let playerScore = 0;
let botScore = 0;

// Função para gerar a escolha do bot (Pedra, Papel ou Tesoura)
function getBotChoice() {
    const choices = ['pedra', 'papel', 'tesoura'];
    const randomIndex = Math.floor(Math.random() * 3);
    return choices[randomIndex];
}

// Função para atualizar o resultado do jogo
function playRound(playerChoice) {
    const botChoice = getBotChoice();

    // Atualiza as imagens com base nas escolhas
    jogadorImage.src = `img/${playerChoice}.1.png`;
    botImage.src = `img/${botChoice}.1.png`;

    // Verifica o vencedor
    if (playerChoice === botChoice) {
        resultText.textContent = "Empate!";
    } else if (
        (playerChoice === 'pedra' && botChoice === 'tesoura') ||
        (playerChoice === 'papel' && botChoice === 'pedra') ||
        (playerChoice === 'tesoura' && botChoice === 'papel')
    ) {
        resultText.textContent = "Você ganhou!";
        playerScore++;
        score1.textContent = playerScore; // Atualiza a pontuação do jogador
    } else {
        resultText.textContent = "Bot ganhou!";
        botScore++;
        score2.textContent = botScore; // Atualiza a pontuação do bot
    }
}

// Adiciona os event listeners para os botões de jogo
document.querySelector('.pedra').addEventListener('click', () => playRound('pedra'));
document.querySelector('.papel').addEventListener('click', () => playRound('papel'));
document.querySelector('.tesoura').addEventListener('click', () => playRound('tesoura'));

