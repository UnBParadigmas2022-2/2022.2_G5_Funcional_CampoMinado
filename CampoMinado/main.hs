import Mensagens
import System.Random
import System.Exit
import GeradorAleatorio
import Formigueiro

type Coordenadas = (Int, Int)
type Valor = Int
type Elem = (Coordenadas,Valor)
type Matriz = [Elem]


criarMapa:: Int -> Int -> Int -> Matriz
criarMapa a b c = [((x,y), c) | x <-[1,2..a], y <-[1,2..b]]

distFormigueiros:: Matriz -> Matriz -> Matriz
distFormigueiros [] matriz = matriz
distFormigueiros (((x, y), z): mtz) matriz = if (z == -1) then distFormigueiros mtz (somaProxFormigueiro x y matriz) else (distFormigueiros mtz matriz)

inverter:: Int -> Int -> Matriz -> Matriz-> Matriz
inverter num1 num2 matriz anterior = reverse(verificarSoma num1 num2 matriz anterior)

verificarSoma:: Int -> Int -> Matriz -> Matriz-> Matriz
verificarSoma num1 num2 [] anterior = [ ]
verificarSoma num1 num2 (((x, y), z): mtz) anterior = if(num1 == x && num2 == y && z /= -1) then anterior++(reverse ([((x,y), z+1)]++ mtz)) else verificarSoma num1 num2 mtz  anterior++[((x,y), z)]

somaProxFormigueiro:: Int -> Int -> Matriz -> Matriz
somaProxFormigueiro x y mtz = inverter x (y-1) (inverter x (y+1) (inverter (x-1) y (inverter (x-1) (y+1) (inverter (x-1) (y-1) (inverter (x+1) y (inverter (x+1) (y+1) (inverter (x+1) (y-1) mtz [])[])[])[])[])[])[])[]

verificaFormigueiro :: (Int, Int) -> Matriz -> Bool
verificaFormigueiro tupla [] = False
verificaFormigueiro (x, y) (((a, b), c):mtzTail) = 
    if (x == a && y == b && c == -1) then 
        True 
    else 
        verificaFormigueiro (x, y) mtzTail

revelarMapa:: Matriz -> Matriz -> Matriz -> Matriz
revelarMapa [] mtzInterna mtzUsuario = mtzUsuario
revelarMapa (((a,b), c):mtzInternaTail) mtzInterna mtzUsuario = revelarMapa mtzInternaTail mtzInterna (modificarMapa a b mtzInterna mtzUsuario)

modificarMapa:: Int -> Int -> Matriz -> Matriz -> Matriz
modificarMapa x y (((a,b), c):mtz) mtz_usuario = if (x == a && y == b) then ((modificarPosicao x y c mtz_usuario [])) else modificarMapa x y mtz mtz_usuario

modificarPosicao:: Int -> Int -> Int -> Matriz -> Matriz -> Matriz 
modificarPosicao x y z (((a,b), c):mtzUsuario) mtzFinal = if (x == a && y == b) then mtzFinal ++ (([((x, y), z)] ++ mtzUsuario)) else modificarPosicao x y z mtzUsuario (mtzFinal ++ [((a,b), c)])
        
preencheCoordLinha :: Int -> [Int]
preencheCoordLinha coluna =  [ i+1 | i <- [0..coluna]]

preencheLinhaDiv :: Int -> [Int]
preencheLinhaDiv coluna =  [ (-9) | i <- [0..coluna]]

retornaValorLinha :: Int -> Int -> Matriz -> [Int]
retornaValorLinha linha 0 matriz = []
retornaValorLinha linha coluna (((x, y), v):mtz)
    | coluna == 1 = v:[-7, linha]
    | linha == x = v:retornaValorLinha linha (coluna-1) mtz
    | otherwise = retornaValorLinha linha coluna mtz

converterListaIntParaString :: [Int] -> String
converterListaIntParaString [] = ""
converterListaIntParaString (h:t) 
    | h == -2 = "+ " ++ converterListaIntParaString t
    | h == -1 = "B " ++ converterListaIntParaString t
    | h == -9 = "_ " ++ converterListaIntParaString t
    | h == -7 = "| " ++ converterListaIntParaString t
    | otherwise = show h ++ " " ++ converterListaIntParaString t

