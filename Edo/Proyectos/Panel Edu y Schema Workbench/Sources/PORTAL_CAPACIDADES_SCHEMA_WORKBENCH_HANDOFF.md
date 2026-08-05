# Handoff — Second Brain y Schema Workbench para el Portal de Capacidades

> Documento portable para continuar el diseño y la implementación en otro hilo o en Visual Studio Code.
>
> Fecha: 2026-08-03  
> Estado: propuesta funcional y técnica; no representa funcionalidad ya implementada.

## 1. Resumen ejecutivo

Se quiere extender el **Portal de Capacidades Agénticas** con un nuevo tab dentro del detalle de cada capacidad. Ese tab permitirá:

1. navegar las definiciones de schemas y artefactos asociados;
2. inspeccionar y configurar un schema seleccionado;
3. visualizar sus relaciones como un workflow o grafo de nodos;
4. vincular cada artefacto con su nota o archivo fuente en Obsidian;
5. preparar una futura operación local, versionada y sincronizable entre equipos.

La experiencia toma dos referencias principales:

- el patrón de tres planos de trabajo de OpenAI Platform: navegación persistente, panel de configuración y superficie principal;
- el uso de nodos personalizados de React Flow para transformar una configuración compleja en una interfaz visual e interactiva.

El objetivo del primer corte no es construir un editor no-code completo. Es ofrecer una **vista confiable, navegable y principalmente de lectura** sobre los schemas y sus relaciones. La edición visual, la sincronización bidireccional y la ejecución de workflows quedan para etapas posteriores.

## 2. Contexto aportado por el usuario

### 2.1 Visión de Second Brain

- Una interfaz SaaS simple para navegar el contenido del Second Brain.
- Tres columnas funcionales:
  - navegación;
  - contenido o configuración principal;
  - contenido secundario visualizado como diagrama/workflow.
- Contenido mantenido en árboles de carpetas y archivos Markdown.
- Posible trabajo en distintos equipos, por ejemplo Mac y Windows.
- Necesidad futura de conocer la última versión y sincronizar al iniciar cada equipo.
- Obsidian es la fuente o interfaz de conocimiento a la que deben quedar vinculados los nodos.

### 2.2 Contexto del Portal de Capacidades

La referencia visual muestra una pantalla de detalle de capacidad con:

- rail global lateral;
- encabezado y breadcrumbs;
- nombre, estado, owner y versión de la capacidad;
- selector de perfil;
- tabs como `Resumen`, `Reglas de Negocio`, `Flujos Agénticos`, `Solicitudes` y `Observabilidad`;
- contenido organizado en cards claras, con jerarquía tipográfica sobria y acento azul.

La propuesta agrega un tab llamado provisionalmente **Schemas**. El nombre final puede cambiar a `Configuración`, `Modelo`, `Schemas y memoria` o `Arquitectura`, pero se recomienda **Schemas** mientras el alcance sea específicamente técnico.

### 2.3 Contexto no disponible

En el material local de este hilo no se encontró la definición previa de los schemas mencionados por el usuario. Por lo tanto:

- no se debe inventar su estructura definitiva;
- los contratos de datos de este documento son una base extensible;
- antes de implementar persistencia o validación hay que recuperar los schemas originales y mapearlos contra esta propuesta.

## 3. Evidencia observada y decisiones propuestas

### 3.1 Patrones observados en OpenAI Platform

De las capturas entregadas se observan estos patrones reutilizables:

- shell persistente con navegación lateral;
- contexto del proyecto siempre visible;
- encabezado compacto con acciones globales;
- panel de configuración dividido en secciones colapsables;
- controles densos pero alineados y fáciles de escanear;
- superficie principal amplia para el resultado o interacción;
- acción primaria con contraste alto;
- estados vacíos explícitos;
- uso consistente de bordes sutiles, fondos neutros y radios moderados;
- edición y preview conviven sin obligar a cambiar de ruta;
- elementos secundarios no compiten con el objeto principal.

### 3.2 Decisiones propuestas para el portal

- Mantener el shell visual del Portal de Capacidades; no copiar literalmente el tema oscuro de OpenAI Platform.
- Adoptar su **arquitectura de interacción**, no su branding.
- Mantener el header y los tabs actuales de la capacidad por encima del workbench.
- Dentro del tab `Schemas`, usar tres paneles redimensionables:
  1. **Explorador**;
  2. **Configuración**;
  3. **Grafo**.
