---
tipo: nota
estado: activo
actualizado: 2026-08-04
fuente: solicitud-del-usuario-2026-08-04
---

# Inventario de pantallas — Portal de Capacidades

Ver [[00 - Portal de Capacidades]] para contexto general.

## 1. Resumen — `/`

Dashboard ejecutivo. Contenido:
- Tabla "Catálogo de Productos" (Mi Local, SIP / PMO) con proyectos, países, capacidades y estado.
- 4 tarjetas KPI: Productos, Capacidades, Solicitudes, Usuarios Activos.
- Gráfico de barras "Uso por Producto" (Mi Local Mobile, Web Portal, Store Operations, Supply Chain).
- Lista "Principales Capacidades" con barras de progreso (% de éxito).

Componentes: `pages/home/HomePage.tsx` + `pages/home/components/{ProductsTable,KpiCards,TopCapabilities}.tsx`.
Datos: `data/dashboard.ts`.

## 2. Capacidades — `/capabilities`

Listado con 5 filtros (Producto, Proyecto, País, Unidad de Negocio, Estado) y 10 tarjetas de capacidad, cada una con ícono, badge de estado, descripción, 4 métricas (proyectos, países, unidades de negocio, tiendas activas), uso y botón "Configurar" que lleva al detalle.

Componentes: `pages/capabilities/CapabilitiesPage.tsx` + `components/{CapabilityFilters,CapabilityCard}.tsx`.
Datos: `data/capabilities.ts` (10 capacidades reales, con íconos mapeados: package, bell, dollar-sign, headset, bar-chart).

## 3. Detalle de Capacidad — `/capabilities/:id`

5 tabs: Resumen, Reglas de Negocio, Flujos Agénticos, Solicitudes, Observabilidad.

- **Resumen**: información básica, owner, versión, proyecto/ambiente, API key enmascarada, propósito (objetivo + descripción funcional).
- **Reglas de Negocio**: políticas de negocio (con estado activo/inactivo), glosario de términos, acciones rápidas.
- **Flujos Agénticos**: tabla de flujos (nombre, descripción, tipo de ejecución, estado, última actualización).
- **Solicitudes**: tabla de solicitudes de servicio (ID, tipo, solicitante, categoría, a quién se envió, estado, mensajes).
- **Observabilidad**: 4 métricas (solicitudes 7d, tasa de éxito, tiempo promedio, errores), gráfico de solicitudes por día, tabla de conversaciones.

Componentes: `pages/capabilities/CapabilityDetailPage.tsx` + `pages/capabilities/detail/*Tab.tsx`.
Datos: `data/capability-detail.ts` (un solo fixture rico, reusado para las 10 capacidades — ver limitación abajo).

### ⚠️ Limitación conocida (heredada de la referencia)

En el Figma Site original, el detalle **siempre muestra el mismo contenido de ejemplo** ("Descuentos de Precio"/"Consulta de Productos" mezclados) sin importar qué tarjeta se abra desde el listado — es un bug/limitación del propio prototipo, no del portado. El mock reproduce ese mismo comportamiento a propósito (solo el nombre/descripción/estado del encabezado cambian según la capacidad elegida). Si se necesita contenido propio por capacidad, es la siguiente unidad de trabajo pendiente — ver [[03 - Decisiones y pendientes]].

## 4. Administración — `/administration`

"Usuarios y Permisos": tabla de usuarios (Juan Pérez, María González) con rol/productos/países/estado, tarjetas de Roles (Administrador de Plataforma, Administrador de Negocio) con su lista de permisos, y Matriz de Permisos (6 permisos × 2 roles, con indicador verde/gris).

Componentes: `pages/administration/AdministrationPage.tsx` + `components/{UsersTable,RolesSection,PermissionMatrix}.tsx`.
Datos: `data/administration.ts`.

## 5. Configuración — `/settings`

Perfil de usuario: avatar, nombre, miembro desde, correo, rol, ID de usuario, último acceso, botón "Cerrar Sesión".

Componentes: `pages/settings/SettingsPage.tsx`.
Datos: `data/profile.ts`.
