Esse código tem o objetivo de simular o funcionamento de um semáforo de trânsito, alternando entre as cores vermelha, amarela e verde, de forma automatizada. A alternância de cores acontece em intervalos definidos, e tem a possibilidade de resetar o ciclo, reiniciando a sequência sempre que for necessário.

COMO FUNCIONA
Alternância Automática das Cores

O semáforo começa com a cor verde, depois passa para o amarelo, e por fim para o vermelho. Esse ciclo se repete automaticamente.

O tempo de cada cor é o seguinte:

Verde: 5 segundos

Amarelo: 2 segundos

Vermelho: 7 segundos

A função setTimeout() é usada para garantir que a troca de cores ocorra no tempo certo.

Interrupção e Reinício

Quando a variável stopLoop é true, o ciclo de troca de cores é interrompido.

A função resetColors() serve para parar tudo, apagar as cores e acender apenas o vermelho. Depois de 7 segundos, o ciclo é reiniciado a partir do verde.

DIFICULDADES

Tivemos dificuldade na hora de implementar a opção para o pedestre, que interrompe o ciclo imediatamente, quando acionado e liga a cor vermelha imediatamente após o tempo de espera o ciclo é retomado a partir da cor verde.
Tivemos dificuldade na hora de interromper o ciclo e aescender somente a cor vermelha.