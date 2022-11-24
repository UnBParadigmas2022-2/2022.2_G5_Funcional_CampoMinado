module Formigueiro
(
inserirFormigueiro,
inserirFormigueiros
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