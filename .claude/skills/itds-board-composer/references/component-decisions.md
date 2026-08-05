# IT DS Board Composer — Component Decisions

> Historial de decisiones de selección de componentes por tipo de pantalla.
> Actualizar al finalizar cada construcción exitosa o parcial con el skill itds-board-composer.
> Usar como referencia al interpretar prompts similares.

---

## Nuevo pedido — Mobile · 2026-05-28

| Campo | Valor |
|---|---|
| **Prompt del usuario** | "Pantalla mobile Nuevo pedido — AppBar Shadow Close, PageHeader Sticky, TextInput Error, Select Error, PhoneInput, TextArea, Switch, Alert Error, ActionButtons VerticalButtons sin íconos" |
| **Plataforma** | Mobile 375×812 |
| **Theme** | IT |

### Componentes seleccionados

| Sección | Componente | Path Penpot | Variante | Estado |
|---|---|---|---|---|
| header | AppBar Mobile | `AppBar / Mobile` | `Shadow Close` | ✅ OK |
| header | PageHeader | `PageHeader` | `Sticky` | ✅ OK |
| body | TextInput | `TextInput / Size=LG` | `Error` | ✅ OK |
| body | Select | `Select / Single / Size=MD` | `Error` | ✅ OK |
| body | PhoneInput | `PhoneInput / Size=LG` | `Default` | ✅ OK |
| body | TextArea | `TextArea` | `Default` | ✅ OK |
| body | Switch | `Switch / Default` | `Default` | ✅ OK |
| body | Alert | `Alert` | `Error` | ✅ OK |
| footer | ActionButtons | `ActionButtons / VerticalButtons` | `Size=LG` | ✅ OK |

### Observaciones

- **TextArea Optional:** `ta.children[0].children[1]` = nodo "Optional" visible por defecto en estado Default. Ocultar SIEMPRE salvo que el campo sea explícitamente opcional.
- **Select Error icon leading:** `sel.children[0].children[0]` = icon leading visible. Ocultar si el select no usa icono.
- **ActionButtons VerticalButtons — iconos en botones:** Cada botón tiene 2 íconos: leading `icon/dashboard_customize` y trailing `icon/expand_more`. Al pedir "sin íconos", ocultar los 4:
  - Primary leading:   `ab.children[0].children[0].hidden = true`
  - Primary trailing:  `ab.children[0].children[3].hidden = true`
  - Secondary leading: `ab.children[1].children[0].children[0].hidden = true`
  - Secondary trailing:`ab.children[1].children[0].children[2].hidden = true`
  Esta regla aplica siempre que el prompt indique botones sin icono.
- Board height = 811.99px — 6 componentes body con estados Error + VerticalButtons caben exactamente en 375×812.
- **⚠️ Duplicado ActionButtons:** un call fallido dejó una instancia huérfana de VerticalButtons en el footer. Eliminado con `footer.children[0].remove()`. Regla incorporada al SKILL.md: nunca más de 1 ActionButtons por pantalla — verificar existentes antes de instanciar en calls de recuperación.

---

## Test 010 — Wizard Desktop 4 etapas · 2026-05-25

| Campo | Valor |
|---|---|
| **Prompt** | Wizard desktop 4 pantallas: Alta de proveedor (Datos generales / Documentos / Condiciones comerciales / Resumen y confirmación) |
| **Plataforma** | Desktop 1280×832 |
| **Calidad** | Pendiente verificación visual |

### Componentes seleccionados

| Sección | Componente | Path Penpot | Variante | Estado |
|---|---|---|---|---|
| header (×4) | AppBar Desktop | `AppBar / Desktop / Shadow` | `Button` | ✅ OK |
| stepper (×4 boards) | Stepper Full Horizontal | `Stepper / Full / Horizontal / Size=LG` | `In progress` / `Pending` / `Success` | ✅ OK |
| S1 body | TextInput × 6 | `TextInput / Size=LG` | `Default` | ✅ OK |
| S1 body | PhoneInput | `PhoneInput / Size=LG` | `Default` | ✅ OK |
| S2 body | Or List | `DataList` | `Or List` | ✅ OK (4 filas) |
| S2 body | Alert | `Alert` | `Info` | ✅ OK |
| S3 body | Radiobutton × 3 | `Radiobutton / Default` | `Default` / `Default-Active` | ✅ OK |
| S3 body | Select | `Select / Single / Size=MD` | `Default` | ✅ OK |
| S3 body | Switch | `Switch / Default` | `Default` | ✅ OK |
| S3 body | TextArea | `TextArea` | `Default` | ✅ OK |
| S3 body | Alert | `Alert` | `Warning` | ✅ OK |
| S4 body | DataList × 8 | `DataList` | `DataList` | ✅ OK |
| S4 body | Checkbox | `Checkbox / Default` | `Deafult` | ✅ OK |
| footer (×4) | ActionButtons | `ActionButtons / FilledButtons` | `Size=LG` | ✅ OK |

### Decisiones y reglas generadas

- **Stepper Full Horizontal:** instanciar 4 veces por board, cambiar state (In progress/Pending/Success) según avance. Número en `children[0].children[0].children[0].characters`. Título en `children[1].children[0].characters`. Descripción ocultar: `children[1].children[1].hidden = true`.
- **2-col desktop:** `formRow.addFlexLayout().alignItems = "start"` — CRÍTICO. Cada col `layoutChild.horizontalSizing = "fill"`.
- **Radiobutton label:** `children[1].characters` — corregido (no `children[0]`).
- **Switch label:** `children[1].characters` — corregido (no `children[0]`).
- **DataList resumen:** 8 instancias independientes en wrapper flex col funcionan correctamente para listas de resumen key/value.
- **Alert informativo sin acciones:** `alert.children[1].children[1].hidden = true; alert.verticalSizing = "fix"; alert.resize(alert.width, 72)`.
- **AppBar Desktop — sin campo de título:** El AppBar Desktop no tiene un nodo de título simple. Es un nav con links. Para wizards, el título de la pantalla va como `createText()` H1 debajo del AppBar.

