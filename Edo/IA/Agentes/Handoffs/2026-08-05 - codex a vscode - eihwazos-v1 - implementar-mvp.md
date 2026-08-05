---
tipo: handoff
estado: cerrado
origen: codex
destino: vscode
proyecto: EihwazOS V1
tarea: implementar-mvp-de-portada-visual-y-busqueda
fecha: 2026-08-05
commit_base: f2321d3
rama: claude/documentar-cencosud
---

# Handoff — EihwazOS V1 — implementar MVP

## Resultado

La implementación se completó en la release `v0.4.0`: plugin local de Obsidian, portada de constelación, búsqueda nativa y documentación de activación. La validación visual manual dentro de Obsidian sigue pendiente.

## Objetivo

Construir la primera versión de la portada de **EihwazOS**, el segundo cerebro personal alojado en este vault Markdown y visualizado principalmente desde Obsidian.

La experiencia al abrir el vault debe parecerse al reel de referencia: una constelación oscura, elegante y minimalista, con un nodo central y dominios conectados alrededor. La entrada debe ser simple: buscar una nota, proyecto, área o agente sin tener que recorrer primero la estructura de carpetas.

## Contexto de la referencia visual

Reel revisado desde la pestaña autenticada de Chrome:

- https://www.instagram.com/p/DZ7lPp6slQl/
- Cuenta: `alassafi.ai`
- Idea central del reel: un “company brain” compuesto por un nodo raíz, siete departamentos y muchas capacidades ejecutables.
- Texto relevante: 137 trabajos de IA agrupados en Sales, Deals, Marketing, Operations, Intelligence, Customer y Back Office.
- Principio trasladable a EihwazOS: el nodo raíz carga el contexto una vez y las capacidades posteriores dejan de adivinar.

Rasgos visuales observados:

- fondo negro/grafito;
- constelación radial con un nodo central;
- líneas finas y nodos claros con brillo suave;
- color verde tenue en el nodo activo;
- tipografía serif para identidad y títulos;
- tipografía sans-serif para datos y búsqueda;
- mucho espacio negativo;
- movimiento ambiental muy discreto.

## Estado actual del vault

- Repositorio: `Edo_Obsidian_os-1`.
- Rama observada: `claude/documentar-cencosud`.
- Árbol limpio al iniciar la tarea.
- Commit observado: `f2321d3` (`docs: document Portal de Capacidades mock in Cencosud/`).
- El vault es Markdown agnóstico a herramientas: Obsidian es una interfaz, Git es el historial y Drive es sincronización.
- La nota de proyecto existente es [[../Proyectos/Sistema Operativo Personal Asistido por IA]].
- El mapa principal existente es [[../MOC - Edu]].
- La taxonomía existente clasifica áreas, proyectos, recursos, archivo y agentes.
- Hay 40 notas Markdown dentro de `Edo/` al momento de la revisión.
- No se encontró una carpeta `.obsidian/` en el repositorio auditado; antes de configurar la apertura automática hay que confirmar cuál es el vault de Obsidian que se desea usar como raíz.

## Decisiones tomadas

### Nombre

- **EihwazOS**: nombre provisional/favorito para el sistema completo.
- **Raido**: nombre recomendado para el portal de capacidades agénticas, con el sentido conceptual de trayecto, movimiento y ejecución.
- No modificar todavía el nombre general `Edo` en las notas existentes; EihwazOS puede funcionar como la capa visual y de producto sobre el vault Edo.

### Experiencia de entrada

La portada debe ser una capa de acceso sobre la estructura existente. No se deben mover, renombrar ni reorganizar las notas para lograr el efecto visual.

La interfaz inicial debe ofrecer:

1. núcleo central con identidad de EihwazOS;
2. búsqueda universal visible inmediatamente;
3. entre cinco y siete dominios, no todas las notas;
4. resultados limitados y legibles;
5. navegación por teclado y clic;
6. acceso posterior a las notas, MOC y estructura real.

### Dominios MVP propuestos

Mapearlos a las notas/carpetas reales después de auditar sus índices:

- **Dirección** — visión, objetivos y decisiones.
- **Proyectos** — iniciativas activas y entregables.
- **Operaciones** — procesos, rutinas y seguimiento.
- **Conocimiento** — notas, referencias y aprendizaje.
- **Inteligencia** — investigaciones, análisis y síntesis.
- **Agentes** — skills, prompts, handoffs y automatizaciones.
- **Archivo** — material cerrado, histórico o de referencia.

No se debe asumir que estos siete dominios reemplazan las áreas existentes como Diseño, UX, Tecnología, IA, Negocios, Salud, etc. En V1 son una capa de navegación superior que enlaza a los MOC existentes.

## Diseño funcional del MVP

Wireframe conceptual:

```text
                 ○ Conocimiento
        ○ Proyectos          ○ Inteligencia

                    ◉
              EIHWAZOS
       ¿Qué quieres encontrar o hacer?

        ○ Operaciones          ○ Agentes
                 ○ Dirección

              resultados
```

Comportamiento mínimo del buscador:

