---
tipo: nota
estado: activo
actualizado: 2026-08-06
fuente: solicitud-del-usuario-2026-08-04
---

# Decisiones y pendientes — Portal de Capacidades

Ver [[00 - Portal de Capacidades]] para contexto general.

## Decisiones tomadas con la persona de diseño

- Orden de portado elegido explícitamente: Resumen → Capacidades → Detalle de Capacidad → Administración → Configuración (la persona priorizó la pantalla "vitrina" antes que la más simple de construir).
- **(2026-08-06)** Ubicación canónica única para iterar en local: `MI Local SM/portal-capacidades-agenticas`. `VernoVentures/mock` queda descartado como referencia de trabajo — solo recibirá el port final una vez validada la iteración local. No volver a usar `VernoVentures/mock` como sinónimo de este proyecto.

## Limitación heredada de la referencia

El detalle de capacidad (`/capabilities/:id`) usa un único fixture de contenido (`data/capability-detail.ts`) para las 10 capacidades, porque así se comporta el Figma Site de origen — nunca mostró contenido distinto según la tarjeta abierta. Solo el nombre/descripción/estado del encabezado cambian. Ver el detalle en [[01 - Inventario de pantallas]].

## Pendiente — decisión abierta con la persona de diseño

**¿Se le da contenido propio (reglas, flujos, solicitudes, observabilidad) a cada una de las 10 capacidades, o se deja el fixture único?** No se avanzó porque implica inventar datos que no están en la referencia — se decidió preguntar antes de fabricar contenido de negocio. Última vez que se preguntó (2026-08-04) la conversación se cerró sin definir esto todavía.

## Otros pendientes técnicos

- No hay remoto Git configurado para `VernoVentures/mock` — evaluar si conviene un repo propio o si debe integrarse a algún monorepo existente.
- Confirmar si la ruta del código debe migrar fuera de `VernoVentures/`; no moverla hasta definir repositorio canónico y preservar el historial.
- Filtros de la pantalla "Capacidades" son visuales (no filtran realmente la lista) — se dejaron así porque la referencia no expone qué capacidad pertenece a qué producto/país/unidad de negocio real; conectarlos requeriría inventar esas relaciones.
- Botones de acción sin función real ("Nueva política", "Agregar Usuario", "Crear Rol", "Cerrar Sesión", etc.) — esperado en un mock de frontend puro sin backend.

## Actualiza también

- [[../../../IA/Agentes/02 - Registro de proyectos|Registro de proyectos]] — fila "Portal de Capacidades Agénticas" actualizada con la ruta local observada.