---

## Test 9 — Finance Flow Mobile · 2026-05-25

| Campo | Valor |
|---|---|
| **Prompt** | Flujo 2 pantallas mobile: Mi cuenta (AppBar + ProgressCircle + DataList + Tabs 3 + Or List + FabButton) + Nueva transferencia (AppBar + TextInput×2 + Select + TextArea + Alert + ActionButtons) |
| **Plataforma** | Mobile 375×812 |
| **Calidad** | 2 — ajustes menores (páginas separadas = manual por openPage lag) |

### Componentes seleccionados

| Sección | Componente | Path Penpot | Variante | Estado |
|---|---|---|---|---|
| S1 header | AppBar Mobile | `AppBar / Mobile` | `Shadow Close` | ✅ OK |
| S1 body | ProgressCircle | `ProgressCircle / Theme / Size=LG` | `75%` | ⚠️ 63% no existe |
| S1 body | DataList × 3 | `DataList` | `DataList` | ✅ OK |
| S1 body | Tabs Active | `Tabs / Default / Active` | `Default` | ✅ OK |
| S1 body | Tabs × 2 | `Tabs / Default` | `Default` | ✅ OK |
| S1 body | Or List | `DataList` | `Or List` | ✅ OK |
| S1 absoluto | FabButton | `FabButton / Default / Size=LG` | `Default` | ✅ OK |
| S2 body | TextInput × 2 | `TextInput / Size=LG` | `Default` | ✅ OK |
| S2 body | Select | `Select / Single / Size=MD` | `Default` | ✅ OK |
| S2 body | TextArea | `TextArea` | `Default` | ✅ OK |
| S2 body | Alert | `Alert` | `Info` | ✅ OK |
| S2 body | ActionButtons | `ActionButtons / FilledButtons` | `Size=LG` | ✅ OK |

### Decisiones y reglas generadas

- **openPage lag CRÍTICO:** `penpot.openPage()` no toma efecto en el mismo call. Para flujos, siempre separar: Call 1 = createPage+openPage, Call 2 = currentPage.name + todo el contenido.
- **DataList = una sola fila:** Para 3 ítems de balance, usar 3 instancias DataList separadas en body flex col.
- **Or List = 6 filas DataList sin Avatar:** No hay avatar built-in. Badge/Tag = manual. Trailing = Label text.
- **ProgressCircle % discreto:** Solo existe 0/25/50/75/100/Indeterminate. Usar el más cercano.
- **TextArea paths:** Label = `children[0].children[0]`, placeholder = `children[1].children[0].children[1]`.
- **Tabs label:** `tab.children[0].children[1].characters` (Content_Tabs → Body text).
- **Or List texto multiline:** `row.children[0].children[0].characters = "Desc\nFecha"` funciona correctamente.
- **FabButton absoluto:** `fab.parentX = 303; fab.parentY = 740` funciona. Verificar no duplicar instancia.

---

## Test 7 — Inicio Mobile Empty States · 2026-05-25

| Campo | Valor |
|---|---|
| **Prompt** | Pantalla mobile 'Inicio' con AppBar + Badge (2), Tabs 3 pestañas, EmptyState x3 contextuales, Alert info, FabButton LG absoluto |
| **Plataforma** | Mobile 375×812 |
| **Calidad** | 2 — ajustes menores |

### Componentes seleccionados

| Sección | Componente | Path Penpot | Variante | Estado |
|---|---|---|---|---|
| header | AppBar Mobile | `AppBar / Mobile` | `Shadow Close` | ✅ OK |
| body | Tabs x3 | `Tabs / Default` | `Default` | ✅ OK |
| body | EmptyState x3 | `EmptyState` | `EmptyState` | ✅ OK |
| body | Alert | `Alert` | `Info` | ✅ OK |
| board absoluto | FabButton | `FabButton / Default / Size=LG` | `Default` | ✅ OK |

### Decisiones y reglas generadas

- **EmptyState path real:** `EmptyState` (no `EmptyState / EmptyState`) — corregido en ds-snapshot y SKILL.md
- **Tab panels ocultos:** patrón `tabContent-[nombre]` con `hidden=true` — funciona correctamente
- **FabButton absoluto:** `fabX = boardW - 16 - fabW = 303`, `fabY = boardH - 16 - fabH = 740` — confirmado
- **Badge AppBar:** el Badge/Notifications en `ActionIcon icon/notifications` está en modo dot (Indeterminate=True) — switchVariant no funciona en librería conectada. El "2" requiere swap manual en Penpot UI
- **AppBar título:** Shadow Close no tiene nodo de texto de título accesible vía MCP — ajuste manual
- **Gap AppBar → tabBar:** `body.flex.topPadding = 16` (spacing.4) — sin este gap los componentes quedan pegados
- **Tabs estructura real:** `children[0]` = Content_Tabs, `children[1]` = Line (underline) — invertido respecto a lo documentado en SKILL.md; corregido en regla TAB BAR
- **EmptyState estructura corregida:** Title = `children[1].children[0]`, Desc = `children[1].children[1]`, ActionButtons en `children[2]` (no `children[0]`)
- **Alert estructura corregida:** Title = `children[1].children[0].children[0]`, Body = `children[1].children[0].children[1]`, icon/close = `children[2]`

---

## Guía de uso

Antes del Paso 2, buscar aquí si existe una construcción previa con un prompt parecido:
- Si existe → reusar la tabla de componentes como punto de partida
- Si no existe → construir desde el ds-snapshot.md §21 y registrar aquí al terminar

---

<!-- Las entradas de historial se agregan aquí al finalizar cada construcción -->

---

## Auditoría Tag + DateInput · 2026-05-18

> Revisión directa de componentes vía MCP — no es un build de pantalla. Documenta estructura, paths MCP confirmados y cambios aplicados al DS.

