---
tipo: recurso
estado: activo
organizacion: Cencosud
actualizado: 2026-08-05
---

# Skills y herramientas — Cencosud

## Skills disponibles para Claude Code

| Skill | Uso | Dependencia |
|---|---|---|
| `mock-frontend` | Crear o portar mocks React + Vite sin backend; fue usada en el Portal de Capacidades | Referencia visual o requisitos |
| `itds-code-forge` | Construir pantallas y flujos React + CSS con componentes IT DS | Penpot MCP + archivo IT DS |
| `itds-board-composer` | Componer boards y flujos en Penpot usando IT DS | Penpot MCP + archivo IT DS |

Las tres están versionadas en `.claude/skills/` de este proyecto. Al integrar esta rama, Claude Code puede detectarlas desde la raíz del repositorio.

## Invocación desde terminal

```bash
cd /ruta/al/vault/Edo_Obsidian_os-1
claude
```

Luego se pueden activar explícitamente:

```text
Usa mock-frontend para portar esta referencia a un mock React + Vite sin backend.
Usa itds-code-forge para construir el flujo de Baja de Precio con componentes IT DS.
Usa itds-board-composer para armar en Penpot el board del Portal de Capacidades.
```

Si la versión de Claude Code expone comandos de skill, usar `/mock-frontend`, `/itds-code-forge` o `/itds-board-composer` y añadir la petición.

## Paquete portable

Existe un paquete fuera del repo en:

`<workspace>/ITDS-skills-for-Claude/`

Incluye las tres skills y un README de instalación. Para una instalación global:

```bash
mkdir -p ~/.claude/skills
cp -R /ruta/al/paquete/ITDS-skills-for-Claude/itds-code-forge ~/.claude/skills/
cp -R /ruta/al/paquete/ITDS-skills-for-Claude/itds-board-composer ~/.claude/skills/
cp -R /ruta/al/paquete/ITDS-skills-for-Claude/mock-frontend ~/.claude/skills/
```

La instalación global modifica el entorno personal de Claude; la copia por proyecto ya quedó preparada en esta rama.

## Regla de uso

- `mock-frontend` para explorar o portar una referencia sin backend.
- `itds-code-forge` cuando la entrega debe respetar fielmente IT DS en código.
- `itds-board-composer` cuando el resultado esperado vive en Penpot.
- Penpot representa flujos, componentes y arquitectura visual; Markdown conserva decisiones, estado y trazabilidad.
- Nunca guardar tokens de Penpot u otras credenciales en el repositorio.
