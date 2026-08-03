# Dual-LLM Continuity Kit

Kit portable para continuar proyectos entre Codex y Claude desde VS Code, usando Obsidian como interfaz de memoria, Git como histórico y Drive como fuente externa.

## Primer uso

1. Extraer el ZIP dentro de una carpeta de proyecto o repositorio nuevo.
2. Revisar `AGENTS.md`, `CLAUDE.md` y `Edo/IA/Agentes/01 - Estado compartido.md`.
3. Crear `.edo-machine` con el identificador del equipo definido en `Machines/registry.yml`.
4. Sustituir rutas locales y registrar el remoto Git del proyecto.
5. Abrir `workspaces/edu-control.code-workspace`.
6. Ejecutar `bash agent-kit/scripts/edo-start.sh` o la variante PowerShell.
7. Crear ramas o worktrees separados antes de trabajar con ambos agentes.

## Autoridad de información

- Git: historia de código y Markdown.
- Obsidian: navegación y edición de la memoria Markdown.
- Drive: fuentes, adjuntos y entregables; su ruta debe verificarse en cada equipo.
- Handoffs: transferencia operativa entre agentes.

## Equipos

- `Machines/` contiene el árbol lógico visible en VS Code y en el futuro portal.
- `.edo-machine` identifica el equipo local y no se publica.
- El arranque consulta la versión de forma explícita y solo permite actualizar `main` mediante fast-forward.
- Drive puede replicar archivos, pero no sustituye la historia de Git.

## Privacidad

El exportador usa una allowlist. No incluye el repositorio completo, `.git`, `.env`, `.edo-machine`, rutas locales, credenciales, cachés, transcripciones ni archivos arbitrarios de Drive.
