module Formigueiro
(
inserirFormigueiro,
inserirFormigueiros,
somaFormigueirosEscondidos,
distFormigueiros,
somaProxFormigueiro,
verificaFormigueiro,
inverter,
verificarSoma
)where

type Coordenadas = (Int, Int)
type Valor = Int
type Elem = (Coordenadas,Valor)
type Matriz = [Elem]

inserirFormigueiro:: Int -> Int -> Matriz -> Matriz -> Matriz
inserirFormigueiro a b [] mtzFinal = mtzFinal
inserirFormigueiro a b (((x, y), z): mtz) mtzFinal = 
    if(a == x && b == y) then
        mtzFinal++[((x, y), -1)]++mtz 
    else
        inserirFormigueiro a b mtz (mtzFinal++[((x, y), z)])

inserirFormigueiros :: [(Int, Int)] -> Matriz -> Matriz
inserirFormigueiros [] mtz = mtz
inserirFormigueiros ((x, y): mtzTail) mtz =  inserirFormigueiros mtzTail (inserirFormigueiro x y mtz []) 

verificarSoma:: Int -> Int -> Matriz -> Matriz-> Matriz
verificarSoma num1 num2 [] anterior = [ ]
verificarSoma num1 num2 (((x, y), z): mtz) anterior = if(num1 == x && num2 == y && z /= -1) then anterior++(reverse ([((x,y), z+1)]++ mtz)) else verificarSoma num1 num2 mtz  anterior++[((x,y), z)]

inverter:: Int -> Int -> Matriz -> Matriz-> Matriz
inverter num1 num2 matriz anterior = reverse(verificarSoma num1 num2 matriz anterior)

somaFormigueirosEscondidos :: Int -> Matriz -> Int
somaFormigueirosEscondidos num [] = num
somaFormigueirosEscondidos num (((x, y), v) : mtz) = if (v == -2) then (somaFormigueirosEscondidos (num+1) mtz) else (somaFormigueirosEscondidos (num) mtz)

distFormigueiros:: Matriz -> Matriz -> Matriz
distFormigueiros [] matriz = matriz
distFormigueiros (((x, y), z): mtz) matriz = if (z == -1) then distFormigueiros mtz (somaProxFormigueiro x y matriz) else (distFormigueiros mtz matriz)

somaProxFormigueiro:: Int -> Int -> Matriz -> Matriz
somaProxFormigueiro x y mtz = inverter x (y-1) (inverter x (y+1) (inverter (x-1) y (inverter (x-1) (y+1) (inverter (x-1) (y-1) (inverter (x+1) y (inverter (x+1) (y+1) (inverter (x+1) (y-1) mtz [])[])[])[])[])[])[])[]

verificaFormigueiro :: (Int, Int) -> Matriz -> Bool
verificaFormigueiro tupla [] = False
verificaFormigueiro (x, y) (((a, b), c):mtzTail) = 
    if (x == a && y == b && c == -1) then 
        True 
    else 
        verificaFormigueiro (x, y) mtzTail