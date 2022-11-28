import Mensagens
import System.Random
import System.Exit
import GeradorAleatorio
import Formigueiro
import Helpers
import System.IO
import System.IO.Error

import Control.Exception
import Formatting
import Formatting.Clock
import System.Clock

type Coordenadas = (Int, Int)
type Valor = Int
type Elem = (Coordenadas,Valor)
type Matriz = [Elem]

entradas :: Int -> Int -> Int -> Int -> Matriz -> Matriz -> IO()
entradas contador linhas colunas bombas mtzInterna mtzUsuario = do
    start <- getTime Monotonic
    putStrLn "Informe sua jogada:"
    entrada <- getLine
    putStrLn"\n"
    let info = words entrada
    let j = info !! 0
    let x = read (info !! 1) :: Int
    let y = read (info !! 2) :: Int

    if (contaPalavras info == 3) then do
        putStrLn ""
    else if (j == "TUTORIAL") then do
            Mensagens.menuInstrucoes
    else if (j == "SAIR") then do
            Mensagens.menuConsciencia
            putStrLn "Aperte Enter para voltar ao menu. . ."
            nada <- getLine
            menu
    else do
        putStrLn "Comando inválido. Digite TUTORIAL para entender as regras do jogo ou SAIR para deixar a partida."
        putStrLn"\n"
        entradas contador linhas colunas bombas mtzInterna mtzUsuario
        --Helpers.imprimirMapa linhas colunas mtzUsuario


    if(j == "C") then do
        let matrizUsuario = if(Formigueiro.verificaFormigueiro (x, y) mtzInterna) then Helpers.revelarMapa mtzInterna mtzInterna mtzUsuario else Helpers.modificarMapa x y mtzInterna mtzUsuario
        let matrizUsuarioReveladaRecursivamente = Helpers.revelarMuitos linhas colunas matrizUsuario matrizUsuario mtzInterna
        
        Helpers.mostraFormigueirosFaltantes bombas matrizUsuarioReveladaRecursivamente
        putStrLn"\n"
        Helpers.imprimirMapa linhas colunas (matrizUsuarioReveladaRecursivamente)
        if(Formigueiro.verificaFormigueiro (x, y) mtzInterna) then do
            end <- getTime Monotonic
            putStr "VOCÊ MORREU EM "
            fprint(timeSpecs) start end
            putStrLn"\n"
            putStrLn "NÚMERO DE RODADAS:"
            print (contador+1)
            Mensagens.menssagemDerrota
            putStrLn "Aperte Enter . . ."
            nada <- getLine
            Mensagens.menuConsciencia
            putStrLn "Aperte Enter . . ."
            nada <- getLine
            menu
        else
            if (Formigueiro.somaFormigueirosEscondidos 0 matrizUsuarioReveladaRecursivamente == bombas) then do 
                end <- getTime Monotonic
                putStr "VOCÊ VENCEU EM "
                fprint(timeSpecs) start end
                putStrLn"\n"

                putStrLn "NÚMERO DE RODADAS:"
                print (contador+1)
                Mensagens.menssagemVitoria
                putStrLn "Digite seu nome:"
                nomeJogador <- getLine
                escreveRanking nomeJogador contador
                menu 
            else entradas (contador+1) linhas colunas bombas mtzInterna matrizUsuario 
    else if (j == "M") then do
            let matrizUsuario = Helpers.marcarBomba x y mtzInterna mtzUsuario
            let matrizUsuarioReveladaRecursivamente = Helpers.revelarMuitos linhas colunas matrizUsuario matrizUsuario mtzInterna
            Helpers.imprimirMapa linhas colunas (matrizUsuarioReveladaRecursivamente)

            entradas (contador) linhas colunas bombas mtzInterna matrizUsuario
    else do
        putStrLn "Aperte Enter para voltar ao menu. . ."
        nada <- getLine
        menu

-- CONTA QUANTAS PALAVRAS FORAM PASSADAS NA STRING
contaPalavras :: [String] -> Int
contaPalavras = sum . map (length . words)

-- USO DE GUARDS
verificaDificuldade :: String -> String
verificaDificuldade x   | x == "1" = "5 5 5"
                        | x == "2" = "7 7 7"
                        | x == "3" = "9 9 9"

-- USO DE IF ELSE 
escolherDificuldade :: IO()
escolherDificuldade = do
    putStrLn"Informe a dificuldade:"
    putStrLn"(1) Facil"
    putStrLn"(2) Medio"
    putStrLn"(3) Dificil"
    putStrLn "Sua opção:\n>>"
    entrada <- getLine
    
    if(entrada == "1") then do
        putStrLn "Essa região é pequena.\nBom jogo\n"
        iniciarJogo entrada
    else if(entrada == "2") then do
        putStrLn "Essa região é grande.Mas o tamanduá-bandeira é maior!!\nBom jogo\n"
        iniciarJogo entrada
    else if(entrada == "3") then do
        putStrLn "Que desafio !\nBoa sorte e bom jogo,Tamanduá-bandeira\n\n"
        iniciarJogo entrada
    else do
        putStrLn "Opção inválida"
        escolherDificuldade

iniciarJogo :: String -> IO()
iniciarJogo entrada = do
    let entradaLinha = verificaDificuldade entrada
    let array = words entradaLinha
    let linhas = read (array !! 0) :: Int
    let colunas = read (array !! 1) :: Int
    let bombas = read (array !! 2) :: Int
    
    g <- newStdGen
    let (a,b) = randomR (1,999999 :: Int) g
    let semente1 = a

    h <- newStdGen
    let (c,d) = randomR (1,999999 :: Int) h
    let semente2 = c

    let campo_minado = criarMapa linhas colunas 0
    
    let posicoes_aleatorias = GeradorAleatorio.geraPosicoesAleatorias linhas colunas bombas semente1 semente2 []
    
    let campo_bombado = (Formigueiro.inserirFormigueiros posicoes_aleatorias campo_minado)
    
    let prepara_campo_bombado = distFormigueiros campo_bombado campo_bombado

    let matriz_impressa = (criarMapa linhas colunas (-2))
    
    imprimirMapa linhas colunas matriz_impressa

    entradas 0 linhas colunas bombas prepara_campo_bombado matriz_impressa

ranking :: IO ()
ranking = do
    file <- openFile "ranking.txt" ReadMode
    conteudo <- hGetContents file
    putStrLn conteudo
    putStrLn "Aperte enter"
    nada <- getLine
    hClose file
    menu

escreveRanking :: String -> Int -> IO ()
escreveRanking jogador contador= do
    file <- openFile "ranking.txt" AppendMode
    hPutStr file (show (jogador))
    hPutStrLn file (show (contador + 1))
    hClose file

main :: IO()
main = do
    menu

menu :: IO()
menu = do
    Mensagens.menssagemMenu
    escolha <- getLine
    
    if(escolha == "1") then do
        escolherDificuldade 
    else if(escolha == "2") then do
        Mensagens.menuHistoria
        putStrLn "Aperte enter"
        nada <- getLine
        menu
    else if(escolha == "3") then do
        Mensagens.menuInstrucoes
        putStrLn "Aperte enter"
        nada <- getLine
        menu
    else if(escolha == "4") then do
        ranking
        menu
    else if(escolha == "5") then do 
        Mensagens.menuConsciencia
        exitSuccess
    else do
        putStrLn "Opção inválida"
        menu