- Conservar el rail global existente como chrome del producto; no cuenta como uno de los tres paneles del workbench.
- Permitir colapsar los paneles 1 y 2 para dar más espacio al grafo.
- Empezar con lectura y navegación. Cualquier escritura al vault debe ser explícita, reversible y auditada.

## 4. Arquitectura de información

### 4.1 Ubicación

Ruta conceptual:

```text
Inicio / Capacidades / {capabilityId} / Schemas
```

URL sugerida si el proyecto usa rutas anidadas:

```text
/capabilities/:capabilityId/schemas
```

### 4.2 Jerarquía de pantalla

```text
Portal shell
├── Rail global
├── Header global
└── Detalle de capacidad
    ├── Breadcrumbs
    ├── Identidad de la capacidad
    ├── Tabs
    └── Tab Schemas
        ├── Toolbar contextual
        └── Workbench de tres paneles
            ├── Explorador
            ├── Configuración
            └── Grafo / workflow
```

### 4.3 Toolbar contextual

Controles recomendados:

- breadcrumb interno del schema seleccionado;
- estado de conexión con el vault: `Desconectado`, `Leyendo`, `Actualizado`, `Desactualizado`, `Error`;
- versión o commit conocido;
- `Actualizar`;
- `Abrir en Obsidian`;
- menú secundario con `Centrar grafo`, `Restablecer layout` y futura exportación.

No mostrar acciones de `Publicar`, `Sincronizar` o `Guardar` hasta que exista una política clara de persistencia y permisos.

## 5. Layout de tres paneles

### Panel 1 — Explorador

Ancho inicial recomendado: `260–300 px`.

Responsabilidad:

- buscar schemas, carpetas o notas;
- filtrar por tipo, estado, owner o tag;
- navegar el árbol del vault o un índice derivado;
- indicar qué elemento está seleccionado;
- mostrar conteos y estados sin sobrecargar la lista.

Estructura:

```text
[Buscar…]
[Todos] [Schemas] [Notas] [Templates]

▾ Capacidad: Descuentos de Precio
  ▾ Schemas
    • discount-request.schema
    • pricing-policy.schema
  ▾ Workflows
    • request-price-change
  ▾ Notes
    • Contexto comercial
    • Reglas y excepciones
```

### Panel 2 — Configuración

Ancho inicial recomendado: `360–440 px`.

Responsabilidad:

- mostrar metadatos del elemento seleccionado;
- presentar la estructura del schema en secciones colapsables;
- separar lectura, validación y futura edición;
- exponer enlaces a fuente, versión y dependencias.

Secciones sugeridas:

- General;
- Identidad y versión;
- Campos;
- Reglas y validaciones;
- Relaciones;
- Fuente Obsidian;
- Historial;
- Diagnóstico.

Patrón visual:

- labels pequeños y neutros;
- valores con mayor contraste;
- inputs compactos;
- secciones colapsables;
- errores junto al campo y resumen superior;
- footer fijo solo si existe una acción de guardado real.

### Panel 3 — Grafo / workflow

Ancho: flexible, ocupa todo el espacio restante. Mínimo recomendado: `520 px` en desktop.

Responsabilidad:

- representar la relación entre schemas, notas, workflows y salidas;
- permitir seleccionar un nodo y reflejarlo en el panel 2;
- permitir abrir el archivo fuente en Obsidian;
- mostrar estado, tipo y dirección de las relaciones;
- ofrecer zoom, paneo, fit view y minimapa cuando el grafo sea grande.

Estado vacío:

```text
Selecciona un schema para visualizar sus relaciones.
```

Estado sin relaciones:

```text
Este schema todavía no tiene relaciones indexadas.
[Abrir archivo fuente]
```

## 6. Modelo visual del grafo

### 6.1 Tipos de nodo iniciales

| Tipo | Propósito | Contenido mínimo |
|---|---|---|
| `capability` | raíz del contexto | nombre, versión, estado |
| `schema` | definición estructural | nombre, versión, número de campos, validez |
| `workflow` | flujo agéntico relacionado | nombre, estado, cantidad de pasos |
| `note` | conocimiento en Obsidian | título, path, fecha de modificación |
| `template` | plantilla reutilizable | nombre, tipo, versión |
| `rule` | regla o validación | nombre, severidad, resultado |
| `source` | carpeta, repositorio o vault | ubicación lógica, estado de lectura |
| `output` | artefacto producido | formato, destino, estado |

