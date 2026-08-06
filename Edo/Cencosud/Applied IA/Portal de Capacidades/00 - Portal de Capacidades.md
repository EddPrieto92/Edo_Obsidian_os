---
tipo: moc
estado: activo
actualizado: 2026-08-06
organizacion: Cencosud
programa: Applied IA
proyecto: Portal de Capacidades Agénticas
fuentes:
  - solicitud-del-usuario-2026-08-04
  - planner-appliedai-2026-08-05
  - solicitud-del-usuario-2026-08-06
---

# Portal de Capacidades Agénticas — Cencosud

## Qué es

Prototipo navegable de frontend puro (sin backend real) de "Capacidades Agénticas", un portal interno de Cencosud para configurar y monitorear capacidades de negocio (agentes) desplegadas en distintos productos (Mi Local, SIP/PMO).

## Fuente de referencia

- Figma Site: `https://opal-mono-90780377.figma.site/`
- Título interno del prototipo original: "Capacidades Agenticas (Copy)"
- Exportado originalmente vía Figma Make (`package.json` name `@figma/my-make-file`).

## Repositorio canónico de iteración local

- Ruta local: `<workspace>/MI Local SM/portal-capacidades-agenticas`
- Repo git propio (`main`), sin remoto configurado; commits recientes incluyen login simulado, capa de Productos y sidebar jerárquico (`d543e1f`).
- Comandos: `npm run dev` (sirve en `http://localhost:5173` o el siguiente puerto libre; usar `--strictPort` si se quiere fijar puerto), `npm run build`.
- **Esta es la única versión que debe usarse para iterar localmente.** No confundir ni asociar con `VernoVentures/mock`.

## VernoVentures/mock — rol y estado

- `VernoVentures/mock` (dentro de `EduVaultMacCoders`) es un **proyecto distinto** en identidad de vault; jamás debe usarse como referencia o sinónimo del Portal de Capacidades.
- Su único rol es recibir el port final de este portal, **después** de validar la navegación e iteraciones en `portal-capacidades-agenticas`. No debe tratarse como versión de trabajo mientras tanto.

## Estado

Ver [[01 - Inventario de pantallas]] para el detalle pantalla por pantalla y [[02 - Arquitectura y stack]] para las decisiones técnicas. Pendientes en [[03 - Decisiones y pendientes]].

Las 5 pantallas del inventario original ya están portadas:

- Resumen (dashboard)
- Capacidades (listado + filtros)
- Detalle de Capacidad (5 tabs)
- Administración (usuarios, roles, permisos)
- Configuración (perfil)

Iteración 2026-08-06 (commit `d543e1f` en `portal-capacidades-agenticas`): login simulado, capa de Productos (árbol Producto → Capacidad en el sidebar), rutas `/products`, `/products/:productId`, `/products/:productId/capabilities/:capabilityId`, alias `/capabilities/:id` conservado. Ver handoff `2026-08-06 - codex a claude - portal-capacidades-agenticas - iterar-login-productos-navegacion.md`.

## Estado operativo observado

El tablero `AppliedAI de Software Engineering` confirma el frente `Portal Agentes` activo al 2026-08-05. Hay trabajo pendiente o en curso sobre prueba de agente de asistencia, frontend de capacidades agénticas, Agent Core, árbol de agentes y Design Capabilities. Ver [[../../03 - Tareas en proceso]].

## Fuentes

- Sesión de trabajo del 2026-08-04 (scaffold + portado de las 5 pantallas).