- buscar por título;
- buscar por alias;
- buscar por carpeta/ruta;
- buscar por etiquetas o propiedades disponibles;
- mostrar 8–12 resultados como máximo;
- `Enter` abre el resultado seleccionado;
- `Esc` limpia la búsqueda;
- flechas permiten recorrer resultados;
- clic en un dominio abre su nota índice/MOC.

La búsqueda de contenido completo puede quedar para una iteración posterior con Omnisearch o una indexación propia. El MVP debe privilegiar rapidez y baja complejidad.

## Implementación recomendada

Primera opción para V1:

- nota de entrada `EihwazOS.md` o `Edo/00 - EihwazOS.md`;
- vista dinámica con DataviewJS si está disponible;
- CSS snippet para la composición radial y los estados visuales;
- configuración de nodos separada de la lógica, idealmente en una nota o archivo de configuración;
- Canvas/Graph View como vista secundaria, no como motor principal del buscador.

Si Dataview no está instalado o no se quiere depender de plugins comunitarios, implementar una vista/plugin local pequeño con la API de Obsidian. La opción debe preservar la naturaleza Markdown-first del vault y no alterar el contenido.

Archivos candidatos, a confirmar en el vault real:

```text
Edo/00 - EihwazOS.md
Edo/Interfaz/EihwazOS-v1.css
Edo/Interfaz/EihwazOS-v1.js
Edo/Interfaz/EihwazOS-v1 - Configuración.md
```

Si se implementa como plugin de Obsidian, usar una carpeta propia bajo `.obsidian/plugins/` y documentar cómo activarlo; no versionar `workspace.json`, cachés ni credenciales.

## Plan de implementación en VS Code

### 1. Confirmar superficie

- confirmar si la raíz de Obsidian es el repositorio completo o `Edo/`;
- confirmar si existe `.obsidian` en la raíz real;
- verificar plugins disponibles;
- identificar MOC/README para Proyectos, Agentes, Conocimiento y Archivo.

### 2. Crear la portada mínima

- crear una nota de entrada sin tocar notas existentes;
- enlazar el núcleo a [[../README]] o a la nota de sistema elegida;
- construir el mapa de siete dominios con enlaces reales;
- agregar el buscador.

### 3. Aplicar el lenguaje visual

- fondo grafito;
- líneas y nodos radiales;
- núcleo verde tenue;
- tipografías y espaciado del reel;
- estados hover/focus accesibles;
- composición usable en pantalla de laptop.

### 4. Configurar entrada

- hacer que Obsidian abra la portada al iniciar, solo si la raíz y configuración `.obsidian` fueron confirmadas;
- conservar un enlace claro hacia [[../MOC - Edu]] y [[../IA/Agentes/00 - Inicio rápido]].

### 5. Validar

- probar búsqueda con notas reales;
- probar navegación por teclado;
- comprobar enlaces a los MOC existentes;
- confirmar que el vault funciona aunque la capa visual esté desactivada;
- revisar diff y ejecutar la validación del kit si se toca configuración de agentes.

## Criterios de aceptación de EihwazOS V1

- la portada aparece como punto de entrada del vault configurado;
- la búsqueda es visible al ingresar;
- se puede encontrar y abrir una nota sin usar el explorador lateral;
- los dominios conducen a contenido real;
- no se mueven ni renombran notas existentes;
- la portada se puede mantener sin editar cada nota individual;
- el diseño evoca la constelación del reel sin convertirse en un grafo ilegible;
- desactivar la capa visual no rompe el vault Markdown;
- queda documentado cómo ampliar dominios y capacidades.

## Fuera de alcance de V1

- indexación semántica/vectorial;
- agente autónomo que modifique notas sin revisión;
- migración masiva de carpetas;
- rediseño completo de todas las notas existentes;
- animaciones complejas o dependencia de una aplicación web externa;
- automatización de correo, calendario o tareas.

## Bloqueos y riesgos

- La rama exclusiva `codex/eihwazos-v1` no pudo crearse porque la autorización para cambiar de rama fue rechazada.
- No se aplicaron cambios de implementación en esta sesión.
- El repositorio observado está en una rama con trabajo de Claude; no editar simultáneamente los mismos archivos sin acordar propiedad.
- Falta confirmar la raíz real del vault de Obsidian y la disponibilidad de Dataview.
- La configuración `.obsidian` puede ser local y no debe copiarse a otros equipos sin revisar rutas, plugins y secretos.

## Próxima acción exacta

En VS Code, abrir el repositorio `Edo_Obsidian_os-1`, confirmar la raíz de Obsidian y crear una rama exclusiva para la implementación. Después crear primero la nota de entrada y un prototipo estático de la constelación con enlaces reales; solo cuando esa navegación esté validada agregar la búsqueda dinámica.

## Fuentes

- [[../MOC - Edu]]
- [[../README]]
- [[../Taxonomía]]
- [[../Proyectos/Sistema Operativo Personal Asistido por IA]]
- [[../IA/Agentes/00 - Inicio rápido]]
- [[../IA/Agentes/01 - Estado compartido]]
- Reel de referencia: https://www.instagram.com/p/DZ7lPp6slQl/