---

### TAG — Arquitectura post-separación de variantes

**Paths actuales (confirmados MCP):**
- Color variants: `Tag / {Color} / Size=SM` y `Tag / {Color} / Size=MD` (9 colores × 2 sizes = 18 componentes, `variantProps: null`)
- Contenedor: `Tag / TagGroup`
- Galería de marcas: `Tag / TagBusiness`
- El path antiguo `Tag / Tags` (singular) ya no existe — usar `Tag / {Color} / Size=XX`

**Estructura interna uniforme (todos los color variants):**
```
children[0]  →  icon / dashboard_customize (leading icon)
children[1]  →  "Body text" (texto editable)   ← SIEMPRE index 1
children[2]  →  icon/close (trailing icon)
```

**Tipografía:**
- SM: 12px / 500 DM Sans (`text-xs.Medium`)
- MD: 14px / 500 DM Sans (`text-sm.Medium`)

**TagGroup:** 4 sub-tags de color como children. Texto de cada sub-tag en `children[i].children[1].characters`. El primer child (i=0) es el contador de overflow ("+N"), los demás son tags reales.

**TagBusiness:** galería de 32 frames estáticos (no un componente switchable). 16 marcas Cencosud × SM+MD. Tipografía Bold (700) a diferencia de color variants (500). Texto en `children[i].children[1].characters`. No usar `switchVariant` — es informativo/decorativo. Marcas: Giga, GBarbosa, Mercantil, Blaisten, Prezunic, Perini, Vea, Bretas, Wong, Metro, Disco, Spid, Easy, Santa Isabel, Jumbo, Paris.

**Fixes aplicados 2026-05-18 vía MCP:**
- `Tag / Accent / Size=MD` creado (faltaba)
- `Tag / Tags / Accent / Size=MD` (path incorrecto) eliminado
- TagGroup → sub-tag Blue: icono w=8 → w=16 corregido
- "Santa isabel" → "Santa Isabel" capitalización corregida (SM y MD)

---

### DATE INPUT — Rename Size=SM → Size=MD

**Rename aplicado 2026-05-18 vía MCP** — los 10 componentes `DateInput / Size=SM / *` renombrados a `DateInput / Size=MD / *`.

**Paths actuales en librería:**
```
DateInput / Size=MD / Default          DateInput / Size=LG / Default
DateInput / Size=MD / Default-Filled   DateInput / Size=LG / Default-Filled
DateInput / Size=MD / Hover            DateInput / Size=LG / Hover
DateInput / Size=MD / Hover-Filled     DateInput / Size=LG / Hover-Filled
DateInput / Size=MD / Pressed          DateInput / Size=LG / Pressed
DateInput / Size=MD / Pressed-Filled   DateInput / Size=LG / Pressed-Filled
DateInput / Size=MD / Error            DateInput / Size=LG / Error
DateInput / Size=MD / Error-Filled     DateInput / Size=LG / Error-Filled
DateInput / Size=MD / Disabled         DateInput / Size=LG / Disabled
DateInput / Size=MD / Disabled-Filled  DateInput / Size=LG / Disabled-Filled
```

**Dimensiones:**
- MD: `Input Container` h=40, texto 14px/500, icono 16px
- LG: `Input Container` h=52, texto 16px/500, icono 20px

**Paths MCP para texto — dependen del estado:**
- Default/Hover/Pressed/Error/Disabled (2 children): `inst.children[1].children[0].characters` → placeholder "Label"
- \*-Filled (3 children): `inst.children[2].children[0].characters` → valor "DD/MM/AAAA" · `inst.children[0].children[1].characters` → float label

**Calendarios (6 componentes, todos `variantProps: null`):**
```
DateInput / Calendar / Inline / days|months|years
DateInput / Calendar / Overlay / days|months|years
```

---

## Settings Authentication Desktop · 2026-05-15

| Campo | Valor |
|---|---|
| **Prompt del usuario** | "Pantalla desktop 'Seguridad de la cuenta' con PageHeader, sección 'Contraseña' (3 PasswordInput + HelpText visible), sección '2FA' con Alert info + List métodos con Switch + Badge, sección 'Sesiones activas' con List dispositivos + Button. ActionButtons 'Guardar cambios'." |
| **Plataforma** | Desktop 1280×832 |
| **Theme** | IT |

### Componentes seleccionados

| Sección | Componente | Path Penpot | Variante | Estado |
|---|---|---|---|---|
| header | PageHeader | `PageHeader` | `Default` | ✅ OK |
| body/pwdSection | PasswordInput × 3 | `PasswordInput` | `Size=LG` | ✅ OK |
| body/pwdSection | HelpText | `penpot.createText()` | — | ✅ OK |
| body/tfaSection | Alert | `Alert` | `Alert` | ✅ texto OK — ⚠️ variant Info manual |
| body/tfaSection | ToggleList × 3 | `List / ToggleList` | `Default` | ✅ títulos + badges OK — ⚠️ toggle state manual |
| body/sesSection | ActionList × 3 | `List / ActionList` | `Default` | ✅ títulos + botones "Cerrar sesión" OK |
| footer | ActionButtons | `ActionButtons` | `Default` | ✅ OK — "Guardar cambios" |

### Textos aplicados — paths exactos

| Componente | Path de índice | Texto |
|---|---|---|
| ToggleList Title | `.children[0].children[2].children[1]` | "Aplicación autenticadora" / "SMS..." / "Correo..." |
| ToggleList Subtitle | `.children[0].children[2].children[0]` | "" (limpiar lorem ipsum) |
| ToggleList Badge text | `.children[0].children[3].children[0].children[0]` | "Activo" / "Inactivo" |
| ActionList Title | `.children[0].children[1].children[1]` | "MacBook Pro" / "iPhone 13" / "iPad Pro" |
| ActionList Subtitle | `.children[0].children[1].children[0]` | "Chrome · Conectado ahora" / etc. |
| ActionList Button text | `.children[0].children[3].children[0].children[2]` | "Cerrar sesión" |
| Alert main text | `.children[1].children[1].children[0]` | "Verificación en 2 pasos activa..." |