pegarValoresMapa :: Int -> Int -> Int -> Matriz -> String
pegarValoresMapa linha linhas colunas matriz
    | linha == (-1) = converterListaIntParaString (preencheCoordLinha (colunas-1)) ++ "\n" ++ pegarValoresMapa(linha+1) linhas colunas matriz
    | linha == 0 = converterListaIntParaString (preencheLinhaDiv (colunas-1)) ++ "\n" ++ pegarValoresMapa(linha+1) linhas colunas matriz
    | linha == (linhas+1) = ""
    | otherwise = converterListaIntParaString (retornaValorLinha linha colunas matriz) ++ "\n" ++ pegarValoresMapa (linha+1) linhas colunas matriz

imprimirMapa :: Int -> Int -> Matriz -> IO()
imprimirMapa linhas colunas matriz = putStrLn (pegarValoresMapa (-1) linhas colunas matriz)
        
somaFormigueirosEscondidos :: Int -> Matriz -> Int
somaFormigueirosEscondidos num [] = num
somaFormigueirosEscondidos num (((x, y), v) : mtz) = if (v == -2) then (somaFormigueirosEscondidos (num+1) mtz) else (somaFormigueirosEscondidos (num) mtz)

revelar :: Int -> Int -> Matriz -> Bool
revelar x y (((a,b),v):mtzTail) = if (a==x && b==y) then (v/=(-2)) else (revelar x y mtzTail)

formigueirosRevelados :: Int -> Int -> Int -> Int -> Matriz -> Bool
formigueirosRevelados x y linhas colunas mtzUsuario
    | (x == 1 && y == 1) = (revelar (x) (y+1) mtzUsuario) && (revelar (x+1) (y) mtzUsuario)
    | (x == 1 && y == colunas) = (revelar (x) (y-1) mtzUsuario) && (revelar (x+1) (y) mtzUsuario)
    | (x == linhas && y == colunas) = (revelar (x) (y-1) mtzUsuario) && (revelar (x-1) (y) mtzUsuario)
    | (x == linhas && y == 1) = (revelar (x) (y+1) mtzUsuario) && (revelar (x-1) (y) mtzUsuario)
    | (x == 1 && y > 1 && y < colunas) = (revelar (x) (y+1) mtzUsuario) && (revelar (x) (y-1) mtzUsuario) && (revelar (x+1) (y) mtzUsuario)
    | (x > 1 && x < linhas && y == colunas) = (revelar (x-1) (y) mtzUsuario) && (revelar (x+1) (y) mtzUsuario) && (revelar (x) (y-1) mtzUsuario)
    | (x == linhas && y > 1 && y < colunas) = (revelar (x-1) (y) mtzUsuario) && (revelar (x) (y-1) mtzUsuario) && (revelar (x) (y+1) mtzUsuario)
    | (x > 1 && x < linhas && y == 1) = (revelar (x) (y+1) mtzUsuario) && (revelar (x-1) (y) mtzUsuario) && (revelar (x+1) (y) mtzUsuario)
    | otherwise = (revelar (x-1) (y) mtzUsuario) && (revelar (x) (y+1) mtzUsuario) && (revelar (x+1) (y) mtzUsuario) && (revelar (x) (y-1) mtzUsuario)

