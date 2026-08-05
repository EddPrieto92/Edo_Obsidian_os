---
tipo: moc
estado: activo
actualizado: 2026-08-04
fuente: solicitud-del-usuario-2026-08-04
---

# Portal de Capacidades — Cencosud

## Qué es

Mock/prototipo navegable de frontend puro (sin backend real) de "Capacidades Agénticas", un portal interno de Cencosud para configurar y monitorear capacidades de negocio (agentes) desplegadas en distintos productos (Mi Local, SIP/PMO).

## Fuente de referencia

- Figma Site: `https://opal-mono-90780377.figma.site/`
- Título interno del prototipo original: "Capacidades Agenticas (Copy)"
- Portado con la skill `mock-frontend` (proceso guiado de 5 pasos + arquitectura de referencia).

## Repositorio del mock

- Ruta local: `/Users/coderslab/Documents/EduVaultMacCoders/VernoVentures/mock`
- **No vive dentro de este repo (`Edo_Obsidian_os-1`)** — es un proyecto Vite + React independiente, sin remoto Git configurado todavía.
- Comandos: `pnpm dev` (sirve en `http://localhost:5173` o el siguiente puerto libre), `pnpm exec tsc -b`, `pnpm exec oxlint src`, `pnpm run build`.

## Estado

Ver [[01 - Inventario de pantallas]] para el detalle pantalla por pantalla y [[02 - Arquitectura y stack]] para las decisiones técnicas. Pendientes en [[03 - Decisiones y pendientes]].

Las 5 pantallas del inventario original ya están portadas:

- Resumen (dashboard)
- Capacidades (listado + filtros)
- Detalle de Capacidad (5 tabs)
- Administración (usuarios, roles, permisos)
- Configuración (perfil)

## Fuentes

- Sesión de trabajo del 2026-08-04 (scaffold + portado de las 5 pantallas).
