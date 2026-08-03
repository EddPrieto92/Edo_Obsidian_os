---
tipo: moc
estado: activo
actualizado: 2026-08-03
fuente: solicitud-del-usuario-2026-08-03
---

# Inicio rápido — Codex + Claude

## Propósito

Punto de entrada común para continuar una tarea desde Codex, Claude, VS Code u Obsidian sin depender de la conversación anterior.

## Lectura mínima

1. [[01 - Estado compartido]]
2. [[02 - Registro de proyectos]]
3. La nota del proyecto activo
4. El handoff vigente, si existe

Leer [[03 - Enrutamiento de modelos]] o [[05 - Política de contexto y tokens]] solo cuando la tarea requiera decidir modelo, esfuerzo o ampliar contexto.

## Regla de propiedad

- Una tarea tiene un agente propietario a la vez.
- Codex y Claude usan ramas o worktrees separados.
- La transferencia se completa únicamente cuando existe un handoff con estado `listo`.
- Git conserva la historia; estas notas conservan el estado operativo.

## Accesos

- [[04 - Acuerdos compartidos]]
- [[05 - Política de contexto y tokens]]
- [[06 - Integraciones y fuentes]]
- [[Historial resumido]]
- [[Handoffs/Índice de handoffs|Índice de handoffs]]
- [[Decisiones/ADR-0001 - Memoria compartida y entornos aislados]]
- [[Plantillas/Plantilla - Paquete de tarea]]
- [[Plantillas/Plantilla - Handoff]]

## Validación

Desde la raíz del repositorio:

```sh
bash agent-kit/scripts/validate-kit.sh .
```

## Inicio por equipo

1. Abrir `workspaces/edu-control.code-workspace`.
2. Ejecutar la tarea `Edo: Inicio seguro`.
3. Comprobar la versión remota cuando se necesite.
4. Actualizar solo si el script confirma que `main` puede avanzar sin conflictos.

Ver `agent-kit/MULTI-MACHINE-STARTUP.md` y [[../../../Machines/README|Equipos y proyectos]].