revelarCruz :: Int -> Int -> Int -> Int -> Matriz -> Matriz -> Matriz
revelarCruz x y linhas colunas mtzUsuario mtzInterna
    | (x == 1 &&  y == 1) = modificarMapa (x+1) y mtzInterna (modificarMapa x (y+1) mtzInterna mtzUsuario)
    | (x == 1 && y == colunas) = modificarMapa (x+1) y mtzInterna (modificarMapa x (y-1) mtzInterna mtzUsuario)
    | (x == linhas && y == colunas) = modificarMapa (x-1) y mtzInterna (modificarMapa x (y-1) mtzInterna mtzUsuario)
    | (x == linhas && y==1) = modificarMapa (x-1) y mtzInterna (modificarMapa x (y+1) mtzInterna mtzUsuario)
    | (x==1 && y > 1 && y < colunas) = modificarMapa (x+1) y mtzInterna (modificarMapa x (y-1) mtzInterna (modificarMapa x (y+1) mtzInterna mtzUsuario))
    | (x>1 && x < linhas && y==colunas) = modificarMapa (x-1) y mtzInterna (modificarMapa (x+1) (y) mtzInterna (modificarMapa x (y-1) mtzInterna mtzUsuario))
    | (x== linhas && y > 1 && y < colunas) = modificarMapa (x-1) y mtzInterna (modificarMapa x (y-1) mtzInterna (modificarMapa x (y+1) mtzInterna mtzUsuario))
    | (x>1 && x<linhas && y==1) = modificarMapa x (y+1) mtzInterna (modificarMapa (x-1) y mtzInterna (modificarMapa (x+1) y mtzInterna mtzUsuario))
    | otherwise = modificarMapa (x-1) y mtzInterna (modificarMapa (x) (y+1) mtzInterna (modificarMapa (x+1) (y) mtzInterna (modificarMapa x (y-1) mtzInterna mtzUsuario)))

revelarMuitos :: Int -> Int -> Matriz -> Matriz -> Matriz -> Matriz
revelarMuitos linhas colunas [] mtzUsuario mtzInterna = mtzUsuario
revelarMuitos linhas colunas (((x, y), z):mtzUsuarioTail) mtzUsuario mtzInterna = 
    if (z /= 0) then
        revelarMuitos linhas colunas mtzUsuarioTail mtzUsuario mtzInterna
    else 
        if (formigueirosRevelados x y linhas colunas mtzUsuario) then
            revelarMuitos linhas colunas mtzUsuarioTail mtzUsuario mtzInterna
        else
            revelarMuitos linhas colunas (revelarCruz x y linhas colunas mtzUsuario mtzInterna) (revelarCruz x y linhas colunas mtzUsuario mtzInterna) mtzInterna

entradas :: Int -> Int -> Int -> Matriz -> Matriz -> IO()
entradas linhas colunas bombas mtzInterna mtzUsuario = do
    putStr "Informe sua jogada:"
    
    entrada <- getLine
    putStrLn"\n"
    let info = words entrada
    let j = info !! 0
    let x = read (info !! 1) :: Int
    let y = read (info !! 2) :: Int

    if(j == "C") then do
        let matrizUsuario = if(verificaFormigueiro (x, y) mtzInterna) then revelarMapa mtzInterna mtzInterna mtzUsuario else modificarMapa x y mtzInterna mtzUsuario
        
        let matrizUsuarioReveladaRecursivamente = revelarMuitos linhas colunas matrizUsuario matrizUsuario mtzInterna

        imprimirMapa linhas colunas (matrizUsuarioReveladaRecursivamente)
        if(verificaFormigueiro (x, y) mtzInterna) then do
            Mensagens.menssagemDerrota
            menu
        else
            if (somaFormigueirosEscondidos 0 matrizUsuarioReveladaRecursivamente == bombas) then do 
                Mensagens.menssagemVitoria 
                menu 
            else entradas linhas colunas bombas mtzInterna matrizUsuario 
    else do
        putStrLn "Opcao invalida"
        entradas linhas colunas bombas mtzInterna mtzUsuario

verificaDificuldade "1" = "5 5 5"
verificaDificuldade "2" = "7 7 7"
verificaDificuldade "3" = "9 9 9"

iniciarJogo :: IO()
iniciarJogo = do
    putStrLn"Informe a dificuldade:"
    putStrLn"(1) Facil"
    putStrLn"(2) Medio"
    putStrLn"(3) Dificil"
    putStr "Sua opção:"
    entrada <- getLine
    putStrLn "\n"

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

    entradas linhas colunas bombas prepara_campo_bombado matriz_impressa

main :: IO()
main = do
    menu

menu :: IO()
menu = do
    Mensagens.menssagemMenu
    escolha <- getLine
    
    if(escolha == "1") then do
        iniciarJogo
    else if(escolha == "2") then do
        Mensagens.menuHistoria
        menu
    else if(escolha == "3") then do
        Mensagens.menuInstrucoes
        menu
    else if(escolha == "4") then do 
        exitSuccess
    else do
        putStrLn "Opção inválida"
        menu
