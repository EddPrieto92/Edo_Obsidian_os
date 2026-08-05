---
tipo: estado
estado: activo
organizacion: Cencosud
actualizado: 2026-08-05
verificado_en:
  - Planner UX 2026
  - Planner AppliedAI de Software Engineering
  - Jira Cencosud
---

# Estado y prioridades — Cencosud

Snapshot verificado el **2026-08-05**. Los sistemas externos siguen siendo la fuente de verdad; revisar [[03 - Tareas en proceso]] antes de asumir que un estado continúa vigente.

## Atención inmediata

| Prioridad | Frente | Evidencia | Lectura |
|---|---|---|---|
| P0 | [[Mi Local/Baja de Precio|Contrato Agente — Baja de precio]] | Planner: En curso, 4/6, vencimiento 2026-06-18 | Asignado a Edu; plazo vencido en el snapshot |
| P0 | [[Applied IA/README|ABM Capa agéntica]] | Planner: En curso, 2/5, vencimiento 2026-06-12 | Asignado a Edu; plazo vencido en el snapshot |
| P1 | [[Applied IA/Portal de Capacidades/00 - Portal de Capacidades|Portal de Capacidades Agénticas]] | Planner AppliedAI: frente Portal Agentes activo | Trabajo de equipo en frontend, Agent Core, árbol y Design Capabilities |
| P1 | [[05 - Skills y herramientas|Migración Figma Make → Penpot]] | Planner: Priorizado, 0/5 | Asignado a Edu; prueba de skill/Design System |
| P1 | [[Applied IA/README|Base Agéntica App]] | Planner: Priorizado, 0/1 | Falta entendimiento de casos de uso y arquitectura |

## Bloqueos visibles

- Aprobación cambio de precio (ACP): bloqueado, 4/6, vencimiento 2026-05-04.
- Solicitud cambio de precio (SCP): bloqueado, 5/7, vencimiento 2026-04-17.
- Mejora de experiencia conversacional/voz: bloqueado, 1/2.

Todos estaban asignados a Edu en `UX 2026` al momento del snapshot.

## Estado por programa

| Programa | Estado resumido | Siguiente foco |
|---|---|---|
| [[Mi Local/README|Mi Local]] | Baja de Precio en curso; recomendador de conteo en backlog; tres tareas bloqueadas | Cerrar contrato y revisar dependencias ACP/SCP |
| [[Applied IA/README|Applied IA]] | Portal Agentes activo; ABM capa agéntica en curso; Base Agéntica priorizada | Alinear arquitectura, roles y relación Portal–Agent Core |
| [[Modernización/README|Modernización]] | Consultor de Producto tiene evidencia reciente en Jira; otras dos alertas sin tarea vigente visible | Confirmar estado, owner y próximos hitos |

## Riesgos de contexto

- Los vencimientos de junio permanecen “En curso”; confirmar si son fechas antiguas o deuda real.
- Jira mostraba `0` asignaciones actuales, mientras Planner sí mostraba tareas asignadas: no interpretar un sistema aislado como panorama completo.
- El mock del Portal está en `VernoVentures/mock`; su clasificación es Cencosud y la ubicación debe revisarse para evitar mezcla con trabajo personal.
