module TP where
  
-- Se importa una implementación básica para la función show para las funciones,
-- de modo que en la consola se muestren como "<function>" en vez de fallar
-- por un error de tipos.
import Text.Show.Functions

----------------------
-- Código inicial
----------------------

ordenarPor :: Ord a => (b -> a) -> [b] -> [b]
ordenarPor ponderacion =
  foldl (\ordenada elemento -> filter ((< ponderacion elemento).ponderacion) ordenada
                                  ++ [elemento] ++ filter ((>= ponderacion elemento).ponderacion) ordenada) []

data Demonio = Demonio {
    deudores :: [String],
    subordinados :: [Demonio]
} deriving (Show, Eq)

----------------------------------------------
-- Definí tus tipos de datos y funciones aquí
----------------------------------------------

data Humano = Humano {
  nombre :: String,
  reconocimiento :: Int,
  felicidad :: Int,
  deseos :: [Deseo]
} deriving (Show)

data Deseo = UnDeseo {
  cambioFelicidad :: Int -> Int,
  cambioReconocimiento :: Int -> Int
} deriving (Show)

-- Funciones de cada deseo

pazMundial :: Deseo
pazMundial = UnDeseo (*20) (*1)

serFamoso :: Deseo
serFamoso = UnDeseo (\valor -> valor * 0 + 50) (+1000)

recibirseCarrera :: String -> Deseo
recibirseCarrera carrera = UnDeseo (+250) (+(length carrera*3))

-- Humano de ejemplo

zoe = Humano {
  nombre = "Zoe",
  reconocimiento = 50,
  felicidad = 100,
  deseos = [pazMundial, recibirseCarrera "Ingenieria en Sistemas de Informacion", recibirseCarrera "Medicina", serFamoso]
}

-- Demonios de ejemplo

lucifer = Demonio {
  deudores = ["Federico", "Zoe", "Graciela"],
  subordinados = [beelzebub, mazikeen]
}

beelzebub = Demonio {
  deudores = ["Mariano"],
  subordinados = [amenadiel]
}

mazikeen = Demonio {
  deudores = [],
  subordinados = []
}

amenadiel = Demonio {
  deudores = ["Lucas"],
  subordinados = []
}

------------------ Punto 1 -------------------

-- Funcion para calcular la nueva felicidad de la persona
calcularDiferenciaFelicidad :: Deseo -> Int -> Int
calcularDiferenciaFelicidad deseo felicidadInicial = cambioFelicidad deseo felicidadInicial - felicidadInicial

-- Funcion para calcular el nuevo reconocimiento de la persona
calcularDiferenciaReconocimiento :: Deseo -> Int -> Int
calcularDiferenciaReconocimiento deseo reconocimientoInicial = cambioReconocimiento deseo reconocimientoInicial - reconocimientoInicial

-- Propuesta:
-- -- Funcion para calcular diferencia
-- calcularDiferencia :: (Deseo -> Int -> Int) -> Deseo -> Int -> Int
-- calcularDiferencia cambioCondicion deseo condicionInicial = cambioCondicion deseo condicionInicial - condicionInicial

----------------------------------------------

------------------ Punto 2 -------------------

-- Funcion  para calcular la espiritualidad de un deseo
calcularEspiritualidad :: Humano -> Deseo -> Int
calcularEspiritualidad persona deseo = calcularDiferenciaFelicidad deseo (felicidad persona)  - calcularDiferenciaReconocimiento deseo (reconocimiento persona)

----------------------------------------------

------------------ Punto 3 -------------------

-- Funcion para saber si una persona es mas feliz que antes de cumplir sus deseos
esMasFeliz :: Humano -> Bool
esMasFeliz persona = felicidad persona < foldl (\felicidad deseo -> cambioFelicidad deseo felicidad) (felicidad persona) (deseos persona)

----------------------------------------------

------------------ Punto 4 -------------------

-- Funcion para filtrar que deseos son terrenales
filtrarDeseosTerrenales :: Humano -> [Deseo]
filtrarDeseosTerrenales persona = (ordenarPor (calcularEspiritualidad persona) . (filter (\deseo -> calcularEspiritualidad persona deseo < 150))) (deseos persona)

-- Funcion para calcular la felicidad mas reconocimiento de un humano cuando se le cumple un deseo
calcularFelicidadMasReconocimiento :: Humano -> Deseo -> Int
calcularFelicidadMasReconocimiento persona deseo = cambioFelicidad deseo (felicidad persona) + cambioReconocimiento deseo (reconocimiento persona)

-- Funcion para cumplir el deseo de la persona
cumplirDeseo :: Humano -> Deseo -> Humano
cumplirDeseo persona deseo = persona {felicidad = cambioFelicidad deseo (felicidad persona), reconocimiento = cambioReconocimiento deseo (reconocimiento persona)}

-- Funcion para comprobar cual es la mejor version de un humano ( Punto 4b )
mejorVersion :: Humano -> Humano
mejorVersion persona = (cumplirDeseo persona . fst . last . ordenarPor (snd) . (zip (deseos persona)) . map (calcularFelicidadMasReconocimiento persona)) (deseos persona)

----------------------------------------------

------------------ Punto 5 -------------------

-- Funcion para comprobar si un humano es deudor de un demonio ( Punto 5a )
esDeudor :: Humano -> Demonio -> Bool
esDeudor persona (Demonio deudores subordinados) = elem (nombre persona) deudores || any (esDeudor persona) subordinados

-- Funcion que devuelve lista con todos los subordinados directos e indirectos de un demonio
concatenarSubordinados :: Demonio -> [Demonio]
concatenarSubordinados (Demonio deudores [] ) = [] 
concatenarSubordinados (Demonio deudores subordinados) = subordinados ++ concatMap (concatenarSubordinados) subordinados

-- Funcion para comprobar si un humano es deudor de un demonio ( Punto 5b )
esDeudor' :: Humano -> Demonio -> Bool
esDeudor' persona demonio = (any (\demonio -> elem (nombre persona) (deudores demonio)) . ([demonio] ++) . concatenarSubordinados) demonio

----------------------------------------------

------------------ Punto 6 -------------------

-- Comprobar si el humano es deudor del demonio
cumpleCondicionesDeudor :: Humano -> Demonio -> Bool
cumpleCondicionesDeudor persona = (not . esDeudor' persona)

-- Comprobar si el humano tiene deseos terrenales
cumpleCondicionesDeseos :: Humano -> Bool
cumpleCondicionesDeseos = (>0) . length . filtrarDeseosTerrenales

-- Comprobar si se cumplen las condiciones para que el demonio ayude
cumpleAmbasCondiciones :: Humano -> Demonio -> Bool
cumpleAmbasCondiciones persona demonio = cumpleCondicionesDeudor persona demonio && cumpleCondicionesDeseos persona

-- Agregar persona a la lista de deudores de un demonio
agregarDeudor :: Humano -> Demonio -> Demonio
agregarDeudor persona demonio = demonio {deudores = (deudores demonio) ++ [(nombre persona)]}

-- Funcion para que un demonio ayude a un humano si le conviene al demonio
ayudarSiLeConviene :: Humano -> Demonio -> (Humano,Demonio)
ayudarSiLeConviene persona demonio
                              | cumpleAmbasCondiciones persona demonio = ((cumplirDeseo persona (head (filtrarDeseosTerrenales persona))) , demonio)
                              | otherwise = (persona , demonio)

----------------------------------------------