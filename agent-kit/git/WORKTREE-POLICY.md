# Política de ramas y worktrees

## Nombres

- Codex: `codex/<proyecto>-<tarea>`.
- Claude: `claude/<proyecto>-<tarea>`.
- Integración: rama principal definida por el repositorio.

## Reglas

1. Un agente y una tarea por worktree.
2. No abrir el worktree del otro agente para editar.
3. No asignar los mismos archivos a ambos agentes simultáneamente.
4. Transferir con handoff y commit base verificados.
5. Revisar y fusionar desde el repositorio principal.
6. No crear worktrees dentro del directorio del repositorio.

## Creación de referencia

Elegir primero una carpeta externa autorizada. Después usar:

```sh
git worktree add <carpeta-externa>/codex -b codex/<proyecto>-<tarea>
git worktree add <carpeta-externa>/claude -b claude/<proyecto>-<tarea>
```

Las rutas concretas no se incluyen porque aún no han sido verificadas.
