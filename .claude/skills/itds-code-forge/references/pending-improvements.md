# IT DS Code Forge — Mejoras Pendientes

> Lista de mejoras detectadas en sesiones de prueba. Cuando el usuario pida "actualizar el skill", aplicar todas las mejoras listadas aquí y marcarlas como ✅.

---

## Pendientes

_(vacío)_

---

## Aplicadas

### ✅ [001] Detección de capas ocultas en Penpot (Paso 3c)
**Aplicado en:** Sesión 2026-05-12
**Descripción:** En el Paso 3c, ejecutar `collectHidden()` sobre cada shape inspeccionado. Las capas con `shape.hidden === true` se reportan al usuario y **no se renderizan** en el JSX.

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

---

### ✅ [002] Swipe horizontal en Tabs (mobile)
**Aplicado en:** Sesión 2026-05-12
**Descripción:** En el Paso 4 / react-patterns para el componente `Tabs`, el swipe horizontal es comportamiento estándar obligatorio en mobile.

```
[Tabs] mobile swipe
  react  touchstart → touchend · deltaX > 50px → tab siguiente/anterior
  css    transition: transform 300ms ease en itds-tabs__content-track
```

**Regla:** `Tabs en mobile SIEMPRE incluye swipe handler` — ver sección Tabs en react-patterns.md

---

### ✅ [003] Action Buttons — siempre al fondo mediante layout flex (regla global)
**Aplicado en:** Sesión 2026-05-12
**Descripción:** El componente Action Buttons (footer) siempre debe posicionarse al fondo mediante flex layout, no `position: sticky` ni `position: fixed`.

```css
.itds-screen { height: 100%; display: flex; flex-direction: column; }
.itds-screen__body { flex: 1; overflow-y: auto; }
.itds-screen__footer { flex-shrink: 0; }
```

**Reglas absolutas:**
```
❌ No usar position: sticky ni position: fixed en el footer de Action Buttons
❌ No usar padding-bottom de compensación en el body
✅ Usar flex layout: itds-screen height:100% → itds-screen__body flex:1 → itds-screen__footer flex-shrink:0
✅ Aplicar en TODAS las pantallas con Action Buttons, sin excepción
```

---

### ✅ [004] PageHeader — orden DOM confirma Penpot y-positions
**Aplicado en:** Sesión 2026-05-12
**Descripción:** Inspeccionando Penpot con MCP, se confirmó que `[Content]` (action icons) tiene y menor que `[Headline]` (título/saludo), lo que significa que los action icons están ARRIBA y el saludo ABAJO. El orden en el DOM debe coincidir con el orden visual de Penpot.

**Regla:** Siempre verificar y-coordinates en Penpot para confirmar el orden visual real antes de implementar. El orden de children en el árbol de Penpot puede no coincidir con el orden visual — los y-coordinates son la fuente de verdad.

---

### ✅ [005] Card / CardFeature — imagen fija 88×88px
**Aplicado en:** Sesión 2026-05-12
**Descripción:** El `[Image]` dentro de Card Feature es un `rectangle` de exactamente 88×88px con 16px de margen desde los bordes del card. NO se estira al alto total del card (127px).

**Reglas:**
```
❌ min-height en la imagen del card → se estira al alto completo (127px en vez de 88px)
❌ align-items: stretch en el card → provoca el mismo problema
✅ height: 88px fijo en .itds-card-feature__image
✅ align-items: flex-start en .itds-card-feature
✅ padding: spacing-4 en el card, gap: spacing-4 entre imagen y contenido
✅ content con align-self: stretch (el content sí puede estirarse)
```

---

### ✅ [006] Tabs Default Box — estructura correcta
**Aplicado en:** Sesión 2026-05-12
**Descripción:** La variante "Default Box" de Tabs usa borde completo en cada tab (no solo border-bottom). Strokes confirmados por Penpot: inactivo `#94a3b8`, activo `#2563eb`. Todos los elementos (icon, label, badge) son visibles en estado inactivo. El badge usa colores distintos: `itds-badge--theme` (activo) / `itds-badge--neutral` (inactivo).

**Reglas:**
```
❌ border-bottom: 2px en tab → es variante underline, no Box
❌ Ocultar badge en tab inactivo → todos los elementos deben verse siempre
✅ border: 1px solid #94a3b8 (inactivo) / border-color: #2563eb (activo)
✅ border-radius: var(--radius-button) en cada tab (caja con esquinas redondeadas)
✅ itds-badge--neutral (gris) en inactivo, itds-badge--theme (azul) en activo
```

---

### ✅ [007] BottomSheet — overlay con portal para cubrir status bar
**Aplicado en:** Sesión 2026-05-12
**Descripción:** El overlay del BottomSheet debe cubrir el frame completo del mockup incluyendo el status bar. La solución es `ReactDOM.createPortal` hacia un `#overlay-root` posicionado como `position: absolute; inset: 0` dentro de `.mockup__frame`.

**Implementación:**
- Agregar `<div id="overlay-root"></div>` dentro de `.mockup__frame` en el HTML
- CSS: `#overlay-root { position: absolute; inset: 0; z-index: 50; pointer-events: none; }`
- React: `ReactDOM.createPortal(children, document.getElementById('overlay-root'))`
- `.itds-overlay` necesita `pointer-events: auto` para capturar eventos

---

### ✅ [008] BottomSheet Headline — estructura exacta por Penpot x/y positions
**Aplicado en:** Sesión 2026-05-12
**Descripción:** Inspeccionando Penpot con MCP x/y-coordinates se confirmó la estructura exacta del Headline del BottomSheet:
- `icon/close`: x=right, y=top → ARRIBA a la DERECHA (primer hijo con `align-self: flex-end`)
- `[Text]` (título+subtítulo): x=left → a la IZQUIERDA
- `[Badge]`: x=right (misma x que close) → a la DERECHA del título

**Estructura correcta:**
```
[Headline] flex-column
  [close button] align-self: flex-end  ← ARRIBA-DERECHA
  [title-section] flex-row
    [text-group] flex-column, flex:1   ← IZQUIERDA
      [title]
      [subtitle]
    [badge]                            ← DERECHA
```

---

### ✅ [009] Action Buttons en BottomSheet — sin padding propio
**Aplicado en:** Sesión 2026-05-12
**Descripción:** Los Action Buttons dentro del BottomSheet no deben tener padding lateral. El bottomsheet ya provee `padding: 16px` en sus lados. Si los action buttons tienen su propio padding, los botones quedan con 32px de inset (doble padding).

**Regla:** `.itds-action-buttons--sheet { padding: 0; }` — el sheet provee el espaciado lateral.

---

### ✅ [010] Alert — línea única y stroke
**Aplicado en:** Sesión 2026-05-12
**Descripción:** El componente Alert debe mostrar el texto en una sola línea. Confirmado por Penpot: el alert success tiene `border: 1px solid #16803c` (stroke). El texto debe ser conciso ("Producto aprobado") y reforzado con `white-space: nowrap`.

**Reglas:**
```
✅ border: 1px solid var(--color-success-default) en .itds-alert--success
✅ white-space: nowrap + overflow: hidden + text-overflow: ellipsis en .itds-alert__title
✅ Texto corto: preferir "Producto aprobado" sobre frases largas
```
