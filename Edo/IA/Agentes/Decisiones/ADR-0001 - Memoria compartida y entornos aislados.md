---
tipo: adr
estado: aceptado
fecha: 2026-08-03
fuente: solicitud-del-usuario-2026-08-03
---

# ADR-0001 — Memoria compartida y entornos aislados

## Contexto

Codex y Claude deben continuar trabajo entre sesiones sin perder coherencia ni editar simultáneamente el mismo entorno.

## Decisión

- Mantener una memoria neutral en Markdown dentro del vault.
- Usar `AGENTS.md` para Codex y `CLAUDE.md` para Claude como adaptadores breves.
- Mantener una sola historia Git por proyecto.
- Separar el trabajo mediante ramas o worktrees por agente.
- Transferir el estado mediante handoffs estructurados.
- Usar Drive para fuentes, adjuntos y sincronización externa, sin convertirlo en una segunda historia de código.

## Consecuencias

- Menor duplicación de contexto y menor riesgo de divergencia.
- Necesidad de mantener actualizados los handoffs y el estado compartido.
- Los worktrees físicos requieren una ubicación externa al repositorio.

## Estado

Aceptado para la configuración inicial.
