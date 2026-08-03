# Arranque y sincronización multi-equipo

## Objetivo

Abrir el mismo sistema desde Mac Coders, Mac Air Edu o Asus Rog con una versión Git verificable y sin perder cambios locales.

## Orden de arranque

1. Identificar el equipo mediante `.edo-machine`.
2. Mostrar rama, commit y estado del árbol local.
3. Consultar el remoto solo cuando el usuario lo solicite.
4. Actualizar únicamente si:
   - la rama es `main`;
   - no hay cambios locales;
   - no existen commits locales por publicar;
   - `origin/main` puede aplicarse con fast-forward.
5. Ejecutar la validación del kit.
6. Abrir el panel de VS Code.

## Acceso desde VS Code

Abrir `workspaces/edu-control.code-workspace` y usar `Terminal → Run Task`:

- `Edo: Inicio seguro`;
- `Edo: Estado local`;
- `Edo: Comprobar versión remota`;
- `Edo: Actualizar desde main`;
- `Edo: Validar configuración`.

## Terminal

macOS:

    bash agent-kit/scripts/edo-start.sh

Windows:

    powershell -ExecutionPolicy Bypass -File agent-kit/scripts/edo-start.ps1

Ambos scripts aceptan `status`, `check`, `update`, `validate` y `open`.

## Primera instalación por equipo

Crear un archivo local `.edo-machine` con exactamente un identificador:

- `mac-coders`;
- `mac-air-edu`;
- `asus-rog`.

El archivo no se publica en Git. Las rutas absolutas y los identificadores privados de Drive se guardan en `agent-kit/config/machine.local.json`, basado en el ejemplo y también excluido de Git.

## Política de conflictos

- El script nunca hace reset, rebase, merge automático ni limpieza.
- Un árbol con cambios se conserva sin alteraciones.
- Una divergencia se detiene y requiere revisión manual.
- Drive no se usa para decidir qué versión Git gana.
- Codex y Claude mantienen ramas o worktrees separados cuando trabajan simultáneamente.

## Estado de los equipos al 2026-08-03

| Equipo | Evidencia | Estado |
|---|---|---|
| Mac Coders | equipo local MacBook Air + raíz Drive | verificado |
| Mac Air Edu | raíz Drive | pendiente de validación local |
| Asus Rog | intención del usuario | pendiente de onboarding |
