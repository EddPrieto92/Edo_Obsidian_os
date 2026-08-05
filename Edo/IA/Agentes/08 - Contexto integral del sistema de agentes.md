---
tipo: contexto-agentes
estado: activo
actualizado: 2026-08-04
fuentes:
  - Edo/IA/Agentes/00 - Inicio rápido.md
  - Edo/IA/Agentes/01 - Estado compartido.md
  - Edo/IA/Agentes/02 - Registro de proyectos.md
  - Edo/IA/Agentes/03 - Enrutamiento de modelos.md
  - Edo/IA/Agentes/04 - Acuerdos compartidos.md
  - Edo/IA/Agentes/05 - Política de contexto y tokens.md
  - Edo/IA/Agentes/06 - Integraciones y fuentes.md
  - Edo/IA/Agentes/07 - Memoria histórica maestra.md
  - Edo/IA/Agentes/Decisiones/ADR-0001 - Memoria compartida y entornos aislados.md
  - Edo/IA/Agentes/Decisiones/ADR-0002 - Main canónico y arranque multi-equipo.md
  - Edo/IA/Agentes/Handoffs/2026-08-03 - codex a claude - dual-llm-continuity-kit - validar-e-integrar-flujo.md
  - Edo/Proyectos/Dual-LLM Continuity Kit.md
  - agent-kit/MANIFEST.yml
  - Machines/registry.yml
  - git-local-2026-08-04
---

# Contexto integral del sistema de agentes

## Uso de esta nota

Este es el resumen autocontenido para que Claude o Codex puedan orientarse sin depender del chat anterior. Antes de editar, leer [[00 - Inicio rápido]], [[01 - Estado compartido]] y la nota del proyecto involucrado. Usar las fuentes enlazadas para comprobar un detalle o resolver contradicciones; no interpretar esta síntesis como reemplazo de Git o de las fuentes originales.

## Objetivo del sistema

El proyecto **Dual-LLM Continuity Kit** busca permitir que Codex y Claude continúen trabajo en distintos equipos con una memoria común, compacta y verificable. Edo es el segundo cerebro en Markdown; Obsidian es su interfaz humana; Git es la historia única del código y las notas; Google Drive aporta fuentes, adjuntos y sincronización externa; los handoffs traspasan una tarea entre agentes.

La meta no es conservar todos los chats como contexto activo, sino transformar evidencia útil en notas pequeñas, enlazadas y mantenibles. Las transcripciones permanecen como fuentes archivadas.

## Arquitectura y autoridad

| Capa | Función | Regla de autoridad |
| --- | --- | --- |
| `Edo/IA/Agentes/` | memoria operativa compartida | estado, acuerdos, decisiones y handoffs trazables |
| `Edo/Proyectos/` | estado y documentación de cada proyecto | una nota por proyecto con objetivo y próxima acción |
| `Edo/Archivo/` | timeline, decisiones y aprendizajes | conservar material cerrado o reusable |
| Git / `origin/main` | historia canónica publicada | una sola historia por proyecto |
| Drive | fuentes, adjuntos y réplica externa | nunca árbitro de commits |
| `.edo-machine` y `machine.local.json` | identidad y rutas locales | nunca publicar en Git |

Adaptadores: `AGENTS.md` guía a Codex y `CLAUDE.md` guía a Claude. Ambos deben leer la misma memoria en Edo, pero tienen configuraciones y workspaces separados.

## Decisiones vigentes

1. **ADR-0001 — memoria compartida y entornos aislados.** La memoria neutral vive en Markdown; cada agente usa rama o worktree propio; Git no se duplica; Drive no se usa como segunda historia; las transferencias se formalizan con handoffs.
2. **ADR-0002 — `main` canónico y arranque multi-equipo.** `origin/main` es la versión publicada de referencia. Las máquinas son puntos de acceso, no ramas. Un update solo es válido con `main` limpio y fast-forward; cualquier divergencia se detiene.
3. **Trazabilidad antes que inferencia.** Cada hecho histórico relevante se respalda por archivo, commit, URL o solicitud fechada. Todo lo no respaldado se marca como `inferencia` o `pendiente`.
4. **No publicar por defecto.** Commit, push, merge, tag, exportación o entrega externa requieren una solicitud explícita del usuario.

## Estado verificado al 2026-08-04

- Repositorio: `EddPrieto92/Edo_Obsidian_os`; rama publicada: `main`.
- Último commit observado: `9decac9` — aceptación del piloto Codex → Claude y nota del proyecto del kit.
- El piloto se cerró el 2026-08-03: Claude aceptó el handoff desde `Asus Rog` y confirmó que memoria, skill, scripts y flujo funcionan en un segundo agente y una segunda máquina.
- Kit actual: versión `0.3.0`.
- En esta sesión se añadieron [[07 - Memoria histórica maestra]] y esta nota; por ello debe revisarse el estado de Git real antes de cualquier tarea posterior. No asumir un árbol limpio a partir de este texto.

## Proyectos