### 6.2 Tipos de relación

| Relación | Significado |
|---|---|
| `contains` | el origen contiene al destino |
| `references` | el origen enlaza o cita al destino |
| `depends_on` | el origen necesita al destino |
| `validates` | el origen valida al destino |
| `produces` | el origen genera al destino |
| `inherits` | el origen extiende otra definición |
| `syncs_to` | existe un destino de sincronización |
| `used_by` | el schema es consumido por otro artefacto |

### 6.3 Anatomía de un nodo

Cada nodo debe ser un componente React personalizado, con:

- icono por tipo;
- título truncado a dos líneas;
- badge de estado;
- metadatos esenciales, no el schema completo;
- handles diferenciados por entrada y salida;
- menú contextual discreto;
- estados visuales `default`, `hover`, `selected`, `warning`, `error`, `stale`;
- acción `Abrir en Obsidian` cuando exista `obsidianUri`.

El detalle completo vive en el panel 2, no dentro del nodo.

### 6.4 Dirección y layout

- Dirección por defecto: izquierda → derecha.
- La capacidad o fuente aparece al inicio.
- Los schemas ocupan el centro.
- Workflows, consumidores y outputs se ubican a la derecha.
- Notas y reglas secundarias pueden agruparse arriba o abajo.
- Para el MVP, calcular layout automáticamente al cargar y permitir movimiento manual no persistente.
- La posición manual persistente es una mejora posterior.

## 7. Contrato de datos inicial

Este contrato es deliberadamente genérico hasta recuperar los schemas originales.

```ts
type ArtifactKind =
  | 'capability'
  | 'schema'
  | 'workflow'
  | 'note'
  | 'template'
  | 'rule'
  | 'source'
  | 'output';

type ArtifactStatus =
  | 'active'
  | 'draft'
  | 'valid'
  | 'warning'
  | 'error'
  | 'stale'
  | 'unknown';

interface KnowledgeArtifact {
  id: string;
  kind: ArtifactKind;
  title: string;
  description?: string;
  status: ArtifactStatus;
  version?: string;
  owner?: string;
  tags?: string[];
  vaultId?: string;
  vaultRelativePath?: string;
  obsidianUri?: string;
  updatedAt?: string;
  contentHash?: string;
  schema?: Record<string, unknown>;
  metadata?: Record<string, unknown>;
}

type RelationKind =
  | 'contains'
  | 'references'
  | 'depends_on'
  | 'validates'
  | 'produces'
  | 'inherits'
  | 'syncs_to'
  | 'used_by';

interface KnowledgeRelation {
  id: string;
  sourceId: string;
  targetId: string;
  kind: RelationKind;
  label?: string;
  metadata?: Record<string, unknown>;
}

interface CapabilityKnowledgeGraph {
  capabilityId: string;
  sourceVersion?: string;
  indexedAt: string;
  artifacts: KnowledgeArtifact[];
  relations: KnowledgeRelation[];
  diagnostics?: {
    level: 'info' | 'warning' | 'error';
    artifactId?: string;
    message: string;
  }[];
}
```

## 8. Integración con Obsidian

### 8.1 Principio

La UI no debe depender directamente de una única forma de acceder a Obsidian. Debe consumir una interfaz `VaultAdapter` para que el origen pueda cambiar sin reescribir el workbench.

```ts
interface VaultAdapter {
  connect(): Promise<void>;
  getStatus(): Promise<'disconnected' | 'ready' | 'stale' | 'error'>;
  listArtifacts(capabilityId: string): Promise<KnowledgeArtifact[]>;
  getArtifact(id: string): Promise<KnowledgeArtifact>;
  getRelations(capabilityId: string): Promise<KnowledgeRelation[]>;
  refresh(): Promise<void>;
  openInObsidian?(artifact: KnowledgeArtifact): Promise<void>;
}
```

### 8.2 Opciones de implementación

#### Opción A — Índice JSON generado localmente (recomendada para MVP)

