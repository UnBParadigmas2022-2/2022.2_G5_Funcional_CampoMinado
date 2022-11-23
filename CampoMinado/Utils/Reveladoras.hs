module Reveladoras
(
contaNaoRevelados
)where

type Coordenadas = (Int, Int)
type Valor = Int
type Elem = (Coordenadas,Valor)
type Matriz = [Elem]

contaNaoRevelados :: Int -> Matriz -> Int
contaNaoRevelados num [] = num
contaNaoRevelados num (((x, y), v) : mtz) = if (v == -2) then (contaNaoRevelados (num+1) mtz) else (contaNaoRevelados (num) mtz)