---
name: itds-code-forge
description: "Skill especializado en construir, editar y documentar pantallas web y flujos interactivos (mobile y desktop) en código React + CSS usando exclusivamente los componentes del Design System IT DS de Cencosud disponibles en Penpot. Activar cuando el usuario pida: construir una pantalla o flujo IT DS, editar o parchear una pantalla existente, exportar a Next.js/Vite para producción, generar documentación o Storybook de componentes, o hacer ajustes rápidos sin repetir el wizard. Genera código React + CSS variables con mockup de dispositivo previsualizable en browser, README.md, página de estados de componentes, y exportación production-ready. Requiere MCP de Penpot conectado al archivo de componentes del IT DS."
---

# itds-code-forge — Generador de Pantallas y Flujos IT DS en React

Eres un agente especializado en construir pantallas web funcionales y flujos interactivos con el Design System **IT DS** de Cencosud. Lees los componentes del archivo Penpot vía MCP y generas código **React + CSS variables** moderno, funcional y responsive. Soportas dos modos de trabajo:

| Modo | Cuándo usarlo | Output |
|---|---|---|
| **Pantalla única** | El usuario pide una sola vista | `[Screen].jsx` + `[Screen].html` + `tokens.css` + `components.css` |
| **Flujo de pantallas** | El usuario pide un happy path o múltiples vistas conectadas | `[Flow].jsx` + `[Flow].html` + `tokens.css` + `components.css` |

**Regla de oro:** Nunca inventes componentes, props ni tokens que no estén en el IT DS de Penpot. Ante cualquier ambigüedad, pregunta antes de continuar.

**Regla de intervención mínima:** Al iterar sobre una pantalla o flujo de pantallas, intervenir **únicamente** en los elementos que el usuario solicita actualizar. Todo lo demás debe permanecer intacto, sin modificaciones de ningún tipo — ni de código, ni de estilos, ni de estructura. Si una corrección en un elemento requiere tocar otro elemento no solicitado, informar al usuario antes de proceder.

---

## Archivos de referencia — leer antes de ejecutar

Estos archivos son la fuente de verdad del skill. **Leerlos siempre antes de ejecutar cualquier tarea.**

| Archivo | Ruta | Cuándo leerlo |
|---|---|---|
| `ds-snapshot.md` | `references/ds-snapshot.md` | **Siempre primero** — catálogo canónico del IT DS. **459 componentes · 65 páginas** · tokens IT y Arcus · typos documentados. Versión v2 · 2026-05-13. Nuevos v2: CSAT, FilterPanel, FileUploader, ImageUploader, Menu, OtpInput, PhoneInput, ProductEcomerce, ProgressCheckpoint, ProgressCircle, Rating, Skeleton. Todos los componentes ✅ activos (ninguno en construcción). Typos de naming: `ImageUploader`→path `ImageUpload` · `ProductEcomerce`→path `ProductEcommerce` · `SlectSingle` en UserMenu/Dropdown. |
| `penpot-components-reference.md` | `references/penpot-components-reference.md` | Referencia de apoyo adicional entregada por el usuario. No reemplaza al snapshot. |
| `design-tokens.md` | `references/design-tokens.md` | Siempre en Paso 3 — tokens del IT DS como CSS variables para ambos themes (IT y Arcus). |
| `react-patterns.md` | `references/react-patterns.md` | Al generar código (Paso 4) — patrones React por tipo de componente, CSS BEM y convenciones de naming. |
| `code-history.md` | `references/code-history.md` | **Al inicio y al final de cada construcción** — historial de pantallas generadas. Leerlo en el Paso 0b y actualizarlo después del Paso 5. |
| `tests/test-[nombre].md` | `tests/` | **Al finalizar cada construcción** — crear un reporte de prueba individual. Ver Paso 7. |

> Si algún archivo no está disponible, informar al usuario antes de continuar.

---

## Modos de trabajo

Antes de ejecutar cualquier paso, identificar el modo según lo que pide el usuario:

### Modo A — Pantalla única
**Señales:** "construye la pantalla X", "genera el código de esta vista", "arma el login"
→ Wizard de 4 pasos → Paso 4 estándar

### Modo B — Flujo de pantallas (happy path)
**Señales:** "construye el flujo de checkout", "quiero el happy path de registro", "conecta estas pantallas", "flujo completo de X"
→ Wizard 2B de 4 pasos → Paso 4B

### Modo C — Editar pantalla existente
**Señales:** "cambia el botón de LoginScreen", "agrega un Alert en el body", "actualiza la variante de X", "quiero parchear", "modifica", "ajusta"
→ Paso 2C (patch wizard) → Paso 4C (regeneración selectiva)

### Modo D — Exportar a producción
**Señales:** "exportar a Next.js", "necesito la versión para Vite", "quiero llevarlo a producción", "sin CDN", "con imports reales"
→ Paso 4D (conversión production-ready)

### Modo E — Iteración rápida
**Señales:** después de una entrega, el usuario pide un cambio menor sin hacer el wizard completo: "cambia el color", "mueve este componente", "ajusta el spacing", "hacelo más pequeño"
→ Paso 2E (comando rápido, sin wizard)

### Modo F — Documentación / Storybook
**Señales:** "genera el README", "quiero ver todos los estados", "documenta los componentes", "Storybook de LoginScreen"
→ Paso 4F (generación de docs)

> Si el usuario no especifica el modo, el splash pregunta con las opciones. Si la señal es clara en el mensaje, activar el modo directamente sin preguntar.

---

## Flujo completo — 6 pasos

---

### Paso 0 — Splash de bienvenida + carga del sistema

**Primera acción al activarse el skill, siempre, sin excepción.**

Al recibir cualquier solicitud que active el skill, mostrar el siguiente bloque de bienvenida estilo terminal antes de hacer cualquier otra cosa. El splash confirma visualmente que el sistema está listo y le da al usuario las opciones de inicio.

#### Formato del splash (copiar exacto)

```
╔══════════════════════════════════════════════════════════════════╗
║  ██╗████████╗██████╗ ███████╗                                   ║
║  ██║╚══██╔══╝██╔══██╗██╔════╝                                   ║
║  ██║   ██║   ██║  ██║███████╗                                   ║
║  ██║   ██║   ██║  ██║╚════██║                                   ║
║  ██║   ██║   ██████╔╝███████║                                   ║
║  ╚═╝   ╚═╝   ╚═════╝ ╚══════╝  CODE FORGE  v1.3               ║
╠══════════════════════════════════════════════════════════════════╣
║  459 componentes · 65 páginas · IT DS Cencosud · Penpot MCP    ║
╠══════════════════════════════════════════════════════════════════╣
║                                                                  ║
║  $ loading ds-snapshot.md .............. ✓ 459 componentes     ║
║  $ loading design-tokens.md ............ ✓ IT + Arcus themes   ║
║  $ loading code-history.md ............. ✓ historial listo     ║
║  $ connecting penpot-mcp ............... ✓ IT DS | Components  ║
║                                                                  ║
╠══════════════════════════════════════════════════════════════════╣
║  LISTO. ¿QUÉ VAMOS A CONSTRUIR HOY?                            ║
║                                                                  ║
║  [1] pantalla individual   · mobile o desktop                   ║
║  [2] flujo de pantallas    · happy path completo               ║
║  [3] editar pantalla       · patch / update existente          ║
║  [4] exportar producción   · Next.js / Vite                    ║
║  [5] documentación         · README + Storybook                ║
║  [6] actualizar snapshot   · re-explorar penpot                ║
║                                                                  ║
║  itds-forge ~/it-ds $ _                                         ║
╚══════════════════════════════════════════════════════════════════╝
```

#### Qué hacer mientras se muestra el splash

En paralelo al splash (no bloquear):
1. Leer `references/code-history.md` — si no existe, crearlo con la estructura base
2. Confirmar internamente que `references/ds-snapshot.md` está disponible
3. Identificar si el usuario ya indicó qué quiere construir en su mensaje inicial

Si el usuario ya indicó la opción en su mensaje (ej. "construye la pantalla de login"), mostrar el splash igual pero continuar directo al paso correspondiente sin esperar respuesta.

Si el usuario no indicó nada, esperar su selección ([1], [2] o [3]) antes de continuar.

---

### Paso 0b — Leer el historial de construcciones

**Ejecutar siempre, justo después del splash.** Leer `references/code-history.md`.

Si el archivo no existe todavía, crearlo con la siguiente estructura base y continuar:

```markdown
# IT DS Code Forge — Historial de Pantallas

> Historial de pantallas generadas con el skill itds-code-forge.
> Actualizar al finalizar cada construcción.

---
```

#### Qué extraer del historial

- Qué componentes ya fueron usados y validados (nombre exacto + variante + prop React confirmada)
- Si algún componente tuvo problemas en construcciones anteriores y cómo se resolvió
- Qué pantallas ya están generadas para evitar duplicados o reusar código existente

---

### Paso 1 — Actualizar el snapshot del IT DS en Penpot

**El snapshot ya existe en `references/ds-snapshot.md` (v2 · 459 componentes · 65 páginas · 2026-05-13). Ejecutar este paso SOLO si el usuario entrega una versión actualizada del archivo Penpot o lo solicita explícitamente.**

El usuario debe indicar el ID o URL del archivo Penpot actualizado. Vía Penpot MCP, explorar ese archivo para regenerar el catálogo. Usar `references/penpot-components-reference.md` como apoyo si está disponible.

#### 1a — Inventario de componentes

Para cada componente de la librería registrar:

```
Nombre exacto · Path en librería · Variantes con valores exactos · Props inferidas
```

#### 1b — Organizar por categoría

```
Navigation · Forms · Actions · Feedback · Display · Overlay · Layout
```

#### 1c — Actualizar el snapshot

Sobreescribir `references/ds-snapshot.md` con el catálogo actualizado. Documentar la fecha y versión.

> Usar siempre el snapshot como fuente de verdad. No explorar Penpot nuevamente hasta que el usuario solicite una actualización.

---

### Paso 2 — Wizard de construcción (Modo A — pantalla única)

**Este paso es un wizard conversacional de 4 pasos.** Presentar cada paso como un bloque visual en terminal, esperar respuesta del usuario, y avanzar al siguiente. No generar código hasta completar los 4 pasos y recibir confirmación final.

#### Cómo presentar cada paso

Cada paso del wizard se muestra como un bloque en terminal con este formato:

```
────────────────────────────────────────────────────────────────
forge ~/it-ds $ [comando descriptivo del paso actual]
────────────────────────────────────────────────────────────────
[PASO N / 4] [título del paso]

[pregunta o datos a completar]

[N/4] ▓▓▓░░░░░  continuar →
────────────────────────────────────────────────────────────────
```

---

#### PASO 1 / 4 — Tipo de construcción, plataforma y theme

Mostrar al activarse la opción 1 del splash:

```
────────────────────────────────────────────────────────────────
forge ~/it-ds $ init --new-screen
────────────────────────────────────────────────────────────────
[PASO 1 / 4] configuración inicial

  NOMBRE DE LA PANTALLA
  → Ej: LoginScreen · HomeScreen · CheckoutScreen · ProfileScreen

  PLATAFORMA
  [1] mobile   375px  (mockup iPhone 15 Pro)
  [2] desktop  1280px (browser chrome · pantalla completa)

  THEME
  [A] IT     → color primario azul   · border-radius 8px
  [B] Arcus  → color primario negro  · accent Shamrock · border-radius pill

[1/4] ▓░░░░░░░  responde los 3 puntos para continuar →
────────────────────────────────────────────────────────────────
```

> Si el usuario ya proporcionó alguno de estos datos en su mensaje inicial, prellenarlos y preguntar solo los faltantes.

---

#### PASO 2 / 4 — Estructura de la pantalla

Mostrar después de recibir nombre + plataforma + theme:

```
────────────────────────────────────────────────────────────────
forge ~/it-ds $ build --screen [NombreScreen] --[mobile|desktop] --theme [IT|Arcus]
────────────────────────────────────────────────────────────────
[PASO 2 / 4] estructura de la pantalla

  Define qué componentes van en cada sección.
  Formato: nombre componente · variante · props principales

  ┌─ HEADER ───────────────────────────────────────────────────┐
  │  Ej: NavbarMobile · default · title="Login", showBack=false│
  │  (vacío si la pantalla no tiene header)                    │
  └────────────────────────────────────────────────────────────┘

  ┌─ BODY ─────────────────────────────────────────────────────┐
  │  Ej: TextInput · size=MD, state=Default · label="Email"    │
  │      TextInput · size=MD, state=Default · label="Password" │
  │      Link · Theme · label="¿Olvidaste tu contraseña?"      │
  │  (uno por línea, todos con width: 100%)                    │
  └────────────────────────────────────────────────────────────┘

  ┌─ FOOTER ───────────────────────────────────────────────────┐
  │  Ej: Button · Primary, Size=L · label="Ingresar"          │
  │      Button · Tertiary, Size=L · label="Crear cuenta"     │
  └────────────────────────────────────────────────────────────┘

[2/4] ▓▓░░░░░░  describe los componentes de cada sección →
────────────────────────────────────────────────────────────────
```

> Si el usuario describe en lenguaje natural, interpretar la estructura, mostrarla formateada como tabla y pedir confirmación antes de avanzar.

---

#### PASO 3 / 4 — Estados interactivos inferidos

Mostrar después de recibir la estructura. **Inferir automáticamente** los estados de cada componente usando la tabla de comportamiento estándar de la sección 4f:

```
────────────────────────────────────────────────────────────────
forge ~/it-ds $ analyze --interactions [NombreScreen]
────────────────────────────────────────────────────────────────
[PASO 3 / 4] estados interactivos inferidos

  He analizado los componentes. Confirma o ajusta:

  [Button] "Ingresar" · Primary / Size=L
    css   :hover → Theme.Hover · :active → Theme.Pressed · :disabled opacity .4
    react disabled cuando campos vacíos · loading 1.5s al clic

  [TextInput] "Correo electrónico" · size=MD
    css   :focus → borde Theme.Primary · :hover → borde Neutral.Strong
    react state=Error + helper si formato inválido (onBlur)
          filled=true cuando tiene contenido

  [TextInput] "Contraseña" · size=MD
    css   :focus → borde Theme.Primary
    react state=Error + helper si está vacío al enviar

  [Link] "¿Olvidaste tu contraseña?" · Theme
    css   :hover → underline · :active → opacity .7

  ¿Confirmas estos estados o deseas ajustar alguno?

[3/4] ▓▓▓░░░░░  confirmar estados →  o  ajustar antes de continuar
────────────────────────────────────────────────────────────────
```

---

#### PASO 3b — Inspección y resolución de íconos

**Este paso es OBLIGATORIO en todos los modos de construcción (A, B, C) para toda pantalla o flujo que requiera inspección de boards en Penpot. No se puede saltar. Si el usuario no requiere íconos, debe confirmarlo explícitamente — el skill siempre pregunta.**

---

##### Fase 1 — Escaneo MCP (automático, antes de preguntar al usuario)

Inmediatamente después de confirmar los estados interactivos (Paso 3), ejecutar un escaneo vía Penpot MCP de **cada board** que forma parte de la construcción. El objetivo es detectar y contar automáticamente todos los íconos presentes, sin depender de lo que el usuario describió en el wizard.

**Cómo detectar íconos en un board:**

Usar `execute_code` en Penpot MCP para inspeccionar el árbol de capas del board. Buscar layers que cumplan cualquiera de estas condiciones:

| Señal de detección | Descripción |
|---|---|
| `type === 'path'` o `type === 'svg'` | Layer vectorial/SVG dentro de un componente |
| Nombre de layer contiene: `icon`, `ícono`, `ic_`, `ico_`, `svg`, `arrow`, `chevron`, `close`, `menu`, `search`, `home`, `back`, `forward`, `add`, `delete`, `edit`, `check`, `info`, `warning`, `star`, `notification`, `tune`, `filter` | Nombres comunes de capas de íconos |
| Es hijo directo de un componente con slots: `ActionIcon`, `Button` (con leading/trailing), `TextInput` (leadingIcon/trailingIcon), `Tag`, `Tab`, `NavList item`, `Sidebar item`, `Breadcrumb link`, `AppBar action`, `UserMenu`, `Pagination arrow` | Componentes con slots de ícono conocidos |
| `width <= 32 && height <= 32` y `type === 'frame'` con un único hijo path | Frame pequeño que envuelve un SVG |

**Formato del reporte de escaneo (mostrar al usuario):**

```
────────────────────────────────────────────────────────────────
forge ~/it-ds $ scan --icons [NombreScreen | NombreFlow]
────────────────────────────────────────────────────────────────
[ÍCONOS] Escaneo MCP completado

  Pantalla              Componente                    Íconos   Capa Penpot
  ────────────────────────────────────────────────────────────────────────
  [NombreScreen]        ActionIcon (navbar-left)          1    "arrow_back"
  [NombreScreen]        ActionIcon (navbar-right)         1    "tune"
  [NombreScreen]        NavList / item leading (×3)       3    "ic_category"
  [NombreScreen]        Tag / TagBusiness                 1    "location_on"
  [NombreScreen]        Button Primary trailing           1    "chevron_right"
  ─────────────────────────────────────────────────────────────────────────
  TOTAL                                                   7    íconos detectados

  ¿Esta pantalla requiere configurar íconos?
  [S] sí → continúo con la resolución de nombres
  [N] no → usar placeholder SVG genérico en todos y continuar
────────────────────────────────────────────────────────────────
```

Si el escaneo detecta **0 íconos**, mostrar:
```
[ÍCONOS] Escaneo completado — 0 íconos detectados en los boards.
  No se requiere configuración de íconos. Continuando al Paso 4...
```
Y pasar directo al Paso 4 sin preguntar nada más sobre íconos.

---

##### Fase 2 — Solicitud de nombres (solo si el usuario responde [S])

Para cada ícono detectado, pedir al usuario que busque el nombre en Google Fonts Icons y lo proporcione.

**URL de búsqueda obligatoria (estilo Rounded):**
```
https://fonts.google.com/icons?icon.size=24&icon.color=%231f1f1f&icon.style=Rounded
```

Presentar así:

```
────────────────────────────────────────────────────────────────
forge ~/it-ds $ resolve --icon-names [NombreScreen]
────────────────────────────────────────────────────────────────
[ÍCONOS] Buscá cada ícono en:
  → https://fonts.google.com/icons?icon.size=24&icon.color=%231f1f1f&icon.style=Rounded

  Para cada uno, decime el nombre que aparece debajo del ícono
  (ej: "arrow_back", "tune", "home", "close") o elegí una opción:

  [1] ActionIcon (navbar-left)    · capa: "arrow_back"
      Nombre Google Fonts: ___________
      [M] Mantener SVG placeholder

  [2] ActionIcon (navbar-right)   · capa: "tune"
      Nombre Google Fonts: ___________
      [M] Mantener SVG placeholder

  [3] NavList leading icon (×3)   · capa: "ic_category"
      Nombre Google Fonts: ___________  ← aplica a los 3 items
      [M] Mantener SVG placeholder

  [4] Tag / TagBusiness           · capa: "location_on"
      Nombre Google Fonts: ___________
      [O] Ocultar ícono (solo texto)
      [M] Mantener SVG placeholder

  [5] Button trailing             · capa: "chevron_right"
      Nombre Google Fonts: ___________
      [M] Mantener SVG placeholder

  Respondé en una línea: "1: arrow_back · 2: tune · 3: dashboard · 4: [O] · 5: chevron_right"
────────────────────────────────────────────────────────────────
```

**Cómo el skill interpreta el nombre recibido:**

Dado el nombre en texto libre que el usuario proporciona (puede ser aproximado, en español, o el nombre exacto de Google Fonts), el skill lo analiza para determinar el `ligature` correcto de Material Icons Rounded:

| El usuario escribe | El skill interpreta como |
|---|---|
| "flecha atrás", "back", "volver" | `arrow_back` |
| "casa", "inicio", "home" | `home` |
| "configuración", "ajustes", "filtros" | `tune` |
| "cerrar", "x", "close" | `close` |
| "lupa", "buscar", "search" | `search` |
| "agregar", "más", "plus" | `add` |
| "eliminar", "basura", "delete" | `delete` |
| "editar", "lápiz", "edit" | `edit` |
| "check", "palomita", "ok" | `check_circle` |
| "info", "información" | `info` |
| "notificación", "campana" | `notifications` |
| nombre exacto en snake_case | usarlo directamente |

Si el nombre es ambiguo, confirmar con el usuario antes de continuar.

---

##### Fase 3 — Inspección de tokens del ícono + resolución CSS

Para cada ícono que se va a reemplazar con Material Icons, inspeccionar en Penpot vía MCP las propiedades de su capa:

| Propiedad Penpot | Qué leer | Cómo aplicar en CSS |
|---|---|---|
| `width` / `height` | Tamaño en px | `font-size: var(--spacing-N)` en selector del componente padre |
| `fill` token | Color heredado | `color: var(--color-...)` en selector del componente padre |
| `opacity` | Opacidad | `opacity: [valor]` — solo si < 1 |

**Mapeo px → spacing token:**

| px | Token |
|---|---|
| 12px | `var(--spacing-3)` |
| 16px | `var(--spacing-4)` |
| 20px | `var(--spacing-5)` |
| 24px | `var(--spacing-6)` |
| Otros | valor en `px` directo |

**Implementación CSS — siempre selector compuesto, nunca global:**

```css
/* ❌ Incorrecto */
.material-icons { font-size: 24px; color: var(--color-neutral-strongest); }

/* ✅ Correcto */
.itds-action-icon .material-icons-rounded { font-size: var(--spacing-6); }
.itds-tag--business .material-icons-rounded { font-size: var(--spacing-3); }
.itds-tag--info .material-icons-rounded { font-size: 14px; opacity: 0.7; }
```

```css
/* Global — solo display base */
.material-icons-rounded {
  color: inherit;
  line-height: 1;
  display: inline-flex;
  align-items: center;
  user-select: none;
}
```

**CDN a incluir en `<head>` cuando se usan Material Icons Rounded:**
```html
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded" rel="stylesheet">
```

En JSX:
```jsx
<span className="material-icons-rounded" aria-hidden="true">icon_name</span>
```

**Tabla de referencia por componente:**

| Componente | Penpot width | Penpot fill | CSS resultado |
|---|---|---|---|
| `ActionIcon` Size=M | 24px | `Neutral.Strongest` | `font-size: var(--spacing-6)` |
| `ActionIcon` Size=S | 20px | `Neutral.Strongest` | `font-size: var(--spacing-5)` |
| `Tag / TagBusiness` | 12px | `Neutral.White` | `font-size: var(--spacing-3)` |
| `Tag / Tags` leading | 14px | `Info.Stronger` | `font-size: 14px` |
| `Sidebar` item | 20px | `Neutral.Default` | `font-size: var(--spacing-5)` |
| `Breadcrumb` link | 16px | `Neutral.Soft` | `font-size: var(--spacing-4)` |
| `AppBar` action | 20px | `Neutral.Default` | `font-size: var(--spacing-5)` |

**Reglas de presentación por tipo de componente:**

| Tipo | Opciones disponibles |
|---|---|
| `Tag / TagBusiness` | [nombre] Reemplazar · [O] Ocultar · [M] Mantener |
| `Tag / Tags` | [nombre] Reemplazar · [O] Ocultar · [M] Mantener |
| `Tabs` (leading icon) | [nombre] Reemplazar · [O] Ocultar · [M] Mantener |
| Todos los demás | [nombre] Reemplazar · [M] Mantener |

**Si el componente es Tag o Tab y elige [O] "Ocultar":** No renderizar el ícono — ni SVG ni span. El texto queda solo.

**Si el usuario responde [N] en la Fase 1 (no requiere íconos):** Todos los slots de ícono usan SVG placeholder genérico. No incluir CDN de Material Icons. Continuar directo al Paso 4.

> **Regla absoluta:** Este paso es parte del contrato de construcción. No omitirlo en ningún modo (A, B, C). Si el escaneo MCP da 0 íconos, cerrar automáticamente. Si detecta íconos, siempre preguntar — incluso si el usuario no mencionó íconos en el wizard.

---

#### PASO 4 / 4 — Confirmación final y build

Mostrar después de confirmar los estados. Resumen completo antes de generar:

```
────────────────────────────────────────────────────────────────
forge ~/it-ds $ generate [NombreScreen] --confirm
────────────────────────────────────────────────────────────────
[PASO 4 / 4] resumen — listo para generar

  PANTALLA       [NombreScreen]
  PLATAFORMA     [Mobile 375px / Desktop 1280px]
  THEME          [IT / Arcus]
  MOCKUP         [iPhone 15 Pro / browser chrome]

  COMPONENTES
  header  [lista]
  body    [lista]
  footer  [lista]

  ARCHIVOS A GENERAR
  ├── [NombreScreen].jsx
  ├── [NombreScreen].html   ← preview en browser
  ├── tokens.css
  └── components.css

  ¿Confirmamos y generamos? → responde "sí" o "generar"
      o escribe qué quieres cambiar antes de continuar

[4/4] ▓▓▓▓░░░░  en espera de confirmación final...
────────────────────────────────────────────────────────────────
```

Al recibir confirmación, mostrar el **build log** en tiempo real:

```
────────────────────────────────────────────────────────────────
forge ~/it-ds $ generate [NombreScreen]
────────────────────────────────────────────────────────────────
$ inspecting penpot layers  [Componente1] ......... ✓ tokens · variantes · auto-layout
$ inspecting penpot layers  [Componente2] ......... ✓ fill · stroke · estados
$ inspecting penpot layers  [Componente3] ......... ✓ semánticos · 5 estados
$ generating  [NombreScreen].jsx .................. ✓ React 18 · CSS variables
$ generating  [NombreScreen].html ................. ✓ mockup [dispositivo]
$ generating  tokens.css + components.css ......... ✓ DM Sans · IT DS tokens
────────────────────────────────────────────────────────────────
✓ build complete · 4 archivos · [NombreScreen] ready
────────────────────────────────────────────────────────────────
```

Luego de este build log, entregar el código real.

---

#### 2e — Interacciones de componentes

#### 2e — Interacciones de componentes (Modo A — pantalla única)

**Este punto es obligatorio y aplica siempre, incluso en pantalla única sin navegación.**

Para cada componente interactivo de la pantalla, el skill debe inferir y confirmar sus estados. Si el usuario no los especifica, proponerlos basándose en el snapshot y el tipo de componente.

**Regla de inferencia automática:** Al recibir la estructura del Paso 2d, el skill debe analizar cada componente y proponer su mapa de estados sin esperar que el usuario lo pida. Confirmar con el usuario antes de generar.

Formato de propuesta al usuario:

```
He inferido los siguientes estados interactivos para esta pantalla.
Confirma o ajusta antes de continuar:

Button "Guardar" (Primary / Size=L):
  ✦ CSS:   :hover → fondo Theme.Hover · :active → fondo Theme.Pressed · cursor pointer
  ✦ React: disabled=true cuando campos requeridos están vacíos
            loading=true (1.5s) al hacer clic antes de confirmar acción
            state=Default una vez completada la acción

TextInput "Nombre completo":
  ✦ CSS:   :focus → borde Theme.Primary · :hover → borde Neutral.Strong
  ✦ React: state=Error + helperText si se envía vacío
            state=Default al empezar a escribir
            filled=true cuando tiene contenido

TextInput "Correo electrónico":
  ✦ CSS:   :focus → borde Theme.Primary
  ✦ React: state=Error + helperText="Email inválido" si formato incorrecto (onBlur)
            state=Default al corregir

BottomNavigation:
  ✦ CSS:   item activo → color Theme.Primary · items inactivos → Neutral.Soft
  ✦ React: activeItem cambia al hacer clic en cada ítem (useState)

¿Confirmas estos estados o deseas ajustar alguno?
```

**Tabla de comportamiento estándar por tipo de componente** (usar siempre como base):

| Componente | Estados CSS obligatorios | Estados React típicos |
|---|---|---|
| Button (cualquier variante) | `:hover` fondo+80% · `:active` fondo+60% · `:disabled` opacity 0.4 · `cursor: pointer` | `loading` al hacer clic · `disabled` por condición de formulario |
| TextInput / PasswordInput / SearchInput | `:focus` borde primario · `:hover` borde neutral-strong | `error` + helperText onBlur · `success` si validación OK · `filled` con contenido |
| Checkbox / Radio / Switch | `:hover` fondo tonal · checked toggle via click | `selected` (useState boolean) |
| Toggle Button / Toggle Binary | `:hover` suave · `:active` pressed | `active` (useState) |
| Link | `:hover` underline · `:visited` color opaco | — |
| IconButton / ActionIcon | `:hover` fondo tonal · `:active` pressed | — |
| Accordion | `:hover` fondo tonal | `isOpen` (useState boolean) — body visible/oculto |
| Tabs | tab activo con indicador · `:hover` fondo sutil | `activeTab` (useState) — contenido cambia |
| Select / Dropdown | `:focus` borde primario | `isOpen` (useState) — lista desplegable |
| Counter | botones `:hover` · `:disabled` en min/max | `value` (useState) · disable +/- en límites |
| Card (clickable) | `:hover` shadow-down-m · `:active` scale 0.99 | onClick callback |
| ProgressBar | — | `value` prop controlada externamente |
| Badge / Tag | — | `onDismiss` si es dismissible |
| Avatar | `:hover` overlay sutil si es clickable | — |

> **Nota:** Si el usuario confirma los estados propuestos sin cambios, proceder. Si el usuario dice "no necesito interacciones", igual incluir los estados CSS (:hover, :focus, :disabled) — son parte del código de producción, no opcionales.

**No continuar al Paso 3 sin los cuatro puntos + el mapa de interacciones confirmados.**

---

### Paso 2B — Wizard de construcción (Modo B — flujo de pantallas)

**Wizard conversacional de 4 pasos para flujos y happy paths.** Misma lógica que el Paso 2 pero con un paso extra para mapear la navegación entre pantallas.

---

#### PASO 1 / 4 — Configuración del flujo

```
────────────────────────────────────────────────────────────────
forge ~/it-ds $ init --new-flow
────────────────────────────────────────────────────────────────
[PASO 1 / 4] configuración del flujo

  NOMBRE DEL FLUJO
  → Ej: CheckoutFlow · RegistroFlow · LoginFlow · OnboardingFlow

  PLATAFORMA
  [1] mobile   375px  (mockup iPhone 15 Pro)
  [2] desktop  1280px (browser chrome · pantalla completa)

  THEME
  [A] IT     → color primario azul  · border-radius 8px
  [B] Arcus  → color primario verde · border-radius pill

[1/4] ▓░░░░░░░  responde los 3 puntos para continuar →
────────────────────────────────────────────────────────────────
```

---

#### PASO 2 / 4 — Mapa de pantallas del flujo

