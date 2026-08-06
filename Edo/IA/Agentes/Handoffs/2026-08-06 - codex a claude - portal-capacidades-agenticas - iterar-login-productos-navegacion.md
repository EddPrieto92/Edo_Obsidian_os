---
tipo: handoff
estado: cerrado
origen: codex
destino: claude
proyecto: "portal-capacidades-agenticas"
tarea: "iterar-login-productos-navegacion"
fecha: 2026-08-06
base: "release/eihwazos-v0.4.0 / commit 3e8526a de la iteracion local"
commit_resultado: "d543e1f (repo propio de portal-capacidades-agenticas)"
---

# Handoff — Portal de Capacidades Agénticas — login, productos y navegación

## Resultado (Claude, 2026-08-06)

Implementado completo en `portal-capacidades-agenticas`, commit `d543e1f`. Las 6 iteraciones se hicieron en una sola pasada (el alcance no ameritaba dividir sesiones):

- `/login` con acceso de un clic (`src/app/auth.ts` + `src/app/screens/Login.tsx`), sesión simulada en `sessionStorage`, sin credenciales reales. `AuthenticatedApp` en `App.tsx` redirige a `/login` si no hay sesión.
- Fixtures nuevos en `src/app/data/products.ts` (`Product`, `CapabilitySummary`) con el catálogo pedido: Mi Local (Consulta de Productos, Alerta de Recepción de Mercadería, Alerta de Found Rate, Baja de Precio) y SIP / PMO (Manuales, PMO).
- `Layout.tsx` reescrito: sidebar con grupo "Productos" expandible (clic navega a `/products` y alterna; el chevron solo alterna), árbol de 2 niveles (producto → capacidad), estado activo por ruta, auto-expand al entrar a `/products*` o `/capabilities*`. Breadcrumb reescrito para resolver nombres reales desde los fixtures en cada segmento en vez de solo capitalizar el slug.
- `Products.tsx` (listado, filtros visuales sin funcionalidad, grid/lista) y `ProductDetail.tsx` (nuevo, tabs Resumen/API keys/Proyectos/Uso y Métricas/Historial de Auditoría/Roles y permisos — solo Resumen tiene contenido real con la lista de capacidades; el resto renderiza un placeholder informativo).
- `CapabilityDetail.tsx`: ahora lee `capabilityId` o `id` de la ruta, resuelve nombre/descripción/producto desde el fixture y los usa en el `<h1>`, el botón "Volver a {producto}" y la card Información. Ruta legacy `/capabilities/:id` se mantiene como alias — funciona igual que `/products/:productId/capabilities/:capabilityId`. Si el id no existe en el fixture, muestra un estado "Capacidad no encontrada" con link a Productos, en vez de contenido genérico engañoso. **No se tocó** el resto del detalle (los 5 tabs y su contenido interno siguen siendo el fixture genérico de "Baja de Precios" tal como pedía el handoff).
- `Settings.tsx`: el botón "Cerrar Sesión" ahora llama a `logout()` y navega a `/login`.

Verificado manualmente en navegador (Chrome vía automatización): login → Overview → expandir Productos en el sidebar → entrar a una capacidad vía el árbol → breadcrumb y header correctos → `/products` → `/products/mi-local` (tabs, lista de capacidades) → alias `/capabilities/consulta-productos` resuelve el mismo producto → `/capabilities/no-existe` muestra el estado de no encontrado → logout vuelve a `/login`. `npm run build` sin errores. Este proyecto no tiene script `lint` definido en `package.json` (solo `dev`/`build`), así que ese criterio no aplica tal como está el repo hoy.

Pendiente explícito (no se tocó, fuera de alcance de esta entrega): contenido interno del detalle de capacidad más allá de nombre/descripción/producto, nombre definitivo de `SIP / PMO`, si `Baja de Precio` debe ocultarse de la navegación, y si las tabs de `ProductDetail` son definitivas o solo referencia visual — quedan como decisiones abiertas listadas en el handoff original.

## Objetivo

Iterar la navegación del portal tomando como referencia los ejemplos adjuntos:

1. agregar un login estándar de entrada;
2. continuar directamente al Overview sin solicitar credenciales reales;
3. agregar una nueva capa de **Productos**;
4. mostrar Productos y sus Capacidades como árbol desplegable desde el sidebar;
5. permitir entrar desde un producto/capacidad al Detalle de Capacidad;
6. conservar por ahora la estructura de Detalle de Capacidad validada en 0.4.0.

Esta iteración es de arquitectura de información y navegación. No busca todavía implementar backend, autenticación real, permisos reales ni nuevos casos de negocio.

## Alcance y límites

### Sí entra en esta iteración

- Pantalla de login visual.
- Acceso simulado mediante un único botón.
- Overview como destino posterior al login.
- Sidebar con navegación jerárquica.
- Nueva sección Productos.
- Productos agrupando capacidades.
- Rutas navegables producto → capacidad → detalle.
- Fixtures genéricos para productos y capacidades.
- Breadcrumbs coherentes con la jerarquía.

