---
tipo: adr
estado: aceptado
fecha: 2026-08-03
fuentes:
  - solicitud-del-usuario-2026-08-03
  - drive-audit-2026-08-03
  - git-audit-2026-08-03
---

# ADR-0002 — Main canónico y arranque multi-equipo

## Contexto

El trabajo debe continuar desde Mac Coders, Mac Air Edu y Asus Rog. Drive muestra dos árboles del vault, mientras Git conserva una sola rama remota `main` y no registra todavía cada máquina por separado.

## Decisión

- Usar `origin/main` como versión publicada canónica.
- Representar las máquinas como puntos de acceso en `Machines/registry.yml`, no como ramas permanentes.
- Conservar la identidad local en `.edo-machine`, fuera de Git.
- Comprobar el remoto de forma explícita al iniciar.
- Permitir actualización automática únicamente como fast-forward, con `main` limpio y sin commits locales.
- Detenerse ante cambios, divergencia o identidad no configurada.
- Mantener Drive como réplica, fuente y adjuntos; no como árbitro de commits.

## Consecuencias

- El mismo proyecto aparece bajo cada equipo sin crear tres historias.
- El arranque es repetible desde VS Code y terminal.
- Asus Rog permanece pendiente hasta validarse desde Windows.
- Las rutas privadas y los identificadores de Drive no se publican.

## Estado

Aceptado para el kit `0.2.0`.
