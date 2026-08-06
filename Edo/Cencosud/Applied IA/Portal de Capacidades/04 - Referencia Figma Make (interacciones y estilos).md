---
tipo: nota
estado: activo
actualizado: 2026-08-06
fuente: figma-make-historial-v26-v66
---

# Referencia Figma Make — interacciones y estilos a portar

Ver [[00 - Portal de Capacidades]] para contexto general. Esta nota documenta decisiones de interacción y estilo extraídas del historial de chat de **Figma Make** (`https://www.figma.com/make/XndeXhlikpGvvOVeqBNVwj/Capacidades-Agénticas`, revisado hasta Version 66), para usarlas como referencia al iterar la versión local (`MI Local SM/portal-capacidades-agenticas`) antes de llevar los cambios al mock canónico (ITDS, `VernoVentures/mock`).

No se pudo cargar el historial anterior a la Version 26 — el panel de chat dejó de traer contenido más antiguo al hacer scroll.

## Principio rector (repetido en todas las specs)

La UI debe comunicar "estoy configurando una capacidad", nunca "estoy configurando un modelo de IA". Evitar siempre términos técnicos de IA (Prompt, Embeddings, Provider, Model, Vector DB, tokens, JSON) en la superficie de negocio — solo lenguaje de negocio. La complejidad técnica queda oculta u opcional para perfiles avanzados (Admin Plataforma/Admin IT).

## Estructura de tabs del Detalle de Capacidad (estado final, v66)

Cinco tabs al mismo nivel (sin anidación bajo "Configuración"): **Resumen · Reglas de Negocio · Flujos Agénticos · Solicitudes · Observabilidad**.

Historial de esta reorganización: originalmente Reglas de Negocio y Flujos Agénticos vivían anidados bajo un tab "Configuración" (v41); se subieron al mismo nivel que Resumen en v42; luego se agregaron Solicitudes y Observabilidad reemplazando los antiguos tabs de Métricas/Auditoría (v50, spec "Iteración 3").

### Componente contenedor único (v45-48)

`TabContent`: `px-8 py-6 grid grid-cols-12 gap-5`, usado por todos los tabs para que el padding quede homologado y alineado a la izquierda.

- Resumen: layout de dos columnas — `col-span-8` (Información + Proyecto) y `col-span-4` (Propósito).
- Reglas de Negocio, Flujos Agénticos, Solicitudes, Observabilidad: `col-span-12` (full width) dentro del mismo grid.

### Tab Resumen

- Card **Información**: Nombre, Estado, Owner, Versión publicada, Descripción.
- Card **Proyecto**: Proyecto, Ambiente, API Key parcialmente oculta estilo OpenAI/Vercel (`sk-prod-****A8F3`), botón mostrar/ocultar + botón rotar.
- Card **Propósito**: Objetivo + Descripción funcional, edición inline con botones Guardar/Cancelar (sin drawer).

### Tab Reglas de Negocio

- **Políticas**: cards con Título + texto de política en lenguaje de negocio (nunca IF/THEN). Acciones: Crear/Editar/Eliminar/Activar-Desactivar con toggle visual. Ejemplo de tono: "Si un producto tiene fecha de vencimiento menor a 3 días y el stock supera las ventas promedio, se puede solicitar una baja de hasta 20% con un máximo de 5 SKU diarios."
- **Glosario**: tabla de términos (Agregar término/Editar/Eliminar).
- **Acciones rápidas**: tabla (Crear/Editar/Eliminar/Activar-Desactivar).

### Tab Flujos Agénticos