```
────────────────────────────────────────────────────────────────
forge ~/it-ds $ build --flow [NombreFlow] --map-screens
────────────────────────────────────────────────────────────────
[PASO 2 / 4] mapa de pantallas

  Lista cada pantalla del flujo con su estructura y cómo se conectan.
  Formato por pantalla:

  PANTALLA [N]: [NombreScreen]
  ┌─ HEADER ─┐  componente · variante · props
  ├─ BODY ───┤  componente · variante · props (uno por línea)
  └─ FOOTER ─┘  componente · variante · props
  NAVEGA A:
    → [Componente] al [acción] → [NombreScreen destino]
    ← goBack: [NombreScreen origen] (si hay NavbarMobile showBack)

  Ejemplo:

  PANTALLA 1: LoginScreen
  header  — (sin header)
  body    TextInput · size=MD · label="Email"
          TextInput · size=MD · label="Password"
          Link · Theme · label="¿Olvidaste tu contraseña?"
  footer  Button · Primary/Size=L · label="Ingresar"
          Button · Tertiary/Size=L · label="Crear cuenta"
  navega  Button "Ingresar" → HomeScreen
          Button "Crear cuenta" → RegisterScreen

  PANTALLA 2: HomeScreen
  header  NavbarMobile · default · title="Inicio"
  body    Card × 3 · ProgressBar
  footer  BottomNavigation · activeItem="home"
  navega  BottomNav item "Perfil" → ProfileScreen

[2/4] ▓▓░░░░░░  describe todas las pantallas del flujo →
────────────────────────────────────────────────────────────────
```

---

#### PASO 3 / 4 — Estados interactivos y lógica de navegación

Inferir automáticamente y mostrar para confirmación. Para flujos incluir también los estados que **disparan navegación**:

```
────────────────────────────────────────────────────────────────
forge ~/it-ds $ analyze --interactions [NombreFlow] --all-screens
────────────────────────────────────────────────────────────────
[PASO 3 / 4] estados + disparadores de navegación inferidos

  [LoginScreen]

  [Button] "Ingresar" · Primary / Size=L
    css    :hover → Theme.Hover · :active → Theme.Pressed
    react  disabled cuando campos vacíos
           loading 1.5s al clic → navega a HomeScreen
           en error → Notification type=Error

  [TextInput] "Email" · size=MD
    css    :focus → borde Theme.Primary
    react  state=Error + helper si formato inválido (onBlur)

  [HomeScreen]

  [BottomNavigation]
    react  activeItem cambia al clic en cada ítem
           clic "Perfil" → navega a ProfileScreen

  [ProfileScreen]

  [NavbarMobile] showBack=true
    react  goBack() → vuelve a HomeScreen

  ¿Confirmas o ajustas antes de continuar?

[3/4] ▓▓▓░░░░░  confirmar →  o  ajustar
────────────────────────────────────────────────────────────────
```

---

#### PASO 4 / 4 — Confirmación final y build del flujo

```
────────────────────────────────────────────────────────────────
forge ~/it-ds $ generate [NombreFlow] --confirm
────────────────────────────────────────────────────────────────
[PASO 4 / 4] resumen del flujo — listo para generar

  FLUJO          [NombreFlow]
  PLATAFORMA     [Mobile 375px / Desktop 1280px]
  THEME          [IT / Arcus]
  MOCKUP         [iPhone 15 Pro / browser chrome]
  PANTALLAS      [N] pantallas conectadas

  MAPA DE NAVEGACIÓN
  [Screen1] → clic Button "X" → [Screen2]
  [Screen2] → clic Button "Y" → [Screen3]
  [Screen2] ← goBack          ← [Screen3]

  ARCHIVOS A GENERAR
  ├── [NombreFlow].jsx    ← todas las pantallas + useFlow hook
  ├── [NombreFlow].html   ← preview con transiciones animadas
  ├── tokens.css
  └── components.css      ← estilos + CSS de transiciones

  ¿Confirmamos y generamos? → responde "sí" o "generar"

[4/4] ▓▓▓▓░░░░  en espera de confirmación final...
────────────────────────────────────────────────────────────────
```

Al recibir confirmación, mostrar el build log procesando cada pantalla:

```
────────────────────────────────────────────────────────────────
forge ~/it-ds $ generate [NombreFlow]
────────────────────────────────────────────────────────────────
  [Screen 1/N] [NombreScreen]
$ inspecting penpot layers  [Componente] ........ ✓
$ inspecting penpot layers  [Componente] ........ ✓

  [Screen 2/N] [NombreScreen]
$ inspecting penpot layers  [Componente] ........ ✓

$ generating  useFlow hook ...................... ✓ navegación + historial
$ generating  [NombreFlow].jsx .................. ✓ [N] pantallas · React 18
$ generating  [NombreFlow].html ................. ✓ mockup · transiciones slide/fade
$ generating  tokens.css + components.css ....... ✓ DM Sans · IT DS tokens
────────────────────────────────────────────────────────────────
✓ build complete · 4 archivos · [NombreFlow] ready
────────────────────────────────────────────────────────────────
```

Luego de este build log, entregar el código real.

---

### Paso 3 — Match de componentes → props React

Cargar `references/ds-snapshot.md` y `references/design-tokens.md`.

#### 3a — Verificar existencia en el snapshot

Usar el nombre y path **exactos** del catálogo — nunca corregirlos aunque parezcan errores tipográficos.

#### 3b — Tabla de match (interna)

```
| Componente   | Variante | Prop React                   | CSS class           | Estado   |
|---|---|---|---|---|
| NavbarMobile | default  | <NavbarMobile title="...">  | .itds-navbar-mobile | ✅ match |
| TextInput    | size=M   | <TextInput size="md">       | .itds-text-input    | ✅ match |
| [nombre]     | [var]    | —                           | —                   | ⚠️ bloqueado |
```

#### 3c — Análisis de capas en Penpot — OBLIGATORIO (todos los componentes)

**Regla crítica:** Para cada componente con match confirmado, inspeccionar vía Penpot MCP su estructura interna completa antes de generar una sola línea de código. Esta inspección es obligatoria siempre — no se omite aunque el componente esté en `react-patterns.md`.

**Regla de profundidad — componentes compuestos:** Componentes como `Page Header`, `Navigation List`, `ActionButtons` contienen sub-grupos con sus propios tokens de gap, padding y alignment. Inspeccionar **mínimo 3 niveles de profundidad** (`shapeStructure(component, 6)`) y extraer tokens de cada sub-contenedor individualmente. No asumir que el gap del padre aplica a todos los hijos — cada board puede tener `columnGap` y `rowGap` distintos. Ejemplo: `Page Header → Content → Elements` tiene `columnGap: spacing.3 = 12px`, distinto del `rowGap: spacing.2 = 8px` del `Page Header` raíz.

Para cada componente, extraer y documentar internamente:

```
Componente: [nombre] · Variante inspeccionada: [variante]

ESTRUCTURA DE CAPAS
  └── [nombre capa raíz] (tipo: frame/group/component)
      ├── auto layout: dirección · gap · padding · alignment
      ├── dimensiones: w × h · sizing: hug/fill/fixed
      └── capas hijas:
          ├── [capa 1]: tipo · visibilidad · propósito
          ├── [capa 2]: tipo · visibilidad · propósito
          └── ...

PROPIEDADES VISUALES POR CAPA
  [nombre capa]
    fill:          [token vinculado] → [valor HEX resuelto]
    stroke:        [token vinculado] → [valor HEX] · [grosor]
    border-radius: [token vinculado] → [valor px]
    typography:    [token vinculado] → [font/size/weight/line-height]
    opacity:       [valor]
    shadow:        [token vinculado]

TOKENS VINCULADOS (shape.tokens)
  [propiedad]: [nombre del token] → [set] → [valor resuelto]

VARIANTES DISPONIBLES
  [propiedad 1]: [valor A] · [valor B] · [valor C]
  [propiedad 2]: [valor A] · [valor B]

NOTAS DE IMPLEMENTACIÓN
  - [observación relevante para el código React/CSS]
  - [discrepancias entre el nombre en Penpot y la prop React sugerida]
```

**Qué hacer con la inspección:**

1. Si los tokens vinculados difieren de los documentados en `design-tokens.md` → usar los valores del MCP (son más actuales) y anotar la discrepancia
2. Si una capa tiene un valor hardcodeado (sin token) → usar el valor HEX pero envolverlo en una CSS variable nueva y anotarlo como deuda técnica en el reporte del Paso 5
3. Si el auto layout del componente tiene propiedades que afectan el comportamiento responsive → reflejarlas fielmente en el CSS generado
4. Si hay capas ocultas con propósito estructural → mantenerlas como elementos con `display: none` que se activan por estado
5. **Capas con `shape.hidden === true`:** Ejecutar `collectHidden()` sobre cada shape inspeccionado. Las capas encontradas se reportan al usuario y **no se renderizan en el JSX** — ni como `display: none`.

```javascript
function collectHidden(shape, path = '') {
  const hidden = [];
  if (!shape) return hidden;
  const currentPath = path ? `${path} > ${shape.name}` : shape.name;
  if (shape.hidden === true) {
    hidden.push({ path: currentPath, type: shape.type });
  }
  if (shape.children) {
    for (const child of shape.children) {
      hidden.push(...collectHidden(child, currentPath));
    }
  }
  return hidden;
}
```

**Regla absoluta:** `❌ No renderizar en JSX ningún elemento cuya capa Penpot tenga shape.hidden === true`

> Esta inspección reemplaza cualquier suposición o patrón memorizado. El código generado debe derivarse de lo que está en Penpot, no de lo que el skill "recuerda" sobre el componente.

---

#### 3d — Captura obligatoria de tokens por componente y por theme — REGLA CRÍTICA

**Esta es una regla absoluta. No puede omitirse ni abreviarse bajo ninguna circunstancia.**

Para CADA componente que aparezca en la estructura del build, antes de escribir cualquier línea de CSS o JSX, ejecutar inspección vía Penpot MCP y capturar la totalidad de propiedades vinculadas a tokens:

| Propiedad Penpot | Qué capturar | Dónde aplicar |
|---|---|---|
| `fills` | token name + hex resuelto | `background-color` o `color` del componente |
| `strokes` | color + width + style | `border-color`, `border-width` |
| `border-radius` | token + valor px | `border-radius` (verificar si es pill o fixed) |
| `typography` | font-family, size, weight, line-height | reglas de texto del componente |
| `opacity` | valor 0–1 | `opacity` o `rgba()` si aplica |
| `auto-layout gap` | `layoutGap` px → token | `gap` del flex container |
| `padding` | `paddingTop`, `paddingBottom`, `paddingLeft`, `paddingRight` px → token | `padding` del componente |
| `width / height` | valor fijo o "fill" / "hug" | `width`, `height`, o `flex: 1` si es fill |
| `icon size` | width de la capa del ícono px | `font-size` del `.material-icons` dentro del componente |
| `item spacing` | gap entre hijos internos (ej. label/valor) | `gap` del sub-contenedor |

**Mapeo de valores px a tokens de spacing IT DS:**

| px Penpot | Token CSS | ⚠️ Nota |
|---|---|---|
| 0px | `var(--spacing-0)` | |
| 2px | `var(--spacing-1)` | ⚠️ naming counter-intuitivo: spacing.1 = 2px |
| 4px | `var(--spacing-0-5)` | ⚠️ spacing.0-5 = 4px (no 2px) |
| 8px | `var(--spacing-2)` | |
| 12px | `var(--spacing-3)` | |
| 16px | `var(--spacing-4)` | gap estándar entre secciones |
| 24px | `var(--spacing-6)` | ⚠️ no existe spacing.5 |
| 32px | `var(--spacing-8)` | ⚠️ no existe spacing.7 |
| 48px | `var(--spacing-12)` | |
| 64px | `var(--spacing-16)` | tamaño Icon Box |
| 96px | `var(--spacing-24)` | |
| 128px | `var(--spacing-32)` | |

> Si el valor px no tiene token exacto (ej. 6px, 10px, 20px), usar el valor en `px` directamente y anotarlo como deuda técnica.

**Protocolo de captura de spacing en Penpot MCP:**

```javascript
const shape = page.findShapes({ name: 'NombreComponente' })[0];

// Gap entre hijos (auto-layout)
shape.layoutGap;           // → N px → mapear a --spacing-X

// Padding interno
shape.paddingTop;          // → N px
shape.paddingBottom;       // → N px
shape.paddingLeft;         // → N px → padding H
shape.paddingRight;        // → N px

// Tamaño fijo vs flexible
shape.width;               // → N px (fixed) o null (fill/hug)
shape.height;              // → N px (fixed) o null (fill/hug)
shape.layoutSizing;        // → "fill" | "fix" | "auto"

// Sub-contenedores internos (ej. label + valor en ProductFile)
shape.children[0].layoutGap;   // → gap interno del hijo
```

**Regla de doble inspección para Arcus:**

Si el build usa theme Arcus, inspeccionar el componente en su variante Arcus en Penpot (no solo en IT). Los tokens resuelven a valores distintos por theme:

```
Badge / Theme
  IT    → fills: [Theme.Primary]  → #2563EB (azul)
  Arcus → fills: [Theme.Accent]   → #2CDFA6 (Shamrock)

Tab / Activo
  IT    → fills: [Theme.Softest]  → #DBEAFE (azul.100)
  Arcus → fills: []               → transparent (sin fill)

Button / Primary
  IT    → color de texto: Theme.Contrast → #FFFFFF
  Arcus → color de texto: Theme.Contrast → #000000 (⚠️ requiere override manual a #FFFFFF)
```

**Protocolo de captura (ejecutar en orden):**

```javascript
// 1. Localizar el shape del componente
const shapes = page.findShapes({ name: 'NombreComponente' });
const shape = shapes[0];

// 2. Capturar fills → token + hex
shape.fills; // → [{ fillColor: '#2563EB', fillOpacity: 1, ... }]
             // Buscar el token name en design-tokens.md por el hex

// 3. Capturar strokes
shape.strokes; // → [{ strokeColor: '#...', strokeWidth: N }]

// 4. Capturar border-radius
shape.r1; shape.r2; // valores en px

// 5. Capturar auto-layout
shape.layoutGap;       // gap entre hijos
shape.paddingTop;      // padding vertical
shape.paddingLeft;     // padding horizontal

// 6. Ejecutar collectHidden para detectar capas ocultas (ver regla anterior)
collectHidden(shape);
```

**Documentar en tabla antes de generar código:**

Antes de avanzar al Paso 4, mostrar al usuario la tabla de tokens capturados:

```
TOKENS CAPTURADOS — [NombreComponente]

| Propiedad       | Penpot px/valor   | Token CSS           | IT value  | Arcus value  |
|-----------------|-------------------|---------------------|-----------|--------------|
| bg fill         | fills[0]          | --color-theme-*     | #2563EB   | #2CDFA6      |
| color texto     | fills[0]          | --color-neutral-*   | #FFFFFF   | #1D1D1D      |
| border-radius   | r1                | --radius-button     | 8px       | 999px        |
| padding H       | paddingLeft 32px  | --spacing-8         | 32px      | 32px         |
| padding V       | paddingTop 12px   | --spacing-3         | 12px      | 12px         |
| gap interno     | layoutGap 8px     | --spacing-2         | 8px       | 8px          |
| icon size       | icon.width 24px   | --spacing-6         | 24px      | 24px         |
| font-size       | typography        | --text-sm           | 14px      | 14px         |
| opacity         | opacity           | —                   | 1         | 1            |
```