### No entra en esta iteración

- Login real, validación de correo o SSO.
- Backend, persistencia o autorización real.
- Implementación de casos específicos de Baja de Precio.
- Diseño de reglas, parámetros o datos comerciales de Baja de Precio.
- Nuevos tabs dentro del Detalle de Capacidad.
- Tab Schemas o Schema Workbench.
- Reorganización del contenido interno del detalle 0.4.0.

La capacidad **Baja de Precio** puede permanecer en el fixture de navegación si se necesita representar el catálogo completo, pero no debe utilizarse como caso de validación ni recibir contenido funcional nuevo en esta iteración.

## Fuente de referencia

- Handoff base: `2026-08-06 - claude a codex - portal-capacidades-agenticas - iterar-detalle-capacidad.md`.
- Referencia de interacción: `Edo/Cencosud/Applied IA/Portal de Capacidades/04 - Referencia Figma Make (interacciones y estilos).md`.
- Ejemplos adjuntos por el usuario:
  - login split-screen con imagen abstracta y botón «Ingresa con tu correo Cencosud»;
  - árbol conceptual de navegación;
  - listado de Productos;
  - listado de Capacidades;
  - detalle de una capacidad.

## Arquitectura de información objetivo

```text
Login
  └── Overview / Resumen

Sidebar
├── Resumen
├── Productos
│   ├── Mi Local
│   │   ├── Agente - Consulta producto
│   │   ├── Agente - Alerta de recepción de mercadería
│   │   ├── Agente - Alerta de Found Rate
│   │   └── Agente - Baja de precio [fuera de alcance funcional]
│   └── SIP / PMO
│       ├── Agente - Manuales
│       └── Agente - PMO
├── Administración
└── Configuración
```

La etiqueta visible puede ser «Capacidades» aunque el nodo padre sea un Producto. La jerarquía debe hacer evidente que una capacidad pertenece a un producto.

## Rutas propuestas

```text
/login
/
/products
/products/:productId
/products/:productId/capabilities/:capabilityId
/capabilities/:capabilityId       // conservar como alias de compatibilidad si ya existe
/administration
/settings
```

Comportamiento esperado:

- `/login` muestra el login simulado.
- El botón de acceso establece una sesión local mínima y navega a `/`.
- `/` muestra el Overview.
- `/products` muestra el catálogo de productos.
- `/products/:productId` muestra el producto y sus capacidades.
- Seleccionar una capacidad abre su detalle.
- El detalle mantiene los cinco tabs de 0.4.0: `Resumen`, `Reglas de Negocio`, `Flujos Agénticos`, `Solicitudes`, `Observabilidad`.

## Iteraciones de implementación

### Iteración 1 — Login estándar

Crear una pantalla `/login` inspirada en el ejemplo adjunto:

- composición de dos columnas en desktop;
- lado visual con imagen/gradiente abstracto;
- lado claro con marca o nombre del portal;
- botón único: «Ingresa con tu correo Cencosud»;
- sin campos de correo, contraseña ni validaciones;
- acceso simulado al hacer clic;
- redirección a `/`.

Estado mínimo permitido:

```ts
const [isAuthenticated, setIsAuthenticated] = useState(false)
```

Puede usarse `sessionStorage` para que el flujo sobreviva a una recarga durante la sesión local, pero no debe presentarse como autenticación real.

Criterios de aceptación:

- abrir `/login` permite completar el flujo con un solo clic;
- después del clic se ve Overview;
- no aparecen errores ni formularios innecesarios;
- el logout, si ya existe en Configuración, solo limpia la sesión simulada y vuelve a `/login`.

### Iteración 2 — Shell y sidebar jerárquico

Modificar el layout global para que Productos sea un grupo expandible, no solo un enlace plano.

Requisitos:

- Resumen como enlace directo a `/`;
- Productos con estado expandido/colapsado;
- Mi Local y SIP / PMO como segundo nivel;
- capacidades como tercer nivel;
- cada nivel navegable cuando corresponda;
- indicador visual de expansión;
- estado activo para producto y capacidad actuales;
- mantener Administración y Configuración como enlaces directos;
- conservar el comportamiento responsive y el sidebar colapsable existente.

Decisión de interacción:

- clic en «Productos» navega a `/products` y alterna el grupo;
- clic en el chevron alterna solo la expansión;
- clic en un producto navega a `/products/:productId`;
- clic en una capacidad navega al detalle de esa capacidad.

### Iteración 3 — Modelo mock de productos y capacidades

Separar los datos de navegación de los datos internos del detalle.

Crear o reorganizar fixtures similares a:

```ts
type Product = {
  id: string
  name: string
  description: string
  status: 'active' | 'inactive'
  capabilities: string[]
  projects: number
  countries: number
  usage: string
}

type CapabilitySummary = {
  id: string
  productId: string
  name: string
  label: string
  description: string
  status: 'active' | 'inactive'
}
```

Fixture inicial:

```text
Mi Local
- Consulta de Productos
- Alerta de Recepción de Mercadería
- Alerta de Found Rate
- Baja de Precio (solo navegación)

SIP / PMO
- Manuales
- PMO
```

No crear reglas de negocio específicas para estas capacidades todavía. El contenido de detalle puede reutilizar un fixture genérico mientras se valida la navegación.

### Iteración 4 — Vista Productos

Implementar `/products` tomando como referencia la captura adjunta de Productos.

Contenido mínimo:

- breadcrumb `Inicio / Productos`;
- título `Productos`;
- descripción orientada a configurar capacidades de negocio;
- filtros mock visuales: Producto/Proyecto, País y Estado;
- cambio de vista grilla/lista si ya está presente en la base;
- cards o filas de producto con estado, descripción, cantidad de capacidades y uso;
- acción «Configurar» o equivalente para entrar al producto.

La vista no necesita filtros funcionales si la base actual tampoco los implementa, pero la interacción visual debe ser consistente y no prometer persistencia.

### Iteración 5 — Vista Detalle de Producto

Implementar `/products/:productId` como contenedor del producto.

Contenido recomendado, inspirado en la captura:

- header con nombre, estado y descripción del producto;
- breadcrumb `Inicio / Productos / {producto}`;
- tabs visuales del producto, inicialmente:
  - Resumen;
  - API keys;
  - Proyectos;
  - Uso y Métricas;
  - Historial de Auditoría;
  - Roles y permisos;
- sección principal con capacidades asociadas;
- cada capacidad debe tener acceso claro al detalle.

Si alguna tab no tiene comportamiento real, renderizar un estado informativo o contenido mock mínimo. No inventar configuraciones técnicas complejas en esta fase.

### Iteración 6 — Entrada al Detalle de Capacidad 0.4.0

Conectar las tarjetas/listas de capacidades con el detalle existente.

Preservar:

- header y breadcrumb;
- selector de rol si ya existe;
- tabs de 0.4.0;
- drawers y patrones de interacción existentes;
- visibilidad de tabs por rol definida en la referencia publicada.

Solo adaptar:

- nombre del producto en el breadcrumb;
- nombre y descripción de la capacidad según el fixture seleccionado;
- navegación de regreso al producto;
- estado activo del árbol lateral.

No reabrir la discusión de `Flujos y reglas` / `Parámetros y datos` en esta entrega: esa variante está archivada y no es la estructura objetivo actual.

## Criterios de aceptación integrales

1. Un usuario puede abrir `/login`, pulsar un único botón y llegar a Overview.
2. Desde Overview puede abrir Productos.
3. El sidebar muestra Productos como árbol expandible.
4. El árbol muestra Mi Local y SIP / PMO con sus capacidades.
5. El usuario puede navegar directamente desde una capacidad del sidebar al detalle.
6. Desde `/products` puede abrir un producto.
7. Desde el detalle del producto puede abrir una capacidad.
8. El breadcrumb refleja la ruta actual.
9. El detalle de capacidad conserva la estructura de cinco tabs de 0.4.0.
10. No se implementan ni se validan casos específicos de Baja de Precio.
11. Las rutas directas no producen pantallas rotas ni contenido de otra capacidad de forma engañosa.
12. `npm run build` y `npm run lint` quedan ejecutables al finalizar.

## Orden recomendado de trabajo

```text
Login
  ↓
Shell + sidebar jerárquico
  ↓
Fixtures de productos/capacidades
  ↓
Listado Productos
  ↓
Detalle Producto
  ↓
Conexión Producto → Capacidad
  ↓
QA de navegación y build
```

## Riesgos y decisiones pendientes

- Definir si el nombre final del producto es `SIP / PMO` o si debe separarse en `SIP` y `PMO`.
- Confirmar si `Baja de precio` se muestra en el árbol solo como capacidad catalogada o si se oculta temporalmente de la navegación.
- Confirmar si el producto tiene tabs propias definitivas o si la captura es solo referencia visual.
- Mantener el mock local como terreno de iteración; portar a `VernoVentures/mock` solo después de validar la navegación.
- Evitar mezclar la capa Producto con la administración global del portal: Producto agrupa y contextualiza capacidades; Administración gestiona usuarios, roles y permisos.

## Resultado esperado para esta entrega

Un prototipo navegable con esta secuencia:

```text
Login simulado
  → Overview
  → Productos
  → Mi Local / SIP-PMO
  → Capacidad seleccionada
  → Detalle de Capacidad 0.4.0
```

La próxima iteración de contenido debe comenzar después con las capacidades que el usuario priorice, no con Baja de Precio por defecto.

