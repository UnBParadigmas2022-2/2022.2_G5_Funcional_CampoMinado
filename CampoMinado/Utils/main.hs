import Mensagens


verificaDificuldade "1" = "5 5 5"
verificaDificuldade "2" = "7 7 7"
verificaDificuldade "3" = "9 9 9"

inicia_jogo :: IO()
inicia_jogo = do

    putStrLn "Escolha seu nível :" 
    putStrLn "1 - Fácil\n2 - Médio\n3 - Difícil\n"
    putStr "Sua opção:"

    entrada <- getLine
    putStrLn "\n"
    let entradaLinha = verificaDificuldade entrada
    let array = words entradaLinha
    let linhas = read (array !! 0) :: Int
    let colunas = read (array !! 1) :: Int
    let bombas = read (array !! 2) :: Int

main :: IO()
main = do
    Mensagens.messageMenu
    Mensagens.messageVitoria
    Mensagens.messageDerrota

    inicia_jogo