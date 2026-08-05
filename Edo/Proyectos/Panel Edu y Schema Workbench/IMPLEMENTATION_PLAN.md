---
tipo: plan-implementacion
estado: listo-para-descubrimiento
actualizado: 2026-08-03
---

# Plan de implementación — Portal de Capacidades

## Decisión de MVP

Se adopta un **snapshot JSON local y read-only detrás de un `VaultAdapter`**, con datos mock en la primera fase y refresco explícito. No habrá escritura, sincronización automática ni acceso directo del navegador al sistema de archivos.

## Puerta de entrada obligatoria

Antes de escribir código se debe localizar el repositorio real del portal y documentar:

- framework, rutas y estructura;
- componente de detalle de capacidad y tabs;
- Design System, tokens y componentes reutilizables;
- schemas existentes y formatos reales;
- pruebas, comandos y restricciones del repositorio;
- si el producto es web, desktop o web con servicio local.

Si alguno de estos elementos no existe, se registra como decisión pendiente; no se inventa.

## Fases

### Fase 0 — Descubrimiento y contratos

**Salida:** inventario técnico y mapa de reutilización.

- localizar el repositorio del portal;
- recuperar schemas originales;
- confirmar identificadores estables y convención de enlaces;
- mapear el modelo propuesto contra datos reales;
- cerrar preguntas críticas del handoff;
- crear ADR para las incompatibilidades.

**Criterio de salida:** repositorio y contratos reales identificados, sin supuestos bloqueantes.

### Fase 1 — Prototipo con fixtures

**Salida:** tab `Schemas` integrado visualmente.

- añadir el tab dentro del detalle de capacidad;
- construir tres paneles redimensionables;
- implementar fixtures tipados detrás de un adapter mock;
- limitar el primer grafo a cinco tipos de nodo;
- sincronizar selección árbol ↔ inspector ↔ grafo;
- cubrir carga, vacío, error y desconectado;
- agregar tabla alternativa al grafo.

**Criterio de salida:** happy path completo sin lectura ni escritura real del vault.

### Fase 2 — Integración read-only

**Salida:** índice local consumible por el portal.

- implementar el adapter real;
- generar snapshot con rutas relativas, hashes y fecha;
- parsear frontmatter y enlaces;
- habilitar Obsidian URI;
- distinguir versión de artefacto, índice y repositorio;
- mostrar diagnósticos.

**Criterio de salida:** el portal refleja fuentes reales sin modificarlas.

### Fase 3 — Estado y versionado

**Salida:** estado verificable por proyecto y equipo.

- consumir el registro lógico de máquinas;
- mostrar commit, rama y fecha de chequeo;
- exponer estados semánticos;
- incorporar historial de indexación;
- bloquear actualización ante cambios locales o divergencia.

**Criterio de salida:** los tres estados de versión no se confunden y las acciones son seguras.

### Fase 4 — Edición controlada

**Salida:** propuesta futura, fuera del MVP.

- preview de diff por archivo;
- confirmación explícita;
- backup o commit recuperable;
- permisos y auditoría;
- resolución de conflictos;
- pruebas de recuperación.

## Backlog priorizado

| Prioridad | Entrega | Dependencia |
|---|---|---|
| P0 | Inventario del repo y schemas reales | acceso al proyecto |
| P0 | Tab y shell de tres paneles | Design System |
| P0 | Adapter mock y selección sincronizada | contratos tipados |
| P0 | Estados de carga, vacío y error | fixtures |
| P1 | Grafo accesible + tabla | React Flow verificado |
| P1 | Snapshot read-only | parser local |
| P1 | Obsidian URI | vault y rutas relativas |
| P2 | Estado multi-equipo | registro y API local |
| P3 | Escritura controlada | políticas y auditoría |

## Estrategia de pruebas

- unitarias: adapters, normalización, estado de versión y URI;
- componentes: selección sincronizada y estados;
- accesibilidad: teclado, foco, labels y tabla alternativa;
- integración: fixture → adapter → tres paneles;
- seguridad: snapshot sin rutas absolutas ni secretos;
- regresión visual: tab integrado con tokens del portal.

## Criterios de aceptación del primer incremento

- el tab existe en la ruta real del producto;
- se reutilizan componentes y tokens existentes;
- los tres paneles son distinguibles y redimensionables;
- árbol, contenido y grafo comparten selección;
- el origen de datos está desacoplado mediante adapter;
- no se escriben archivos;
- no se muestran rutas absolutas ni secretos;
- existe una alternativa accesible al grafo;
- pruebas relevantes pasan;
- las decisiones pendientes quedan registradas.

## Bloqueos actuales

- repositorio del Portal de Capacidades no localizado;
- schemas originales no localizados;
- Design System real no inspeccionado;
- escala esperada del grafo no confirmada;
- onboarding de Asus Rog pendiente.

Estos bloqueos impiden implementar el producto con fidelidad, pero no impiden cerrar esta planificación.
