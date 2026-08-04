---
tipo: memoria-maestra
estado: activo
actualizado: 2026-08-04
fuentes:
  - Edo/IA/Agentes/01 - Estado compartido.md
  - Edo/IA/Agentes/Historial resumido.md
  - Edo/IA/Agentes/04 - Acuerdos compartidos.md
  - Edo/IA/Agentes/05 - Política de contexto y tokens.md
  - Edo/IA/Agentes/06 - Integraciones y fuentes.md
  - solicitud-del-usuario-2026-08-04
sensibilidad: interna
---

# Memoria histórica maestra — OpenAI, Claude y Edo

## Propósito

Esta nota es el punto de entrada para reconstruir y mantener una memoria compartida entre OpenAI/Codex, Claude y el vault Edo. Convierte conversaciones y material disperso en notas pequeñas, trazables y útiles para pensar, decidir y continuar proyectos.

No reemplaza las fuentes originales: las conserva como evidencia y registra únicamente hechos, decisiones, aprendizajes y contexto que puedan verificarse.

## Lectura de inicio para un agente

1. Leer [[00 - Inicio rápido]].
2. Leer [[01 - Estado compartido]] y esta nota.
3. Abrir la nota del proyecto o área relacionada con la tarea.
4. Consultar el registro de fuentes y solo después la conversación o archivo original necesario.
5. Antes de escribir, distinguir entre `verificado`, `inferencia` y `pendiente`.

## Principios de memoria

- El vault es la memoria utilizable; Git conserva el historial de sus cambios.
- Una conversación completa es una fuente archivada, no memoria operativa por defecto.
- Cada afirmación relevante debe poder rastrearse a una conversación, archivo, commit, enlace o instrucción fechada.
- Las decisiones durables se registran en una nota ADR; las acciones vigentes, en el estado del proyecto; los traspasos de sesión, en un handoff.
- Se actualiza una nota existente antes de crear duplicados.
- No incorporar secretos, credenciales, datos privados de terceros, configuraciones `.env`, ni rutas locales que no sean imprescindibles.

## Contexto confirmado al 2026-08-04

### Sistema Edo

- Edo es un segundo cerebro basado en Markdown, independiente de herramientas concretas.
- Obsidian sirve para navegar y editar; Git es el histórico autoritativo; Drive cumple la función de sincronización externa y fuente de adjuntos; Codex ejecuta cambios sobre archivos.
- La memoria operativa compartida para Codex y Claude se encuentra en `Edo/IA/Agentes/`.
- La política del vault exige no inventar antecedentes y conservar la trazabilidad de hechos históricos relevantes.

### Continuidad entre agentes

- Todo trabajo tiene un agente propietario y se realiza en una rama o worktree exclusivo.
- El estado vigente se mantiene en [[01 - Estado compartido]].
- Las decisiones durables se guardan en `Decisiones/`; los handoffs en `Handoffs/`; las conversaciones completas se archivan fuera del contexto permanente.
- Existe un kit de continuidad Codex–Claude y un piloto de transferencia entre ambos agentes que fue confirmado como operable el 2026-08-03.

### Límites de esta reconstrucción

- El vault no contiene todavía un historial verificable de conversaciones de OpenAI anterior a las fuentes listadas arriba.
- Por tanto, ningún proyecto, decisión, preferencia o antecedente anterior debe añadirse como hecho hasta importar su fuente original o una síntesis aprobada por el usuario.

## Mapa de memoria

| Necesidad | Ubicación destino | Qué guardar |
| --- | --- | --- |
| Navegar por un dominio | MOC del área | enlaces a notas activas y relevantes |
| Conocer el estado actual | `01 - Estado compartido` o estado del proyecto | situación, bloqueos y próxima acción |
| Mantener un proyecto | `Proyectos/<proyecto>/` | objetivo, alcance, entregables y evolución |
| Registrar una decisión | `IA/Agentes/Decisiones/ADR-XXXX` | contexto, decisión, consecuencias y fuente |
| Conservar un aprendizaje | `Archivo/Aprendizajes.md` o nota del área | patrón, evidencia y aplicación futura |
| Conservar una idea | `Archivo/Ideas recurrentes.md` o proyecto | idea, contexto y siguiente revisión |
| Transferir trabajo | `IA/Agentes/Handoffs/` | estado, cambios, validaciones y próxima acción |
| Conservar evidencia | fuente externa enlazada + registro de fuente | origen, fecha, alcance y limitaciones |

