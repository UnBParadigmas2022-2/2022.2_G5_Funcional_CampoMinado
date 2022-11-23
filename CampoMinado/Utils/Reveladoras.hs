module Reveladoras
(
contaNaoRevelados,
foiRevelado,
)where

type Coordenadas = (Int, Int)
type Valor = Int
type Elem = (Coordenadas,Valor)
type Matriz = [Elem]

-- Dicionário das siglas
-- cm: cauda da matriz


contaNaoRevelados :: Int -> Matriz -> Int
contaNaoRevelados num [] = num
contaNaoRevelados num (((x, y), v) : matriz) = if (v == (-2)) then (contaNaoRevelados (num+1) matriz) else (contaNaoRevelados (num) matriz)

foiRevelado :: Int -> Int -> Matriz -> Bool
foiRevelado x y (((a, b), v) : cm) = if (a == x && b == y) then (v /= (-2)) else (foiRevelado x y cm)