# Reglas - Push Pull Histórico

## Propósito

Registrar reglas operativas para histórico, sincronización y cambios sobre archivos.

> Nota: el contenido debe derivar de fuentes reales, no de inferencias ni contenido inventado.

## Push

- Hacer push únicamente cuando el usuario lo solicite o apruebe explícitamente.
- Revisar diff, validaciones y archivos incluidos antes de publicar.
- No publicar secretos, `.env`, cachés, logs privados ni artefactos regenerables.

## Pull

- Revisar el estado local antes de actualizar desde el remoto.
- No sobrescribir cambios locales no confirmados.
- En el arranque multi-equipo, actualizar únicamente `main` mediante fast-forward.
- Detenerse si hay cambios locales, commits sin publicar o divergencia.
- Resolver conflictos por significado y fuente, no eligiendo automáticamente una versión completa.

## Histórico

- Git es la historia autoritativa de código y Markdown.
- Registrar cambios conceptuales en [[Archivo/Histórico de cambios]].
- Registrar decisiones durables como ADR.
- Mantener Drive como fuente o sincronización, no como historia paralela del código.

## Conflictos

- Codex y Claude deben usar ramas o worktrees separados.
- Una tarea y archivo tienen un agente propietario a la vez.
- Transferir trabajo mediante un handoff con commit base, rama, estado y próxima acción.
- Drive replica y aporta fuentes; no decide cuál commit reemplaza a otro.