- Tabla principal de flujos; botón **"Nuevo flujo"** abre el mismo drawer que "Configurar" pero vacío — se logra con `setSelectedFlowId(null)` + `key={selectedFlowId ?? 'new'}` para forzar remount del drawer con estado limpio (v59).
- **FlowConfigDrawer** ("Configurar Flujo"), ancho 800px, subtítulo "Define el comportamiento de negocio para esta capacidad." Secciones:
  1. Información General — nombre, descripción, estado (toggle activo/inactivo), versión (solo lectura)
  2. Disparador — radio single-select: Consulta de usuario / Acción rápida / Evento automático / Solicitud de negocio
  3. Comportamiento del Flujo — textarea grande + botón secundario "Usar plantilla" (sin funcionalidad)
  4. Reglas de Negocio — accordion, lista editable de reglas condición→resultado, modal para agregar (Condición/Resultado/Cancelar/Guardar)
  5. Información Utilizada — checklist multi-select de atributos de negocio (Stock, Precio, Promociones, etc.)
  6. Acciones Disponibles — checklist multi-select de quick actions existentes, con contador de uso
  7. Resultado Esperado — textarea
  8. Alcance — resumen de solo lectura (tiendas/roles/secciones activas) + botón "Editar Alcance" que abre `ScopeConfigDrawer` (sin duplicar esa función)
  - Footer sticky: izquierda "Última modificación · Usuario · Fecha"; derecha Cancelar / Guardar Borrador / Publicar Cambios.

### ScopeConfigDrawer ("Configuración de Alcance", v36-38)

Header compacto con resumen `[N tiendas] [N roles] [N secciones]`. Tres accordions:

1. **Tiendas habilitadas** (opcional) — selector de negocio (Jumbo/Santa Isabel/SPID), multi-select de zona/división, buscador de tiendas, tiendas seleccionadas como chips removibles.
2. **Roles activos** (requerido) — checkboxes agrupados por categoría: Operación Tienda (Gerente Tienda, Jefe de Sección, Subgerente, Operador) y Administración Central (Comercial, Pricing, Planificador).
3. **Secciones activas** (opcional) — categorías anidadas (Perecibles, Consumo Masivo, Non Food) con checkboxes y "Seleccionar todo" por categoría — mismo lenguaje visual que targeting de comunicaciones de Mi Local.

Nota técnica: cuidado con botones anidados dentro de botones al construir el header de categoría con toggle + "Seleccionar todo" — deben ser hermanos en un flex container, no anidados (bug real encontrado en v37→v38).

### Tab Solicitudes (spec "Iteración 3", v50-53)

Responde **"¿Qué pasó?"**. Representa ejecuciones funcionales de la capacidad (instancias de uso).

- Filtros: País, UDN, Tienda, Sección, Usuario, Estado, Categoría.
- Columnas de tabla: ID, Tipo/Subcategoría, Descripción, Solicitante, Rol resolutor, Categoría, Enviado a, Estado, Mensajes, Última actualización.
- Al hacer clic en una fila se abre **SolicitudDrawer** (no filas expandibles inline — decisión explícita en v53: "los detalle siempre deben verse en un drawer"). Contenido: Resultado (tipo problema, descripción, estado, resultado final), Conversación (tabla remitente/email/rol/origen/mensaje), Timeline horizontal (Usuario → Capacidad → Planner → Comercial → Resultado, con flechas).

### Tab Observabilidad (spec "Iteración 3", v50-58)

Responde **"¿Cómo pasó?"**. Orientada a soporte/administración, no es vista de negocio.

- Cards de salud arriba: Solicitudes (7d), Tasa de éxito, Tiempo promedio, Errores.
- Gráfico de barras de distribución semanal.
- Sub-tabs internos: **Conversaciones / Ejecuciones / Logs**.
- **Conversaciones** → Drawer lateral (no modal — cambiado en v56 a pedido explícito, mismo tamaño `large` que SolicitudDrawer/ExecutionDrawer). Contenido: chat de conversación en card con `h-64 overflow-y-auto` (scroll interno, altura fija 256px, para no romper el alto del drawer — v57/58), chips de "Información utilizada" (Stock/Precio/Promociones/Margen), checklist de "Acciones ejecutadas", accordion colapsado de Tokens y costos (oculto por defecto, **visible solo para Admin Plataforma**: Input/Output/Total/Cached/Reasoning Tokens), accordion colapsado de Datos técnicos (JSON completo, Metadata, Request ID, Payload — no mostrar por defecto).
- **Ejecuciones** → Drawer lateral con Request ID, Estado, Duración, Herramientas utilizadas, Error, Fecha; al abrir muestra Input, Herramientas, Resultado, Tiempo, Errores, Request ID.
- **Logs** → tabla orientada a soporte: Nivel, Método, URL, Status, Tiempo, Fecha; filtros por Nivel/Error/Fecha; badges de color por status HTTP; no mostrar detalle complejo por defecto.