### Observaciones clave

- **`penpot.currentPage.appendChild` no existe** — `createBoard()` auto-agrega la shape a la página activa. No llamar `currentPage.appendChild()`.
- **`penpot.currentPage.getShapeById(id)`** — método correcto para recuperar shapes entre calls. NO usar `findById` (no existe).
- **`shape.findAll()` requiere parent** — solo funciona en shapes ya appended. En instancias sin parent lanza error. Siempre `appendChild` antes de `findAll`.
- **Paths List en librería son camelCase sin espacios** — `List / ToggleList` y `List / ActionList` (NO `List / Toggle List / Default` como indica el snapshot). Corregir en ds-snapshot.md.
- **Alert: `findAll` no funciona** — usar `.children` tree traversal directo para acceder a texto del Alert.
- **Duplicados por retry parcial** — si un call falla a mitad, puede dejar instancias huérfanas. Siempre verificar y limpiar duplicados con `getShapeById` + `.remove()` antes de continuar.
- **HelpText sin componente IT DS** — usar `penpot.createText()` directamente. No existe componente HelpText en la librería.
- **Contenido overflows 832px** — una pantalla Settings con 3 secciones ricas supera la altura del board. Es esperado (pantalla scrollable). Si se quiere ver todo, aumentar height a ~1300px manualmente.

---

## Admin Panel Desktop · 2026-05-15

| Campo | Valor |
|---|---|
| **Prompt del usuario** | "Pantalla desktop 'Panel de administración' con AppBar 'Admin' y Badge rol 'Super Admin', Sidebar 6 ítems, Breadcrumb, 3 Badges de conteo, 2 ProgressCircles (Uptime/Disco), Table 'Actividad reciente' (Usuario/Acción Tag/Fecha/IP). Sin footer." |
| **Plataforma** | Desktop 1280×832 |
| **Theme** | IT |

### Componentes seleccionados

| Sección | Componente | Path Penpot | Variante | Estado |
|---|---|---|---|---|
| header/roleBar | Badge rol | `Badge` | `Theme` | ✅ OK — texto "Super Admin" |
| header | AppBar | `AppBar / Desktop` | `Shadow` | ✅ OK — CTA "Admin", nav 4 items |
| body/sidebarSlot | Sidebar | `Sidebar / Expand / Shadow` | `Click Expand` | ✅ OK — 6 items, 4 hidden |
| body/main/bcBar | Breadcrumb | `Breadcrumb` | `Breadcrumb` | ✅ OK — 4 niveles |
| body/main/summaryRow | Badge × 3 | `Badge` | Theme / Gray / Red | ✅ OK — stat cards |
| body/main/metricsRow | ProgressCircle × 2 | `ProgressCircle` | `Size=L` | ✅ texts OK — ⚠️ state swap manual |
| body/main/tableSection | Table | `Table` | `Table` | ✅ OK — 5 cols, col3=Tag |

### Observaciones clave

- **roleBar patrón nuevo** — header flex column: `roleBar` (Screen.Soft strip, Badge/Theme right-aligned) + AppBar. Usar para cualquier admin panel con indicador de rol de usuario.
- **sidebarSlot como placeholder** — crear como primer hijo de body (flex row) en CALL 1 garantiza que el Sidebar quede a la izquierda. Sidebar natural width = 270px.
- **Table / Table col Tag fija en idx 3** — la columna con `Table / Cells / Tag` siempre es col index 3 en el componente estándar. Asignar "Acción" Tag a esa columna; reasignar las demás según el prompt.
- **Tag / Tags — variante de color NO accesible vía MCP** — `switchVariant`, `componentProperties` y `mainComponentId` no funcionan para este componente. El plugin API no expone el selector de variante. El MCP setea solo el texto; el cambio de variante (`Blue / Warning / Success / Error`) es ajuste manual en Penpot UI → panel Diseño → selector de variante. No usar fills manuales.
- **Stat cards con penpot.createText()** — para labels de sección fuera de componentes IT DS, `penpot.createText("texto")` funciona correctamente. No requiere componente Text/Text.
- **ProgressCircle verifier falso positivo** — el scanner de textos devuelve "Loading/0%" para overrides de PC aunque estén correctamente seteados. Validar siempre con acceso directo `pc.children[1].children[N].characters`.
- **Sidebar width = 270px** — valor real medido via MCP (no 240px como se asume por defecto).

### Textos aplicados

| Componente | Índice | Texto |
|---|---|---|
| AppBar nav[0..3] | `children[1].children[0].children[N].children[0]` | Dashboard / Usuarios / Pedidos / Configuración |
| AppBar CTA | `children[3].children[2]` | "Admin" |
| Badge roleBar | `children[0]` | "Super Admin" |
| Breadcrumb | `children[0..2].children[1]` | Panel / Admin / Inicio |
| Sidebar items[4..9] | `item.children[0].children[1]` | Dashboard..Soporte |
| Table name | `children[0].children[1].children[0]` | "Actividad reciente" |
| Table Header Primary | `items.children[1].children[1]` | "Exportar" |
| Table Header Secondary | `items.children[2].children[0].children[0].children[0]` | "Filtrar" |
| Table Header Search | `items.children[3].children[0].children[0]` | "Buscar actividad..." |
| Table col3 Tag cells | `tagsBoard.children[0].children[1]` + 4 fills | Inicio sesión(blue) / Cambio clave(amber) / Exportar datos(green) / Acceso denegado(red) |

---

## Dashboard Desktop · 2026-05-14

| Campo | Valor |
|---|---|
| **Prompt del usuario** | "dashboard desktop — nueva página, con sidebar siempre como regla" |
| **Plataforma** | Desktop 1280×832 |
| **Theme** | IT |

### Componentes seleccionados

