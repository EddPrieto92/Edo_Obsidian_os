---
tipo: handoff
estado: abierto
origen: claude
destino: codex
proyecto: "portal-capacidades-agenticas"
tarea: "iterar-detalle-capacidad"
fecha: 2026-08-06
commit_base: ffb6a07
rama: "release/eihwazos-v0.4.0"
---

# Handoff — portal-capacidades-agenticas — iterar detalle de capacidad

## Objetivo

Iterar el **Detalle de una Capacidad** (`/capabilities/:id`) del Portal de Capacidades Agénticas incorporando el feedback real de devs, ahora que la estructura de tabs quedó alineada con la referencia de Figma Make. La sesión de hoy dejó las tres fuentes de referencia sincronizadas; el trabajo que sigue es tomar los casos/feedback pendientes y decidir dónde encajan dentro de esos 5 tabs (o si requieren una nueva unidad de trabajo).

## Estado actual

Hay **tres versiones vivas** del portal, todas corriendo en local durante la sesión:

1. **Mock canónico ITDS** — `<workspace>/VernoVentures/mock`, `http://localhost:5173`. Es la base canónica: tiene todos los componentes del IT Design System de Cencosud y sigue los lineamientos visuales. Es el destino final de cualquier iteración validada.
2. **Iteración local (esta)** — `/Users/coderslab/Documents/MI Local SM/portal-capacidades-agenticas`, `http://localhost:5175` (`npm run dev`). Es donde se itera antes de pasar algo al mock canónico. Stack: Vite + React + Ant Design + MUI + Radix + Tailwind, mucho más avanzado en profundidad de interacción que el mock canónico.
3. **Figma Make (referencia de diseño)** — `https://www.figma.com/make/XndeXhlikpGvvOVeqBNVwj/Capacidades-Agénticas` (requiere sesión de Figma del usuario, cuenta `edo.prieto92@gmail.com`). Ahí viven las decisiones de interacción/estilo más recientes tomadas con la persona de diseño (hasta Version 66 del historial de chat de Figma Make).

Ver [[../../Cencosud/Applied IA/Portal de Capacidades/00 - Portal de Capacidades]] y las notas `01`–`04` de esa carpeta para el contexto completo del proyecto (inventario de pantallas, arquitectura, decisiones/pendientes, y la referencia de interacciones extraída de Figma Make).

## Trabajo realizado

1. Se auditó el historial completo de Figma Make (v26–v66, más los documentos de spec "Iteración 2" y "Iteración 3" pegados dentro del chat) y se documentó en [[../../Cencosud/Applied IA/Portal de Capacidades/04 - Referencia Figma Make (interacciones y estilos)]]: estructura de tabs, drawers, estandarización de tablas (columnas sticky, iconos de acción, orden, paginación), sidebar con hover-expand, breadcrumb, y matriz de visibilidad por rol (Admin Negocio / Admin IT).
2. Se comparó la iteración local (5175) contra esa referencia. La iteración local tenía **dos tabs divergentes**: "Flujos y reglas" (policy engine con alcance cadena/tienda/sección/rubro/subrubro) y "Parámetros y datos" (parámetros comerciales + datos disponibles + listas de control) — contenido de una iteración anterior no cubierto por el spec de Figma Make.
3. Por instrucción explícita del usuario, se **reemplazaron esos dos tabs** por **"Reglas de Negocio"** (Políticas + Glosario + Acciones rápidas) y **"Flujos Agénticos"** (tabla de flujos + `FlowConfigDrawer` de 8 secciones), dejando el detalle de capacidad con los mismos 5 tabs que Figma Make: Resumen · Reglas de Negocio · Flujos Agénticos · Solicitudes · Observabilidad.
   - Dato relevante: el código de "Flujos Agénticos" **ya existía completo** en el archivo (`safeActiveTab === 'agentic'`, con tabla + `FlowConfigDrawer` ya wireado) pero estaba huérfano — nunca estuvo en `ALL_TABS`. Solo se reconectó.
   - "Reglas de Negocio" también reutilizó piezas ya existentes pero desconectadas: `rulesData`, `glossaryData`, `quickActionsData`, `RuleModal`, `PolicyDetailDrawer`. Se construyó el render de Políticas (cards con toggle + Ver detalle/Editar/Eliminar), Glosario y Acciones rápidas (tablas con columnas sticky, orden y paginación, siguiendo el patrón ya establecido en el resto de la app).
   - Se ajustó la visibilidad por rol: "Flujos Agénticos" pasó a ser exclusivo de Admin IT (antes lo veían ambos roles), acorde a la matriz documentada en la nota 04.
