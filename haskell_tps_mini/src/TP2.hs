module TP2 where

------------------------------------------
-- Modelo inicial
------------------------------------------

data Celular = Celular {
  linea :: (String, String),
  saldo :: Int,
  proveedor :: String
} deriving (Show, Eq)

------------------------------------------

-- Funcion para saber cual promoción aplicar.
promo :: Int -> Celular -> Int
promo montoPagado (Celular ("011", _) _ "Movistar") = 3 * montoPagado
promo montoPagado (Celular _ _ "Personal") = montoPagado + min montoPagado 100
promo montoPagado _ = montoPagado
 
-- Inmutabilidad y aplicacion de la carga de saldo.
cargarSaldo :: Int -> Celular -> Celular
cargarSaldo carga (Celular linea saldo proveedor) = Celular linea (saldo + carga) proveedor

promoRecarga :: Int -> Celular -> Celular
promoRecarga montoPagado celular = cargarSaldo (promo montoPagado celular) celular 