| Sección | Componente | Path Penpot | Variante | Estado |
|---|---|---|---|---|
| header | AppBar | `AppBar / Desktop` | `Shadow` | ✅ OK |
| body | Sidebar | `Sidebar / Expand / Shadow` | `Click Expand` | ✅ OK |
| body/main | ProgressCircle × 3 (métricas) | `ProgressCircle` | `Size=L` | ✅ OK |
| body/main | Table completa | `Table` | `Table` | ✅ OK |
| footer | — | — | — | vacío (dashboard no tiene footer) |

### Textos aplicados (GOLD RULE)

| Componente | Path de índice | Texto asignado |
|---|---|---|
| AppBar | `children[3].children[2]` | "Nuevo pedido" |
| ProgressCircle 1 | `children[1].children[0]` / `children[1].children[1]` | "Ventas" / "82%" |
| ProgressCircle 2 | `children[1].children[0]` / `children[1].children[1]` | "Pedidos" / "65%" |
| ProgressCircle 3 | `children[1].children[0]` / `children[1].children[1]` | "Clientes" / "47%" |
| Table | `children[0].children[1].children[0]` | "Pedidos recientes" |
| Table Header — Primary btn | `Items.children[1].children[1]` | "Exportar" |
| Table Header — Secondary btn | `Items.children[2].children[0].children[0].children[0]` | "Filtrar" |
| Table Header — SearchInput | `Items.children[3].children[0].children[0]` | "Buscar pedido..." |
| Table col 0 | header + cells | "Pedido" / "PED-001".."PED-004" |
| Table col 1 | header + cells | "Fecha" / "01 may".."04 may" |
| Table col 2 | header + cells | "Cliente" / "Ana López".."Juan P." |
| Table col 3 (Tags) | `cell.children[0].children[0].children[0].children[1]` × 4 | "Entregado", "Pendiente", "En tránsito", "Cancelado" |
| Sidebar Expand items | `item.children[0].children[1]` × 10 | "Dashboard".."Ayuda" |

### Tokens aplicados en metricsRow

| Token | Propiedad | Valor resuelto |
|---|---|---|
| `spacing.4` | padding (4 lados) + columnGap | 16px |
| `Radius` | borderRadius | 8px (`{lg}`) |
| `Shadow-Down.S` | shadow | `0 1px 3px rgba(0,0,0,0.20)` |
| `Neutral.White` | fill (en `main` board) | #FFFFFF |

### Observaciones

- **ProgressCircle reemplaza Card** — `ProgressCircle / Size=L` es el componente correcto para KPIs. Compacto (120×120px), semánticamente correcto para métricas de porcentaje.
- **switchVariant no funciona** en librerías conectadas — swap de atom (state: Success/Warning/Error) se hace manualmente en Penpot UI. MCP solo aplica fills y textos después.
- **Estructura del arco** — tras swap manual: `children[0].children[0]` = anillo fondo (NO tocar, siempre `#cbd5e1`), `children[0].children[1]` = arco de progreso (solo este cambia color).
- **Label del Data board max 10 chars** — el board `Data` tiene 53px de ancho. Labels válidos: "Ventas", "Pedidos", "Clientes". Labels inválidos: "Ventas del mes" (se recortan).
- **`applyToken(radiusTok, ["borderRadius"])` sola no funciona** — el valor `borderRadius` queda en 0. Siempre agregar `metricsRow.borderRadius = 8` después del `applyToken`.
- **metricsRow alignItems debe ser `"start"`** — con `alignItems: "stretch"` el row queda en altura 0. Siempre `alignItems: "start"` + `verticalSizing: "fix"` + `resize(w, h)`.
- **Referencias de storage se vuelven stale entre calls** — siempre re-encontrar shapes con `penpotUtils.findShape(s => s.name === "...", penpot.root)` en cada call.
- **`createBoard().layoutChild` null en boards anidados cross-call** — re-encontrar el padre desde root en el mismo call donde se crea el hijo.

---

## Login Mobile · 2026-05-14

| Campo | Valor |
|---|---|
| **Prompt del usuario** | "login mobile" |
| **Plataforma** | Mobile 375×812 |
| **Theme** | IT |

### Componentes seleccionados

| Sección | Componente | Path Penpot | Variante | Estado |
|---|---|---|---|---|
| header | Text | `Text` | `Text` | ✅ OK |
| header | Text | `Text` | `Text` | ✅ OK (subtítulo) |
| body | TextInput | `TextInput` | `Size=LG` | ✅ OK |
| body | PasswordInput | `PasswordInput` | `Size=LG` | ✅ OK |
| body | Checkbox | `Checkbox` | `Default` | ✅ OK |
| footer | ActionButtons | `ActionButtons` | `Default` | ✅ OK |

### Observaciones

- `PasswordInput` path en librería es `PasswordInput` (sin espacio) — ds-snapshot.md tenía `Password Input`. **Corregido en ds-snapshot.md.**
- `Text / Default` no existe — el name correcto es `Text / Text`. **Corregido en ds-snapshot.md.**
- Instancias `Text / Text` tienen altura por defecto de **120px fija**. Siempre redimensionar con `resize(width, height)` al alto real del texto tras instanciar. **Regla §5e agregada al SKILL.md.**
- `penpotUtils.findTokenByName()` confirmado funcional: `Screen.Base`, `spacing.4`, `spacing.3` resueltos correctamente.
- `penpot.currentFile.addPage()` y `setCurrentPage()` — **no testeados** en esta sesión (se usó página activa existente). Pendiente verificar.

---

## Perfil Mobile · 2026-05-14

| Campo | Valor |
|---|---|
| **Prompt del usuario** | "perfil de usuario mobile — avatar, datos del usuario y botón de cerrar sesión" |
| **Plataforma** | Mobile 375×812 |
| **Theme** | IT |

### Componentes seleccionados

