# IT DS Code Forge — Historial de Pantallas

> Historial de pantallas generadas con el skill itds-code-forge.
> Actualizar al finalizar cada construcción.

---

## Sesión de mejoras del skill · 2026-05-13

| Campo | Valor |
|---|---|
| **Tipo** | Mejora interna del skill (no build de pantalla) |
| **Archivos modificados** | `design-tokens.md` · `ds-snapshot.md` · `react-patterns.md` · `skill.md` · 4 archivos Desktop (shadow patch) |

### Cambios aplicados

| Área | Detalle |
|---|---|
| **design-tokens.md** | Reescritura completa validada contra `tokens penpot.json` (MCP + JSON). Corregidas sombras (opacidades correctas). Agregados: negativos, letter-spacing 14 tokens, text-6xl/7xl/8xl, opacity 0%-90% (sin 100%), brand 19 colores, Transparent.Black. Arcus radius-box corregido a 24px ({2XL}). Documentado: lineHeight uniforme 1.25, letter-spacing NO vinculado a tipografías. |
| **ds-snapshot.md v2** | Actualizado de 53 páginas/286 componentes → 65 páginas/459 componentes. 12 nuevas páginas documentadas. Todos los 🚧 resueltos — ningún componente en construcción. 4 typos de naming registrados en sección 7. Todos los componentes nuevos anotados con patrón de selección por path (sin componentProperties). |
| **react-patterns.md** | Agregados patrones para: Rating (estrella interactiva 7 colores), CSAT (emoji satisfaction 5 niveles), OtpInput (código verificación 3/4/6 chars × LG/MD), Skeleton (shimmer CSS puro 9 tipos). |
| **Shadow patch Desktop** | Corregidas sombras incorrectas en 4 archivos: CategoryScreen/tokens.css · CategoryScreen/CategoryScreen.html · CategoryFlow-Arcus/tokens.css · CategoryFlow/tokens.css. Valores: `0 1px 3px 0 rgba(0,0,0,0.20)` / `0 1px 8px -1px rgba(0,0,0,0.30)` / `0 2px 15px -3px rgba(0,0,0,0.40)`. |

### Typos de naming documentados (sección 7 del snapshot)

| Componente | Página Penpot | Path en librería |
|---|---|---|
| ImageUploader | `↳ ImageUploader` | `ImageUpload` (sin "r") |
| ProductEcomerce | `↳ ProductEcomerce` (1 m) | `ProductEcommerce` (2 m) |
| UserMenu utility | `SlectSingle` | debería ser `SelectSingle` |
| DateInput size mayor | `Size=MD` (nombre anterior) | `Size=LG` (confirmado MCP) |

---

## CategoryScreen · 2026-05-11

| Campo | Valor |
|---|---|
| **Origen Penpot** | Página "Skill code-forge" · board "Category - IT" |
| **Plataforma** | Mobile 375px |
| **Theme** | IT |
| **Archivos** | CategoryScreen.jsx · CategoryScreen.html · tokens.css · components.css |
| **Output** | ~/Desktop/CategoryScreen/ |

### Componentes utilizados

| Sección | Componente Penpot | Variante | Prop React | Estado |
|---|---|---|---|---|
| header | Page Header / Default | default | `<div className="itds-page-header">` | ✅ OK |
| header | ActionIcon / Size=M | default | `<button className="itds-action-icon">` | ✅ OK |
| header | Tag / TagBusiness | Theme pill | `<span className="itds-tag itds-tag--theme">` | ✅ OK |
| body | List / Navigation List / Box | × 3 | `<button className="itds-nav-list-item">` | ✅ OK |
| body | Badge / Theme | Theme | `<span className="itds-badge itds-badge--theme">` | ✅ OK |
| body | ActionIcon / Size=S | chevron | `<span className="itds-chevron">` | ✅ OK |
| footer | Button / Primary / Size=L | Primary/L | `<button className="itds-button itds-button--primary">` | ✅ OK |
| footer | Button / Secondary / Size=L | Secondary/L | `<button className="itds-button itds-button--secondary">` | ✅ OK |
| footer | Button / Tertiary / Size=L | Tertiary/L | `<button className="itds-button itds-button--tertiary">` | ✅ OK |