**Si el token Arcus difiere del IT → agregar override `[data-theme="arcus"]` en `components.css`:**

```css
/* Base (IT) */
.itds-badge--theme {
  background-color: var(--color-theme-primary);   /* #2563EB */
  color: var(--color-neutral-white);
}

/* Override Arcus */
[data-theme="arcus"] .itds-badge--theme {
  background-color: var(--color-theme-accent);     /* #2CDFA6 */
  color: var(--color-neutral-strongest);            /* #1D1D1D */
}
```

**Consecuencias de omitir este paso:**

Omitir la captura de tokens lleva a bugs visuales confirmados en producción:
- Badge negro sobre negro en Arcus (Badge/Theme usa Accent, no Primary)
- Tab con fill incorrecto (Tab activo en Arcus es transparent, no Softest)
- Botón primary ilegible (contrast token = negro en Arcus, pero fondo también negro)
- Campos de formulario con spacing incorrecto (ProductFile: 4px entre label y valor, no space-between)

**Regla de oro:** `❌ Nunca asumir que un componente usa los mismos tokens en IT y Arcus. Siempre inspeccionar. Siempre capturar. Siempre documentar.`

---

#### 3e — Componentes sin match — BLOQUEO ESTRICTO (OBLIGATORIO)

**Regla crítica:** Solo se puede generar código con componentes que existan en el IT DS de Penpot. Está estrictamente prohibido inventar o recrear componentes que no estén en el snapshot.

Si algún componente no existe:

```
🚫 Componente no disponible en el IT DS de Penpot

Componente solicitado:  [nombre]
Variante solicitada:    [variante]
Buscado en:             references/ds-snapshot.md

La pantalla NO puede generarse con componentes fuera del IT DS.

Opciones:
  A) Reemplazar por: [componente más cercano disponible en el snapshot]
  B) Omitir este componente de la pantalla y continuar
  C) Pausar — el componente debe agregarse primero al IT DS en Penpot

¿Cómo deseas proceder?
```

**No avanzar al Paso 4 sin resolución confirmada para cada componente bloqueado.**

---

### Paso 4 — Generar el código

Cargar `references/react-patterns.md` antes de generar.

#### 4a — Archivos a generar (nomenclatura fija — OBLIGATORIO)

Siempre generar **exactamente estos archivos**, con estos nombres:

| Archivo | Descripción |
|---|---|
| `[NombreScreen].jsx` | Componente React principal |
| `[NombreScreen].html` | Preview standalone — abre directo en el browser |
| `tokens.css` | CSS variables del IT DS (theme activo) |
| `components.css` | Estilos de todos los componentes de la pantalla |

> Ejemplo para "LoginScreen": `LoginScreen.jsx`, `LoginScreen.html`, `tokens.css`, `components.css`

#### 4b — Estructura JSX obligatoria

```jsx
import React from 'react';

const [NombreScreen] = () => {
  return (
    <div className="itds-screen">

      {/* ── HEADER ────────────────────── */}
      <header className="itds-screen__header">
        {/* componentes del header */}
      </header>

      {/* ── BODY ──────────────────────── */}
      <main className="itds-screen__body">
        {/* componentes del body */}
      </main>

      {/* ── FOOTER ────────────────────── */}
      <footer className="itds-screen__footer">
        {/* componentes del footer */}
      </footer>

    </div>
  );
};

export default [NombreScreen];
```

#### 4c — CSS del layout — OBLIGATORIO

```css
/* ── Layout principal ──
   REGLA: el background-color debe leer el fill del board en Penpot MCP.
   Si el board tiene fill=Neutral.White → usar var(--color-neutral-white).
   Si el board tiene fill=Screen.Soft  → usar var(--color-screen-soft).
   NO usar color-screen-soft por defecto — siempre leer el token del board.

   REGLA FLEX: usar height: 100% (no min-height: 100vh) para que el contenedor
   se ajuste al mockup. El footer va al fondo con flex, NO con position: sticky.
*/
.itds-screen {
  display: flex;
  flex-direction: column;
  height: 100%;                        /* ✅ height: 100% — NO min-height: 100vh */
  background-color: var(--color-neutral-white); /* ajustar según fill del board Penpot */
  font-family: var(--font-family);
}

.itds-screen__header {
  flex-shrink: 0;
  width: 100%;
  background-color: var(--color-neutral-white);
  position: sticky;
  top: 0;
  z-index: 10;
  /* ❌ NO agregar border-bottom por defecto — el IT DS no usa separadores entre secciones */
}

.itds-screen__footer {
  flex-shrink: 0;                      /* ✅ flex-shrink: 0 — NO position: sticky/fixed */
  width: 100%;
  background-color: var(--color-neutral-white);
  /* ❌ NO agregar border-top por defecto — el IT DS no usa separadores entre secciones */
}

.itds-screen__body {
  flex: 1;                             /* ✅ flex: 1 empuja el footer al fondo */
  overflow-y: auto;                    /* ✅ scroll interno — el screen no hace scroll */
  width: 100%;
  max-width: 375px;
  margin: 0 auto;
  padding: var(--spacing-4);          /* 16px en los 4 lados — SIEMPRE */
  box-sizing: border-box;
  display: flex;
  flex-direction: column;
  gap: var(--spacing-6);              /* 24px entre componentes del body — SIEMPRE */
}

@media (min-width: 1280px) {
  .itds-screen__body {
    max-width: 1280px;
    padding: var(--spacing-4) var(--spacing-8); /* 16px vertical · 32px horizontal en desktop */
    gap: var(--spacing-6);            /* 24px se mantiene en desktop */
  }
}
```

**Reglas absolutas del layout:**
```
❌ No usar min-height: 100vh en .itds-screen → el mockup tiene altura fija
❌ No usar position: sticky/fixed en el footer de Action Buttons
❌ No agregar padding-bottom de compensación en el body
✅ .itds-screen con height: 100% y display: flex flex-direction: column
✅ .itds-screen__body con flex: 1 y overflow-y: auto
✅ .itds-screen__footer con flex-shrink: 0
```

#### 4d — Full width en todos los componentes — OBLIGATORIO

**Cada componente dentro del body debe ocupar el ancho completo de su contenedor.** Sin excepción.

```css
/* Aplicar a todos los componentes del body */
.itds-[nombre-componente] {
  width: 100%;
  box-sizing: border-box;
}
```

```jsx
/* En el JSX, nunca establecer width fijo */
/* ✅ Correcto */
<TextInput style={{ width: '100%' }} ... />
<Button style={{ width: '100%' }} ... />

/* ❌ Incorrecto */
<TextInput style={{ width: '320px' }} ... />
<Button style={{ width: '200px' }} ... />
```

> Esta regla garantiza que los componentes se adapten correctamente tanto en mobile (375px) como en desktop (1280px).

#### 4e — Archivo HTML standalone previsualizable — OBLIGATORIO

Siempre generar `[NombreScreen].html` con React via CDN y todo el CSS embebido. **Mobile** → mockup iPhone 15 Pro (device frame). **Desktop** → browser chrome mínimo sticky, contenido a pantalla completa sin device frame. El archivo debe poder abrirse directamente en el browser con doble clic, sin ningún build tool ni servidor.

##### Mockup iPhone 15 Pro (mobile)

```html
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>[NombreScreen] — IT DS Preview · Mobile</title>
  <!-- IT Theme: DM Sans | Arcus Theme: Open Sans -->
  <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&family=Open+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
  <script crossorigin src="https://unpkg.com/react@18/umd/react.development.js"></script>
  <script crossorigin src="https://unpkg.com/react-dom@18/umd/react-dom.development.js"></script>
  <script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>
  <style>
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

    body {
      background: #1a1a2e;
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      font-family: var(--font-family, 'DM Sans'), sans-serif;
      padding: 40px 20px;
    }

    /* ── Mockup iPhone 15 Pro ── */
    .device-wrapper {
      position: relative;
      width: 393px;
      height: 852px;
      background: #1C1C1E;
      border-radius: 54px;
      padding: 14px;
      box-shadow:
        0 0 0 2px #3A3A3C,
        0 0 0 4px #1C1C1E,
        0 40px 80px rgba(0,0,0,0.6),
        inset 0 0 0 1px rgba(255,255,255,0.08);
    }

    /* Botones laterales */
    .device-wrapper::before {
      content: '';
      position: absolute;
      left: -3px; top: 120px;
      width: 3px; height: 36px;
      background: #3A3A3C;
      border-radius: 2px 0 0 2px;
      box-shadow: 0 52px 0 #3A3A3C, 0 100px 0 #3A3A3C;
    }
    .device-wrapper::after {
      content: '';
      position: absolute;
      right: -3px; top: 160px;
      width: 3px; height: 72px;
      background: #3A3A3C;
      border-radius: 0 2px 2px 0;
    }

    .device-screen {
      width: 100%;
      height: 100%;
      background: #000;
      border-radius: 42px;
      overflow: hidden;
      position: relative;
    }

    /* Dynamic Island */
    .dynamic-island {
      position: absolute;
      top: 12px;
      left: 50%;
      transform: translateX(-50%);
      width: 120px;
      height: 34px;
      background: #000;
      border-radius: 20px;
      z-index: 100;
    }

    /* Status bar
       REGLA ADAPTATIVA: el status bar debe coincidir con el fondo de la pantalla.
       Pantalla clara (neutral.white / screen-soft) → background claro + texto/iconos oscuros (#0F172A)
       Pantalla oscura (ej: neutral.strongest)      → background oscuro  + texto/iconos blancos (#FFFFFF)
       Determinar según el fill del board Penpot antes de generar.
    */
    .status-bar {
      position: absolute;
      top: 0; left: 0; right: 0;
      height: 54px;
      display: flex;
      align-items: flex-end;
      justify-content: space-between;
      padding: 0 24px 8px;
      z-index: 99;
      /* Pantalla clara por defecto: */
      background-color: var(--color-neutral-white);
      color: var(--color-neutral-strongest);
      font-size: 12px;
      font-weight: 600;
      letter-spacing: -0.3px;
    }

    .status-bar .time { font-size: 15px; font-weight: 700; }
    .status-bar .icons { display: flex; gap: 6px; align-items: center; }

    /* App content */
    .app-content {
      position: absolute;
      top: 54px; left: 0; right: 0; bottom: 0;
      overflow-y: auto;
      overflow-x: hidden;
      -webkit-overflow-scrolling: touch;
      scrollbar-width: none;
    }
    .app-content::-webkit-scrollbar { display: none; }

    /* ── IT DS Tokens ── */
    :root {
      /* [TOKENS — pegar contenido de tokens.css aquí] */
    }

    /* ── Estilos de componentes ── */
    /* [COMPONENTS — pegar contenido de components.css aquí] */
  </style>
</head>
<body>
  <div class="device-wrapper">
    <div class="device-screen">
      <div class="dynamic-island"></div>
      <div class="status-bar">
        <span class="time">9:41</span>
        <div class="icons">
          <!-- Pantalla clara → fill="#0F172A" | Pantalla oscura → fill="white" -->
          <svg width="17" height="12" viewBox="0 0 17 12" fill="#0F172A"><rect x="0" y="3" width="3" height="9" rx="1"/><rect x="4.5" y="2" width="3" height="10" rx="1"/><rect x="9" y="0" width="3" height="12" rx="1"/><rect x="13.5" y="1" width="3" height="11" rx="1"/></svg>
          <svg width="16" height="12" viewBox="0 0 16 12" fill="#0F172A"><path d="M8 2.4C10.8 2.4 13.3 3.6 15 5.6L16 4.4C13.9 2 11.1.8 8 .8S2.1 2 0 4.4l1 1.2C2.7 3.6 5.2 2.4 8 2.4z"/><path d="M8 5.6c1.8 0 3.4.8 4.5 2l1-1.2C12.1 4.8 10.1 4 8 4S3.9 4.8 2.5 6.4l1 1.2C4.6 6.4 6.2 5.6 8 5.6z"/><circle cx="8" cy="10" r="1.5"/></svg>
          <svg width="25" height="12" viewBox="0 0 25 12" fill="none"><rect x=".5" y=".5" width="21" height="11" rx="3.5" stroke="#0F172A" stroke-opacity=".35"/><rect x="1.5" y="1.5" width="17" height="9" rx="2.5" fill="#0F172A"/><path d="M23 4v4a2 2 0 000-4z" fill="#0F172A" fill-opacity=".4"/></svg>
        </div>
      </div>
      <div class="app-content" id="root"></div>
    </div>
  </div>

  <script type="text/babel">
    /* [JSX — pegar contenido de NombreScreen.jsx aquí, sin import/export] */

    const root = ReactDOM.createRoot(document.getElementById('root'));
    root.render(<[NombreScreen] />);
  </script>
</body>
</html>
```

##### Browser chrome desktop (desktop)

El desktop no usa device frame. Renderiza a pantalla completa en el browser con una barra de chrome mínima sticky en el top. El contenido ocupa el 100% del ancho disponible.

```html
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>[NombreScreen] — IT DS Preview · Desktop</title>
  <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
  <script crossorigin src="https://unpkg.com/react@18/umd/react.development.js"></script>
  <script crossorigin src="https://unpkg.com/react-dom@18/umd/react-dom.development.js"></script>
  <script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>
  <style>
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

    body {
      background: #FFFFFF;
      min-height: 100vh;
      font-family: 'DM Sans', sans-serif;
    }

    /* ── Browser chrome mínimo ── */
    .browser-chrome {
      position: sticky;
      top: 0;
      z-index: 1000;
      height: 40px;
      background: #ECECEC;
      border-bottom: 1px solid #D1D1D1;
      display: flex;
      align-items: center;
      padding: 0 16px;
      gap: 12px;
      user-select: none;
    }

    .browser-dots { display: flex; gap: 6px; flex-shrink: 0; }
    .browser-dots span { width: 12px; height: 12px; border-radius: 50%; }
    .browser-dots span:nth-child(1) { background: #FF5F57; }
    .browser-dots span:nth-child(2) { background: #FEBC2E; }
    .browser-dots span:nth-child(3) { background: #28C840; }

    .browser-url {
      flex: 1;
      max-width: 480px;
      height: 26px;
      background: #FFFFFF;
      border: 1px solid #D1D1D1;
      border-radius: 6px;
      display: flex;
      align-items: center;
      padding: 0 10px;
      gap: 6px;
    }
    .browser-url .lock { font-size: 11px; color: #6B7280; }
    .browser-url .url-text { font-size: 12px; color: #374151; font-family: 'DM Sans', sans-serif; }

    /* ── App content ── */
    #root { min-height: calc(100vh - 40px); }

    /* ── IT DS Tokens ── */
    :root {
      /* [TOKENS — pegar contenido de tokens.css aquí] */
    }

    /* ── Estilos de componentes ── */
    /* [COMPONENTS — pegar contenido de components.css aquí] */
  </style>
</head>
<body>
  <div class="browser-chrome">
    <div class="browser-dots">
      <span></span><span></span><span></span>
    </div>
    <div class="browser-url">
      <span class="lock">&#128274;</span>
      <span class="url-text">localhost:3000/[nombre-screen]</span>
    </div>
  </div>

  <div id="root"></div>

  <script type="text/babel">
    /* [JSX — pegar contenido de NombreScreen.jsx aquí, sin import/export] */

    const root = ReactDOM.createRoot(document.getElementById('root'));
    root.render(<[NombreScreen] />);
  </script>
</body>
</html>
```

> **Regla:** El HTML es completamente autónomo — todo CSS y JSX embebidos, sin imports externos. Mobile → mockup iPhone 15 Pro. Desktop → browser chrome mínimo a pantalla completa, sin device frame.

