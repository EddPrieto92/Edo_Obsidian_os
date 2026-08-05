---
name: generar-briefing-semanal
description: Crear una revisión semanal ejecutiva y accionable a partir del vault, Git y fuentes conectadas, destacando prioridades, atrasos, riesgos, decisiones, aprendizaje y próximos pasos. Usar cuando el usuario pida qué atender hoy o esta semana, un resumen de lunes, detectar pendientes o bloqueos, revisar proyectos y requerimientos, preparar un correo de prioridades o diseñar/operar la automatización de ese briefing.
---

# Generar Briefing Semanal

## Principio

Producir pocas decisiones útiles, no un resumen exhaustivo. Todo elemento debe tener fuente, razón de prioridad y acción siguiente.

Leer `references/fuentes-y-priorizacion.md` para reunir y puntuar información. Leer `references/formato-de-salida.md` antes de redactar el resultado o un correo.

## Flujo

1. Determinar la fecha de corte y el horizonte de la revisión.
2. Leer el estado compartido, registro de proyectos, proyectos activos, handoffs y notas modificadas desde el último briefing.
3. Consultar Git para cambios, divergencias y trabajo no publicado.
4. Incorporar correo, calendario, tareas, contabilidad u otras fuentes solo si están conectadas y autorizadas.
5. Distinguir hechos verificados, inferencias y datos ausentes.
6. Puntuar candidatos y seleccionar un máximo de tres prioridades principales.
7. Redactar el briefing con acción, responsable o dependencia y criterio de cierre.
8. Guardar en `Edo/IA/Agentes/Briefings/AAAA-MM-DD - Briefing semanal.md` cuando la ejecución sea formal.
9. Preparar el correo; enviarlo únicamente cuando la automatización o el usuario autoricen expresamente el envío.

## Reglas de calidad

- Explicar por qué algo importa ahora.
- Señalar atrasos únicamente cuando exista fecha, compromiso o evidencia de envejecimiento.
- No convertir todas las notas recientes en tareas.
- Consolidar duplicados provenientes de varias fuentes.
- Mostrar dependencias y bloqueos antes de recomendar más trabajo.
- Reservar capacidad; no planificar más de lo razonablemente ejecutable.
- Incluir una acción de aprendizaje si existe una brecha técnica que afecta proyectos activos.

## Guardrails

- No inventar fechas, responsables, saldos, compromisos ni estados.
- No leer ni enviar información sensible fuera del alcance autorizado.
- No enviar correo como efecto secundario de una revisión manual.
- No modificar estados de proyecto para hacerlos coincidir con el briefing; reportar inconsistencias.
- Si faltan fuentes críticas, entregar un briefing parcial con una sección explícita de cobertura.