4. Se archivó como documentación el código retirado ("Flujos y reglas" / "Parámetros y datos": datos, tipos, los tres componentes de drawer `BusinessFlowDrawer`/`NewBusinessFlowDrawer`/`BusinessParameterDrawer`, y sus puntos de conexión) en `docs/iteracion-deprecada-flujos-y-reglas-parametros-y-datos.md` dentro del propio proyecto, con el código completo y una nota de dónde podría encajar si se retoma (ej. como parámetros por flujo dentro de "Flujos Agénticos" en vez de un tab propio).
5. Se limpió el código muerto correspondiente del componente activo (`CapabilityDetail.tsx`) y se verificó en navegador que ambos tabs renderizan y funcionan (Políticas, Glosario, Acciones rápidas, tabla de Flujos Agénticos y su drawer).
6. Se inicializó **un repositorio Git propio para este proyecto** (antes no tenía — el único `.git` detectado estaba anclado accidentalmente en el home del usuario, `/Users/coderslab`, mezclando `.ssh`, `.bash_history`, `.npmrc`, etc. con cualquier commit). Se creó `.gitignore` (`node_modules/`, `dist/`, `.DS_Store`) y se hizo el commit inicial con todo el estado del proyecto. **El repo de home sigue existiendo y sin tocar** — si Codex trabaja desde otra máquina/sesión, confirmar que corre `git` dentro de `portal-capacidades-agenticas/` y no en el home antes de cualquier commit.

## Archivos modificados

- `portal-capacidades-agenticas/src/app/screens/CapabilityDetail.tsx` — reemplazo de tabs (ver arriba).
- `portal-capacidades-agenticas/docs/iteracion-deprecada-flujos-y-reglas-parametros-y-datos.md` — nuevo, archivo del código retirado.
- `portal-capacidades-agenticas/.gitignore` — nuevo.
- `portal-capacidades-agenticas/.git/` — nuevo (`git init` local al proyecto, commit `3e8526a`).
- Vault: `Edo/Cencosud/Applied IA/Portal de Capacidades/04 - Referencia Figma Make (interacciones y estilos).md` — nuevo.

## Verificaciones

- `pnpm dev` / `npm run dev` corriendo sin errores de compilación (HMR limpio tras cada cambio).
- Verificación visual en navegador (Chrome vía automatización) de ambos tabs nuevos: Políticas con toggle/Ver detalle/Editar/Eliminar, Glosario y Acciones rápidas con paginación, tabla de Flujos Agénticos y apertura del `FlowConfigDrawer` con sus secciones.
- `grep` de todos los identificadores del código retirado (`businessParameters`, `businessConfigTab`, `selectedBusinessFlow`, `BusinessFlowDrawer`, etc.) confirma cero referencias colgantes.
- No se corrió `tsc`/`oxlint` explícitamente esta sesión — recomendable correrlos antes de seguir iterando (`pnpm exec tsc -b` no existe en este proyecto, es `npm run build` que incluye `tsc -b && vite build`; lint es `npm run lint` → `oxlint`).

## Decisiones