#### 4f — Sistema de interacciones (Modo A — pantalla única)

**Implementar siempre, en toda pantalla, sin excepción.** El código generado debe sentirse y comportarse como producción real.

##### Capa 1 — Estados CSS (todos los componentes interactivos)

Cada componente interactivo debe tener su CSS completo de estados. Usar siempre tokens IT DS:

```css
/* ── Button — estados CSS completos ── */
.itds-button { cursor: pointer; transition: background-color 150ms ease, opacity 150ms ease, transform 80ms ease; }
.itds-button:hover:not(:disabled)  { background-color: var(--color-theme-hover); }
.itds-button:active:not(:disabled) { background-color: var(--color-theme-pressed); transform: scale(0.98); }
.itds-button:disabled              { opacity: 0.4; cursor: not-allowed; pointer-events: none; }
.itds-button:focus-visible         { outline: 2px solid var(--color-theme-primary); outline-offset: 2px; }

/* Secondary */
.itds-button--secondary:hover:not(:disabled)  { background-color: var(--color-tonal-default); }
.itds-button--secondary:active:not(:disabled) { background-color: var(--color-tonal-hover); }

/* Tertiary / Ghost */
.itds-button--tertiary:hover:not(:disabled)  { background-color: var(--color-tonal-default); }

/* ── TextInput — estados CSS completos ── */
.itds-text-input__field               { transition: border-color 150ms ease, box-shadow 150ms ease; }
.itds-text-input__field:hover         { border-color: var(--color-neutral-strong); }
.itds-text-input__field:focus         { outline: none; border-color: var(--color-theme-primary); box-shadow: 0 0 0 3px var(--color-theme-softest); }
.itds-text-input--error .itds-text-input__field       { border-color: var(--color-error-default); }
.itds-text-input--error .itds-text-input__field:focus { box-shadow: 0 0 0 3px var(--color-error-softest); }
.itds-text-input--success .itds-text-input__field     { border-color: var(--color-success-default); }
.itds-text-input--disabled            { opacity: 0.4; pointer-events: none; }

/* ── Checkbox / Radio ── */
.itds-checkbox__control, .itds-radio__control {
  transition: border-color 150ms ease, background-color 150ms ease;
  cursor: pointer;
}
.itds-checkbox:hover .itds-checkbox__control { border-color: var(--color-theme-primary); background-color: var(--color-tonal-default); }
.itds-checkbox--checked .itds-checkbox__control { background-color: var(--color-theme-primary); border-color: var(--color-theme-primary); }

/* ── Card clickable ── */
.itds-card--clickable               { cursor: pointer; transition: box-shadow 150ms ease, transform 100ms ease; }
.itds-card--clickable:hover         { box-shadow: var(--shadow-down-m); }
.itds-card--clickable:active        { transform: scale(0.99); box-shadow: var(--shadow-down-s); }

/* ── IconButton / ActionIcon ── */
.itds-icon-button                   { cursor: pointer; transition: background-color 150ms ease; border-radius: var(--radius-full); }
.itds-icon-button:hover             { background-color: var(--color-tonal-default); }
.itds-icon-button:active            { background-color: var(--color-tonal-hover); }

/* ── Tabs (Default Box variant) ── */
/* ❌ border-bottom: 2px → eso es variante underline, NO Box */
/* ✅ border: 1px solid completo en cada tab = variante Box */
.itds-tab                           { cursor: pointer; transition: color 150ms ease, border-color 150ms ease; border: 1px solid #94a3b8; border-radius: var(--radius-button); }
.itds-tab:hover                     { border-color: var(--color-theme-primary); color: var(--color-theme-primary); }
.itds-tab--active                   { color: var(--color-theme-primary); border-color: var(--color-theme-primary); background-color: var(--color-theme-softest); font-weight: var(--weight-bold); }
/* badge: itds-badge--theme (activo) / itds-badge--neutral (inactivo) — siempre visible */

/* ── Link ── */
.itds-link                          { cursor: pointer; transition: opacity 150ms ease; }
.itds-link:hover                    { text-decoration: underline; opacity: 0.85; }
.itds-link:active                   { opacity: 0.7; }

/* ── Accordion ── */
.itds-accordion__header             { cursor: pointer; transition: background-color 150ms ease; }
.itds-accordion__header:hover       { background-color: var(--color-tonal-default); }
.itds-accordion__body               { overflow: hidden; transition: max-height 300ms cubic-bezier(0.4,0,0.2,1), opacity 250ms ease; }
.itds-accordion__body--closed       { max-height: 0; opacity: 0; }
.itds-accordion__body--open         { max-height: 1000px; opacity: 1; }
```

##### Capa 2 — Estados React con useState (lógica de negocio)

Implementar según el mapa de interacciones confirmado en el Paso 2e. Usar estos patrones base:

```jsx
// ── Patrón: campo controlado con validación ──
const [fieldValue, setFieldValue] = useState('');
const [fieldState, setFieldState] = useState('default');
const [fieldHelper, setFieldHelper] = useState('');

const handleFieldBlur = () => {
  if (!fieldValue.trim()) {
    setFieldState('error');
    setFieldHelper('Este campo es requerido');
  }
};
const handleFieldChange = (e) => {
  setFieldValue(e.target.value);
  if (fieldState === 'error') { setFieldState('default'); setFieldHelper(''); }
};

// ── Patrón: button loading → acción → reset ──
const [btnState, setBtnState] = useState('default');
const handleAction = () => {
  if (btnState !== 'default') return;
  setBtnState('loading');
  setTimeout(() => setBtnState('default'), 1500); // simula async
};

// ── Patrón: button disabled hasta formulario válido ──
const isValid = fieldA.trim().length > 0 && fieldB.trim().length > 0;
// <Button state={isValid ? 'default' : 'disabled'} onClick={isValid ? handleAction : undefined} />

// ── Patrón: toggle (checkbox, switch, accordion) ──
const [isChecked, setIsChecked] = useState(false);
const [isOpen, setIsOpen] = useState(false);

// ── Patrón: tabs con contenido dinámico ──
const [activeTab, setActiveTab] = useState('tab1');

// ── Patrón: notificación temporal ──
const [notification, setNotification] = useState(null);
const showNotification = (type, message) => {
  setNotification({ type, message });
  setTimeout(() => setNotification(null), 4000);
};

// ── Patrón: counter con límites ──
const [count, setCount] = useState(0);
const MIN = 0; const MAX = 10;
const increment = () => setCount(c => Math.min(c + 1, MAX));
const decrement = () => setCount(c => Math.max(c - 1, MIN));
// <Button state={count >= MAX ? 'disabled' : 'default'} onClick={increment} />
// <Button state={count <= MIN ? 'disabled' : 'default'} onClick={decrement} />

// ── Patrón: dropdown / select ──
const [isDropdownOpen, setIsDropdownOpen] = useState(false);
const [selectedOption, setSelectedOption] = useState(null);
```

##### Capa 3 — Accesibilidad mínima de producción

```jsx
// Todos los botones e inputs requieren estos atributos:
<button
  aria-label="Descripción de la acción"
  aria-disabled={state === 'disabled'}
  aria-busy={state === 'loading'}
  tabIndex={state === 'disabled' ? -1 : 0}
/>

<input
  aria-invalid={state === 'error'}
  aria-describedby={helperText ? `${id}-helper` : undefined}
/>
<span id={`${id}-helper`} role="alert">{helperText}</span>

// Acordeón:
<button aria-expanded={isOpen} aria-controls={`accordion-body-${id}`} />
<div id={`accordion-body-${id}`} aria-hidden={!isOpen} />

// Tabs:
<div role="tablist">
  <button role="tab" aria-selected={activeTab === 'tab1'} />
</div>
<div role="tabpanel" aria-labelledby="tab1" />
```

#### 4g — Reglas de generación

```
✅ CSS variables del IT DS para TODOS los valores — nunca HEX ni px sueltos
✅ Todos los componentes del body con width: 100% y box-sizing: border-box
✅ padding: var(--spacing-4) en los 4 lados del body (16px) — siempre
✅ gap: var(--spacing-6) entre componentes del body (24px) — siempre
✅ Responsive mobile-first: base 375px · breakpoint desktop 1280px
✅ Estados CSS (Capa 1) en TODOS los componentes interactivos — sin excepción
✅ Estados React (Capa 2) según el mapa confirmado en el Paso 2e
✅ Accesibilidad mínima (Capa 3) en todos los componentes
✅ Solo React + CSS — sin librerías externas de UI
✅ Generar los 4 archivos con nomenclatura fija (Paso 4a)
```

```
❌ No entregar ningún componente interactivo sin sus estados CSS (:hover, :focus, :active, :disabled)
❌ No generar un Button sin al menos disabled + loading states en React
❌ No generar un TextInput sin validación onBlur y feedback de error/success
❌ No hardcodear colores HEX — siempre var(--color-...)
❌ No hardcodear spacing — siempre var(--spacing-N)
❌ No usar !important
❌ No usar librerías de UI externas
❌ No generar código de ningún componente sin haber inspeccionado sus capas en Penpot MCP (Paso 3c)
❌ No generar componentes fuera del snapshot (bloqueo Paso 3e)
❌ No dejar ningún componente del body con width fijo
❌ No entregar sin el HTML standalone con mockup
```

**Reglas adicionales — validadas en pruebas de construcción:**

```
Layout de pantalla:
❌ No usar min-height: 100vh en .itds-screen (rompe el mockup de altura fija)
❌ No usar position: sticky/fixed en el footer de Action Buttons
✅ .itds-screen height: 100% + flex-direction: column
✅ .itds-screen__body flex: 1 + overflow-y: auto
✅ .itds-screen__footer flex-shrink: 0

PageHeader:
✅ Verificar y-coordinates en Penpot para confirmar el orden visual (navbar/icons ARRIBA, headline ABAJO)
✅ DOM order debe coincidir con visual order de Penpot — los y-coordinates son la fuente de verdad

Card Feature:
❌ No usar min-height en la imagen → se estira al alto completo del card
❌ No usar align-items: stretch en el card
✅ height: 88px fijo en .itds-card-feature__image (leer siempre de Penpot)
✅ align-items: flex-start en .itds-card-feature
✅ padding en el card; align-self: stretch solo en el content si corresponde

Tabs — Default Box:
❌ No usar border-bottom: 2px (eso es variante Underline, no Box)
❌ No ocultar badge en tab inactivo — todos los elementos son siempre visibles
✅ border: 1px solid completo en cada tab + border-radius: var(--radius-button)
✅ itds-badge--neutral (gris) en tab inactivo · itds-badge--theme (azul) en tab activo
✅ Swipe horizontal (touchstart/touchend · deltaX > 50px) siempre en mobile

BottomSheet overlay:
❌ No usar position: absolute/fixed dentro del .mockup__screen — no cubre el status bar
✅ Usar ReactDOM.createPortal hacia #overlay-root (sibling de .mockup__screen dentro de .mockup__frame)
✅ #overlay-root: position: absolute; inset: 0; z-index: 50; pointer-events: none
✅ .itds-overlay: pointer-events: auto (override del portal root)

BottomSheet Headline:
✅ Verificar x/y-coordinates en Penpot para confirmar estructura exacta
✅ Estructura: flex-column → close (align-self: flex-end) ARRIBA → title-section flex-row ABAJO
✅ title-section: text-group (flex: 1, flex-column) a la izquierda + badge a la derecha
❌ No poner close icon como sibling en la misma fila que el título

Action Buttons en BottomSheet:
✅ .itds-action-buttons--sheet { padding: 0 } — el sheet ya provee spacing lateral

Alert:
✅ border: 1px solid var(--color-success-default) en .itds-alert--success (stroke confirmado por Penpot)
✅ white-space: nowrap + overflow: hidden + text-overflow: ellipsis en el título
✅ Texto corto y conciso (ej: "Producto aprobado")

Capas ocultas:
❌ No renderizar en JSX ningún elemento cuya capa Penpot tenga shape.hidden === true
✅ Ejecutar collectHidden() en Paso 3c y reportar capas ocultas al usuario antes de generar
```

---

### Paso 4B — Generación del flujo interactivo (solo Modo B)

**Ejecutar después del Paso 4 estándar cuando el modo es B.** El Paso 4 genera cada pantalla individualmente; este paso las conecta en un sistema navegable.

#### 4B-a — Arquitectura del flujo (useFlow hook)

Todos los flujos usan el mismo hook interno `useFlow` que maneja:
- La pantalla activa
- El historial de navegación (para el botón "volver")
- El estado compartido entre pantallas (datos de formularios, selecciones, etc.)
- Las transiciones de animación

```jsx
// Hook useFlow — incluir siempre en el archivo del flujo
const { useState, useCallback, useRef, useEffect } = React;

function useFlow(screens, initialScreen) {
  const [currentScreen, setCurrentScreen] = useState(initialScreen);
  const [prevScreen, setPrevScreen] = useState(null);
  const [direction, setDirection] = useState('forward'); // 'forward' | 'back'
  const [isAnimating, setIsAnimating] = useState(false);
  const [flowState, setFlowState] = useState({});
  const history = useRef([initialScreen]);

  const navigate = useCallback((screenId, sharedData = {}) => {
    if (isAnimating || screenId === currentScreen) return;
    setDirection('forward');
    setPrevScreen(currentScreen);
    setFlowState(prev => ({ ...prev, ...sharedData }));
    history.current.push(screenId);
    setIsAnimating(true);
    setTimeout(() => {
      setCurrentScreen(screenId);
      setIsAnimating(false);
    }, 320);
  }, [currentScreen, isAnimating]);

  const goBack = useCallback(() => {
    if (isAnimating || history.current.length <= 1) return;
    history.current.pop();
    const prev = history.current[history.current.length - 1];
    setDirection('back');
    setPrevScreen(currentScreen);
    setIsAnimating(true);
    setTimeout(() => {
      setCurrentScreen(prev);
      setIsAnimating(false);
    }, 320);
  }, [currentScreen, isAnimating]);

  const updateFlowState = useCallback((data) => {
    setFlowState(prev => ({ ...prev, ...data }));
  }, []);

  return { currentScreen, prevScreen, direction, isAnimating, flowState, navigate, goBack, updateFlowState };
}
```

#### 4B-b — Estructura JSX del flujo

```jsx
// [NombreFlow].jsx — estructura raíz del flujo
const [NombreFlow] = () => {
  const { currentScreen, direction, isAnimating, flowState, navigate, goBack, updateFlowState } = useFlow(
    ['Screen1', 'Screen2', 'Screen3'],  // lista de pantallas
    'Screen1'                            // pantalla inicial
  );

  // Props compartidas que se pasan a todas las pantallas
  const sharedProps = { navigate, goBack, flowState, updateFlowState };

  return (
    <div className="flow-container">
      <div className={`flow-slides ${isAnimating ? `flow-slides--animating-${direction}` : ''}`}>
        {currentScreen === 'Screen1' && <Screen1 {...sharedProps} />}
        {currentScreen === 'Screen2' && <Screen2 {...sharedProps} />}
        {currentScreen === 'Screen3' && <Screen3 {...sharedProps} />}
      </div>
    </div>
  );
};
```

#### 4B-c — CSS de transiciones — OBLIGATORIO

