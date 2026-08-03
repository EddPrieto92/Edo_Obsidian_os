# Instrucciones para Claude — Edo

## Alcance

- Este repositorio es un vault Markdown agnóstico a herramientas.
- Git conserva el historial; Drive aporta fuentes, adjuntos y sincronización externa.
- Usar solamente contexto respaldado por archivos, commits, enlaces o instrucciones explícitas del usuario.

## Inicio de cada tarea

1. Leer `Edo/IA/Agentes/00 - Inicio rápido.md`.
2. Leer `Edo/IA/Agentes/01 - Estado compartido.md` y la nota del proyecto relevante.
3. Revisar el estado de Git antes de editar.
4. Abrir solo las fuentes necesarias para no inflar el contexto.

## Forma de trabajo

- Trabajar en una rama o worktree exclusivo de Claude.
- No editar archivos que estén asignados a Codex en un handoff activo.
- Usar las skills para procedimientos extensos y mantener este archivo breve.
- Crear o actualizar un handoff al transferir trabajo a Codex.
- Registrar decisiones durables como ADR y mantener las transcripciones fuera del contexto permanente.
- No tocar credenciales, `.env`, historiales privados ni configuración personal sin autorización explícita.
- No hacer commit, tag, push, merge ni publicar archivos salvo solicitud explícita.

## Validación

- Ejecutar `bash agent-kit/scripts/validate-kit.sh .` después de modificar la configuración compartida.
- Revisar el diff y confirmar que el cambio no contiene secretos, cachés, binarios ni rutas personales innecesarias.
- Entregar un resumen con archivos modificados, validaciones y próximos pasos.