### Tokens CSS clave extraídos de Penpot

| Propiedad | Variable | Valor Penpot |
|---|---|---|
| Button fill | `var(--color-theme-primary)` | Theme.Primary = #2563EB |
| Button radius | `var(--radius-button)` | token Button = 8px |
| Header padding | `var(--spacing-4)` | spacing.4 = 16px |
| Header gap | `var(--spacing-2)` | spacing.2 = 8px |
| Body gap entre items | `var(--spacing-3)` | spacing.3 = 12px (real del diseño) |
| Button padding H | `var(--spacing-8)` | spacing.8 = 32px |
| Footer gap botones | `var(--spacing-2)` | spacing.2 = 8px |

### Observaciones

- El gap entre list items del body es 12px (`spacing.3`) según el diseño Penpot — difiere del default de 16px del skill. Se respetó el valor del diseño.
- Los textos del diseño Penpot ("Title", "Subtitle", "Body text") fueron reemplazados por contenido real representativo para la prueba.
- Tag "Paris" replicado como pill azul con ícono de ubicación.

---

## ProductsFlow — Desktop · 2026-05-13

| Campo | Valor |
|---|---|
| **Origen Penpot** | Página "Pages portal" · 5 boards seleccionados |
| **Plataforma** | Desktop 1280×832 (full viewport 100vw/100vh) |
| **Theme** | IT (DM Sans · primary #2563EB · radius 8px) |
| **Archivos** | ProductsFlow.html · ProductsFlow.jsx · tokens.css · components.css |
| **Output** | ~/Desktop/ProductsFlow/ |
| **Resultado** | 2 — Ajustes menores (14 iteraciones post-entrega, sin rework estructural) |

### Boards inspeccionados

| Board | Descripción |
|---|---|
| `Products table - sidebar collapsed` | Tabla base · sidebar 76px · CSS hover |
| `Products table - sidebar expand` | Estado hover sidebar 271px (CSS puro, sin React state) |
| `drawer product edit` | Drawer 480px · slide derecha · ProductFile/Default 4 secciones |
| `modal confirm delete` | Modal 473px · fadeInScale · ícono sobre título |
| `Products table - success mesaje` | Toast Notification/Inverse · auto-dismiss 3s · fila eliminada |

### Componentes utilizados

| Sección | Componente Penpot | Variante | Clase CSS | Estado |
|---|---|---|---|---|
| layout | AppBar / Desktop / Outline | h=79px | `.itds-appbar` | ✅ OK |
| layout | UserMenu / Right top | avatar 53×54 · texto right · role arriba | `.itds-user-menu` | ✅ OK |
| layout | Badge / Notifications | dot 12×12 · #dc2626 · sin texto | `.itds-notification-badge` | ✅ OK |
| layout | Sidebar / Expand / Outline | collapsed 76px · expanded 271px · CSS :hover | `.itds-sidebar` | ✅ OK |
| body | Breadcrumb | Material Symbols Outlined · ícono por link | `.itds-breadcrumb` | ✅ OK |
| body | Table / Header / Desktop | bg #f1f5f9 · separadores #cbd5e1 | `.itds-table thead th` | ✅ OK |
| body | Tabs / Tab Bar | 3 tabs | `.itds-tab` | ✅ OK |
| body | Table / Pagination / Desktop Default | nav izq (←·input·de·N·→) + result der | `.itds-pagination` | ✅ OK |
| drawer | Drawer / Drawer | 480px · slideInRight 320ms | `.itds-drawer` | ✅ OK |
| drawer | ProductFile / Default | tags + info + ItemsCardValues | `.pf-*` | ✅ OK |
| modal | Modal confirm delete | 473px · fadeInScale · ícono azul sobre título | `.itds-modal` | ✅ OK |
| feedback | Toast / Notification/Inverse | 388px · #0f172a bg · auto-dismiss 3s | `.itds-toast` | ✅ OK |

### Hallazgos clave

| # | Hallazgo | Regla |
|---|---|---|
| 001 | Sidebar expand es estado CSS, no transición de pantalla | `:hover { width: 271px }` + `transition: width 250ms`. Sin React state. |
| 002 | Overlays desktop deben ser `position: absolute; inset: 0` — no `fixed` | El wrapper del flujo es el stacking context. `fixed` escapa del contenedor 1280×832. |
| 003 | Pagination Desktop Default tiene estructura propia (no numérica) | nav izq: ← · input · de · N · → \| result der: X-Y · de · Z · [rows▼] |
| 004 | UserMenu/Right top: avatar 53×54 (oval-pill), texto right-aligned, role encima del nombre | Leer dimensiones exactas de Penpot — no asumir cuadrado. |
| 005 | Badge/Notifications desktop = dot 12×12 sin texto | Diferente al badge mobile con contador numérico. |
| 006 | Table header: bg #f1f5f9 · stroke #cbd5e1 — no tokens --color-divider | Leer `Table/Cells/Head` en Penpot antes de asumir tokens. |
| 007 | Breadcrumb requiere 2 CDNs: Material Icons Outlined + Material Symbols Outlined | Incluir ambos `<link>`. Selector separado por familia. |
| 008 | ProductFile/Default tiene 4 secciones distintas | [Tags row] → [Product Information: imagen 64×64 + key-values] → [ItemsCardValues: TextInput LG full + 2×half] |
| 009 | `deletedIds` inmutable para eliminar filas | `setDeletedIds(ids => [...ids, id])` + `filter(p => !deletedIds.includes(p.id))` |
| 010 | Modal IT DS: ícono warning sobre el título (column layout), color theme-primary | `flex-direction: column`. No usar `color-warning-*` para confirmación destructiva. |

---

## FormsStepper1Screen · 2026-05-12

| Campo | Valor |
|---|---|
| **Origen Penpot** | Página "Skill code-forge" · board "Forms stepper 1" |
| **Plataforma** | Mobile 375×812 (iPhone 15 Pro) |
| **Theme** | Arcus (Open Sans · primary #000000 · accent #2CDFA6 · radius pill) |
| **Archivos** | FormsStepper1Screen.jsx · FormsStepper1Screen.html · tokens.css · components.css |
| **Output** | ~/Desktop/FormsStepper1Screen/ |
| **Resultado** | 1 — Sin rework |

### Componentes utilizados

| Sección | Componente Penpot | Variante | Clase CSS | Estado |
|---|---|---|---|---|
| header | Page Header / Default | CSS back + Tags | `.itds-screen__header` | ✅ OK |
| header | Tag / Tags | "Paris" pill #006DFF + "Oferta" pill accent | `.itds-tag` | ✅ OK |
| header | Stepper / Compact / Horizontal | step 1/4 · track 25% | `.itds-stepper` | ✅ OK |
| body | TextInput / LG | labelFixed × 4 | `.itds-text-input` | ✅ OK |
| body | Select / Single / MD | labelFixed × 2 · CSS chevron `::after` | `.itds-select` | ✅ OK |
| body | Divider | horizontal 1px | `.itds-divider` | ✅ OK |
| footer | Button / Primary / Size=L | Arcus black · disabled/loading | `.itds-button--primary` | ✅ OK |
| footer | Button / Secondary + Tertiary / Size=L | — | `.itds-button` | ✅ OK |

### Hallazgos clave

| # | Hallazgo | Regla |
|---|---|---|
| 001 | `labelFixed` no existe como variante en Penpot — label siempre visible encima del container | Code pattern: `<label>` estático sobre `.itds-text-input__container`. Sin animación float. |
| 002 | Button Primary Arcus: `color: var(--color-theme-contrast)` = #000000 → texto invisible | Override: `[data-theme="arcus"] .itds-button--primary { color: #FFFFFF }` |
| 003 | Stepper track `#D6D6D6` sin token semántico | Hardcoded desde Penpot. Sugerencia: `--color-neutral-track`. |
| 004 | `Theme.Accent` Arcus no tiene override explícito en design-tokens.md | Agregar `--color-theme-accent: #2CDFA6` en bloque `[data-theme="arcus"]` de tokens.css. |
| 005 | Select pill (999px) + dropdown rectangular → gap visual al abrir | Override: `border-bottom-left-radius: var(--radius-lg); border-bottom-right-radius: var(--radius-lg)` cuando open. |
| 006 | Íconos sin CDN — back button y chevron con CSS `::before` / `::after` | Decisión del usuario. Funcionales con CSS puro. |

---

## CategoryFlow-Arcus · 2026-05-12

| Campo | Valor |
|---|---|
| **Origen Penpot** | Página "Skill code-forge" · 5 boards seleccionados |
| **Plataforma** | Mobile 375×812 (iPhone 15 Pro) |
| **Theme** | Arcus (Open Sans · primary #000000 · accent #2CDFA6 · radius pill) |
| **Archivos** | CategoryFlowArcus.html · CategoryFlowArcus.jsx · tokens.css · components.css |
| **Output** | ~/Desktop/CategoryFlow-Arcus/ |
| **Inspección Penpot** | Íconos via execute_code · fills #585858 (Neutral.Default Boulder) todos los ActionIcons |

### Componentes utilizados

| Sección | Componente Penpot | Variante | Prop React | Estado |
|---|---|---|---|---|
| header (01) | PageHeader / Default | sin back · notifications | `<header className="itds-screen__header">` | ✅ OK |
| body (01) | Tabs / Box | × 3 tabs con swipe | `<div className="itds-tabs">` + track swipe | ✅ OK |
| body (01) | CardFeature / SideImage_MD | × 3 cards Arcus colors | `<button className="itds-card-feature">` | ✅ OK |
| header (02-05) | PageHeader / Default | arrow_back + tune | `<PageHeader onBack rightIcon="tune">` | ✅ OK |
| body (02-05) | List / Navigation List / Box | × 3 / × 2 items | `<NavListItem>` | ✅ OK |
| body item | Icon Box 64×64 | #f5f5f5 bg · dashboard_customize | `.itds-nav-list-item__icon-box` | ✅ OK |
| body item | Badge / Theme | black bg · white text Arcus | `<span className="itds-badge itds-badge--theme">` | ✅ OK |
| body item | ActionIcon / Size=S | chevron_right trailing | `.itds-chevron` | ✅ OK |
| footer (02-05) | ActionButtons / Default | Primary + Secondary | `<CategoryFooter>` con loading spinner | ✅ OK |
| overlay (03) | BottomSheet | close + title + badge + ProductFile + ActionButtons | `<BottomSheet>` via OverlayPortal | ✅ OK |
| alert (04) | Alert / Alert | #dcfce7 bg · check_circle · close | `.itds-alert itds-alert--success itds-alert--floating` | ✅ OK |

### Tokens CSS clave Arcus (diferencias vs IT)

| Token | IT | Arcus | Variable |
|---|---|---|---|
| Theme.Primary | `#2563EB` Blue | `#000000` Black | `--color-theme-primary` |
| Theme.Accent | `#2563EB` Blue | `#2CDFA6` Shamrock | `--color-theme-accent` |
| Theme.Softest | `#DBEAFE` Blue.100 | `#CEFDE7` Shamrock.100 | `--color-theme-softest` (tab activo bg) |
| radius-button | 8px | 999px (pill) | `--radius-button` |
| radius-box | 8px | 16px | `--radius-box` |
| radius-input | 8px | 999px (pill) | `--radius-input` |
| Neutral.Default | `#475569` Lynch | `#585858` Boulder | `--color-neutral-default` |
| Font | DM Sans | Open Sans | `--font-family` |

### Observaciones

- `--color-theme-contrast` en Arcus es `#000000` (Black) — token heredado de IT DS que en Arcus tiene semántica diferente. El botón primary usa `color: #FFFFFF` hardcodeado en components.css para garantizar legibilidad sobre fondo negro.
- CardFeature usa colores Arcus on-brand: #1D1D1D · #2CDFA6 (Shamrock) · #585858 (Boulder). Card 2 (Shamrock) usa `iconColor: rgba(0,0,0,0.5)` para legibilidad del ícono.
- La clase `.itds-tab` usa `border-color: var(--color-neutral-soft)` (no hardcodeado) para que en Arcus tome `#A6A6A6` (Boulder.400) en vez de `#94A3B8` (Lynch.400).
- Mockup background: `#111111` (dark gray) en vez de `#0F172A` (blue-gray IT) — más on-brand con el estilo monocromático de Arcus.
- BottomSheet overlay backdrop: `rgba(0,0,0,0.50)` en vez de `rgba(15,23,42,0.45)` — negro puro para Arcus.

---