| Proyecto | Situación | Próximo movimiento comprobable |
| --- | --- | --- |
| [[../../Proyectos/Dual-LLM Continuity Kit\|Dual-LLM Continuity Kit]] | activo, piloto cerrado, v0.3.0 | onboarding local de Mac Air Edu; validar la versión en cada equipo y definir ruta de worktrees físicos |
| Portal de Capacidades | planificación inicial; sin repo ni Design System verificados | localizar repositorio, schemas y Design System reales antes de implementar |

No incorporar otros proyectos hasta verificar ruta local o remoto Git, rama, comandos de validación, fuentes externas y propiedad de la tarea.

## Equipos

| Identificador | Plataforma | Estado actual |
| --- | --- | --- |
| `mac-coders` | macOS | `local-and-drive` |
| `mac-air-edu` | macOS | `drive-only`; falta onboarding local |
| `asus-rog` | Windows | `local-and-drive`, validado el 2026-08-03 |

La fuente vigente es `Machines/registry.yml`. Documentos de arranque anteriores al cierre del piloto pueden describir a Asus Rog como pendiente; ese dato es histórico y queda superado por la evidencia posterior.

## Rutina obligatoria para comenzar o retomar

1. Leer [[00 - Inicio rápido]], [[01 - Estado compartido]], el proyecto y, si está activo, su handoff.
2. Revisar rama, commit, worktree y cambios existentes; conservar siempre cambios del usuario.
3. Confirmar que existe un solo agente propietario y que los archivos no están asignados en un handoff activo.
4. Cargar solo las fuentes adicionales necesarias.
5. Al terminar, actualizar la nota del proyecto o el estado; crear handoff solo si cambia el agente responsable o queda una transferencia pendiente.

Para iniciar una máquina: leer `.edo-machine`, ejecutar el script de arranque con `status`, usar `check` antes de evaluar actualización y usar `update` solo en un `main` limpio y adelantable por fast-forward. El script no debe hacer reset, rebase, merge automático ni limpieza.

## Handoffs

Un handoff está listo solo si el agente receptor puede continuar sin leer el chat previo. Debe contener: objetivo y criterio de aceptación; estado; archivos modificados; commit base y rama; validaciones con resultados; decisiones; riesgos y bloqueos; una próxima acción exacta; y enlaces a fuentes. Comparar siempre su base contra Git antes de aceptar. Hoy no hay handoffs activos; el único piloto está cerrado.

## Modelos y contexto

- Elegir modelo por complejidad y riesgo: eficiente/low para tareas mecánicas; equilibrado/medium para trabajo normal; modelo principal/high para arquitectura, migraciones, debugging difícil o seguridad; revisión independiente para situaciones críticas.
- Mantener al mismo agente durante una fase coherente y justificar escalamiento complejo o crítico.
- Presupuesto: instrucciones permanentes hasta ~3.000 tokens, paquete de tarea entre ~3.000 y 8.000, resumen histórico hasta ~2.000. Buscar e indexar antes de abrir fuentes extensas.

## Componentes disponibles

- Skill portable: `agent-kit/skills/dual-llm-continuity/`, instalada también en adaptadores de Codex y Claude.
- Scripts: arranque (`edo-start.sh` / `.ps1`), validación (`validate-kit.sh` / `.ps1`), creación de handoff y exportación allowlisted.
- Workspaces VS Code: `edu-control`, `edo-codex` y `edo-claude`.
- Plantillas: paquete de tarea, handoff, ADR y registro de fuente.
- Exportación: `agent-kit/MANIFEST.yml` define lo incluido; el paquete excluye `.git`, secretos, archivos `.env`, claves, caches, dependencias, transcripciones, configuraciones locales y archivos arbitrarios de Drive.

## Riesgos y límites abiertos

- No trabajar simultáneamente en la misma rama ni los mismos archivos.
- La ubicación de worktrees físicos aún no está autorizada/definida.
- En PowerShell de Asus Rog, `ripgrep` no está en el PATH nativo; la validación sigue funcionando con aviso o puede ejecutarse completa desde git-bash.
- El histórico de conversaciones previo al vault no está disponible como fuente local. Para incorporarlo, usar [[07 - Memoria histórica maestra]] y registrar cada exportación antes de sintetizarla.
- No hay repositorio, schemas ni Design System confirmados para el Portal de Capacidades.

## Referencias de profundización

- [[02 - Registro de proyectos]] · [[03 - Enrutamiento de modelos]] · [[04 - Acuerdos compartidos]] · [[05 - Política de contexto y tokens]] · [[06 - Integraciones y fuentes]]
- [[07 - Memoria histórica maestra]] · [[Decisiones/ADR-0001 - Memoria compartida y entornos aislados]] · [[Decisiones/ADR-0002 - Main canónico y arranque multi-equipo]]
- [[Handoffs/Índice de handoffs|Índice de handoffs]] · [[../../Proyectos/Dual-LLM Continuity Kit|Proyecto Dual-LLM Continuity Kit]]