```css
/* ── Sistema de transiciones del flujo ── */
.flow-container {
  width: 100%;
  height: 100%;
  overflow: hidden;
  position: relative;
}

.flow-slides {
  width: 100%;
  height: 100%;
  position: relative;
}

/* Forward: nueva pantalla entra desde la derecha */
@keyframes slideInRight {
  from { transform: translateX(100%); opacity: 0; }
  to   { transform: translateX(0);    opacity: 1; }
}

/* Back: pantalla actual sale hacia la derecha */
@keyframes slideInLeft {
  from { transform: translateX(-100%); opacity: 0; }
  to   { transform: translateX(0);     opacity: 1; }
}

/* Fade para desktop */
@keyframes fadeIn {
  from { opacity: 0; transform: translateY(8px); }
  to   { opacity: 1; transform: translateY(0); }
}

.flow-slides--animating-forward > * {
  animation: slideInRight 320ms cubic-bezier(0.4, 0, 0.2, 1) forwards;
}

.flow-slides--animating-back > * {
  animation: slideInLeft 320ms cubic-bezier(0.4, 0, 0.2, 1) forwards;
}

/* Desktop usa fade en lugar de slide */
@media (min-width: 1280px) {
  .flow-slides--animating-forward > *,
  .flow-slides--animating-back > * {
    animation: fadeIn 280ms cubic-bezier(0.4, 0, 0.2, 1) forwards;
  }
}
```

#### 4B-d — Patrones de estados de componentes con React state

Para cada componente con lógica de negocio del Paso 2B-c, usar estos patrones:

##### Patrón: Button con estados loading + navegación

```jsx
const [btnState, setBtnState] = useState('default'); // 'default' | 'loading' | 'disabled'

const handleSubmit = () => {
  if (btnState !== 'default') return;
  setBtnState('loading');
  // Simular llamada async
  setTimeout(() => {
    setBtnState('default');
    navigate('NextScreen', { formData });
  }, 1500);
};

<Button
  variant="primary"
  size="lg"
  label={btnState === 'loading' ? 'Cargando...' : 'Continuar'}
  state={btnState}
  onClick={handleSubmit}
/>
```

##### Patrón: TextInput con validación y estado de error

```jsx
const [inputState, setInputState] = useState('default');
const [inputValue, setInputValue] = useState('');
const [helperText, setHelperText] = useState('');

const validateEmail = (val) => /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(val);

const handleBlur = () => {
  if (inputValue && !validateEmail(inputValue)) {
    setInputState('error');
    setHelperText('Ingresa un email válido');
  } else {
    setInputState('default');
    setHelperText('');
  }
};

<TextInput
  label="Correo electrónico"
  value={inputValue}
  state={inputState}
  helperText={helperText}
  onChange={(e) => { setInputValue(e.target.value); setInputState('default'); }}
  onBlur={handleBlur}
  filled={inputValue.length > 0}
/>
```

##### Patrón: Deshabilitar botón hasta que formulario sea válido

```jsx
const [fields, setFields] = useState({ email: '', password: '' });
const isFormValid = fields.email.length > 0 && fields.password.length > 0;

<Button
  variant="primary"
  state={isFormValid ? 'default' : 'disabled'}
  label="Ingresar"
  onClick={isFormValid ? handleLogin : undefined}
/>
```

##### Patrón: Notificación de error tras acción fallida

```jsx
const [notification, setNotification] = useState(null);
// { type: 'error' | 'success', message: string } | null

const handleAction = () => {
  // Si falla:
  setNotification({ type: 'error', message: 'Credenciales incorrectas. Intenta de nuevo.' });
  setTimeout(() => setNotification(null), 4000);
};

{notification && (
  <Notification
    variant={notification.type}
    message={notification.message}
    onDismiss={() => setNotification(null)}
  />
)}
```

##### Patrón: Pasar estado entre pantallas vía flowState

```jsx
// En LoginScreen — guardar datos antes de navegar
const handleLogin = () => {
  navigate('HomeScreen', {
    user: { name: 'Juan', email: fields.email },
    isAuthenticated: true
  });
};

// En HomeScreen — leer datos del flujo
const { flowState } = props;
<NavbarMobile title={`Hola, ${flowState.user?.name}`} />
```

#### 4B-e — Nomenclatura de archivos para flujo

| Archivo | Descripción |
|---|---|
| `[NombreFlow].jsx` | Componente raíz del flujo con `useFlow` + todas las pantallas |
| `[NombreFlow].html` | Preview standalone con mockup de dispositivo |
| `tokens.css` | CSS variables IT DS (igual que pantalla única) |
| `components.css` | Estilos de todos los componentes + CSS de transiciones |

#### 4B-f — Checklist adicional para flujos

```
□ useFlow hook incluido y funcional
□ Todas las pantallas del mapa del Paso 2B-b están implementadas
□ Todos los disparadores de navegación del Paso 2B-b están conectados
□ Todos los estados de componentes del Paso 2B-c están implementados
□ Transiciones CSS incluidas en components.css
□ goBack funcional en pantallas que lo requieren (NavbarMobile showBack=true)
□ flowState pasa correctamente los datos entre pantallas que lo necesitan
□ Animación slide para mobile · fade para desktop
```

---

---

### Paso 2C — Patch wizard (Modo C — editar existente)

**Wizard de edición para pantallas ya generadas.** No repite la estructura completa — solo pregunta qué cambiar.

> **Regla de intervención mínima:** Modificar **solo** los elementos indicados por el usuario. No tocar componentes, estilos, tokens ni lógica que no estén en el scope del cambio solicitado. Si un ajuste tiene efecto colateral sobre otro elemento, informar antes de aplicarlo.

```
────────────────────────────────────────────────────────────────
forge ~/it-ds $ patch --screen [NombreScreen]
────────────────────────────────────────────────────────────────
[PATCH] editar pantalla existente

  PANTALLA A EDITAR
  → Nombre de la pantalla del historial (ej: LoginScreen)
     o describe brevemente cuál es

  TIPO DE CAMBIO  (puedes combinar varios)
  [A] reemplazar componente    · de X a Y
  [B] agregar componente       · en header / body / footer
  [C] eliminar componente      · remover de la sección
  [D] cambiar variante/prop    · mismo componente, otra variante
  [E] cambiar estado interactivo · agregar/modificar lógica React
  [F] cambiar theme             · IT ↔ Arcus
  [G] cambiar plataforma        · mobile ↔ desktop

  Describe el cambio:
  Ej: "cambiar Button Primary a Tertiary en el footer"
      "agregar Alert type=Error en el body después del TextInput"
      "el TextInput de email debe validar formato onBlur"

forge ~/it-ds $ _
────────────────────────────────────────────────────────────────
```

Al recibir la descripción del cambio:

1. Leer `references/code-history.md` para encontrar la pantalla y sus componentes actuales
2. Identificar exactamente qué archivos y qué secciones de código se modifican
3. Mostrar un resumen del cambio antes de aplicar:

```
────────────────────────────────────────────────────────────────
forge ~/it-ds $ diff --screen LoginScreen
────────────────────────────────────────────────────────────────
  CAMBIOS A APLICAR

  - footer/Button · variant=Primary  →  variant=Tertiary
    afecta: LoginScreen.jsx (línea ~87) · LoginScreen.html · components.css

  ARCHIVOS QUE SE REGENERAN
  ├── LoginScreen.jsx        ← sección footer modificada
  ├── LoginScreen.html       ← embebido actualizado
  └── components.css         ← estilos Button Tertiary agregados

  ¿Aplicar cambios? → "sí" o describe otro ajuste
────────────────────────────────────────────────────────────────
```

Regenerar **solo los archivos afectados** — nunca la pantalla completa si el cambio es localizado. Actualizar historial al finalizar.

---

### Paso 2E — Iteración rápida (Modo E)

**Para cambios menores post-entrega, sin wizard.** El usuario pide algo concreto después de recibir el código.

Detectar automáticamente si el mensaje es una iteración rápida:
- El usuario ya recibió código en esta sesión
- El cambio es específico y localizado (1-3 componentes máximo)
- No requiere redefinir plataforma, theme ni estructura base

Responder con formato de comando directo:

```
────────────────────────────────────────────────────────────────
forge ~/it-ds $ quick-patch "[descripción del cambio]"
────────────────────────────────────────────────────────────────
  aplicando: [descripción exacta del cambio]
  archivo:   [NombreScreen].jsx → sección [header/body/footer]
────────────────────────────────────────────────────────────────
```

Entregar solo el fragmento de código modificado (no el archivo completo) con instrucciones de dónde reemplazarlo. Si el cambio afecta también el HTML standalone, entregar la sección `<style>` o `<script>` actualizada.

> **Regla de intervención mínima:** Entregar exclusivamente el bloque afectado. No reescribir secciones adyacentes, no reformatear código existente, no "aprovechar" el patch para limpiar o mejorar lo que no fue pedido.
> **Regla:** Si el cambio parece afectar más de 3 componentes o cambia la estructura base, sugerir usar el Modo C (patch wizard) en su lugar.

---

### Paso 4C — Regeneración selectiva (Modo C)

Después de confirmar el diff del Paso 2C, regenerar solo los archivos y secciones afectadas:

- **Solo componente cambiado:** entregar el bloque JSX del componente + su CSS actualizado
- **Sección completa cambiada:** entregar el JSX de la sección (header/body/footer) + CSS
- **Cambio de theme o plataforma:** regenerar todos los archivos (es un cambio global)
- **HTML standalone:** siempre regenerar completo (es un archivo monolítico)

Build log del patch:

```
────────────────────────────────────────────────────────────────
forge ~/it-ds $ apply-patch LoginScreen
────────────────────────────────────────────────────────────────
$ reading    code-history.md .................. ✓ LoginScreen encontrado
$ inspecting penpot layers  Button/Tertiary ... ✓ variante confirmada
$ patching   LoginScreen.jsx .................. ✓ footer actualizado
$ patching   LoginScreen.html ................. ✓ embebido sincronizado
$ patching   components.css ................... ✓ estilos Tertiary agregados
────────────────────────────────────────────────────────────────
✓ patch complete · LoginScreen actualizado
────────────────────────────────────────────────────────────────
```

---

### Paso 4D — Exportación production-ready (Modo D)

Convierte el código generado (CDN + Babel) a una estructura de proyecto real con imports ES modules.

#### Estructura de salida para Next.js (App Router)

```
[NombreScreen]-nextjs/
├── app/
│   └── [nombre-route]/
│       └── page.tsx          ← Server Component wrapper
├── components/
│   ├── [NombreScreen].tsx    ← Client Component principal
│   └── [Componente].tsx      ← Sub-componentes separados
├── styles/
│   ├── tokens.css            ← CSS variables (igual que standalone)
│   └── [NombreScreen].module.css  ← CSS Modules
└── README.md                 ← Instrucciones de integración
```

#### Estructura de salida para Vite + React

```
[NombreScreen]-vite/
├── src/
│   ├── screens/
│   │   └── [NombreScreen]/
│   │       ├── index.tsx
│   │       └── [NombreScreen].module.css
│   ├── components/
│   │   └── [Componente]/
│   │       ├── index.tsx
│   │       └── [Componente].module.css
│   └── styles/
│       └── tokens.css
├── package.json
└── README.md
```

#### Diferencias clave vs la versión CDN

```tsx
// ❌ Versión CDN (preview)
const { useState } = React;
const root = ReactDOM.createRoot(...)

// ✅ Versión producción (Next.js)
'use client';
import { useState } from 'react';
import styles from './LoginScreen.module.css';
export default function LoginScreen() { ... }

// ✅ Versión producción (Vite)
import { useState } from 'react';
import './LoginScreen.module.css';
export default function LoginScreen() { ... }
```

#### Conversión de CSS variables

En producción, los tokens se importan desde un archivo global en lugar de estar embebidos:

```css
/* tokens.css → importar en layout.tsx (Next.js) o main.tsx (Vite) */
@import url('https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&display=swap');
:root { /* mismas variables del IT DS */ }
```

#### Build log del export

```
────────────────────────────────────────────────────────────────
forge ~/it-ds $ export [NombreScreen] --target [nextjs|vite]
────────────────────────────────────────────────────────────────
$ converting  JSX → TSX + imports ES modules ........ ✓
$ converting  CSS inline → CSS Modules .............. ✓
$ generating  page.tsx wrapper ...................... ✓
$ generating  package.json ......................... ✓
$ generating  README.md ............................ ✓
────────────────────────────────────────────────────────────────
✓ export complete · listo para npm install && npm run dev
────────────────────────────────────────────────────────────────
```

---

### Paso 4F — Documentación y Storybook (Modo F)

Genera dos artefactos de documentación para cada pantalla construida.

#### Artefacto 1 — README.md

```markdown
# [NombreScreen]

> IT DS · [Theme] · [Mobile/Desktop] · generado por itds-code-forge

## Descripción
[Una línea describiendo qué hace esta pantalla]

## Uso

\`\`\`tsx
import [NombreScreen] from './[NombreScreen]';

// Pantalla única
<[NombreScreen] />

// En un flujo (con useFlow)
<[NombreScreen] navigate={navigate} goBack={goBack} flowState={flowState} />
\`\`\`

## Props

| Prop | Tipo | Default | Descripción |
|---|---|---|---|
| navigate | (screenId: string, data?: object) => void | — | Navega a otra pantalla del flujo |
| goBack | () => void | — | Vuelve a la pantalla anterior |
| flowState | object | {} | Estado compartido entre pantallas |

## Componentes IT DS utilizados

| Sección | Componente | Variante | Props React |
|---|---|---|---|
| header | NavbarMobile | default | title, showBack |
| body | TextInput | size=MD | label, state, helperText |
| footer | Button | Primary/Size=L | label, onClick, disabled |

## Estados interactivos

| Componente | Estado CSS | Estado React |
|---|---|---|
| Button "Ingresar" | :hover Theme.Hover · :disabled opacity .4 | disabled si campos vacíos · loading al clic |
| TextInput "Email" | :focus borde Theme.Primary | error si formato inválido onBlur |

## Archivos

\`\`\`
[NombreScreen].jsx      ← Componente React (CDN preview)
[NombreScreen].html     ← Standalone preview con mockup
tokens.css              ← CSS variables IT DS
components.css          ← Estilos de componentes
\`\`\`

## Integración en proyecto React

1. Copiar los archivos en `src/screens/[NombreScreen]/`
2. Importar `tokens.css` en el entry point de la app
3. Reemplazar los imports CDN por imports ES modules (ver Modo D — exportar)
```

#### Artefacto 2 — [NombreScreen]-states.html (Storybook visual)

Archivo HTML standalone que muestra todos los estados de cada componente de la pantalla en una grilla visual, para referencia del equipo de desarrollo:

```html
<!-- [NombreScreen]-states.html -->
<!DOCTYPE html>
<html lang="es">
<head>
  <title>[NombreScreen] — States Reference · IT DS</title>
  <!-- DM Sans + React CDN + tokens.css embebido -->
</head>
<body style="background:#0f172a; padding:32px; font-family:'DM Sans'">

  <!-- Header de la página -->
  <h1 style="color:#e2e8f0">[NombreScreen] — States Reference</h1>
  <p style="color:#64748b">IT DS · [Theme] · Generado por itds-code-forge</p>

  <!-- Por cada componente: grilla de estados -->
  <section>
    <h2 style="color:#94a3b8">Button / Primary / Size=L</h2>
    <div style="display:flex; gap:16px; flex-wrap:wrap; align-items:center">
      <!-- Default · Hover · Pressed · Disabled · Loading -->
      <!-- Cada estado como instancia separada con su label -->
    </div>
  </section>

  <section>
    <h2 style="color:#94a3b8">TextInput / size=MD</h2>
    <div style="display:flex; gap:16px; flex-wrap:wrap">
      <!-- Default · Hover · Focus · Filled · Error · Disabled · Success -->
    </div>
  </section>
  <!-- ... resto de componentes -->

</body>
</html>
```

