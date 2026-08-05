---
tipo: proyecto-capacidad
estado: activo
organizacion: Cencosud
programa: Mi Local
proyecto: Baja de Precio
actualizado: 2026-08-05
fuentes:
  - chatgpt-iteracion-baja-precios
  - planner-ux-2026
---

# Baja de Precio

Capacidad de Mi Local para consultar, clasificar y tramitar solicitudes de baja de precio mediante una experiencia agéntica y reglas de negocio configurables.

## Estado

- `Contrato Agente - Baja de precio`: En curso, 4/6, vencimiento visible 2026-06-18.
- `Diseño: aprobación cambio precio (ACP)`: Bloqueado, 4/6.
- `Diseño: solicitud cambio precio (SCP)`: Bloqueado, 5/7.
- `Mejora experiencia conversacional/voz`: Bloqueado, 1/2.

Todos estaban asignados a Edu en el snapshot de Planner del 2026-08-05. Ver [[../03 - Tareas en proceso]].

## Arquitectura de decisión

1. **Experiencia — Agente Mi Local:** consulta, clasifica, explica, pregunta y construye la solicitud.
2. **Motor de decisión:** aplica reglas, parámetros, filtros, límites, clasificación, cálculo y enrutamiento.
3. **Portal de Capacidades:** administra la inteligencia y hace visibles configuración, flujos y observabilidad.

La decisión de negocio pertenece al Rule Engine; el agente no debe improvisar aprobaciones.

## Datos de entrada

El precio sugerido puede provenir de algoritmo, usuario, carga manual o una fuente predictiva futura. Debe modelarse como dato de entrada, no como regla fija.

## Motivos o casos de uso

- sobre stock;
- próximo a vencer;
- mal estado;
- baja rotación;
- precio erróneo.

## Reglas y excepciones

- SKU estratégico;
- promoción activa;
- monto sobre límite SAP FIORI;
- ausencia de cupo SAP;
- precio alternativo;
- restricción horaria.

Las reglas deben ser configurables. Tipos observados: entrada, negocio, clasificación y enrutamiento.

## Estados de experiencia

- consulta;
- resolución;
- seguimiento.

## Integraciones mencionadas

- SAP FIORI;
- Mi Local;
- SAR — contrato y preguntas pendientes de confirmar.

## Preguntas abiertas

- ¿Qué partes exactas del contrato 4/6 faltan?
- ¿Cuál es la dependencia que bloquea ACP y SCP?
- ¿Qué decisión corresponde a SAR y cuál a SAP FIORI?
- ¿Cómo se administran estas reglas en el ABM Capa agéntica?
- ¿Qué métricas prueban éxito, tiempo de resolución y calidad de explicación?
