[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/7byCJCza)
# TP Integrador - Paradigma Funcional 2023

Integrantes:

- Bolatti Torcasio, Juan Cruz
- Dorin Kraushart, Nahuel
- Etcheverry, Tomas Agustin
- Petta, Alexis
- Santoro, Federico 

## Consignas

Este trabajo, a diferencia de los anteriores, tiene consignas abiertas con la intención de que tomen decisiones respecto a los tipos de datos y funciones a desarrollar. También tiene las dimensiones y complejidad similares a las de un parcial, con lo cual debería servir para prepararse para lo que se viene :muscle:

Pueden encontrar el enunciado del trabajo práctico en formato PDF en la raíz de este repositorio.

> Teniendo instalada la extensión **vscode-pdf** deberían poder abrir una vista previa del archivo dentro del mismo entorno.

Se espera que desarrollen lo indicado en cada punto en el archivo `src/TP.hs`, luego del código provisto.

A su vez hay un archivo `test/Spec.hs` para implementar pruebas automáticas para el trabajo.

> Queda a criterio del equipo el desarrollo de las pruebas que permitan verificar la funcionalidad de cada punto de forma aislada.

Y no olviden editar este `README` con los nombres de cada integrante :smile:

## Modalidad de trabajo

Para arrancar, cada integrante debería clonarse el repositorio ejecutando el comando `git clone urlParaClonarElRepo` , de modo que puedan trabajar tanto de forma sincrónica como asincrónica (ver más abajo).

Al igual que para los trabajos prácticos anteriores, se recomienda dar pasos chicos: implementar lo que se pide para un punto, y a la par probar lo desarrollado para validar que funciona correctamente.

Si tienen dudas, la idea es usar el canal privado de Discord que fue creado para su grupo. También pueden usar ese mismo canal para cualquier comunicación entre ustedes.

> :speaker: Para sesiones de trabajo sincrónicas, también encontraran en el server de Discord un canal de voz para su grupo, para facilitarles un punto de encuentro.

No olviden abrir un issue para avisar que entregaron el trabajo práctico, así como también crear un tag para que se dispare la corrida de pruebas en el servidor.

### Testeo :heavy_check_mark:

Para este trabajo **no se proveen pruebas automáticas** que verifiquen los resultados de las funciones a desarrollar en cada punto, para no comprometer la libertad para diseñar la solución. Sin embargo, se espera que incluyan pruebas automáticas en el archivo `test/Spec.hs` como parte del trabajo a resolver.

> :warning: Recuerden no dejar las pruebas para el final! Lo mejor es desarrollarlas a la par del desarrollo de la funcionalidad.

Las pruebas automáticas se corren ejecutando el comando `stack test` sobre la raíz del proyecto.

Recuerden que para probar el trabajo manualmente desde la consola, alcanza con correr el comando `stack ghci` sobre la raíz del proyecto y ejecutar las consultas correspondientes en la consola de Haskell.

> :writing_hand: Dado que las funciones no son equiparables, en caso de que para algún problema el resultado que esperan obtener sea **una función**, la forma de verificar que efectivamente el valor obtenido se trate de la función que esperan no es tan directa.
>
> Para ello pueden **aplicar la función resultante** de la operación que están testeando con los valores que quieran, de modo que les permita verificar qué es lo que retorna esa aplicación y a partir de eso determinar de qué función se trataba en primer lugar.

### Recomendaciones para trabajo grupal :busts_in_silhouette:

Si bien no hay una única forma para trabajar en grupo sobre una misma base de código, la recomendación es que se coordinen sobre todo para arrancar trabajando de forma **sincrónica** y aprovechen la extensión **Live Share** del VSCode (que ya deberían haberse instalado al preparar el ambiente), de forma que puedan tomar decisiones conjuntas y avanzar en equipo.

Para trabajo **asincrónico**, alcanza con que cada integrante tenga clonado el repositorio y **antes** de trabajar sobre un cambio, se asegure de tener su repo local con el **código actualizado** corriendo el comando `git pull` sobre la raíz del proyecto.

En la medida en la que avancen sobre el ejercicio, recuerden subir su solución a GitHub con los comandos:

```
git add .
git commit -m "Mensaje que explica los cambios"
git push
```

> :warning: Si falla `git push` por no tener algún cambio realizado por alguien más, ejecutar `git pull` para incorporar los cambios que falten, y luego volver a pushear para subir sus cambios.
>
> En el mejor de los escenarios (si no hay conflictos entre los cambios entrantes y los realizados localmente), git podrá integrar automáticamente los cambios sin requerir mergeos manuales.

Eviten empezar un cambio y dejarlo sin subir, de lo contrario es muy probable que se produzcan [**conflictos**](https://www.youtube.com/watch?v=sKcN7cWFniw&list=PL2xYJ49ov_ddydw7wvncxMBzB3wpqPV0u&index=7) con lo que haga la otra persona.

Siempre es mejor hacer commits chicos para cambios puntuales y pushear seguido, y más aún trabajando en equipo. Si necesitan ayuda con el uso de git, no duden en pedirla!

### Uso de LiveShare :rocket:

Para trabajar con Live Share, una persona del equipo deberá:

- abrir el VSCode sobre la carpeta del proyecto
- crear una sesión compartida usando la extensión Live Share y compartirle el link para sumarse a esa sesión al resto del equipo (les va a pedir loguearse, para eso usan su id de GitHub y listo).

Esta extensión permite que todas las personas que se sumen a la sesión puedan editar al mismo tiempo el código del proyecto, como si fuera un google doc pero con todos los features del entorno de desarrollo que se armaron para Haskell.

> Una vez iniciada la sesión, aparecerá el menú Live Share a la izquierda del VSCode. Allí pueden encontrar opciones útiles, incluyendo compartir la terminal en modo editable para el resto del equipo en vez de ser sólo lectura.
>
> Para más información ver: https://code.visualstudio.com/learn/collaboration/live-share