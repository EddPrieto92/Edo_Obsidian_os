# Edo

## Propósito

Edo es un segundo cerebro en Markdown para organizar información, proyectos, ideas y archivos de forma agnóstica a herramientas.

> Nota: el contenido debe derivar de fuentes reales, no de inferencias ni contenido inventado.

## Principios

Edo no depende de GPT, Claude, Gemini ni Obsidian.

Obsidian es solo una interfaz para leer y editar archivos Markdown.

Git es el histórico.

Google Drive es sincronización.

Codex ejecuta cambios sobre archivos.

## Estructura

- `Cencosud/`: contexto corporativo organizado por programa, proyecto, tareas, fuentes y decisiones.
- `IA/Agentes/`: memoria operativa compartida para Codex y Claude.
- `Proyectos/`: registros confirmados de proyectos activos, pausados y archivados.
- `Archivo/`: decisiones, aprendizajes, timeline e histórico.
- `Recursos/`: plantillas, prompts, frameworks, referencias y herramientas.
- `../Machines/`: panel lógico de equipos y proyectos para VS Code y el portal.

## Uso

1. Entrar por [[MOC - Edu]].
2. Para trabajo Cencosud, abrir [[Cencosud/README]] y luego [[Cencosud/01 - Estado y prioridades]].
3. Para trabajo con agentes, abrir [[IA/Agentes/00 - Inicio rápido]].
4. Mantener el estado vigente en [[IA/Agentes/01 - Estado compartido]].
5. Registrar fuentes y decisiones antes de convertir inferencias en contexto permanente.
6. Iniciar cada equipo con `workspaces/edu-control.code-workspace`.

## Mantenimiento

- Usar Git para revisar y conservar cambios.
- Mantener Drive como fuente o sincronización externa, evitando duplicar la historia de código.
- No almacenar secretos, credenciales ni cachés en el vault.
- Validar el kit de agentes con `bash agent-kit/scripts/validate-kit.sh .`.