- Un proceso local lee el vault y genera un snapshot JSON normalizado.
- El front consume ese snapshot.
- La UI permanece read-only.
- Es simple de probar y desacopla el parser del canvas.
- El snapshot puede incluir hash, versión y fecha de indexación.

#### Opción B — Backend local que observa el vault

- Un servicio local observa cambios en carpetas Markdown.
- Expone datos normalizados al front.
- Permite refresco y diagnóstico casi en tiempo real.
- Requiere resolver permisos, rutas por sistema operativo y ciclo de vida del servicio.

#### Opción C — Plugin de Obsidian como puente

- Un plugin usa la API oficial de Vault dentro de Obsidian.
- Expone solo las operaciones necesarias al portal.
- Es apropiado para integración profunda, pero aumenta el alcance y la superficie de seguridad.

### 8.3 Apertura de archivos

Para abrir una nota desde el nodo se puede construir un Obsidian URI:

```text
obsidian://open?vault={vaultEncoded}&file={vaultRelativePathEncoded}
```

Los parámetros deben codificarse correctamente. El URI permite abrir el vault o una nota, pero no sustituye un mecanismo de lectura o sincronización.

### 8.4 Restricciones importantes

- Un front web común no debe asumir acceso libre al sistema de archivos local.
- Nunca exponer rutas absolutas, tokens, secretos o API keys en nodos o snapshots compartidos.
- Los paths persistidos deben ser relativos al vault.
- La escritura debe exigir confirmación y mostrar exactamente qué archivo cambiará.
- En el MVP, no borrar, mover ni renombrar archivos desde el grafo.
- `Actualizar índice` y `Sincronizar repositorio` son acciones distintas.

## 9. Versionado y sincronización

Separar tres conceptos:

1. **Versión del artefacto**: versión declarada en frontmatter o schema.
2. **Versión del índice**: hash y fecha del último snapshot leído por el portal.
3. **Versión del repositorio**: commit o tag del mecanismo externo de sincronización.

Estado sugerido en UI:

| Estado | Significado |
|---|---|
| `Actualizado` | snapshot y fuente coinciden |
| `Cambios locales` | hay archivos modificados no indexados o no versionados |
| `Remoto disponible` | existe una versión posterior, si el adaptador puede verificarla |
| `Conflicto` | hay cambios incompatibles; no resolver automáticamente |
| `Desconocido` | no se pudo comprobar el origen |

No ejecutar sincronización automática al iniciar durante el MVP. Primero mostrar el estado y permitir una acción explícita. La automatización puede añadirse cuando estén definidos el repositorio autoritativo, la resolución de conflictos y el modelo de permisos.

## 10. Interacciones principales

### Caso 1 — Explorar un schema

1. El usuario entra a una capacidad.
2. Abre el tab `Schemas`.
3. El portal carga el índice disponible.
4. El usuario selecciona un schema en el explorador.
5. El panel central muestra su configuración.
6. El grafo centra y resalta el nodo y sus relaciones de primer nivel.

Resultado: el usuario entiende definición, estado, origen y dependencias sin abandonar la capacidad.

### Caso 2 — Navegar desde una relación

1. El usuario selecciona un nodo conectado en el grafo.
2. El explorador sincroniza la selección.
3. El panel central muestra el artefacto seleccionado.
4. El resto del grafo baja de énfasis, conservando el contexto.

Resultado: exploración bidireccional lista ↔ grafo.

### Caso 3 — Abrir en Obsidian

1. El usuario selecciona una nota o schema con vínculo válido.
2. Presiona `Abrir en Obsidian`.
3. El portal invoca el URI codificado.
4. Obsidian abre el vault y archivo correspondiente.

Resultado: el portal funciona como mapa; Obsidian sigue siendo el espacio de edición del conocimiento.

### Caso 4 — Revisar problemas

1. El índice detecta un vínculo roto, schema inválido o versión antigua.
2. El nodo y la lista muestran un estado de advertencia.
3. Al seleccionarlo, `Diagnóstico` explica el problema y su fuente.
4. La UI ofrece abrir el archivo, no corregirlo silenciosamente.

Resultado: problemas visibles y trazables.

## 11. Estados que deben diseñarse

- carga inicial;
- vault desconectado;
- permiso denegado;
- índice vacío;
- schema sin relaciones;
- schema válido;
- schema con warnings;
- schema inválido;
- vínculo roto;
- snapshot desactualizado;
- error de parseo de frontmatter o JSON/YAML;
- selección de nodo;
- panel colapsado;
- grafo demasiado grande;
- Obsidian no instalado o URI no atendido.

