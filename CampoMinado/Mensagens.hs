module Mensagens
(menssagemDerrota
,menssagemVitoria
,menssagemMenu
,menuHistoria
,menuInstrucoes
,menuConsciencia
)where

menssagemDerrota :: IO()
menssagemDerrota = do   
    putStrLn ""
    putStrLn "██████████████████████████████████▀██████████████████"
    putStrLn "█▄─▄▄─█─▄▄─█▄─▄▄▀█▄─▀█▀─▄█▄─▄█─▄▄▄▄██▀▄─██▄─▄▄▀█─▄▄─█"
    putStrLn "██─▄███─██─██─▄─▄██─█▄█─███─██─██▄─██─▀─███─██─█─██─█"
    putStrLn "▀▄▄▄▀▀▀▄▄▄▄▀▄▄▀▄▄▀▄▄▄▀▄▄▄▀▄▄▄▀▄▄▄▄▄▀▄▄▀▄▄▀▄▄▄▄▀▀▄▄▄▄▀"

menssagemVitoria :: IO()                         
menssagemVitoria = do
    putStrLn ""
    putStrLn"██╗░░░██╗██╗████████╗░█████╗░██████╗░██╗░█████╗░"
    putStrLn"██║░░░██║██║╚══██╔══╝██╔══██╗██╔══██╗██║██╔══██╗"
    putStrLn"╚██╗░██╔╝██║░░░██║░░░██║░░██║██████╔╝██║███████║"
    putStrLn"░╚████╔╝░██║░░░██║░░░██║░░██║██╔══██╗██║██╔══██║"
    putStrLn"░░╚██╔╝░░██║░░░██║░░░╚█████╔╝██║░░██║██║██║░░██║"
    putStrLn"░░░╚═╝░░░╚═╝░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝╚═╝╚═╝░░╚═╝"

menssagemMenu :: IO()
menssagemMenu = do
    putStrLn "" 
    putStrLn " _________________________________________________________________________________________________ "
    putStrLn "|_________________________________________________________________________________________________|"
    putStrLn "|_________________________________________________________________________________________________|"
    putStrLn "|                                                                                                 |"
    putStrLn "|                                                                                                 |"
    putStrLn "|         ███████╗░█████╗░██████╗░███╗░░░███╗██╗░██████╗░██╗░░░██╗███████╗██╗██████╗░░█████╗░     |" 
    putStrLn "|         ██╔════╝██╔══██╗██╔══██╗████╗░████║██║██╔════╝░██║░░░██║██╔════╝██║██╔══██╗██╔══██╗     |"
    putStrLn "|         █████╗░░██║░░██║██████╔╝██╔████╔██║██║██║░░██╗░██║░░░██║█████╗░░██║██████╔╝██║░░██║     |"
    putStrLn "|         ██╔══╝░░██║░░██║██╔══██╗██║╚██╔╝██║██║██║░░╚██╗██║░░░██║██╔══╝░░██║██╔══██╗██║░░██║     |"
    putStrLn "|         ██║░░░░░╚█████╔╝██║░░██║██║░╚═╝░██║██║╚██████╔╝╚██████╔╝███████╗██║██║░░██║╚█████╔╝     |"
    putStrLn "|         ╚═╝░░░░░░╚════╝░╚═╝░░╚═╝╚═╝░░░░░╚═╝╚═╝░╚═════╝░░╚═════╝░╚══════╝╚═╝╚═╝░░╚═╝░╚════╝░     |"
    putStrLn "|                                                                                                 |"
    putStrLn "|                         ███╗░░░███╗██╗███╗░░██╗░█████╗░██████╗░░█████╗░                         |"
    putStrLn "|                         ████╗░████║██║████╗░██║██╔══██╗██╔══██╗██╔══██╗                         |"
    putStrLn "|                         ██╔████╔██║██║██╔██╗██║███████║██║░░██║██║░░██║                         |"
    putStrLn "|                         ██║╚██╔╝██║██║██║╚████║██╔══██║██║░░██║██║░░██║                         |"
    putStrLn "|                         ██║░╚═╝░██║██║██║░╚███║██║░░██║██████╔╝╚█████╔╝                         |"
    putStrLn "|                         ╚═╝░░░░░╚═╝╚═╝╚═╝░░╚══╝╚═╝░░╚═╝╚═════╝░░╚════╝░                         |"
    putStrLn "|_________________________________________________________________________________________________|"
    putStrLn "|                                                                                                 |"
    putStrLn "|                                          MENU                                                   |"
    putStrLn "|_________________________________________________________________________________________________|" 
    putStrLn "|                                                                                                 |"
    putStrLn "|                                       |1| START                                                 |" 
    putStrLn "|                                       |2| HISTORIA                                              |" 
    putStrLn "|                                       |3| TUTORIAL                                              |" 
    putStrLn "|                                       |4| QUIT                                                  |" 
    putStrLn "|_________________________________________________________________________________________________|"


