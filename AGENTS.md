# Instrucciones para Codex — Edo

## Alcance

- Este repositorio es un vault Markdown agnóstico a herramientas.
- Tratar Git como historial autoritativo y Drive como fuente/sincronización externa.
- Basar todo contenido factual en archivos, commits, enlaces o instrucciones explícitas del usuario. No inventar contexto.

## Inicio de cada tarea

1. Leer `Edo/IA/Agentes/00 - Inicio rápido.md`.
2. Leer `Edo/IA/Agentes/01 - Estado compartido.md` y la nota del proyecto relevante.
3. Revisar `git status --short --branch` antes de editar.
4. Cargar únicamente las fuentes necesarias para la tarea.

## Forma de trabajo

- Usar una rama o worktree exclusivo por agente. No editar simultáneamente los mismos archivos desde Codex y Claude.
- Mantener instrucciones permanentes breves; mover procedimientos reutilizables a skills.
- Actualizar un handoff cuando cambie el agente propietario o la sesión termine con trabajo pendiente.
- Registrar decisiones durables como ADR, no dentro de transcripciones.
- No modificar credenciales, `.env`, historiales privados ni configuración personal sin autorización explícita.
- No hacer commit, tag, push, merge ni publicar archivos salvo que el usuario lo solicite.

## Validación

- Ejecutar `bash agent-kit/scripts/validate-kit.sh .` cuando se modifique la configuración de agentes.
- Revisar el diff y confirmar que no se incluyan secretos, cachés, binarios o rutas personales innecesarias.
- Informar archivos modificados, validaciones y cualquier decisión pendiente.