| Sección | Componente | Path Penpot | Variante | Estado |
|---|---|---|---|---|
| header | PageHeader | `PageHeader` | `Default` | ✅ OK — Title "Mi perfil", Subtitle oculto, Tag "Admin" |
| body | Avatar | `Avatar` | `Size=M` | ✅ OK |
| body | DataList Or List | `DataList` | `Or List` | ✅ OK — 6 filas perfil |
| body | ActionList | `List / ActionList` | `Default` | ✅ OK × 2 (Configuración, Privacidad) |
| footer | ActionButtons | `ActionButtons` | `Default` | ✅ OK — 1 botón "Cerrar sesión" |

### Textos aplicados

| Componente | Path | Texto |
|---|---|---|
| PageHeader Title | `findByName(ph, "Title")` | "Mi perfil" |
| PageHeader Subtitle | `findByName(ph, "Subtitle")` | oculto |
| PageHeader Tag | `ph.children[1].children[0].children[1].children[1]` | "Admin" |
| Or List fila 0 | label / valor | "Nombre" / "Ana López" |
| Or List fila 1 | label / valor | "Apellido" / "García" |
| Or List fila 2 | label / valor | "Email" / "ana@cencosud.com" |
| Or List fila 3 | label / valor | "Teléfono" / "+56 9 1234 5678" |
| Or List fila 4 | label / valor | "Cargo" / "Administrador" |
| Or List fila 5 | label / valor | "Empresa" / "Cencosud S.A." |
| ActionList 1 Title | `findByName(al, "Title")` | "Configuración" |
| ActionList 2 Title | `findByName(al, "Title")` | "Privacidad" |
| ActionButtons Primary | `findByName(ab, "Button / Primary") → "Text"` | "Cerrar sesión" |
| ActionButtons Secondary | `findByName(ab, "Button / Secondary") → "Text"` | "Cancelar" (oculto) |
| ActionButtons Tertiary | `findByName(ab, "Button / Tertiary") → "Text"` | "Omitir" (oculto) |

### Observaciones

- **`DataList / Or List` sobre DataList individual** — para pantallas de perfil con 3+ campos, usar Or List directamente. Tiene 6 filas incorporadas y evita instanciar y apilar DataList individuales.
- **Orden correcto DataList** — `children[0].children[0]` = **label (campo)**, `children[1].children[0].children[0]` = **valor**. El campo va SIEMPRE primero.
- **`findByName()` recursivo** — más robusto que rutas de índice para PageHeader Title/Subtitle y botones de ActionButtons. Usar cuando el nombre del nodo es conocido.
- **Texto en botones ocultos** — siempre asignar texto real a Secondary/Tertiary aunque estén `hidden`, porque el verifier de bad-prefixes detecta el texto incluso cuando el padre está oculto.
- **API flex correcta** — `board.addFlexLayout()` + `board.flex.dir = "column"`. Nunca `board.layoutFlexDir` (error "not extensible").
- **`penpot.currentPage.name` no persiste entre calls** — verificar y corregir nombre de página en call de validación posterior al build.

---

## Formulario Registro Mobile · 2026-05-14

| Campo | Valor |
|---|---|
| **Prompt del usuario** | "formulario de registro mobile — nombre, email, teléfono y botón guardar. Crealo en una página nueva llamada Registro" |
| **Plataforma** | Mobile 375×812 |
| **Theme** | IT |

### Componentes seleccionados

| Sección | Componente | Path Penpot | Variante | Estado |
|---|---|---|---|---|
| header | Page Header | `PageHeader` | `Default` | ✅ OK |
| body | TextInput | `TextInput` | `Size=LG` | ✅ OK (nombre) |
| body | TextInput | `TextInput` | `Size=LG` | ✅ OK (email) |
| body | PhoneInput | `PhoneInput` | `Size=LG` | ✅ OK |
| footer | ActionButtons | `ActionButtons` | `Default` | ✅ OK (1 botón — Secondary y Tertiary ocultos) |

### Observaciones

- `penpot.createPage()` + `penpot.openPage(page)` confirmados funcionales. **SKILL.md corregido** (antes usaba `currentFile.addPage()` y `setCurrentPage()` inexistentes).
- `PageHeader` path correcto sin espacio — SKILL.md ejemplo corregido. ds-snapshot.md actualizado con variantes `Default` y `Sticky`.
- `PhoneInput` path es `PhoneInput` (sin espacio) — consistente con el patrón de componentes compuestos.
- Página nueva `Registro` creada y activa correctamente antes de construir el board.

---

## Catálogo Desktop · 2026-05-14

| Campo | Valor |
|---|---|
| **Prompt del usuario** | "Pantalla desktop 'Catálogo' con AppBar y SearchInput, layout de dos columnas: sidebar izquierdo de filtros (CheckboxGroup Categoría / RadioButtons Precio / Switch 'Solo disponibles' / Button 'Aplicar filtros'), área principal con Tabs de ordenamiento, grid de Cards de producto (nombre, precio, Badge 'Oferta'/'Nuevo', Button 'Agregar'), paginación al pie." |
| **Plataforma** | Desktop 1280×832 |
| **Theme** | IT |

### Componentes seleccionados

| Sección | Componente | Path Penpot | Variante | Estado |
|---|---|---|---|---|
| header | AppBar | `AppBar / Desktop` | `Shadow` | ✅ OK — AppBar ya incluye SearchInput interno |
| body/sidebar | Text / Text (labels) | `Text` | `Text` | ✅ OK — `text-sm.Bold` token |
| body/sidebar | Checkbox × N | `Checkbox` | `Default` | ✅ OK |
| body/sidebar | Radiobutton × N | `Radiobutton` | `Default` | ✅ OK |
| body/sidebar | Switch | `Switch` | `Default` | ✅ OK |
| body/sidebar | Button / Primary | `Button / Primary` | `Size=M` | ✅ OK — "Aplicar filtros" |
| body/main | Tabs | `Tabs` | `Default` | ✅ OK |
| body/main | Card × N | `Card / CardImage` | `Vertical` | ✅ OK — nombre, precio, Badge, Button |
| body/main | Tag / Tags × N | `Tag` | `Tags` | ✅ OK — "Oferta" / "Nuevo" |
| body/main | Badge × N | `Badge` | `Theme` | ✅ OK |
| footer | — | — | — | Sin footer (desktop catálogo) |