## 12. Criterios visuales

### Mantener del Portal de Capacidades

- fondo claro;
- acento azul;
- cards y paneles con borde gris sutil;
- tipografía y escala actuales;
- badges semánticos;
- densidad moderada;
- breadcrumbs, tabs y contexto de capacidad existentes.

### Adoptar como patrón de OpenAI Platform

- configuración junto al resultado;
- paneles colapsables;
- controles alineados y predecibles;
- acciones globales fuera del cuerpo del formulario;
- estados vacíos claros;
- foco en una superficie principal amplia;
- progressive disclosure.

### Evitar

- copiar literalmente colores, textos o branding de OpenAI;
- llenar cada nodo con formularios completos;
- usar color como único indicador de estado;
- líneas animadas permanentes sin significado operativo;
- minimapa en grafos pequeños;
- paneles modales para navegación rutinaria;
- esconder errores de conexión o sincronización.

## 13. Accesibilidad y comportamiento responsive

- Navegación completa por teclado entre lista, configuración y grafo.
- Foco visible y contraste AA.
- Labels accesibles para handles, controles de zoom y menús.
- Estado expresado con texto o icono además de color.
- Alternativa tabular accesible al grafo.
- En anchos menores a `1200 px`, permitir colapsar el explorador.
- En tablet, mostrar `Explorador | Configuración | Grafo` como vistas conmutables.
- En móvil, no intentar mantener tres columnas simultáneas.

## 14. Recomendación técnica para React Flow

Usar el paquete actual `@xyflow/react` y mantener el estado del grafo controlado.

Estructura de componentes sugerida:

```text
CapabilitySchemasPage
├── SchemaWorkbenchToolbar
└── ResizableSchemaWorkbench
    ├── ArtifactExplorer
    ├── ArtifactInspector
    └── KnowledgeGraph
        ├── ReactFlow
        ├── nodeTypes
        │   ├── CapabilityNode
        │   ├── SchemaNode
        │   ├── WorkflowNode
        │   ├── NoteNode
        │   └── DiagnosticNode
        ├── edgeTypes
        │   └── RelationEdge
        ├── Controls
        ├── Background
        └── MiniMap (condicional)
```

Notas de implementación:

- declarar `nodeTypes` y `edgeTypes` fuera del componente para evitar recrearlos;
- asignar ids únicos a múltiples handles;
- usar `nodrag` en botones e inputs dentro de nodos;
- usar `nowheel` en contenido interno scrollable;
- no recalcular todo el grafo por cada hover;
- renderizar el detalle en el inspector, no duplicarlo dentro de cada nodo;
- activar renderizado de elementos visibles y clustering si el volumen lo exige;
- separar modelo de dominio, layout y representación de React Flow.

## 15. Alcance recomendado por fases

### Fase 0 — Recuperar contratos

- localizar los schemas revisados anteriormente;
- inventariar formatos reales: JSON Schema, YAML, Markdown/frontmatter u otros;
- definir identificadores estables;
- confirmar vault, carpetas y convención de links.

### Fase 1 — Prototipo con fixtures

- tab `Schemas` dentro de una capacidad;
- workbench de tres paneles;
- datos mock tipados;
- selección sincronizada entre lista, inspector y grafo;
- cinco tipos de nodo como máximo;
- estados vacío, carga y error;
- sin escritura ni sincronización real.

### Fase 2 — Integración read-only

- `VaultAdapter` real;
- índice local;
- parseo de frontmatter y links;
- Obsidian URI;
- diagnósticos y estado de actualización.

### Fase 3 — Versionado y validación

- hashes y versión de fuente;
- validación contra schemas reales;
- historial de indexación;
- comparación entre versión local y autoritativa.

### Fase 4 — Edición controlada

- cambios explícitos con preview de diff;
- confirmación por archivo;
- backup o commit recuperable;
- resolución de conflictos;
- permisos y auditoría.

## 16. Criterios de aceptación del MVP

