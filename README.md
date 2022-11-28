# Formigueiro Minado
**Disciplina**: FGA0210 - PARADIGMAS DE PROGRAMAÇÃO - T01 <br>
**Número do Grupo (de acordo com a Planilha de Divisão dos Grupos)**: 05<br>
**Paradigma**: Funcional.<br>

## Alunos
|Matrícula | Aluno |
| -- | -- |
| 19/0142421  | Artur Vinicius Dias Nunes |
| 19/0085291  | Caio César Oliveira |
| 18/0123203 | João Pedro Alves da Silva Chaves |
| 18/0123459  | João Vitor de Souza Durso |
| 19/0128712  | Leticia Assunção Aires Moreira |
| 19/0111836  | Luan Vasco Cavalcante |
| 19/0044390  | Victor Rayan Adriano Ferreira |

## Sobre 
O presente projeto consiste na construção de uma releitura da versão do popular jogo campo minado para a disciplina Paradigmas de Programação do curso de Engenharia de Software da Universidade de Brasília.

Tomou-se como inspiração e base os seguintes projetos: [Campo Minado](https://github.com/raianyrufino/Minesweeper/blob/master/Haskell) e [projeto da disciplina do semestre passado](https://github.com/UnBParadigmas2021-2/2021.2_G4-Struct_Logico_Campo_Minado), ao qual adicionamos funcionalidades, ajustamos bugs e modularizamos de forma a adequar o código ao paradigma funcional.

Nossa releitura corresponde na busca do Tamanduá Bandeira por formigueiros seguros para que seu filho se alimente, tendo em vista que existem inúmeros formigueiros da espécie rasga-língua, que machuca seu filhote. Assim, para proteger seu filho e vencer o jogo, objetiva-se identificar todos esses formigueiros e evitá-los.

Para jogar, é necessário indicar, primeiramente a dificuldade do jogo e, em seguida, a linha e coluna do espaço que será revelado. A partir disso, deverá-se analisar o mapa a fim de evitar espaços comprometidos por formigueiros da rasga-língua, o que impacta na derrota do jogador.

Caso queira se familiarizar com a lógica do jogo, por outros meios, indicamos também este [site](https://minesweeperonline.com/) de minesweeper.


## Screenshots
![image](https://user-images.githubusercontent.com/72623771/203873711-8b2ce8cd-16d7-4e45-b2a1-abd3dd72cecf.png)
![image](https://user-images.githubusercontent.com/72623771/203873725-07469796-ef22-4a98-be51-8cdaf6169925.png)


## Instalação 
**Linguagens**: Haskell<br>
**Tecnologias**: VS Code e Haskell Tool Stack <br>
Para rodar Haskell code, instale as seguintes bibliotecas.

```
$ sudo apt install cabal-install
$ cabal update
```
Depois use cabal para instalar as bibliotecas Random e ExitCode:
```
$ cabal install --lib random

```
Compile o código:
```
ghc main.hs
```
```
main.hs
```

## Uso 
<!-- Explique como usar seu projeto.
Procure ilustrar em passos, com apoio de telas do software, seja com base na interface gráfica, seja com base no terminal.
Nessa seção, deve-se revelar de forma clara sobre o funcionamento do software.
--> 
É possível que haja problemas com bibliotecas ao rodar o código. Para resolvê-los, rode no terminal:
```
cabal install --lib random
```
```
cabal install --lib formatting
```
```
cabal install --lib clock
```

## Vídeo
<!--Adicione 1 ou mais vídeos com a execução do projeto.
Procure: 
(i) Introduzir o projeto;
(ii) Mostrar passo a passo o código, explicando-o, e deixando claro o que é de terceiros, e o que é contribuição real da equipe;
(iii) Apresentar particularidades do Paradigma, da Linguagem, e das Tecnologias, e
(iV) Apresentar lições aprendidas, contribuições, pendências, e ideias para trabalhos futuros.
OBS: TODOS DEVEM PARTICIPAR, CONFERINDO PONTOS DE VISTA.
TEMPO: +/- 15min
-->

## Participações
Apresente, brevemente, como cada membro do grupo contribuiu para o projeto.
|Nome do Membro | Contribuição | Significância da Contribuição para o Projeto (Excelente/Boa/Regular/Ruim/Nula) |
| -- | -- | -- |
| Artur Vinicius Dias Nunes  |  Corrigir bug de quando você insere o comando errado no jogo, adicionar Ranking para top melhores jogadas. | Excelente |
| Caio César Oliveira | Adicionar função para marcar bomba e fazer o jogador retornar para o menu ao vencer ou perder uma partida, adicionar Ranking para top melhores jogadas, corrigir bug de quando você erra o comando no jogo. | Excelente |
| João Pedro Alves da Silva Chaves | Adicionar contador de partidas e adicionar números nas laterais, corrigir bug de quando você erra o comando no jogo, adicionar função para marcar bomba. | Excelente |
| João Vitor de Souza Durso |  Adicionar opção para 2 jogadores, corrigir bug de quando você erra o comando no jogo, adicionar cronometro. | Excelente |
| Leticia Assunção Aires Moreira | Adicionar contador de partidas e adicionar opção para 2 jogadores, adicionar função de cronômetro e read me. | Excelente |
| Luan Vasco Cavalcante | Adicionar dificuldade para o jogo, contextualizou o jogo com a história do Tamanduá | Excelente |
| Victor Rayan Adriano Ferreira | Refatorar e modularizar o código dividindo conjunto de funções parecidas em arquivos, Adicionar contador de formigas rasga-línguas, Arte Asci do menu e função para marcar quadrados possíveis. | Excelente |


## Outros 

### Sugestões para próximos semestres

* Implementar uma opção no menu para jogar o formigueiro minado com 2 jogadores: soluções imaginadas pela equipe: Jogar 2 jogadores no mesmo campo, com intuito de colaboração ou de competição, no sentido de que quem errar perde ou quem fizer o último comando antes da vitória é o vencedor. Segunda solução seria executar dois mapas de uma vez e alternar as jogadas entre os jogadores, perderia quem acertasse um formigueiro primeiro ou ganharia quem terminasse o jogo primeiro.

## Fontes
<!--Referencie, adequadamente, as referências utilizadas.
Indique ainda sobre fontes de leitura complementares.
-->

https://github.com/raianyrufino/Minesweeper/tree/master/Haskell (Repositório com funções úteis para o projeto)


https://github.com/UnBParadigmas2021-2/2021.2_G4-Struct_Logico_Campo_Minado (Repositório com idéia de projeto)


https://kuniga.wordpress.com/2012/06/17/leitura-e-escrita-de-dados-em-haskell/ (Site com ensimanetos úteis para trabalhar com arquios em Haskell)