## Protocolo de importación de conversaciones históricas

Por cada exportación, enlace o copia de un hilo:

1. Crear un registro con [[Plantillas/Plantilla - Registro de fuente]], identificando plataforma, fecha, título, enlace o ruta, sensibilidad y limitaciones.
2. Mantener la transcripción/exportación original fuera de las notas de contexto permanente. Enlazarla desde el registro si está disponible.
3. Extraer solamente los elementos durables: proyectos, decisiones, aprendizajes, preferencias de trabajo, recursos y pendientes.
4. Contrastar los elementos con las notas existentes. Si algo contradice el vault, marcarlo como `pendiente de reconciliación`; no sobrescribir sin decisión explícita.
5. Escribir cada elemento en su destino natural y enlazar el registro de fuente.
6. Actualizar esta nota, el MOC o el estado correspondiente con enlaces, no con transcripciones duplicadas.

## Ficha de síntesis por hilo

Usar esta ficha dentro de una nota temporal de importación o al actualizar la nota de destino:

```md
### Hilo: <título original>

- Fuente: [[Fuente — <plataforma y fecha>]]
- Periodo: <fecha o rango>
- Estado de evidencia: verificado | parcial | pendiente
- Tema: <una frase>
- Proyecto o área: [[<nota relacionada>]]

#### Hechos verificables
- ...

#### Decisiones y su destino
- <decisión> → [[ADR-XXXX - <título>]]

#### Aprendizajes reutilizables
- ...

#### Pendientes o preguntas abiertas
- ...

#### Material que no se eleva a memoria permanente
- Transcripción, iteraciones descartadas, contenido sensible o detalles sin valor futuro.
```

## Registro de importación

| Periodo | Plataforma | Fuente registrada | Síntesis completada | Destinos actualizados | Estado |
| --- | --- | --- | --- | --- | --- |
| 2026-07-07 a 2026-08-03 | Vault Edo | [[Historial resumido]] | Parcial | [[01 - Estado compartido]], proyectos y agentes | verificado |
| Anterior a 2026-07-07 | OpenAI / otros | Pendiente de exportación o enlaces | No | No aplica | pendiente |
| Desde 2026-08-04 | OpenAI, Codex y Claude | Registrar por lote | No | Por determinar | pendiente |

## Reglas para Claude al consultar esta memoria

- Empezar por la lectura de inicio y buscar enlaces antes de abrir fuentes completas.
- Usar esta nota como índice y criterio de síntesis, no como sustituto de la evidencia original.
- No afirmar que se leyó o conoce el histórico total de OpenAI si las fuentes no fueron importadas.
- Al encontrar nueva evidencia, crear o actualizar primero su registro de fuente y luego la nota de destino.
- Si una tarea deja decisiones, pruebas, cambios o pendientes que sobrevivirán la sesión, registrarlos en el vault y crear un handoff solo cuando cambie el agente responsable.

## Próxima iteración recomendada

1. Obtener el export o los enlaces de los hilos históricos que el usuario decida incorporar.
2. Registrarlos por lote, desde los más antiguos a los más recientes, sin mezclar fuentes.
3. Sintetizar cada hilo con la ficha anterior y reconciliar duplicados.
4. Actualizar los MOC, los proyectos activos y el historial resumido con enlaces a las notas consolidadas.

## Enlaces operativos

- [[00 - Inicio rápido]]
- [[01 - Estado compartido]]
- [[02 - Registro de proyectos]]
- [[04 - Acuerdos compartidos]]
- [[05 - Política de contexto y tokens]]
- [[06 - Integraciones y fuentes]]
- [[Historial resumido]]
- [[Plantillas/Plantilla - Registro de fuente]]
- [[Handoffs/Índice de handoffs|Índice de handoffs]]
