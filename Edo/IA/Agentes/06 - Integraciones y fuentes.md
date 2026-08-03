---
tipo: registro
estado: activo
actualizado: 2026-08-03
fuentes:
  - git-local-2026-08-03
  - solicitud-del-usuario-2026-08-03
---

# Integraciones y fuentes

## Git

- Repositorio verificado: `Edo_Obsidian_os-1`.
- Remoto verificado: `https://github.com/EddPrieto92/Edo_Obsidian_os.git`.
- Autoridad: historial de código y Markdown.
- Regla: no hacer push, merge o tag sin solicitud explícita.

## Obsidian

- Vault verificado: `Edo_Obsidian_os-1`.
- Función: navegación y edición humana del Markdown.
- La ruta absoluta se configura localmente y no se publica.

## Google Drive

- Función: réplica, fuentes, adjuntos y entregables.
- Árboles verificados: `Mi Mac/EduVaultMacCoders` y `Mi MacBook Air/EduVaultMacCoders`.
- Los identificadores y rutas locales de Drive permanecen fuera de Git.
- Regla: enlazar fuentes de Drive; no duplicar automáticamente archivos pesados dentro del ZIP.

## VS Code

- Workspaces generados en `workspaces/`, incluido el panel `edu-control.code-workspace`.
- Tareas de inicio y versión disponibles en `.vscode/tasks.json`.
- Cada archivo oculta el adaptador del otro agente para reducir errores visuales.
- Los worktrees físicos permanecen pendientes hasta definir una carpeta autorizada fuera del vault.

## Registro mínimo de fuente

Usar [[Plantillas/Plantilla - Registro de fuente]] para incorporar documentos, conversaciones, commits o enlaces externos.