### Observaciones

- **AppBar Desktop Shadow** ya incluye SearchInput internamente — no agregar SearchInput por separado.
- **FilterPanel es un botón trigger**, NO un panel de filtros completo — sidebar de filtros se construye manualmente con atoms.
- **Text/Text en sidebar** deben usar `text-sm.Bold` (14px) — el default es Headline XL (20px), que es demasiado grande.
- **Sidebar background manual**: usar `Neutral.White` fill + `Shadow-Down.S` shadow para replicar el color del Sidebar IT DS original.
- **Button/Primary text** a `children[2]` para Size=M (NO findByName — Badge tiene hijo "Text" que intercepta).
- **Tag/Tags text** a `children[1]` (nodo "Body text" — NO findByName("Text")).

---

## Flujo Onboarding Mobile · 2026-05-14

| Campo | Valor |
|---|---|
| **Prompt del usuario** | "Flujo onboarding mobile en 3 pantallas: (1) 'Bienvenido a Cencosud' — Stepper 1/3, ilustración placeholder, título, subtítulo, ActionButtons 'Comenzar' y link 'Omitir'; (2) 'Configura tu perfil' — Stepper 2/3, Avatar con botón de cambio, TextInput nombre, Select rol, Select empresa; (3) 'Todo listo' — Stepper 3/3, EmptyState éxito con ícono check, DataList resumen de configuración, Button 'Ir al dashboard'." |
| **Plataforma** | Mobile 375×812 |
| **Theme** | IT |

### Componentes seleccionados

| Pantalla | Sección | Componente | Path Penpot | Variante | Estado |
|---|---|---|---|---|---|
| 1 | header | Stepper | `Stepper / Compact` | `Horizontal_Size=L` | ✅ OK — counter "1/3" |
| 1 | body | Rectangle placeholder | — | 280×200 #E2E8F0 | ✅ OK |
| 1 | body | Text | `Text` | `Text` | ✅ OK — título + subtítulo |
| 1 | footer | ActionButtons | `ActionButtons` | `Default` | ✅ OK — "Comenzar" |
| 2 | header | Stepper | `Stepper / Compact` | `Horizontal_Size=L` | ✅ OK — counter "2/3" |
| 2 | body | Avatar | `Avatar` | `Size=M` | ✅ OK — "CL" |
| 2 | body | TextInput | `TextInput` | `Size=LG` | ✅ OK — "Nombre completo" |
| 2 | body | Select × 2 | `Select / Single` | `Size=MD` | ✅ OK — rol + empresa |
| 2 | footer | ActionButtons | `ActionButtons` | `Default` | ✅ OK — "Continuar" |
| 3 | header | Stepper | `Stepper / Compact` | `Horizontal_Size=L` | ✅ OK — counter "3/3" |
| 3 | body | EmptyState | `EmptyState` | `EmptyState` | ✅ OK — "¡Todo listo!" |
| 3 | body | DataList × 3 | `DataList` | `DataList` | ✅ OK — resumen config |
| 3 | footer | Button / Primary | `Button / Primary` | `Size=M` | ✅ OK — "Ir al dashboard" |

### Observaciones

- **3 boards en una página** — flujo de N pantallas va en una sola página, boards alineados en x=0, x=415, x=830 (ancho + 40px gap).
- **Stepper — 4 campos obligatorios por pantalla** — asignar TODOS en cada instancia:
  1. Step number (`children[0].children[0].children[0]`) → "1", "2", "3"
  2. Step title (`children[0].children[1].children[1]`) → nombre del paso
  3. Step description (`children[0].children[1].children[0]`) → "Paso X de Y"
  4. Counter (`children[0].children[2]`) → "X/Y"
  ⚠️ El step number NO cambia automáticamente al cambiar el counter — siempre setear los 4.
- **EmptyState botones** — tiene 2 botones internos con "Body text" — SIEMPRE asignar texto real a ambos: `children[0][0][0][0][1]` y `children[0][0][1][1]`.
- **TextInput Label** — siempre asignar `children[1].children[1].characters = "..."` en el mismo call de instanciación.
- **TextInput HelpText** — ocultar con `textInput.children[0].hidden = true` o asignar texto real para evitar bad-prefix.
- **Text / Text — tipografía obligatoria** — el default es `text-8xl.Bold` (96px). Siempre sobrescribir: título principal → `text-xl.Bold` (20px), subtítulo → `text-sm.Regular` (14px). Alineación con `textNode.align = "center"` (NO `textAlign`).
- **Text / Text — wrap** — limitar ancho del wrapper al disponible (375 - 32 = 343px); `growType: "auto-height"` wrapea solo.
- **ActionButtons — 2 botones** — NUNCA agregar Link suelto al footer. Prender `row.children[1].hidden = false` y setear su texto. `row.children[2].hidden = true` para el terciario.
- **Header faltante en board** — si el Stepper queda en el root sin header: crear `header` board, agregar nueva instancia Stepper con los 4 campos seteados, ocultar el Stepper suelto. Padding estándar: top/bottom 24px, left/right 16px. Forzar altura con `header.resize(375, 116)`.
- **Altura de headers consistente en flujos** — todos los headers deben medir lo mismo (116px en mobile). Usar `header.resize(375, 116)` explícito — `verticalSizing: "auto"` no siempre recalcula.
- **Reordenar hijos no es posible por API** — `parentIndex` es read-only. Si el orden es incorrecto, mover el board viejo fuera de pantalla (`board.x = -2000; board.hidden = true`) y reconstruir desde cero en orden: header → body → footer.
- **EmptyState FilledButtons** — por defecto `dir: "row"` con botones al 50%. Cambiar a `dir: "column"` + `alignItems: "stretch"`. Asignar texto DIFERENTE e independiente a cada botón — nunca el mismo texto a los dos.