- La estructura de 5 tabs de Figma Make (Resumen · Reglas de Negocio · Flujos Agénticos · Solicitudes · Observabilidad) es la que se sigue en el Detalle de Capacidad, por instrucción explícita del usuario — no la variante "Flujos y reglas / Parámetros y datos" que había tomado esta iteración local.
- El "policy engine con alcance" (parámetros/flujos con dimensión cadena/tienda/sección/rubro/subrubro) queda archivado, no descartado conceptualmente — es una idea de producto real que no tiene lugar claro en el spec actual de 5 tabs.
- `VernoVentures/mock` (ITDS) sigue siendo la base canónica final; esta iteración local es terreno de pruebas antes de portar cambios validados ahí.

## Pendientes

**Esta es la unidad de trabajo principal que queda abierta**: el usuario quiere iterar el Detalle de Capacidad incorporando **feedback y cambios reales de los devs** — feedback que aún no fue enumerado en esta sesión. Antes de escribir código, la próxima sesión (Claude o Codex) debería:

1. Pedirle al usuario el listado concreto de feedback/casos de dev pendientes (no asumir cuáles son).
2. Para cada caso, decidir en qué tab de los 5 encaja (Resumen / Reglas de Negocio / Flujos Agénticos / Solicitudes / Observabilidad) o si requiere una nueva sección — siguiendo el principio rector de Figma Make: nunca exponer terminología de IA (prompt, embeddings, model, vector DB) en la superficie de negocio.
3. Mantener el patrón de interacción ya establecido: todo detalle se abre en drawer (nunca modal ni fila expandible), tablas con columna sticky + iconos de acción uniformes (Eye/Edit/Trash/Toggle con tooltip) + orden + paginación de 5 filas.
4. Una vez validado en la iteración local, portar el cambio al mock canónico ITDS (`VernoVentures/mock`) para que use los componentes del Design System real.

Pendientes técnicos menores (no bloqueantes):
- Hay dos archivos sueltos que parecen duplicados de Finder — `src/app/components/FlowConfigDrawer 2.tsx` y `src/app/screens/CapabilityDetail 2.tsx` — quedaron committeados tal cual porque no se confirmó con el usuario si son basura o backups intencionales. Confirmar y limpiar si son basura.
- No hay remoto Git configurado para `portal-capacidades-agenticas` todavía — evaluar si conviene un repo propio en GitHub/similar o integrarlo a un monorepo existente.

## Bloqueos y riesgos

- El repo Git de home (`~/.git`, root en `/Users/coderslab`) sigue existiendo. Si alguien corre `git add -A` / `git commit` estando parado en el home (en vez de dentro de un subproyecto con su propio `.git`), puede terminar commiteando `.ssh`, `.bash_history`, `.npmrc`, etc. No se investigó ni se tocó ese repo esta sesión — quedó fuera de alcance, solo se aisló este proyecto de él.
- No hay acceso vía MCP al archivo de Figma (solo al sitio publicado/Figma Make vía navegador con sesión del usuario) — cualquier consulta futura al historial de Figma Make requiere que el usuario tenga sesión iniciada en esa pestaña de Chrome.

## Próxima acción exacta

Preguntarle al usuario cuáles son los casos/feedback de dev concretos que quiere incorporar al Detalle de Capacidad, y trabajarlos uno por uno sobre `http://localhost:5175` (o el puerto que Vite asigne), tab por tab, siguiendo los patrones de interacción de [[../../Cencosud/Applied IA/Portal de Capacidades/04 - Referencia Figma Make (interacciones y estilos)]].

## Fuentes

- [[../../Cencosud/Applied IA/Portal de Capacidades/00 - Portal de Capacidades]]
- [[../../Cencosud/Applied IA/Portal de Capacidades/01 - Inventario de pantallas]]
- [[../../Cencosud/Applied IA/Portal de Capacidades/03 - Decisiones y pendientes]]
- [[../../Cencosud/Applied IA/Portal de Capacidades/04 - Referencia Figma Make (interacciones y estilos)]]
- `portal-capacidades-agenticas/docs/iteracion-deprecada-flujos-y-reglas-parametros-y-datos.md`
- Figma Make: `https://www.figma.com/make/XndeXhlikpGvvOVeqBNVwj/Capacidades-Agénticas`
- Sitio publicado de referencia original: `https://opal-mono-90780377.figma.site/`