menuHistoria :: IO()
menuHistoria = do
    putStrLn ""
    putStrLn "|-----------------------------------------------------------------------------|"
    putStrLn "|                     Rasga-língua é uma formiga muito forte                  |"
    putStrLn "|                  que machuca a língua do tamanduá bandeira!!                |"
    putStrLn "|                                                                             |"
    putStrLn "|            O tamanduá bandeira é muito cuidadoso com seu filhote            |"
    putStrLn "|                  e precisa mapear uma área marcando onde existe             |"
    putStrLn "|                       formigueiros da rasga língua!!                        |"
    putStrLn "|                                                                             |"
    putStrLn "|    O tamanduá bandeira consegue farejar os formigueiros de rasga-língua     |"
    putStrLn "|   quanto maior o número, maior o cheiro e mais rasga-língua por perto !!!   |"
    putStrLn "|       Sendo assim, se o número for 1, tem um formigueiro nos arredores      |"
    putStrLn "|                       Se for 2, têm 2 (queee medoo !!) e etc                |"
    putStrLn "|                                                                             |"
    putStrLn "|                  Mas o tamanduá-bandeira é esperto e glorioso               |"
    putStrLn "|      por isso ele consegue marcar a região onde essas formigas estão !!     |"
    putStrLn "|                Sendo assim, não ouse abrir a região marcada !!              |"
    putStrLn "|-----------------------------------------------------------------------------|"

menuConsciencia :: IO()
menuConsciencia = do
    putStrLn ""
    putStrLn "|-----------------------------------------------------------------------------|"
    putStrLn "|                                 TAMANDUÁ-BANDEIRA                           |"
    putStrLn "|                                                                             |"
    putStrLn "|            - O tamanduá bandeira é muito cuidadoso com seu filhote          |"
    putStrLn "|                    e o carrega por 6 meses em suas costas.                  |"
    putStrLn "|                                                                             |"
    putStrLn "|            - Ele pode chegar a comer até 30 mil formigas por dia.           |"
    putStrLn "|                                                                             |"
    putStrLn "|      - É um animal na lista de extinção, antes era presente nos seis        |"
    putStrLn "|            biomas brasileiros. Hoje, já foi extinto nos Pampas.             |"
    putStrLn "|                                                                             |"
    putStrLn "|      - É o maior entre os tamanduás, podendo chegar a 2 m de comprimento    |"
    putStrLn "|                  40 kg e sua língua pode chegar a 60 cm.                    |"
    putStrLn "|                                                                             |"
    putStrLn "|                             Como você pode ajudar ?                         |"
    putStrLn "|                                                                             |"
    putStrLn "|             - Aprenda mais sobre espécies ameaçadas de extinção             |"
    putStrLn "|                  e as principais ameaças à sua sobrevivência                |"
    putStrLn "|                como o desmatamento, a caça e os atropelamentos.             |"
    putStrLn "|                   Ensine seus amigos e familiares sobre isso.               |"
    putStrLn "|                          Compartilhe o que aprender.                        |"
    putStrLn "|                              Obrigado por jogar.                            |"
    putStrLn "|-----------------------------------------------------------------------------|"

menuInstrucoes :: IO()
menuInstrucoes = do
    putStrLn "" 
    putStrLn "|-----------------------------------------------------------------------------|" 
    putStrLn "|                         Instruções para jogar:                              |" 
    putStrLn "|                                                                             |" 
    putStrLn "|                Coloque o comando e as posições desejadas!                   |" 
    putStrLn "|                 Exemplo: C 1 2 - Cavar formigueiro (1,2).                   |" 
    putStrLn "|                 Exemplo: M 1 2 - Marcar formigueiro (1,2).                  |"
    putStrLn "|                   C significa Cavar, ou melhor, revelar.                    |"
    putStrLn "|                           Já M significa Marcar.                            |" 
    putStrLn "|-----------------------------------------------------------------------------|" 
