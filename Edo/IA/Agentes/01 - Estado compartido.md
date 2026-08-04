---
tipo: estado
estado: activo
actualizado: 2026-08-03
fuentes:
  - solicitud-del-usuario-2026-08-03
  - git-local-2026-08-03
---

# Estado compartido

## Estado verificado

- Vault local: `Edo_Obsidian_os-1`.
- Rama observada al iniciar esta iteración: `main`.
- Remoto Git: `https://github.com/EddPrieto92/Edo_Obsidian_os.git`.
- Commit base observado: `d4f82a1` (`chore: track empty Edo folders`).
- El árbol de trabajo estaba limpio antes de generar esta configuración.
- El vault ya definía Markdown como formato, Git como histórico, Drive como sincronización y Codex como ejecutor de cambios.

## Configuración en esta iteración

- Instrucciones separadas para Codex y Claude.
- Memoria compartida dentro de `Edo/IA/Agentes/`.
- Skill portable `dual-llm-continuity`.
- Workspaces separados de VS Code.
- Plantillas de tarea, handoff, ADR y fuente.
- Exportación ZIP con allowlist y verificación de secretos.
- Handoff Codex → Claude preparado y marcado como `listo`.
- Equipo local identificado como `Mac Coders` (MacBook Air de Coderslab).
- Dos árboles de Drive verificados: `Mi Mac` y `Mi MacBook Air`.
- Panel lógico `Edu → Equipo → Proyecto` agregado en `Machines/`.
- Arranque seguro agregado para macOS, Windows y tareas de VS Code.
- Portal de Capacidades planificado como MVP read-only de tres columnas.
- Equipo `Asus Rog` conectado y verificado (local + Drive) el 2026-08-03.
- `validate-kit.ps1` corregido: si `rg` no está en el PATH nativo, omite el escaneo de secretos con un aviso en vez de fallar (paridad con `validate-kit.sh`).
- Handoff Codex → Claude del 2026-08-03 aceptado y cerrado por Claude, desde `Asus Rog`; transferencia piloto entre agentes confirmada como operable.

## Pendientes de verificación

- Onboarding local de `Mac Air Edu`.
- Instalar `ripgrep` en el PATH nativo de PowerShell en `Asus Rog` para que `validate-kit.ps1` incluya el escaneo de secretos (opcional: siempre se puede validar desde git-bash).
- Inventario de repositorios de proyectos adicionales.
- Repositorio, Design System y schemas reales del Portal de Capacidades.
- Ubicación autorizada para crear worktrees físicos fuera del vault.

## Riesgos vigentes

- Trabajar con ambos agentes sobre la misma rama puede generar conflictos.
- Las dos copias observadas en Drive pueden confundirse con proyectos distintos si no se conserva la identidad de máquina.
- No debe marcarse Asus Rog como conectado sin evidencia desde ese equipo.
- El historial anterior a este vault no está disponible localmente y no debe inferirse.
