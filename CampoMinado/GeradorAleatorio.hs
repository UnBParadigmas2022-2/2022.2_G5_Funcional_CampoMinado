module GeradorAleatorio
(
geraNumeroAleatorio,
geraTuplaAleatoria,
geraPosicoesAleatorias
)where

import System.IO.Unsafe
import System.Random

geraNumeroAleatorio :: Int -> Int -> Int
geraNumeroAleatorio num semente = 
    if (semente `mod` 2 == 0) then
        (((semente * 20) `mod` num) + 1)
    else
        (((semente * 43) `mod` num) + 1)

geraTuplaAleatoria :: Int -> Int -> Int -> Int -> [(Int, Int)] -> (Int, Int)
geraTuplaAleatoria linhas colunas semente1 semente2 lista
    | (x, y) `elem` lista = geraTuplaAleatoria linhas colunas (semente1+137) (semente2+331) lista
    | otherwise = (x, y)
    where x = geraNumeroAleatorio linhas (semente1)
          y = geraNumeroAleatorio colunas (semente2)

geraPosicoesAleatorias :: Int -> Int -> Int -> Int -> Int -> [(Int, Int)] -> [(Int, Int)]
geraPosicoesAleatorias linhas colunas 0 semente1 semente2 lista = lista
geraPosicoesAleatorias linhas colunas bombas semente1 semente2 lista =
    geraPosicoesAleatorias linhas colunas (bombas-1) (semente1 + 59) (semente2 + 277) ((geraTuplaAleatoria linhas colunas semente1 semente2 lista) : lista)