- Existe un tab `Schemas` en el detalle de una capacidad.
- El tab muestra tres paneles claramente diferenciados.
- El explorador permite buscar y seleccionar artefactos.
- La configuración cambia al seleccionar desde lista o grafo.
- El grafo usa nodos personalizados y relaciones tipadas.
- La capacidad seleccionada mantiene su contexto y breadcrumb.
- Un nodo con `obsidianUri` ofrece `Abrir en Obsidian`.
- La ausencia de Obsidian o de datos tiene un estado comprensible.
- No se escriben ni eliminan archivos del vault.
- No se muestran secretos ni rutas absolutas.
- Existe una vista alternativa en lista o tabla para las relaciones.
- Los datos mock se reemplazan mediante un adapter, sin acoplar el grafo al origen.

## 17. Preguntas pendientes para el siguiente hilo

1. ¿Dónde están los schemas originales y en qué formato viven?
2. ¿Cada capacidad tiene una carpeta raíz propia dentro del vault?
3. ¿Qué metadatos de frontmatter son obligatorios?
4. ¿Qué representa una arista hoy: wikilink, dependencia declarada, ejecución o inferencia?
5. ¿El portal será web puro, aplicación desktop o web con servicio local?
6. ¿Cuál es la fuente autoritativa de versión: Git, Obsidian Sync u otra?
7. ¿Quién puede editar, validar y publicar?
8. ¿El grafo representa conocimiento, ejecución o ambos? Se recomienda no mezclarlos sin una distinción visual explícita.
9. ¿Qué escala se espera por capacidad: decenas, cientos o miles de nodos?
10. ¿Debe existir modo oscuro o se conserva inicialmente el tema claro del portal?

## 18. Prompt de continuación para Visual Studio Code / otro hilo

```text
Necesito implementar un nuevo tab `Schemas` dentro del detalle de una capacidad del Portal de Capacidades Agénticas.

Usa como fuente de verdad el documento PORTAL_CAPACIDADES_SCHEMA_WORKBENCH_HANDOFF.md. Antes de escribir código:

1. inspecciona la estructura real del proyecto, rutas, componentes y Design System;
2. localiza cualquier definición previa de schemas;
3. informa qué componentes existentes pueden reutilizarse;
4. propone un plan corto y señala incompatibilidades con el handoff;
5. no inventes APIs, rutas ni tokens;
6. no implementes escritura o sincronización real con Obsidian en el primer corte.

Primera entrega esperada:

- tab `Schemas` integrado al detalle de capacidad;
- workbench de tres paneles: Explorador, Configuración y Grafo;
- fixtures tipados detrás de un `VaultAdapter` mock;
- grafo con `@xyflow/react` y nodos personalizados;
- selección sincronizada entre lista, inspector y grafo;
- estados de carga, vacío, error y desconectado;
- acción `Abrir en Obsidian` solo cuando exista un URI válido;
- visual consistente con el Portal de Capacidades actual;
- tests relevantes y una nota breve con decisiones y pendientes.

No copies el branding de OpenAI Platform. Reutiliza su patrón de navegación + configuración + superficie principal, manteniendo los tokens y componentes del portal.
```

## 19. Fuentes de referencia

- Artículo conceptual: [React Flow Custom Nodes: The Future of Workflow Visualization for Modern SaaS Products](https://dev.to/azimahmed/react-flow-custom-nodes-the-future-of-workflow-visualization-for-modern-saas-products-2a9o)
- Documentación oficial: [React Flow — Custom Nodes](https://reactflow.dev/learn/customization/custom-nodes)
- Documentación oficial: [React Flow — Handles](https://reactflow.dev/learn/customization/handles)
- Documentación oficial: [React Flow — Utility Classes](https://reactflow.dev/learn/customization/utility-classes)
- Referencia visual: [OpenAI Platform](https://platform.openai.com/home)
- Documentación oficial: [Obsidian URI](https://obsidian.md/help/Extending%2BObsidian/Obsidian%2BURI)
- Documentación oficial: [Obsidian Plugin API — Vault](https://docs.obsidian.md/Plugins/Vault)

## 20. Nota de alcance

Este documento mezcla dos niveles de intención relacionados, pero distintos:

- **Producto transversal:** un front simple para navegar un Second Brain versionado.
- **Caso concreto:** un Schema Workbench dentro de una capacidad agéntica.

El tab `Schemas` debe diseñarse como el primer caso utilizable del modelo transversal, no como una implementación completa de toda la plataforma de Second Brain.
