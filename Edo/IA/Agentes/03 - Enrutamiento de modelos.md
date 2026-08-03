---
tipo: política
estado: activo
actualizado: 2026-08-03
fuente: solicitud-del-usuario-2026-08-03
---

# Enrutamiento de modelos

## Principio

Elegir por complejidad y riesgo, no por preferencia de plataforma. Empezar con el menor esfuerzo razonable y escalar cuando falte calidad, aparezca ambigüedad material o falle la verificación.

## Matriz

| Nivel | Ejemplos | Codex | Claude |
|---|---|---|---|
| Mecánico | buscar, ordenar, clasificar, cambios repetitivos | modelo eficiente; mínimo o low | Haiku; low |
| Estándar | implementación acotada, bugs, pruebas, documentación | modelo equilibrado; low o medium | Sonnet; medium |
| Complejo | arquitectura, migraciones, debugging multicausal | modelo principal; high o xhigh | Opus u `opusplan`; high |
| Crítico | seguridad, datos sensibles, operación irreversible | modelo principal + revisión independiente | Opus + revisión independiente |

## Reglas

- No fijar versiones numéricas en la memoria compartida salvo que un proyecto requiera reproducibilidad.
- Usar alias o roles que puedan actualizarse con la plataforma.
- Mantener el mismo agente durante una fase coherente; cambiar de modelo solo en un límite claro.
- Usar agentes paralelos únicamente para subtareas independientes cuyo ahorro compense el costo adicional.
- Registrar la razón cuando se use el nivel complejo o crítico.
