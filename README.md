# Campo Minado
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

Tomou-se como inspiração os seguintes projetos: [Campo Minado](https://github.com/raianyrufino/Minesweeper/blob/master/Haskell) e [projeto da disciplina do semestre passado](https://github.com/UnBParadigmas2021-2/2021.2_G4-Struct_Logico_Campo_Minado), ao qual adicionamos funcionalidades, ajustamos bugs e modularizamos de forma a adequar o código ao paradigma funcional.

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
$ cabal install random
$ cabal install exitcode

```
Compile o código:
```
campoMinado.hs
```

Prolog:

Compile o código:

```
$ swipl -q -f campo.pl
```


## Uso 
<!-- Explique como usar seu projeto.
Procure ilustrar em passos, com apoio de telas do software, seja com base na interface gráfica, seja com base no terminal.
Nessa seção, deve-se revelar de forma clara sobre o funcionamento do software.
-->

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
| Artur Vinicius Dias Nunes  |  Corrigir bug de quando você insere o comando errado no jogo |  |
| Caio César Oliveira | Adicionar função para marcar bomba e fazer o jogador retornar para o menu ao vencer ou perder uma partida | |
| João Pedro Alves da Silva Chaves | Adicionar contador de partidas e adicionar números nas laterais | |
| João Vitor de Souza Durso |  Adicionar opção para 2 jogadores | |
| Leticia Assunção Aires Moreira | Adicionar contador de partidas, adicionar jogador 2 e read me| |
| Luan Vasco Cavalcante | Adicionar dificuldade para o jogo, contextualizou o jogo com a história do Tamanduá | |
| Victor Rayan Adriano Ferreira | Refatorar o código dividindo conjunto de funções parecidas em arquivos | |


## Outros 
<!--Quaisquer outras informações sobre o projeto podem ser descritas aqui. Não esqueça, entretanto, de informar sobre:
(i) Lições Aprendidas;
(ii) Percepções;
(iii) Contribuições e Fragilidades, e
(iV) Trabalhos Futuros.
-->

## Fontes
<!--Referencie, adequadamente, as referências utilizadas.
Indique ainda sobre fontes de leitura complementares.
-->