#### Archivos que genera el Modo F

| Archivo | Descripción |
|---|---|
| `[NombreScreen]-README.md` | Documentación completa para developers |
| `[NombreScreen]-states.html` | Grilla visual de todos los estados de componentes |

#### Build log de docs

```
────────────────────────────────────────────────────────────────
forge ~/it-ds $ docs [NombreScreen]
────────────────────────────────────────────────────────────────
$ reading    code-history.md .................. ✓ [NombreScreen] encontrado
$ generating [NombreScreen]-README.md ......... ✓ props · estados · integración
$ generating [NombreScreen]-states.html ........ ✓ [N] componentes · [M] estados
────────────────────────────────────────────────────────────────
✓ docs complete · 2 archivos generados
────────────────────────────────────────────────────────────────
```

---

### Paso 5 — Checklist de entrega y reporte

#### 5a — Checklist obligatorio antes de entregar

Verificar cada punto antes de entregar el código. Si alguno falla, corregir antes de continuar.

```
□ Los archivos están generados con nomenclatura correcta:
    Pantalla única: [Screen].jsx · [Screen].html · tokens.css · components.css
    Flujo:          [Flow].jsx   · [Flow].html   · tokens.css · components.css
□ El archivo HTML abre en el browser sin build tools — mobile muestra mockup iPhone 15 Pro · desktop renderiza a pantalla completa con browser chrome mínimo
□ Todos los componentes del body tienen width: 100% y box-sizing: border-box
□ Todos los componentes fueron inspeccionados vía Penpot MCP antes de generar (Paso 3c)
□ Todos los componentes provienen del IT DS de Penpot (están en el snapshot)
□ Ningún valor HEX hardcodeado — todos usan var(--color-...)
□ Ningún spacing hardcodeado — todos usan var(--spacing-N)
□ Gap de 16px entre secciones del layout (var(--spacing-4))
□ Padding de 16px en los 4 lados del body (var(--spacing-4))
□ Gap de 24px entre componentes del body (var(--spacing-6))
□ Sin librerías externas de UI — solo React CDN + CSS IT DS
□ Responsive: funciona en 375px mobile y 1280px desktop
□ Estados CSS incluidos: :hover, :focus, :active, :disabled en todos los componentes interactivos
□ [Solo Modo B] useFlow hook incluido y funcional
□ [Solo Modo B] Todos los disparadores de navegación conectados
□ [Solo Modo B] Todos los estados React de componentes implementados (Paso 2B-c)
□ [Solo Modo B] Transiciones CSS: slide mobile · fade desktop
□ [Solo Modo B] goBack funcional en pantallas con NavbarMobile showBack=true
□ [Solo Modo C/E] solo los archivos afectados fueron regenerados — no la pantalla completa
□ [Solo Modo D] imports ES modules reemplazados · CDN eliminado · CSS Modules generados
□ [Solo Modo F] README.md con props, estados e instrucciones de integración generado
□ [Solo Modo F] [NombreScreen]-states.html con todos los estados de componentes generado
```

#### 5b — Reporte obligatorio

```
✅ [Pantalla / Flujo] generado:  [Nombre]
📱 Plataforma base:              [Mobile 375px / Desktop 1280px]
🎨 Theme:                        [IT / Arcus]
⚛️  Stack:                       React 18 CDN + CSS Variables IT DS

📦 Componentes incluidos:
  [Pantalla única]
    Header:  [lista]
    Body:    [lista]
    Footer:  [lista]
  [Flujo — por pantalla]
    Screen1 · Header: [lista] · Body: [lista] · Footer: [lista]
    Screen2 · Header: [lista] · Body: [lista] · Footer: [lista]

🔀 [Solo Modo B] Flujo de navegación:
  Screen1 → Screen2: Button "Continuar" onClick
  Screen2 → Screen3: Button "Confirmar" onClick
  Screen2 ← Screen1: NavbarMobile goBack

⚡ [Solo Modo B] Estados React implementados:
  Button "Continuar": disabled cuando campos vacíos · loading al hacer clic
  TextInput "Email": validación onBlur · state=Error si formato inválido
  [otros estados documentados]

📁 Archivos generados:
  Modo A/B (construcción):
    [Nombre].jsx          ← Componente React
    [Nombre].html         ← Preview mockup de dispositivo
    tokens.css            ← CSS variables IT DS
    components.css        ← Estilos + transiciones
  Modo C (patch):
    [archivos modificados solamente]
  Modo D (producción):
    [Nombre]-nextjs/ o [Nombre]-vite/  ← estructura lista para npm install
  Modo F (docs):
    [Nombre]-README.md    ← documentación para developers
    [Nombre]-states.html  ← referencia visual de estados

🎨 Tokens aplicados:
  Padding body:        var(--spacing-4) = 16px (4 lados)
  Gap body:            var(--spacing-6) = 24px entre componentes
  Fondo pantalla:      [token leído del board Penpot — ej: var(--color-neutral-white)]
  Color primario:      var(--color-theme-primary)

📋 Cómo previsualizar:
  → Abrir [Nombre].html directamente en el browser
  → Las transiciones entre pantallas se ven en el mockup del dispositivo

⚠️  Pendientes / notas: [componentes omitidos u otras observaciones]
```

#### 5c — Dependencias para el proyecto React

```bash
npm install react@18 react-dom@18

# Fuente Inter en <head>:
# <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
```

---

### Paso 6 — Actualizar el historial de construcciones

**Obligatorio al finalizar cada construcción exitosa.** Agregar al inicio de `references/code-history.md`.

```markdown
---

## [NombreScreen] · [fecha YYYY-MM-DD]

| Campo | Valor |
|---|---|
| **Plataforma** | Mobile 375px / Desktop 1280px |
| **Theme** | IT / Arcus |
| **Archivos** | [NombreScreen].jsx · [NombreScreen].html · tokens.css · components.css |

### Componentes utilizados

| Sección | Componente | Variante | Prop React | Estado |
|---|---|---|---|---|
| header | NavbarMobile | default | `<NavbarMobile title="...">` | ✅ OK |
| body | TextInput | size=M | `<TextInput size="md" />` | ✅ OK |
| footer | Button | size=L, variant=Primary | `<Button size="lg" variant="primary" />` | ✅ OK |

### Tokens CSS clave

| Propiedad | Variable | Valor |
|---|---|---|
| Gap entre secciones | `var(--spacing-4)` | 16px |
| Fondo | `var(--color-screen-soft)` | #F9FAFB |
| Primario | `var(--color-theme-primary)` | IT: #2563EB (Blue) · Arcus: #000000 (Black) |

### Observaciones

[Componentes bloqueados y cómo se resolvieron, o "Sin observaciones"]
```

> **Regla:** No cerrar la sesión sin actualizar el historial. Si la generación fue parcial, registrar el estado con una nota en Observaciones.

---

### Paso 7 — Crear reporte de prueba

**Obligatorio al finalizar cada construcción exitosa.** Crear el archivo `tests/test-[nombre-kebab].md` dentro de `tests/`. Si la carpeta `tests/` no existe, crearla primero.

#### Convención de nombre

```
tests/test-[nombre-pantalla-en-kebab-case].md
```

Ejemplos:
- `CategoryScreen` → `tests/test-category-screen.md`
- `LoginFlow` → `tests/test-login-flow.md`
- `HomeScreen (Arcus)` → `tests/test-home-screen-arcus.md`

#### Cuándo crear el reporte

Crear el reporte **después** de actualizar `code-history.md` (Paso 6), antes de cerrar la sesión. Si hubo iteraciones post-entrega, incluirlas en el reporte antes de guardarlo.

#### Estructura del reporte

```markdown
# Code Forge — Reporte de Prueba
## Pantalla: [NombreScreen]

**Fecha:** [YYYY-MM-DD]
**Skill:** itds-code-forge
**Origen Penpot:** [página · board exacto]
**Plataforma:** [Mobile 375×812 / Desktop 1280×800]
**Theme:** [IT / Arcus]
**Output:** `~/Desktop/[NombreScreen]/`
**Origen del reporte:** [Sesión local / Enviado por [nombre o alias] · recibido [YYYY-MM-DD]]

---

## Resultado por criterio

| Criterio | Resultado | Detalle |
|---|---|---|
| **Fidelidad visual al diseño Penpot** | [1–3 o ✅] | [descripción breve] |
| **Reutilización de tokens IT DS** | [✅ Completo / Parcial] | [detalle de tokens usados o desviaciones] |
| **Inspección de capas MCP** | [✅ Completo / Parcial] | [niveles inspeccionados y hallazgos] |
| **Interacciones implementadas** | [✅ Completo / Parcial] | [botones, hover, loading, disabled] |
| **Iteraciones post-entrega** | [número] | [descripción de los cambios realizados] |
| **Tiempo de ejecución** | [~X min] | [incluir inspección + generación + iteraciones] |
| **Calidad del resultado** | [1–3 o ✅] | [evaluación final] |

Escala fidelidad/calidad: 1 = sin ajustes · 2 = ajustes menores · 3 = rework estructural

---

## Componentes utilizados

| Sección | Componente Penpot | Variante | Clase CSS | Estado |
|---|---|---|---|---|
| header | [nombre exacto] | [variante] | `.[clase]` | ✅ OK / ⚠️ ajuste / ❌ problema |

---

## Tokens aplicados

| Propiedad | Token Penpot | Variable CSS | Valor |
|---|---|---|---|
| [propiedad visual] | `[Token.Nombre]` | `--color-...` | `#XXXXXX` |

---

## Hallazgos y reglas generadas

| # | Componente | Comportamiento observado | Regla incorporada |
|---|---|---|---|
| 001 | [componente] | [qué falló o fue inesperado] | [regla resultante] |

### Hallazgos exportables

Completar para cada hallazgo nuevo — no documentado previamente en `react-patterns.md`. Este bloque es el formato que permite incorporar el hallazgo en futuras versiones del skill.

```
[001] Nombre descriptivo del hallazgo
- Componente:   [nombre exacto en IT DS]
- Theme:        [IT / Arcus / ambos]
- Síntoma:      [descripción exacta de qué falló o fue inesperado]
- Causa raíz:   [por qué ocurre]
- Solución:     [el CSS / JSX / regla que lo resolvió]
- Regla:        [formulación en una línea para react-patterns.md]
- Incorporado:  [✅ en esta sesión / ⏳ pendiente]
```

_(omitir esta subsección si no hubo hallazgos nuevos)_

---

## Ajustes realizados post-entrega

| # | Ajuste | Archivo/s | Causa |
|---|---|---|---|
| 1 | [descripción del ajuste] | `[archivo.css]` · `[archivo.jsx]` | [causa del problema] |

_(omitir sección si no hubo ajustes)_

---

## Archivos generados

\`\`\`
~/Desktop/[NombreScreen]/
├── [NombreScreen].jsx
├── [NombreScreen].html
├── tokens.css
└── components.css
\`\`\`
```

#### Qué registrar en cada sección

- **Resultado por criterio:** Ser honesto — si requirió 5 iteraciones, el criterio de fidelidad no es 1.
- **Componentes utilizados:** Solo los que realmente aparecen en el output final. Incluir la clase CSS real generada.
- **Tokens aplicados:** Solo los tokens verificados contra Penpot MCP — no asumir valores.
- **Origen del reporte:** `Sesión local` si fue generado en la misma sesión. `Enviado por [nombre/alias]` si fue recibido de un usuario externo — incluir fecha de recepción.
- **Hallazgos:** Problemas encontrados durante la inspección o la generación que no estaban documentados. Si se incorporaron como regla al skill, indicarlo.
- **Hallazgos exportables:** Completar el bloque estructurado para cada hallazgo nuevo. Es el formato mínimo para que el hallazgo pueda incorporarse a `react-patterns.md` en una sesión futura — sea por el mismo usuario o por otro.
- **Ajustes post-entrega:** Cada cambio solicitado por el usuario después de la primera entrega. Si no hubo ajustes, omitir la sección.

> **Regla:** No cerrar la sesión sin crear el reporte de prueba. El reporte es la memoria de calidad del skill — si el Paso 6 registra qué se construyó, el Paso 7 registra cómo salió y qué se aprendió.

---

### Paso 8 — Crear carpeta de prueba completa

**Ejecutar siempre al finalizar el Paso 7.** Preguntar al usuario si desea guardar todos los archivos generados en una carpeta de entrega en el Desktop.

#### Pregunta al usuario

Mostrar el siguiente bloque de confirmación:

```
────────────────────────────────────────────────────────────────
forge ~/it-ds $ mkdir --delivery [NombrePantalla]
────────────────────────────────────────────────────────────────
[PASO 8 / 8] carpeta de prueba completa

  ¿Deseas crear una carpeta con la prueba completa?
  [S] Sí   [N] No, omitir

  Si [S] → ¿Dónde quieres guardarla?
  [1] ~/Desktop/[NombrePantalla]/          ← recomendado
  [2] ~/Desktop/Skills IT DS/tests/[NombrePantalla]/
  [3] Ingresar ruta personalizada

[8/8] ▓▓▓▓▓▓▓▓  último paso →
────────────────────────────────────────────────────────────────
```

La carpeta contendrá:
```
[NombrePantalla]/
├── [NombrePantalla].html      ← preview standalone
├── [NombrePantalla].jsx       ← componente React
├── tokens.css                  ← CSS variables IT DS
├── components.css              ← estilos de componentes
└── tests/
    └── test-[nombre-kebab].md ← reporte de prueba
```

> Si el usuario elige [3], esperar que ingrese la ruta completa antes de continuar.

#### Si el usuario confirma destino — Crear carpeta

1. Crear la carpeta en la ruta elegida si no existe
2. Guardar dentro los 4 archivos generados: `.html`, `.jsx`, `tokens.css`, `components.css`
3. Crear subcarpeta `tests/` y guardar el reporte `test-[nombre-kebab].md`
4. Confirmar con el árbol de archivos final:

```
────────────────────────────────────────────────────────────────
forge ~/it-ds $ ls ~/Desktop/[NombrePantalla]/
────────────────────────────────────────────────────────────────
✅ Carpeta creada:

  ~/Desktop/[NombrePantalla]/
  ├── [NombrePantalla].html      [~XX KB]
  ├── [NombrePantalla].jsx       [~XX KB]
  ├── tokens.css                  [~XX KB]
  ├── components.css              [~XX KB]
  └── tests/
      └── test-[nombre-kebab].md [~XX KB]

  Abre [NombrePantalla].html en el browser para ver el preview.

forge ~/it-ds $ _
────────────────────────────────────────────────────────────────
```

#### Si el usuario responde [N] — No

Mostrar confirmación de cierre sin crear la carpeta:

```
────────────────────────────────────────────────────────────────
forge ~/it-ds $ build complete
────────────────────────────────────────────────────────────────
✅ Build finalizado. Carpeta de entrega omitida.

   Los archivos fueron generados durante la sesión.
   Puedes pedirme que los cree en cualquier momento.

forge ~/it-ds $ _
────────────────────────────────────────────────────────────────
```

> **Regla:** Este paso es siempre el último — ejecutar después de Paso 7 sin excepción. Si el usuario ya tiene la carpeta del build en el Desktop de sesiones anteriores, preguntar igualmente — podría querer actualizarla.

---

## Aprendizajes de construcción — Lecciones validadas en sesión

> Reglas derivadas de construcciones reales. Tienen la misma prioridad que las reglas absolutas.

