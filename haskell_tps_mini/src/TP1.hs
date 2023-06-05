module TP1 where

esMes :: Int -> Bool
esMes mes = mes>0 && mes<=12

mesAnterior :: Int -> Int
mesAnterior 1 = 12
mesAnterior mes | esMes mes = mes-1

mesSiguiente :: Int -> Int
mesSiguiente 12 = 1
mesSiguiente mes | esMes mes = mes+1

-- Funciones para saber estacion
mesEstacion :: Int -> String
mesEstacion 1 = "verano"
mesEstacion 4 = "otonio"
mesEstacion 7 = "invierno"
mesEstacion 10 = "primavera"
mesEstacion x = mesEstacion(mesAnterior x)

cambioEstacion :: Int -> String 
cambioEstacion mes = mesEstacion(mesAnterior mes) ++ "/" ++ mesEstacion(mesSiguiente mes)

estacion :: Int -> String
estacion mes
    | rem mes 3 == 0 = cambioEstacion mes
    | esMes mes = mesEstacion mes