## Estandarización de tablas (v59-61, aplicada a todas las tablas del portal)

- **Columnas sticky**: primera columna `sticky left-0` con sombra sutil a la derecha; columna de acciones `sticky right-0` con sombra sutil a la izquierda — el scroll horizontal solo mueve el contenido intermedio. Las filas usan `group` para que el hover `bg-white → bg-gray-50` se propague a las celdas sticky.
- **Íconos de acción uniformes** (componente reutilizable `ActBtn`, todos con `title` como tooltip nativo):
  - `Eye` → "Ver detalle" (abre drawer)
  - `Edit` → "Editar"
  - `Trash2` → "Eliminar" (rojo al hover)
  - `ToggleRight/ToggleLeft` → Activar/Desactivar
- **Ordenamiento por columna**: `SortBtn` en cada header relevante — ciclo `ChevronsUpDown` (sin orden) → `ChevronUp` (asc) → `ChevronDown` (desc) → sin orden, al hacer clic.
- **Paginación**: `TablePagination` en el pie — "Mostrando 1–5 de N resultados" a la izquierda, controles Anterior/página/Siguiente a la derecha. 5 ítems por página por defecto, cada tabla con estado independiente.

## Header y navegación (v66, el cambio más reciente)

- **Sidebar**: icon-only por defecto (`w-14`), se expande a `w-56` al pasar el cursor con transición suave. Los labels de texto usan `opacity-0 → opacity-100` con `delay-75` para aparecer después de que el ancho ya empezó a expandirse. El ícono activo mantiene el highlight azul también en estado colapsado.
- **Top bar**: logo + "Capacidades Agénticas" fijo a la izquierda; a la derecha campana, ayuda, y usuario (avatar + nombre + rol, ej. "Admin User / Administrador"). **Sin breadcrumb** en esta barra.
- **Breadcrumb**: vive en su propia franja dentro del área de contenido, debajo del top bar y antes de `<main>` — siempre visible. Mismo comportamiento de siempre: clic en items anteriores navega, el último item queda en azul y no es clickeable.

## Visibilidad de tabs por rol (evolución, estado final v65)

Se simplificó de 4 roles (Business Owner / Admin Negocio / Viewer / Admin Plataforma, spec Iteración 2) a **2 roles** tras corrección explícita del usuario: no existe Business Owner como tal.

| Tab | Admin Negocio | Admin IT |
|---|---|---|
| Resumen | — | ✓ |
| Reglas de Negocio | ✓ | ✓ |
| Flujos Agénticos | — | ✓ |
| Solicitudes | ✓ | ✓ |
| Observabilidad | — | ✓ |

El selector de perfil está en el header (arriba a la derecha) y permite cambiar de rol en el prototipo; al cambiar, si el tab activo no está disponible para el nuevo rol, redirige automáticamente al primer tab visible.

## Pendiente / no confirmado

- No se pudo revisar el historial anterior a la Version 26 (specs previas a "Iteración 2", si existieron, no cargaron en el panel).
- Falta comparar explícitamente pantalla por pantalla contra el mock canónico (`VernoVentures/mock`) y contra la iteración local (`MI Local SM/portal-capacidades-agenticas`) para decidir qué de esto ya está portado y qué falta.
