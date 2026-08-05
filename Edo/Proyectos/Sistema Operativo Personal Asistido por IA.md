---
tipo: proyecto
estado: activo
actualizado: 2026-08-04
fuentes:
  - solicitud-del-usuario-2026-08-04
  - Edo/Proyectos/Dual-LLM Continuity Kit.md
  - Edo/IA/Agentes/08 - Contexto integral del sistema de agentes.md
  - Machines/registry.yml
  - git-local-2026-08-04
---

# Sistema Operativo Personal Asistido por IA

## En una frase

Un entorno **local-first, versionado y multiagente** que convierte proyectos, decisiones y aprendizaje en contexto compartido y verificable, accesible desde diferentes dispositivos.

## Qué se logró

- Un vault Markdown común para conocimiento y estado operativo.
- Una historia Git canónica que permite verificar qué versión tiene cada equipo.
- Sincronización y continuidad entre Mac Coders, Mac Air Edu y Asus Rog.
- Adaptadores separados para Codex y Claude que consumen la misma memoria.
- Handoffs, ADR, registros de fuente y notas de proyecto para continuar sin depender del chat anterior.
- VS Code como superficie de ejecución y Obsidian como superficie de lectura, enlace y documentación.
- Una primera integración MCP con Obsidian en configuración local pendiente de completar y proteger su API key.

## Cómo se describe en lenguaje de industria

No existe un único nombre universal. La descripción más precisa es:

> **Personal AI Operating System con arquitectura local-first, memoria versionada y orquestación multiagente human-in-the-loop.**

Conceptos relacionados:

| Concepto | Qué significa aquí |
| --- | --- |
| Knowledge management | organizar conocimiento para encontrarlo y mantenerlo |
| Second brain | memoria externa personal para proyectos, ideas y decisiones |
| Local-first | los archivos locales son utilizables sin depender de una plataforma SaaS |
| GitOps para conocimiento | cambios, versiones y sincronización gobernados mediante Git |
| Context engineering | diseñar qué contexto recibe cada agente, cuándo y con qué fuentes |
| Multi-agent workflow | Codex y Claude comparten estado pero tienen propiedad y entornos separados |
| Human-in-the-loop | la IA propone o ejecuta dentro de límites; el usuario conserva decisiones sensibles |
| MCP | protocolo para que un agente use herramientas y datos externos de manera estructurada |
| Automation/orchestration | ejecutar flujos recurrentes que leen fuentes, deciden y producen acciones |

## Qué no es todavía

- No es una IA autónoma que conoce toda la vida del usuario.
- No es RAG completo: aún no existe una capa formal de indexación semántica/vectorial y recuperación automática.
- No es un gestor de tareas unificado: proyectos y pendientes todavía dependen de consistencia manual en las notas.
- No es una automatización semanal completa: faltan fuentes conectadas, reglas de cobertura, scheduler y canal de envío.
- No sustituye seguridad, backups ni revisión humana.

## Nivel de madurez

| Nivel | Capacidad | Estado |
| --- | --- | --- |
| 1 | archivos y acceso desde varios dispositivos | logrado |
| 2 | versionado, estado compartido y recuperación de contexto | logrado |
| 3 | workflows de agentes, skills, handoffs y MCP | en desarrollo |
| 4 | briefing, correo y tareas automatizadas con fuentes conectadas | siguiente iteración |
| 5 | métricas, observabilidad, gobierno y mejora continua | futuro |

## Automatización objetivo — correo del lunes

### Resultado esperado

Cada lunes por la mañana, recibir un correo breve que responda:

1. ¿Cuáles son las tres cosas que requieren atención esta semana?
2. ¿Qué compromiso o riesgo se está atrasando?
3. ¿Qué depende de otra persona o fuente?
4. ¿Qué decisión debe tomarse?
5. ¿Qué aprendizaje técnico desbloquea trabajo real?

### Flujo propuesto

```text
Vault + Git + proyectos + handoffs
            ↓
Correo + calendario + tareas + contabilidad autorizada
            ↓
Normalización y detección de duplicados
            ↓
Priorización con evidencia, impacto, riesgo y antigüedad
            ↓
Nota Markdown versionada
            ↓
Correo de máximo 500 palabras
```

### Requisitos antes de activarlo

- Definir la hora exacta y zona horaria.
- Conectar calendario y correo autorizados.
- Definir dónde viven tareas y compromisos con fecha.
- Establecer fuentes contables permitidas y nivel de sensibilidad.
- Ejecutar el briefing manualmente durante dos o tres semanas y corregir falsos positivos.
- Solo después programar generación y envío automático.

Skill de contenido: `.claude/skills/generar-briefing-semanal/`.

## Desarrollo profesional

Objetivo: pasar desde base lógica y JavaScript desactualizado hacia un Tech Lead medio capaz de implementar, revisar, diseñar y comunicar decisiones técnicas.

El aprendizaje debe usar proyectos reales como laboratorio y conservar evidencia. La progresión propuesta cubre:

1. JavaScript moderno, web, TypeScript y React.
2. Testing, APIs, Git, CI y desarrollo de producto.
3. Arquitectura, seguridad, rendimiento y observabilidad.
4. Estimación, RFC/ADR, revisión, mentoring e incidentes.

Skill pedagógica: `.claude/skills/formar-tech-lead/`.
Estado de aprendizaje: [[../Tecnología/Aprendizaje/Progreso Tech Lead]].

## Principio rector

Automatizar primero la **captura y síntesis**; mantener bajo decisión humana las prioridades, compromisos externos, dinero, seguridad y cambios irreversibles hasta que el flujo acumule evidencia suficiente.

## Próximas acciones

1. Ejecutar una primera evaluación con `$formar-tech-lead` en Claude.
2. Generar dos briefings manuales con `$generar-briefing-semanal`.
3. Definir hora del lunes y fuentes conectadas.
4. Activar el envío automático solo después de validar la calidad del briefing.