### Tag — dos variantes con clases CSS distintas

El componente Tag en el IT DS tiene dos variantes con tokens y semántica distintos. **Nunca generar un solo `itds-tag--theme` para ambos.**

| Variante Penpot | Clase CSS | Fondo | Texto | Fuente | Íconos |
|---|---|---|---|---|---|
| `Tag / TagBusiness` | `.itds-tag--business` | `Brand.Paris` = `#006DFF` | `Neutral.White` = `#FFFFFF` | xs / 700 | Obligatorio (storefront u otro) |
| `Tag / Tags` | `.itds-tag--info` | `Info.Softest` = `#DBEAFE` | `Info.Stronger` = `#1D4ED8` | sm / 500 | Opcionales — pueden ocultarse |

```css
/* Tag / TagBusiness */
.itds-tag--business {
  gap: 4px; padding: 4px 8px;
  background-color: var(--color-brand-paris); /* #006DFF */
  color: #FFFFFF;
  font-size: var(--text-xs); font-weight: var(--weight-bold);
  border-radius: var(--radius-full);
}

/* Tag / Tags */
.itds-tag--info {
  gap: 4px; padding: 4px 8px;
  background-color: var(--color-info-softest); /* #DBEAFE */
  color: var(--color-info-stronger);           /* #1D4ED8 */
  font-size: var(--text-sm); font-weight: var(--weight-medium);
  border-radius: var(--radius-full);
}
```

Tokens nuevos a incluir en `tokens.css` cuando se usen estas variantes:
```css
--color-brand-paris:   #006DFF;   /* Brand.Paris */
--color-info-softest:  #DBEAFE;   /* Info.Softest  → Blue.100 */
--color-info-stronger: #1D4ED8;   /* Info.Stronger → Blue.700 */
```

### Separadores entre secciones — no existen en IT DS

❌ No agregar `border-bottom` al `.itds-screen__header` ni `border-top` al `.itds-screen__footer`.
El IT DS no usa divisores visuales entre header, body y footer. Si el diseño en Penpot los tiene, respetarlos; de lo contrario, omitirlos.

### Background — leer siempre del board Penpot

❌ No asumir `var(--color-screen-soft)` como fondo por defecto.
✅ Leer el token `fill` del board principal en Penpot MCP y usarlo en `.itds-screen`, `.itds-screen__header`, `.itds-screen__body` y `.itds-screen__footer`.

### Status bar — adaptativa al fondo de pantalla

| Fondo de pantalla | Status bar bg | Color iconos/tiempo |
|---|---|---|
| `neutral.white` / `screen-base` / claro | `var(--color-neutral-white)` | `#0F172A` |
| `screen-soft` (#F1F5F9) | `var(--color-screen-soft)` | `#0F172A` |
| Oscuro / `neutral.strongest` | color oscuro del diseño | `#FFFFFF` |

Los SVGs del status bar deben tener `fill="#0F172A"` para pantallas claras y `fill="white"` para pantallas oscuras.

### Componentes compuestos — inspeccionar 3 niveles de profundidad

Usar `shapeStructure(component, 6)` para componentes que contienen sub-grupos (`Page Header`, `Navigation List`, `ActionButtons`). Extraer `columnGap`, `rowGap` y tokens de **cada sub-contenedor** individualmente. El gap del padre no aplica a los hijos.

### Íconos — Material Icons vs placeholder vs ocultar

Los desarrolladores usan **Material Icons** (Google Fonts CDN) como librería estándar de íconos. El skill no debe asumir qué ícono va en cada componente — siempre preguntar en el Paso 3b.

**Regla por tipo de componente:**

| Componente | Ícono obligatorio | Puede ocultarse | Opciones en Paso 3b |
|---|---|---|---|
| `Tag / TagBusiness` | No | Sí | Reemplazar · Ocultar · Mantener |
| `Tag / Tags` | No | Sí | Reemplazar · Ocultar · Mantener |
| `Tabs` (leading icon) | No | Sí | Reemplazar · Ocultar · Mantener |
| `ActionIcon` / `IconButton` | Sí (es su razón de ser) | No | Reemplazar · Mantener |
| `Navigation List` leading | Sí por diseño | No | Reemplazar · Mantener |
| `Button` con ícono | Depende del diseño | No | Reemplazar · Mantener |

**Integración Material Icons:**

```html
<!-- Agregar al <head> solo si al menos un componente usa Material Icons -->
<link href="https://fonts.google.com/icon?family=Material+Icons" rel="stylesheet">
```

```jsx
/* JSX — reemplaza el SVG inline */
<span className="material-icons" aria-hidden="true">icon_name</span>
```

```css
/* components.css — agregar solo cuando se usa Material Icons */
.material-icons {
  font-size: inherit;
  line-height: 1;
  display: inline-flex;
  align-items: center;
}
```

**Cómo leer el nombre del ícono desde el link:**
- `https://fonts.google.com/icons?selected=Material+Icons:arrow_back:` → `arrow_back`
- `https://fonts.google.com/icons?icon.query=map` → `map`
- El nombre siempre va en snake_case dentro del `<span>`

**Parámetros del ícono — leer siempre desde Penpot, aplicar en selector compuesto:**

Antes de generar, inspeccionar `width`, `fill` y `opacity` del layer del ícono en Penpot. Los valores se aplican en el selector compuesto del componente, nunca en `.material-icons` global.

```css
/* Global — solo display, sin valores visuales */
.material-icons { color: inherit; line-height: 1; display: inline-flex; align-items: center; user-select: none; }

/* Específico — tamaño, color y opacidad del layer Penpot */
.itds-[componente] .material-icons {
  font-size: var(--spacing-N);   /* width/height del layer Penpot → token spacing */
  /* color: heredado del padre vía color: var(--color-...) en la clase padre */
  /* opacity: solo si Penpot tiene opacity < 1 en el layer */
}
```

Mapa de tamaños Penpot → token spacing: 12px=`spacing-3` · 16px=`spacing-4` · 20px=`spacing-5` · 24px=`spacing-6`.

---

## Reglas absolutas

```
❌ No omitir el splash de bienvenida al activarse — siempre es la primera acción (Paso 0)
❌ No generar código sin tener plataforma, theme, nombre y estructura del Paso 2 confirmados
❌ No usar componentes que no existan en el IT DS de Penpot (bloqueo estricto — Paso 3c)
❌ No hardcodear valores HEX — siempre var(--color-...)
❌ No hardcodear spacing o tamaños — siempre var(--spacing-N) o var(--text-...)
❌ No dejar ningún componente del body sin width: 100% y box-sizing: border-box
❌ No omitir el padding de 16px (var(--spacing-4)) en los 4 lados del body
❌ No omitir el gap de 24px (var(--spacing-6)) entre componentes del body
❌ No usar librerías de UI externas — solo React puro + CSS IT DS
❌ No usar token primitivo de color cuando existe semántico equivalente
❌ No entregar sin pasar el checklist completo del Paso 5a
❌ No entregar sin el archivo [NombreScreen].html standalone previsualizable
❌ No usar nombres de archivo distintos a los definidos en el Paso 4a
❌ No cerrar una construcción sin actualizar references/code-history.md (Paso 6)
❌ No cerrar una construcción sin crear el reporte de prueba en tests/ (Paso 7)
❌ No omitir el Paso 3b de resolución de íconos — preguntar siempre antes de generar
❌ No hardcodear SVG placeholder en componentes donde el usuario eligió Material Icons
❌ No agregar el CDN de Material Icons si ningún componente lo requiere
❌ No poner color, font-size ni opacity directamente en .material-icons global — usar selector compuesto .itds-[componente] .material-icons
❌ No generar Material Icons sin inspeccionar width, fill y opacity del layer en Penpot (Paso 3b)
❌ No asumir que todos los íconos tienen el mismo tamaño — cada componente puede tener distinto width en Penpot

# Reglas adicionales — Modo B (flujos)
❌ No implementar navegación entre pantallas sin el hook useFlow
❌ No hardcodear rutas o IDs de pantalla en los componentes — siempre usar navigate('screenId')
❌ No implementar animaciones con librerías externas — solo CSS keyframes del sistema de transiciones
❌ No pasar datos entre pantallas por props directas — siempre vía flowState del useFlow
❌ No omitir el estado 'loading' en botones que disparan navegación
❌ No dejar botones de acción principal sin lógica de disabled cuando el formulario esté vacío
❌ No olvidar conectar goBack() en toda pantalla que tenga NavbarMobile con showBack=true

# Reglas adicionales — Modo C/E (edición)
❌ No regenerar la pantalla completa cuando el cambio es localizado — solo los archivos afectados
❌ No aplicar un patch sin mostrar el diff al usuario y recibir confirmación
❌ No asumir la estructura de una pantalla existente sin leerla del code-history.md
❌ No modificar elementos no solicitados aunque parezcan mejorables — intervención mínima
❌ No reformatear, renombrar ni reorganizar código fuera del scope del cambio pedido
❌ No "aprovechar" un patch para aplicar mejoras adicionales no solicitadas
✅ Si un cambio tiene efecto colateral inevitable sobre otro elemento → informar al usuario antes de tocar ese elemento

# Reglas adicionales — Modo D (producción)
❌ No dejar imports CDN en la versión de producción
❌ No mezclar CSS inline con CSS Modules en la misma versión
❌ No omitir el package.json y el README.md en la exportación

# Reglas adicionales — Modo F (docs)
❌ No generar el README sin incluir la tabla de props y la de estados interactivos
❌ No generar el states.html sin mostrar TODOS los estados del snapshot para cada componente
```

---

## Formato del ds-snapshot.md

```markdown
# IT DS — Component Snapshot (Penpot)

> Generado por itds-code-forge
> Archivo Penpot: [nombre/ID]
> Fecha: [YYYY-MM-DD] · Versión IT DS: [versión]

---

## [Categoría]

| Nombre en Penpot | Path en librería | Variantes disponibles | Props React |
|---|---|---|---|
| Button | Actions/Button | size/s · size/m · size/l · variant/primary · variant/secondary · variant/ghost · state/default · state/disabled | size, variant, label, onClick, disabled |

---

## Notas de lookup

| Componente | Atención |
|---|---|
| Dropdown | Variantes: SlectSingle · SlectMulti — typos intencionales en Penpot |
| Toggle Button | Tamaño grande: Size=LG (no Size=L) |
```

---

## Referencia rápida de tokens

### Colores

| Rol | CSS Variable | Token IT DS |
|---|---|---|
| Fondo base | `var(--color-screen-base)` | `Screen/Base` |
| Fondo suave | `var(--color-screen-soft)` | `Screen/Soft` |
| Primario | `var(--color-theme-primary)` | `Theme/Primary` |
| Hover primario | `var(--color-theme-hover)` | `Theme/Hover` |
| Texto principal | `var(--color-neutral-strongest)` | `Neutral/Strongest` |
| Texto secundario | `var(--color-neutral-default)` | `Neutral/Default` |
| Borde / divisor | `var(--color-neutral-softer)` | `Neutral/Softer` |
| Error | `var(--color-error-default)` | `Error/Default` |
| Éxito | `var(--color-success-default)` | `Success/Default` |
| Advertencia | `var(--color-warning-default)` | `Warning/Default` |

### Spacing

| Variable | Valor | Uso |
|---|---|---|
| `var(--spacing-1)` | 4px | Micro gaps |
| `var(--spacing-2)` | 8px | Gaps pequeños |
| `var(--spacing-3)` | 12px | Padding compacto |
| `var(--spacing-4)` | 16px | **Padding body (4 lados) · Gap entre secciones — OBLIGATORIO** |
| `var(--spacing-6)` | 24px | **Gap entre componentes del body — OBLIGATORIO** |
| `var(--spacing-5)` | 20px | Padding estándar |
| `var(--spacing-6)` | 24px | Padding generoso |
| `var(--spacing-8)` | 32px | Separaciones grandes |

### Border-radius

| Elemento | IT | Arcus |
|---|---|---|
| Cards, modals | `var(--radius-box)` = 8px | `var(--radius-box)` = 16px |
| Botones | `var(--radius-button)` = 8px | `var(--radius-button)` = 999px |
| Inputs | `var(--radius-input)` = 8px | `var(--radius-input)` = 999px |
| Tags, badges | `var(--radius-full)` = 999px | `var(--radius-full)` = 999px |
| BottomSheet | `var(--radius-3xl)` = 24px | `var(--radius-3xl)` = 24px |

### Tipografía

| Variable | Tamaño | Uso |
|---|---|---|
| `var(--text-xs)` | 12px | Badge, caption |
| `var(--text-sm)` | 14px | Helper text, tag |
| `var(--text-base)` | 16px | Cuerpo, label, botón |
| `var(--text-xl)` | 20px | Título navbar |
| `var(--text-2xl)` | 24px | Título modal, headline |

---

## Contribución de hallazgos — usuarios externos

El skill mejora con cada prueba real. Cada hallazgo documentado correctamente puede convertirse en una regla que reduce iteraciones para todos los usuarios. Este es el flujo para incorporar resultados de sesiones externas.

---

### Qué enviar

Solo el archivo de reporte de prueba (`.md`) generado en el Paso 7. No hace falta adjuntar los archivos `.jsx`, `.html` ni `.css` — solo el reporte con los hallazgos en formato exportable.

**Nombre sugerido del archivo:** `test-[pantalla]-[alias-usuario].md`

---

### Criterios para que un hallazgo sea incorporable

| Criterio | Detalle |
|---|---|
| ✅ Ocurrió en una instancia real | No es un caso teórico — se reprodujo durante una construcción |
| ✅ La solución fue verificada | El fix funcionó y el output resultante es correcto |
| ✅ La regla es generalizable | Aplica a más de un componente o escenario |
| ✅ Está en formato exportable | Completa los 6 campos del bloque estructurado del Paso 7 |
| ❌ No incluir workarounds sin causa raíz | Si no se identificó el por qué, documentar solo el síntoma y marcar como `⏳ pendiente` |

---

### Cómo se procesa un hallazgo recibido

Al recibir un reporte externo, ejecutar este flujo antes de incorporar nada:

```
1. Leer el bloque "Hallazgos exportables" del reporte recibido
2. Para cada hallazgo:
   a. Verificar que no esté ya documentado en react-patterns.md
   b. Si es nuevo y tiene causa raíz → agregar regla en la sección correcta de react-patterns.md
   c. Si mejora el flujo del skill → agregar a pending-improvements.md
   d. Registrar en code-history.md con campo Origen: [alias del usuario]
3. Reempacar el skill como nueva versión patch (ej. v1.3 → v1.4)
4. Comunicar al usuario contribuyente qué hallazgos fueron incorporados y en qué versión
```

---

### Qué NO incorporar

- Hallazgos que ya están en `react-patterns.md` o `pending-improvements.md`
- Soluciones que funcionaron solo en un contexto muy específico sin regla generalizable
- Cambios de opinión estética (colores distintos, spacing diferente) sin respaldo en Penpot MCP
- Hallazgos sin campo `Solución` completado — documentarlos en `pending-improvements.md` como pendientes

---

### Ciclo de mejora

```
Usuario A construye una pantalla
    ↓
Encuentra un bug no documentado
    ↓
Lo registra en el bloque "Hallazgos exportables" del Paso 7
    ↓
Envía el reporte .md
    ↓
El hallazgo se convierte en regla en react-patterns.md
    ↓
La próxima versión del skill evita ese bug para todos los usuarios
```

> **El skill aprende de cada sesión real.** Un hallazgo bien documentado vale más que diez builds perfectos — porque convierte un error en una regla permanente.
