# Consigna TP2: Tipos de datos propios

## Objetivos

- Definir funciones en Haskell, trabajando con **tipos de datos compuestos**.
- Manipular estructuras de forma **inmutable**.
- Pensar cuándo conviene trabajar con **pattern matching** y cuándo conviene desentenderse de la forma de los datos, **delegando** en otras funciones.

> :bulb: Tené en cuenta que podés **subir soluciones intermedias** tantas veces como quieras. De hecho es una buena práctica subir tus cambios luego de aquellos avances que consideres relevantes.
> 
> Si algo no te funciona y necesitás ayuda para destrabarte, podés subir una solución intermedia y crear un **issue de consulta** en GitHub comentando qué es lo que no te está saliendo para que veamos lo que tenés y te demos una mano. No es la idea que te frustres :heart:

## Telefonía :iphone:

Tenemos el siguiente modelo de datos para trabajar con teléfonos celulares:

```haskell
data Celular = Celular {
  linea :: (String, String),
  saldo :: Int,
  proveedor :: String
} deriving (Show, Eq)
```

Cada línea se compone por un código de área y un número de teléfono, por ejemplo: `("011", "7890-1234")`.

Necesitamos definir una función `promoRecarga :: Int -> Celular -> Celular` que, a partir del monto pagado y el celular a recargar, realice la recarga considerando que:

* Los de `"Movistar"` con código de área `"011"` aumentan el saldo en el triple del monto pagado,
* Los de `"Personal"` aumentan el saldo en el monto pagado + un plus equivalente al **mínimo** entre el monto pagado y 100,
* Todos los demás aumentan el saldo solamente en el monto pagado.

> :writing_hand: Tené en cuenta que existe una función en Haskell para calcular el mínimo entre dos valores, `min :: Ord a => a -> a -> a`.

Además de la función principal `promoRecarga`, se pueden desarrollar tantas funciones como creas conveniente, para abstraer y reutilizar cualquier idea de dominio que consideres relevante.

> :bulb: Considerá delegar a funciones más chicas aquellos problemas que requieran trabajar con detalles estructurales de los datos. Por ejemplo, saber cuál es el código de área de un celular.

> Al correr `stack test` vas a encontrar los resultados de las pruebas para este trabajo agrupados bajo el título **Recarga promocional** en el grupo de pruebas del TP2.

## Checkpoint de autorevisión :mag::broom::repeat:

Si estás leyendo esto y todas las pruebas están pasando: :tada: **felicitaciones** :tada: tu solución está cumpliendo con la funcionalidad esperada.

> :exclamation: Si no lo hiciste todavía, asegurate de subir tus cambios de la misma forma que se explicó en el TP0, usando los comandos:
> - `git add .` seguido de `git commit -m "mensaje del commit"` (o alternativamente `git commit -am "mensaje del commit"` que combina ambas operaciones), para versionar tus cambios localmente,
> - y luego `git push` para que se suban al repo remoto.

Sin embargo, todavía hay algo más para hacer antes de dar por terminado el trabajo. No olvides que el desarrollo es un proceso iterativo, nadie pretende que quede todo impecable a la primera pasada :smile:

1. :mag: Revisá la solución en busca de cosas mejorables.
2. :broom: Si encontrás alguna mejora posible, realizala, volvé a correr las pruebas, y si todo está ok, volvé a subir la solución.
3. :repeat: Repetí los pasos anteriores hasta que estés conforme con el resultado.

Aspectos importantes para revisar:
- **Repetición de lógica**: ¿Te quedó lógica repetida entre los distintos flujos de la función principal?

  Si sí, ¿qué es lo que cambia? ¿se podría extraer la lógica común a otra función de modo que tenga sentido en sí misma?
- **Abuso de azúcares sintácticos por sobre abstracciones**: Si bien existen formas convenientes de crear un celular a partir de otro indicando los valores que se desean cambiar, asegurate de no estar perdiendo alguna abstracción importante en el camino.
- **Pattern matching**: si estás descomponiendo el patrón del celular en todos lados y volviéndolo a armar para pasarlo a otras funciones, quedando una solución muy verbosa... ¿consideraste **no descomponer el patrón** y usar las **funciones de acceso** correspondientes para obtener el dato que necesitabas?

  Puede que sea conveniente limitar el uso de pattern matching a funciones más chiquitas y puntuales.

## Entrega de TP

Una vez que hayas subido tu solución para el trabajo práctico, recordá:
- crear un tag para que se corran las pruebas en el servidor de GitHub, como se explicaba en el TP0,
- crear un issue de entrega para avisar que ya está listo para revisar.