HTML:

Botões de Jogo: O jogador pode clicar em um dos botões (Pedra, Papel ou Tesoura) para fazer sua escolha.

Pontuação: Exibe a pontuação atual do jogador e do bot.

Resultado: Exibe o vencedor (Jogador, Bot ou Empate) e mostra as escolhas do jogador e do bot.

JavaScript:

Captura dos Elementos no DOM: Usamos getElementById para capturar os elementos que vamos manipular, como pontuação e resultados.

Função getBotChoice: Gera uma escolha aleatória para o bot.

Função playRound: Recebe a escolha do jogador, gera a escolha do bot, compara as duas e determina o vencedor. Também atualiza as pontuações.

Eventos de Clique: Quando o jogador clica em um dos botões (Pedra, Papel, ou Tesoura), a função playRound é chamada com a escolha do jogador.

Fluxo do Jogo:

O jogador clica em um botão para fazer sua escolha.

O bot escolhe aleatoriamente uma das opções.

O vencedor é determinado e as pontuações são atualizadas.