# Consigna TP3: Composición y Aplicación Parcial

## Objetivos

- Definir funciones en términos de otras funciones, usando **composición** y **aplicación parcial**.
- Resolver problemas complejos combinando adecuadamente funciones más chicas.

## Cafetería :coffee:

Tenemos un programa que cuenta con las siguientes abstracciones.

```haskell
data Cafe = Cafe {
  intensidad :: Int,
  temperatura :: Int,
  ml :: Int
} deriving (Show, Eq)


molerGranos :: Gramos -> Gramos
prepararCafe :: Agua -> Gramos -> Cafe
servirEnVaso :: Vaso -> Cafe -> Cafe
licuar :: Segundos -> Leche -> Cafe -> Cafe
agregarHielo :: Hielos -> Cafe -> Cafe
```

> :bulb: Todos los tipos que se mencionan más allá de `Cafe` son simplemente un **alias** del tipo Int, a modo orientantivo.

La implementación de esas funciones **ya está resuelta**. Qué hace cada una de ellas no es relevante para el problema a resolver y **no deben modificarse**. A partir de estas funciones queremos armar otras funciones que sirvan para determinar cómo saldrá la preparación del café que queremos hacer.

Definir las siguientes funciones en el archivo `src/TP3.hs`:

 - `prepararFrapuccino :: Gramos -> Cafe` que primero muela los gramos de café, luego prepare el café con sólo 80 ml de agua, le agregue 6 hielos, lo licúe durante 60 segundos con 120 ml de leche y finalmente lo sirva en un vaso de 400 ml.

 - `prepararCafeDeFiltro :: Vaso -> Gramos -> Cafe` que primero muela los gramos de café, luego prepare el café en una cafetera con 1000 ml de agua y finalmente lo sirva en el vaso del tamaño indicado.

:warning: ¡Prestá especial atención al orden de las operaciones descritas, para asegurar que el resultado obtenido coincida con el esperado! :warning:

> :exclamation: Las funciones `prepararFrapuccino` y `prepararCafeDeFiltro` deben definirse combinando las funciones provistas de modo **que se aprovechen los conceptos de [composición](https://wiki.uqbar.org/wiki/articles/composicion.html) y [aplicación parcial](https://wiki.uqbar.org/wiki/articles/aplicacion-parcial.html)**.
>
> Si tu solución se basa en la **aplicación anidada de funciones**, sabé que no está cumpliendo con los objetivos de este trabajo :x:

> Al correr `stack test` vas a encontrar los resultados de las pruebas para este trabajo agrupados bajo el título **Cafetería** en el grupo de pruebas del TP3.

## Checkpoint de autorevisión :mag::broom::repeat:

Si estás leyendo esto y todas las pruebas están pasando: :tada: **felicitaciones** :tada: tu solución está cumpliendo con la funcionalidad esperada. 

Sin embargo, todavía hay algo más para hacer antes de dar por terminado el trabajo. No olvides que el desarrollo es un proceso iterativo, nadie pretende que quede todo impecable a la primera pasada :smile:

> :bulb: Si no lo hiciste todavía, recordá que es una buena práctica subir tus cambios en esta instancia usando los comandos:
> - `git add .` seguido de `git commit -m "mensaje del commit"` (o alternativamente `git commit -am "mensaje del commit"` que combina ambas operaciones), para versionar tus cambios localmente,
> - y luego `git push` para que se suban al repo remoto.

Aspectos importantes para revisar:
- **¿Estás usando composición todo lo posible?** No te limites a usar los conceptos pedidos sólo una vez por cada ejercicio.

  > :bulb: Si bien no es necesario que las mismas se definan con [notación point-free](http://wiki.uqbar.org/wiki/articles/notacion-point-free.html) (omitiendo el último parámetro), recomendamos que lo hagas para estas funciones, para forzarte a explotar el uso de composición al máximo.

- **Funciones auxiliares que no sumen:** no hace falta delegar en funciones auxiliares que no tengan valor para el dominio. Todas las abstracciones importantes ya vienen dadas, el objetivo es que las combines adecuadamente.

  Es especialmente importante que no definas funciones auxiliares para sortear problemas que podían resolverse aplicando parcialmente una función pre-existente.

Detalles cosméticos:
- **Paréntesis innecesarios:** recordá que gracias a la **precedencia** de la aplicación de funciones por sobre la composición, no es necesario usar paréntesis para que se interprete correctamente que queremos aplicar parcialmente **funciones prefijas**.

  Por ejemplo, dadas dos funciones f y g que esperan dos y tres parámetros respectivamente y pueden componerse entre ellas de esta forma `(f 1).(g "hola" "mundo")`, hay paréntesis que pueden omitirse.
  
  La siguiente función compuesta: `f 1 . g "hola" "mundo"` se interpretará exactamente igual, ya que la composición se hará con las funciones resultantes de aplicar f y g con los parámetros indicados.

## Entrega de TP

Una vez que hayas subido tu solución para el trabajo práctico, recordá:
- crear un tag para que se corran las pruebas en el servidor de GitHub, como se explicaba en el TP0,
- crear un issue de entrega para avisar que ya está listo para revisar.