---

## Finance App Mobile · Mi cuenta · 2026-05-14

| Campo | Valor |
|---|---|
| **Prompt del usuario** | "Pantalla mobile 'Mi cuenta' con AppBar 'Finanzas' y Badge notificaciones (2), sección balance con ProgressCircle Theme 'Meta de ahorro' 63%, DataList (Balance disponible / Ahorros / En tránsito), Tabs ('Movimientos' / 'Tarjetas' / 'Metas'), List de movimientos con Avatar placeholder, descripción, fecha, Badge monto (positivo/negativo), Tag categoría. Botón flotante 'Nueva transferencia' en footer." |
| **Plataforma** | Mobile 375×812 |
| **Theme** | IT |

### Componentes seleccionados

| Sección | Componente | Path Penpot | Variante | Estado |
|---|---|---|---|---|
| header | AppBar | `AppBar / Mobile` | `Shadow Close` | ✅ OK — Badge notif "2" |
| body | ProgressCircle | `ProgressCircle` | `Size=M` | ✅ OK — "63% / Ahorro" |
| body | DataList Or List | `DataList` | `Or List` | ✅ OK — 3 filas (3 ocultas de 6 default) |
| body | Tabs | `Tabs` | `Default` | ✅ OK — "Movimientos" activo |
| body | Avatar × 4 | `Avatar` | `Size=M` | ✅ OK — iniciales default |
| body | Badge × 4 | `Badge` | `Theme` | ✅ OK — montos |
| body | Tag × 4 | `Tag` | `TagBusiness` | ✅ OK — Compra/Transferencia/Pago |
| footer | FabButton | `FabButton / Default` | `Size=M` | ✅ OK — icon flotante |

### Observaciones

- **AppBar Mobile → 2 boards**: `Open` (x negativo, full height, solo AppBar, menú expandido) + `Shadow Close` (x=0, contenido completo). NUNCA mezclar Open en el board de contenido.
- **AppBar Shadow Close — sin título de app**: no tiene nodo texto de app title. El Rectangle central es para logo. Badge/Notifications del IconButton = contador de notificaciones.
- **ProgressCircle / Size=M — paths texto**: `children[1].children[0]` = label (default "Loading"), `children[1].children[1]` = value (default "0%"). El arco SVG NO refleja el % via MCP — solo los textos.
- **DataList Or List — 6 filas default**: siempre ocultar filas sobrantes si se necesitan menos de 6.
- **Tabs / Default — 1 sola pestaña activa**: label en `contentTabs.children.find(c => c.type === "text")`. Pestañas adicionales requieren ajuste manual en Penpot UI.
- **FabButton / Default / Size=M — icon-only**: sin campo de texto. Label "Nueva transferencia" debe agregarse manualmente en Penpot UI.
- **findShape con boards duplicados**: usar `page.root.children.find(b => b.name === "..." && !b.hidden)` — `penpotUtils.findShape()` puede retornar el board viejo hidden.
- **Movimientos list**: cada ítem = frame flex row (Avatar + info column + monto column). Los textos de description/date se crean con `penpot.createText()` — texto sencillo dentro de layout propio, no componente IT DS.
- **Badge/Theme para montos**: texto a `penpotUtils.findShape(s => s.type === "text", badgeInst)` (findShape funciona para lectura de estructura, no para setear directamente — navegar por children).
- **Tag/TagBusiness texto**: `penpotUtils.findShape(s => s.type === "text", tagInst)` → setear `.characters`.

---

## Audit v3 — Preferencias de cuenta Desktop · 2026-05-19

> Test de validación de paths v3 post-audit. Board construido en Page 1 del archivo IT DS Lab (1280×832).
> Objetivo: confirmar 4 rutas v3 críticas: TextArea, ToggleButton, Tooltip, Footer.

### Paths confirmados en producción (MCP, 2026-05-19)

| Componente | Path confirmado | name | Notas |
|---|---|---|---|
| TextArea Default | `TextArea` | `Default` | path corto sin sub-path ✅ |
| ToggleButton v3 | `ToggleButton / Default / Size=MD / Default` | `Default` | 4 niveles — Variant y State son path segments, no variantProps ✅ |
| Tooltip Top | `Tooltip` | `Top` | boards separados por dirección ✅ |
| Footer Desktop | `Footer / Desktop` | `Outline` | nuevo path v3 ✅ |
| ActionButtons FilledButtons | `ActionButtons / FilledButtons` | `Size=LG` | `Default` wrapper eliminado en v3 ✅ |
| ActionButtons HuggedButtons | `ActionButtons / HuggedButtons` | `Size=LG/MD/SM` | ✅ |
| ActionButtons VerticalButtons | `ActionButtons / VerticalButtons` | `Size=LG/MD/SM` | ✅ |
| AppBar Desktop | `AppBar / Desktop / Outline` | `Button` | ✅ |
| Sidebar Collapse | `Sidebar / Collapse / Outline` | `Click Expand` | ✅ |
| Text/Text | — | — | ❌ ELIMINADO en v3 — usar `penpot.createText()` con tokens tipográficos |

### Ajustes menores detectados

1. **PageHeader children[0]/[1]**: subtitle es `children[0].children[0]`, title es `children[0].children[1]` — el orden está invertido respecto a lo esperado.
2. **Breadcrumb labels**: `bc.children[0].children` traversal no aplica texto — requiere inspección de estructura real.
3. **ToggleButton label interno**: muestra "Body text" default — texto interno está profundo en la jerarquía, requiere traversal adicional.

### Componentes del build
AppBar Desktop + Sidebar Collapse + PageHeader + Breadcrumb + Divider (×3) + ToggleButton (×2) + Tooltip + TextArea + ActionButtons FilledButtons + Footer Desktop
