---
tipo: proyecto
estado: activo
actualizado: 2026-08-03
fuentes:
  - agent-kit/MANIFEST.yml
  - Edo/IA/Agentes/01 - Estado compartido.md
  - Edo/IA/Agentes/Handoffs/2026-08-03 - codex a claude - dual-llm-continuity-kit - validar-e-integrar-flujo.md
  - Machines/registry.yml
---

# Dual-LLM Continuity Kit

## Objetivo

Integrar Codex, Claude, Obsidian, VS Code, Git y Drive en un flujo de trabajo coherente y portable entre varios equipos, con memoria compartida en Markdown, historia única en Git y transferencia de tareas mediante handoffs explícitos.

## Estado

- Versión del kit: `0.2.1` (`agent-kit/VERSION`).
- Repositorio: `Edo_Obsidian_os-1` (`EddPrieto92/Edo_Obsidian_os`), rama única `main`.
- Propietario: compartido entre Codex y Claude; sin agente único asignado.
- Handoff piloto Codex → Claude (2026-08-03) aceptado y cerrado por Claude desde el equipo `Asus Rog`. Confirma que el flujo compartido es operable desde un segundo agente y una segunda máquina.

## Componentes

- Memoria compartida en `Edo/IA/Agentes/` (inicio rápido, estado compartido, registro de proyectos, enrutamiento de modelos, política de contexto, acuerdos, integraciones, ADR, handoffs, plantillas).
- Skill portable `dual-llm-continuity`, con copias en `agent-kit/skills/`, `agent-kit/adapters/claude/.claude/skills/` y `agent-kit/adapters/codex/.codex/skills/`.
- Scripts de arranque y validación: `agent-kit/scripts/edo-start.sh` y `.ps1`, `agent-kit/scripts/validate-kit.sh` y `.ps1`, `agent-kit/scripts/create-handoff.sh`, `agent-kit/scripts/build-export.sh`.
- Workspaces separados de VS Code: `edu-control`, `edo-codex`, `edo-claude`.
- Panel lógico de equipos y proyectos en `Machines/` (`registry.yml` + una nota por equipo).
- Exportación ZIP portable con allowlist (`agent-kit/MANIFEST.yml`).

## Equipos conectados

| Equipo | Plataforma | Verificación |
|---|---|---|
| Mac Coders | macOS | local-and-drive |
| Mac Air Edu | macOS | drive-only |
| Asus Rog | Windows | local-and-drive (2026-08-03) |

Fuente: [[../../Machines/registry.yml|Machines/registry.yml]].

## Próximas acciones

- Completar onboarding local de `Mac Air Edu` (hoy solo verificado por Drive).
- Instalar `ripgrep` en el PATH nativo de PowerShell en `Asus Rog`, o mantener como aceptado el uso de git-bash para la validación completa.
- Definir un versionado/release formal del kit (más allá del archivo `agent-kit/VERSION`).
- Definir la ubicación autorizada para worktrees físicos fuera del vault, antes de que ambos agentes trabajen en paralelo sobre la misma tarea.

## Riesgos vigentes

- Trabajar con ambos agentes sobre la misma rama puede generar conflictos si no se usan ramas o worktrees separados.
- No debe marcarse un equipo como conectado sin evidencia local verificada desde ese equipo.

## Fuentes

- [[../IA/Agentes/01 - Estado compartido]]
- [[../IA/Agentes/02 - Registro de proyectos]]
- [[../IA/Agentes/Handoffs/2026-08-03 - codex a claude - dual-llm-continuity-kit - validar-e-integrar-flujo]]
