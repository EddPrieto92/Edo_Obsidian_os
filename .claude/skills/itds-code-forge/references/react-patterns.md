# React Patterns — IT DS Code Forge

Patrones de código React para construir pantallas con el IT DS de Cencosud.

---

## ⚠️ REGLA CRÍTICA — Escaneo obligatorio de íconos antes de generar código

**Esta regla aplica a TODOS los modos de construcción (A, B, C), en TODOS los builds, sin excepción.**

Antes de generar cualquier línea de código, escanear cada board via Penpot MCP para detectar íconos. El escaneo es automático — no depende de lo que el usuario describió.

### Proceso obligatorio

1. **Escanear** cada board vía `execute_code` → buscar layers con `type=path/svg`, nombres que contengan `icon/arrow/chevron/close/menu/search`, o hijos de componentes con slots de ícono conocidos
2. **Reportar** al usuario: tabla con pantalla · componente · nº íconos · nombre de capa
3. **Preguntar** si requiere configurar íconos → [S] sí / [N] no
4. **Si [S]**: pedir nombre de cada ícono buscado en `https://fonts.google.com/icons?icon.size=24&icon.color=%231f1f1f&icon.style=Rounded`
5. **Interpretar** el nombre recibido (puede ser en español o aproximado) → mapear al ligature correcto
6. **Si [N]** o **0 íconos detectados**: usar SVG placeholder, continuar sin CDN

### CDN Material Icons Rounded (cuando se usan íconos)

```html
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded" rel="stylesheet">
```

```jsx
<span className="material-icons-rounded" aria-hidden="true">icon_name</span>
```

```css
/* Solo display base en global — tamaño y color en selector compuesto del componente */
.material-icons-rounded { color: inherit; line-height: 1; display: inline-flex; align-items: center; }

/* ✅ Correcto */
.itds-action-icon .material-icons-rounded { font-size: var(--spacing-6); }

/* ❌ Incorrecto */
.material-icons-rounded { font-size: 24px; color: var(--color-neutral-strongest); }
```

> Ver SKILL.md Paso 3b para el flujo conversacional completo de detección y resolución.

---

## ⚠️ REGLA CRÍTICA — Captura obligatoria de tokens antes de generar código

**Esta regla aplica a TODOS los componentes, en TODOS los builds, sin excepción.**

Antes de escribir cualquier línea de CSS o JSX para un componente, inspeccionar sus tokens en Penpot MCP y documentarlos en tabla. Nunca asumir que el valor es el mismo que en el snapshot, memory, o builds anteriores.

### Propiedades a capturar por componente

| Propiedad Penpot | CSS target |
|---|---|
| `fills` → token name + hex | `background-color`, `color` |
| `strokes` → color + width | `border-color`, `border-width` |
| `r1` / `r2` → border-radius px | `border-radius` |
| `layoutGap` → px → token | `gap` del flex container |
| `paddingTop/Bottom/Left/Right` → px → token | `padding` del componente |
| `width` / `height` → px o fill/hug | `width`, `height`, `flex: 1` |
| icon layer `width` → px → token | `font-size` en `.itds-X .material-icons` |
| children[N].layoutGap → px | `gap` de sub-contenedores internos |
| typography → font, size, weight | reglas de texto |
| `opacity` | `opacity`, `rgba()` |

**Mapeo px → token spacing (⚠️ naming no secuencial):**

| px | Token | | px | Token |
|---|---|---|---|---|
| 2px | `--spacing-1` | | 24px | `--spacing-6` |
| 4px | `--spacing-0-5` | | 32px | `--spacing-8` |
| 8px | `--spacing-2` | | 48px | `--spacing-12` |
| 12px | `--spacing-3` | | 64px | `--spacing-16` |
| 16px | `--spacing-4` | | 96px | `--spacing-24` |

> ⚠️ No existe `--spacing-5` ni `--spacing-7`. Si Penpot da 20px o 28px, usar el valor en `px` directo.

### Regla de doble inspección — Arcus

Si el build usa Arcus, los tokens resuelven diferente. **Siempre inspeccionar la variante Arcus por separado** antes de asumir que coincide con IT:

```
Badge / Theme
  IT    → fills: Theme.Primary  → #2563EB (azul)    ✓ verificado
  Arcus → fills: Theme.Accent   → #2CDFA6 (Shamrock) ← DIFERENTE

Tab / Estado activo
  IT    → fills: Theme.Softest  → #DBEAFE (azul.100) ✓ verificado
  Arcus → fills: []             → transparent         ← DIFERENTE

Button / Primary — color de texto
  IT    → Theme.Contrast        → #FFFFFF ✓ correcto
  Arcus → Theme.Contrast        → #000000 ⚠️ override manual a #FFFFFF requerido
```

**Si el token difiere entre themes → agregar `[data-theme="arcus"]` override en components.css.**

### Bugs confirmados por omitir esta regla

- Badge negro sobre negro en Arcus (usaba Theme.Primary en vez de Theme.Accent)
- Tab activo con fill verde menta (usaba Theme.Softest en vez de transparent)
- ProductFile con label/valor separados a extremos (space-between en vez de gap 4px)
- Botón primary con texto invisible (contrast token negro sobre fondo negro en Arcus)

`❌ Nunca asumir. ✅ Siempre inspeccionar. ✅ Siempre documentar antes de generar.`

---

## Estructura base de un componente IT DS

```jsx
import React, { useState } from 'react';
import PropTypes from 'prop-types';

/**
 * [NombreComponente] — IT DS
 * Variantes: [lista de variantes disponibles]
 */
const NombreComponente = ({
  variant = 'primary',
  size = 'md',
  state = 'default',
  label = '',
  onClick,
  disabled = false,
  ...props
}) => {
  const classNames = [
    'itds-component-nombre',
    `itds-component-nombre--${variant}`,
    `itds-component-nombre--${size}`,
    state !== 'default' ? `itds-component-nombre--${state}` : '',
  ].filter(Boolean).join(' ');

  return (
    <div
      className={classNames}
      onClick={!disabled ? onClick : undefined}
      aria-disabled={disabled}
      {...props}
    >
      {label}
    </div>
  );
};

NombreComponente.propTypes = {
  variant: PropTypes.oneOf(['primary', 'secondary', 'ghost']),
  size: PropTypes.oneOf(['sm', 'md', 'lg']),
  state: PropTypes.oneOf(['default', 'hover', 'pressed', 'disabled', 'error']),
  label: PropTypes.string,
  onClick: PropTypes.func,
  disabled: PropTypes.bool,
};

export default NombreComponente;
```

---

## Patrones por tipo de componente

### Button

**Storybook verificado 2026-05-12.** Height 48px (h-12) · padding 16px · border-radius `--radius-button` (8px IT / 999px Arcus) · font 16px · texto del span: font-weight 500.

```jsx
const Button = ({
  variant = 'primary',   // primary | secondary | tertiary
  size = 'lg',           // sm | md | lg
  label = 'Continuar',
  onClick,
  disabled = false,
  loading = false,
  leadingIcon = null,    // JSX de ícono SVG o <span class="material-icons">
  trailingIcon = null,
}) => (
  <button
    className={`itds-button itds-button--${variant} itds-button--${size}${loading ? ' itds-button--loading' : ''}`}
    onClick={onClick}
    disabled={disabled || loading}
    type="button"
  >
    {loading ? (
      <span className="itds-button__spinner" aria-hidden="true" />
    ) : (
      <>
        {leadingIcon && <span className="itds-button__icon" aria-hidden="true">{leadingIcon}</span>}
        <span className="itds-button__label">{label}</span>
        {trailingIcon && <span className="itds-button__icon" aria-hidden="true">{trailingIcon}</span>}
      </>
    )}
  </button>
);
```

```css
.itds-button {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  width: 100%;
  font-family: var(--font-family);
  font-size: var(--text-base);   /* 16px — Storybook verified */
  cursor: pointer;
  border: 1px solid transparent;
  border-radius: var(--radius-button);
  transition: background-color 150ms ease, border-color 150ms ease, color 150ms ease;
  box-sizing: border-box;
  position: relative;
}

.itds-button__label { font-weight: var(--weight-medium); } /* 500 — span hijo */
.itds-button__icon  { display: inline-flex; align-items: center; font-size: 20px; }

/* ── Sizes — Storybook computed ── */
.itds-button--sm { height: 36px; padding: 0 12px; font-size: var(--text-sm); }
.itds-button--md { height: 44px; padding: 0 16px; }
.itds-button--lg { height: 48px; padding: 0 16px; } /* h-12 = 48px */

/* ── Variants ── */
/* Primary: bg theme-primary · white text · border theme-primary */
.itds-button--primary {
  background: var(--color-theme-primary);
  color: var(--color-neutral-white);
  border-color: var(--color-theme-primary);
}
.itds-button--primary:hover   { background: var(--color-theme-hover); border-color: var(--color-theme-hover); }
.itds-button--primary:active  { background: var(--color-theme-pressed); border-color: var(--color-theme-pressed); }

/* Secondary: white bg · theme border · theme text */
.itds-button--secondary {
  background: var(--color-neutral-white);
  color: var(--color-theme-primary);
  border-color: var(--color-theme-primary);
}
.itds-button--secondary:hover  { background: var(--color-theme-softest); border-color: var(--color-theme-hover); color: var(--color-theme-hover); }
.itds-button--secondary:active { background: var(--color-theme-softest); border-color: var(--color-theme-pressed); color: var(--color-theme-pressed); }

/* Tertiary: transparent · theme text · no visible border */
.itds-button--tertiary {
  background: transparent;
  color: var(--color-theme-primary);
  border-color: transparent;
}
.itds-button--tertiary:hover  { color: var(--color-theme-hover); }
.itds-button--tertiary:active { color: var(--color-theme-pressed); }

/* ── States ── */
.itds-button:disabled,
.itds-button--loading {
  background: var(--color-neutral-softest);
  color: var(--color-neutral-disabled);
  border-color: var(--color-neutral-softest);
  pointer-events: none;
  cursor: not-allowed;
}

/* ── Loading spinner ── */
.itds-button__spinner {
  width: 20px; height: 20px;
  border: 2px solid currentColor;
  border-top-color: transparent;
  border-radius: 50%;
  animation: itds-spin 0.6s linear infinite;
}
@keyframes itds-spin { to { transform: rotate(360deg); } }
```

```
Variants (Storybook + Penpot):
  primary   → bg theme-primary · white · border theme-primary  (acción principal)
  secondary → bg white · border theme-primary · color theme-primary  (acción secundaria)
  tertiary  → sin fondo · sin borde visible · color theme-primary  (acción de menor peso)

Sizes verificados Storybook (computed styles):
  sm: 36px   md: 44px   lg: 48px ← default en ActionButtons

❌ height 52px es el valor de Penpot design — el código usa 48px (h-12 Tailwind)
✅ span hijo .itds-button__label tiene font-weight: 500 (medium)
✅ Arcus: border-radius: 999px (pill) via --radius-button
```

---

### ActionButtons

**Penpot:** `ActionButtons / Default` — stack vertical de 2-3 botones, ancho completo. **Storybook verificado 2026-05-12:** container `flex-col gap: 12px` · cada botón 48px alto · padding 16px.

```jsx
const ActionButtons = ({
  primary,     // { label, onClick, disabled?, loading? }
  secondary,   // { label, onClick, disabled? } — opcional
  tertiary,    // { label, onClick } — opcional
  inSheet = false,  // true → padding: 0 (el BottomSheet ya provee 16px lateral)
}) => (
  <div className={`itds-action-buttons${inSheet ? ' itds-action-buttons--sheet' : ''}`}>
    <Button variant="primary" label={primary.label} onClick={primary.onClick}
      disabled={primary.disabled} loading={primary.loading} />
    {secondary && (
      <Button variant="secondary" label={secondary.label} onClick={secondary.onClick}
        disabled={secondary.disabled} />
    )}
    {tertiary && (
      <Button variant="tertiary" label={tertiary.label} onClick={tertiary.onClick} />
    )}
  </div>
);
```

```css
.itds-action-buttons {
  display: flex;
  flex-direction: column;
  gap: 12px;           /* gap-3 Tailwind — Storybook verified */
  width: 100%;
  padding: var(--spacing-4);   /* 16px lateral cuando está standalone */
  box-sizing: border-box;
}

/* Dentro de BottomSheet: el sheet ya provee el padding lateral */
.itds-action-buttons--sheet { padding: 0; }
```

```
Reglas (Penpot + CategoryFlow + Storybook):
  ✅ Siempre flex-col · gap 12px · botones w-full
  ✅ Máximo 3 botones: Primary (obligatorio) + Secondary (opcional) + Tertiary (opcional)
  ✅ En BottomSheet: inSheet=true → padding: 0 — el sheet provee el spacing
  ✅ Loading solo en Primary (la acción principal)

❌ No poner gap diferente al de diseño (12px, no 8px)
❌ No usar 2 botones primary en el mismo ActionButtons
```

---

### TextInput — Floating Label

**Penpot:** `column-reverse` flex · Label board (fondo blanco, 12px) "corta" el borde superiror del container · Input Container 52px (LG) / 44px (MD) · borde 1px Neutral.Soft · `border-radius: var(--radius-input)` (8px IT / 999px Arcus).

El label flota cuando hay foco O hay valor. En estado vacío-sin-foco actúa como placeholder visual.

```jsx
const TextInput = ({
  label = '',
  value = '',
  onChange,
  onBlur,
  state = 'default',   // default | error | disabled
  helperText = '',
  size = 'lg',          // lg (52px) | md (44px)
  leadingIcon = null,
  trailingIcon = null,
  type = 'text',
}) => {
  const [isFocused, setIsFocused] = useState(false);
  const isFloating = isFocused || value.length > 0;

  return (
    <div className={`itds-text-input itds-text-input--${size} itds-text-input--${state}`}>
      <div className="itds-text-input__wrapper">
        {label && (
          <label className={[
            'itds-text-input__label',
            isFloating ? 'itds-text-input__label--float' : '',
            leadingIcon && !isFloating ? 'itds-text-input__label--with-icon' : '',
          ].filter(Boolean).join(' ')}>
            {label}
          </label>
        )}
        <div className={`itds-text-input__container${isFocused ? ' itds-text-input__container--focused' : ''}`}>
          {leadingIcon && (
            <span className="material-icons itds-text-input__icon" aria-hidden="true">{leadingIcon}</span>
          )}
          <input
            className="itds-text-input__field"
            type={type}
            value={value}
            onChange={onChange}
            onFocus={() => setIsFocused(true)}
            onBlur={(e) => { setIsFocused(false); onBlur?.(e); }}
            disabled={state === 'disabled'}
            aria-invalid={state === 'error'}
            placeholder={isFloating ? '' : ''}
          />
          {trailingIcon && (
            <span className="material-icons itds-text-input__icon" aria-hidden="true">{trailingIcon}</span>
          )}
        </div>
      </div>
      {helperText && (
        <span className="itds-text-input__helper">{helperText}</span>
      )}
    </div>
  );
};
```

```css
/* ── Wrapper ── */
.itds-text-input {
  display: flex;
  flex-direction: column;
  gap: 4px;
  width: 100%;
}

.itds-text-input__wrapper {
  position: relative;   /* contexto para el label flotante */
}

/* ── Floating label ── */
.itds-text-input__label {
  position: absolute;
  left: 12px;
  top: 50%;
  transform: translateY(-50%);
  font-size: var(--text-base);      /* 16px — tamaño placeholder */
  font-weight: var(--weight-medium);
  color: var(--color-neutral-default);
  background: transparent;
  padding: 0 2px;
  pointer-events: none;
  transition: top 200ms ease, font-size 200ms ease, background-color 200ms ease;
  z-index: 1;
  white-space: nowrap;
}

.itds-text-input__label--float {
  top: 0;
  transform: translateY(-50%);      /* sube: la mitad de su altura queda fuera del borde */
  font-size: var(--text-xs);        /* 12px — reducido al flotar */
  background: var(--color-neutral-white); /* corta el borde visualmente */
}

/* ── Input Container ── */
.itds-text-input__container {
  display: flex;
  align-items: center;
  gap: 4px;
  height: 52px;                     /* Size=LG */
  padding: 0 12px;
  border: 1px solid var(--color-neutral-soft);   /* #94a3b8 IT / #a6a6a6 Arcus */
  border-radius: var(--radius-input);            /* 8px IT / 999px Arcus */
  background: var(--color-neutral-white);
  box-sizing: border-box;
  transition: border-color 200ms ease;
}

.itds-text-input__container--focused {
  border-color: var(--color-theme-primary);
}

.itds-text-input__field {
  flex: 1;
  border: none;
  outline: none;
  background: transparent;
  font-size: var(--text-base);      /* 16px */
  font-weight: var(--weight-medium);
  font-family: var(--font-family);
  color: var(--color-neutral-strongest);
}

/* Icons */
.itds-text-input__icon {
  font-size: 20px;
  color: var(--color-neutral-strongest);
  flex-shrink: 0;
}

/* Label con leading icon: desplaza a la derecha mientras no flota */
.itds-text-input__label--with-icon {
  left: calc(12px + var(--spacing-6) + 4px); /* 12px padding + 24px icon + 4px gap */
}
/* Al flotar siempre vuelve a left: 12px (independiente del icon) */
.itds-text-input__label--float { left: 12px; }

/* Size MD */
.itds-text-input--md .itds-text-input__container { height: 44px; }

/* States */
.itds-text-input--error .itds-text-input__container   { border-color: var(--color-error-default); }
.itds-text-input--error .itds-text-input__label       { color: var(--color-error-default); }
.itds-text-input--disabled                            { opacity: 0.4; pointer-events: none; }

/* Helper */
.itds-text-input__helper {
  font-size: var(--text-xs);
  font-weight: var(--weight-medium);
  color: var(--color-neutral-default);
}
.itds-text-input--error .itds-text-input__helper { color: var(--color-error-default); }
```

```
Estados implementados en React:
  default   → label como placeholder centrado en el campo
  focused   → label flota arriba, borde primary (gestionado por isFocused state)
  filled    → label flota arriba, valor visible (gestionado por value.length > 0)
  error     → borde rojo, label rojo, helper rojo
  disabled  → opacity 0.4, pointer-events none

❌ No usar placeholder HTML — el label flotante es el placeholder visual
✅ label flota cuando: isFocused === true OR value.length > 0
✅ background blanco en el label flotante para "cortar" el borde del container
✅ Transición CSS 200ms en top + font-size para animación suave
```

#### Variante: labelFixed (Arcus / label siempre visible)

**Cuándo usar:** El board Penpot muestra la label siempre visible encima del container — sin animación float, sin placeholder visual. Activar con `labelFixed={true}`.

```jsx
const TextInput = ({
  // ...props existentes
  labelFixed = false,   // true → label estática encima del container (Arcus)
}) => {
  const [isFocused, setIsFocused] = useState(false);
  const isFloating = labelFixed ? true : (isFocused || value.length > 0);

  return (
    <div className={`itds-text-input itds-text-input--${size} itds-text-input--${state}${labelFixed ? ' itds-text-input--fixed' : ''}`}>
      <div className="itds-text-input__wrapper">
        {label && labelFixed ? (
          <label className="itds-text-input__label-fixed">{label}</label>
        ) : label ? (
          <label className={[
            'itds-text-input__label',
            isFloating ? 'itds-text-input__label--float' : '',
            leadingIcon && !isFloating ? 'itds-text-input__label--with-icon' : '',
          ].filter(Boolean).join(' ')}>
            {label}
          </label>
        ) : null}
        <div className={`itds-text-input__container${isFocused ? ' itds-text-input__container--focused' : ''}`}>
          {/* ...resto igual */}
        </div>
      </div>
    </div>
  );
};
```

```css
/* labelFixed: label estática fuera del container — sin position:absolute */
.itds-text-input--fixed .itds-text-input__wrapper {
  display: flex;
  flex-direction: column;
  gap: 4px;
}

.itds-text-input__label-fixed {
  display: block;
  font-size: var(--text-sm);        /* 14px */
  font-weight: var(--weight-medium);
  color: var(--color-neutral-default);
  /* Sin position:absolute — flujo normal del DOM */
}

/* El container no necesita position:relative cuando labelFixed=true */
.itds-text-input--fixed .itds-text-input__wrapper { position: static; }
```

```
✅ Usar labelFixed=true cuando Penpot muestra label fuera y encima del container
✅ Sin isFocused/isFloating logic — sin animación de ningún tipo
✅ label es un <label> estático en flujo normal con gap: 4px sobre el container
❌ No animar ni flotar el label en modo fixed
❌ SelectFixed tampoco tiene estado error por defecto (issue menor pendiente)
```

---

### Select / Single — Combobox con Dropdown

**Storybook verificado 2026-05-12.** Es un combobox filtreable: `input[type=text, role=combobox]`. El valor seleccionado se muestra como `placeholder` del input, no como texto. Dos chevrones SVG separados (expand/collapse), no uno rotado. El dropdown es un Popover con `z-index: 100000`.

**Estados:** `Default` → `Open` (borde primary, label flota, expand_less, filtreable) → `Filled` (valor en placeholder, borde neutral-soft) → `Error` → `Disabled`

```jsx
const Select = ({
  label = '',
  options = [],        // [{ value, label, icon? }]
  value = '',
  onChange,
  state = 'default',  // default | error | disabled
  helperText = '',
  leadingIcon = null,  // JSX del ícono leading (SVG o <span class="material-icons">)
  size = 'md',
}) => {
  const [isOpen, setIsOpen] = useState(false);
  const [filterText, setFilterText] = useState('');
  const isFloating = isOpen || value !== '';
  const isFilled = !isOpen && value !== '';
  const selectedOption = options.find(o => o.value === value);
  const wrapperRef = useRef(null);

  const filteredOptions = filterText
    ? options.filter(o => o.label.toLowerCase().includes(filterText.toLowerCase()))
    : options;

  useEffect(() => {
    const handleClickOutside = (e) => {
      if (wrapperRef.current && !wrapperRef.current.contains(e.target)) {
        setIsOpen(false);
        setFilterText('');
      }
    };
    if (isOpen) document.addEventListener('mousedown', handleClickOutside);
    return () => document.removeEventListener('mousedown', handleClickOutside);
  }, [isOpen]);

  const handleToggle = () => {
    if (state === 'disabled') return;
    setIsOpen(prev => !prev);
    if (!isOpen) setFilterText('');
  };

  const handleInputChange = (e) => {
    setFilterText(e.target.value);
    if (!isOpen) setIsOpen(true);
  };

  const handleSelect = (option) => {
    onChange(option.value);
    setIsOpen(false);
    setFilterText('');
  };

  const containerClasses = [
    'itds-select__container',
    leadingIcon ? 'itds-select__container--with-icon' : '',
    isOpen ? 'itds-select__container--open' : '',
    isFilled ? 'itds-select__container--filled' : '',
  ].filter(Boolean).join(' ');

  return (
    <div
      ref={wrapperRef}
      className={`itds-select itds-select--${size} itds-select--${state}`}
    >
      <div className={containerClasses}>
        {leadingIcon && (
          <span className="itds-select__leading-icon" aria-hidden="true">
            {leadingIcon}
          </span>
        )}

        {/* Valor seleccionado → placeholder; texto de filtro → value */}
        <input
          type="text"
          role="combobox"
          aria-autocomplete="list"
          aria-expanded={isOpen}
          aria-label={label}
          value={isOpen ? filterText : ''}
          placeholder={selectedOption ? selectedOption.label : ''}
          onChange={handleInputChange}
          onClick={handleToggle}
          disabled={state === 'disabled'}
          className="itds-select__input"
          autoComplete="off"
          spellCheck={false}
        />

        {label && (
          <label
            className={[
              'itds-select__label',
              isFloating ? 'itds-select__label--float' : '',
              leadingIcon && !isFloating ? 'itds-select__label--with-icon' : '',
            ].filter(Boolean).join(' ')}
          >
            {label}
          </label>
        )}

        {/* Dos chevrones separados — expand cuando cerrado, collapse cuando abierto */}
        <button
          type="button"
          tabIndex={-1}
          aria-label="Mostrar opciones"
          aria-haspopup="listbox"
          aria-expanded={isOpen}
          onClick={handleToggle}
          className="itds-select__chevron-btn"
        >
          <span className="material-icons" aria-hidden="true">
            {isOpen ? 'expand_less' : 'expand_more'}
          </span>
        </button>
      </div>

      {isOpen && (
        <div className="itds-dropdown" role="listbox" aria-label={label}>
          {filteredOptions.length === 0 ? (
            <div className="itds-dropdown__empty">Sin resultados</div>
          ) : (
            filteredOptions.map(opt => (
              <div
                key={opt.value}
                role="option"
                aria-selected={value === opt.value}
                className={`itds-dropdown__item${value === opt.value ? ' itds-dropdown__item--selected' : ''}`}
                onClick={() => handleSelect(opt)}
              >
                {opt.icon && (
                  <span className="material-icons itds-dropdown__icon" aria-hidden="true">{opt.icon}</span>
                )}
                <span className="itds-dropdown__item-label">{opt.label}</span>
              </div>
            ))
          )}
        </div>
      )}

      {helperText && (
        <span className="itds-select__helper">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true" className="itds-select__helper-icon">
            <path d="M11 15h2v2h-2v-2zm0-8h2v6h-2V7zm.99-5C6.47 2 2 6.48 2 12s4.47 10 9.99 10C17.52 22 22 17.52 22 12S17.52 2 11.99 2zM12 20c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8z"/>
          </svg>
          {helperText}
        </span>
      )}
    </div>
  );
};
```

```css
/* ── Select ── */
.itds-select {
  display: flex;
  flex-direction: column;
  gap: 4px;
  width: 100%;
  position: relative;
}

/* ── Container ── */
.itds-select__container {
  display: flex;
  align-items: center;
  gap: 4px;
  height: 52px;
  padding: 0 12px;
  border: 1px solid var(--color-neutral-soft);
  border-radius: var(--radius-input);
  background: var(--color-neutral-white);
  box-sizing: border-box;
  position: relative;
  transition: border-color 200ms ease;
  cursor: pointer;
}

.itds-select__container--open   { border-color: var(--color-theme-primary); }
.itds-select__container--filled { border-color: var(--color-neutral-soft); }

/* ── Leading icon ── */
.itds-select__leading-icon {
  display: flex;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
  color: var(--color-tonal-default);
  height: var(--spacing-6);
  width: var(--spacing-6);
}

/* ── Combobox input ── */
.itds-select__input {
  flex: 1;
  height: 100%;
  border: none;
  outline: none;
  background: transparent;
  font-family: var(--font-family);
  font-size: var(--text-base);
  font-weight: var(--weight-medium);
  color: var(--color-neutral-pressed);
  cursor: pointer;
  min-width: 0;
}

/* Valor seleccionado aparece como placeholder */
.itds-select__input::placeholder { color: var(--color-neutral-pressed); }
.itds-select__input:disabled { cursor: not-allowed; }

/* ── Floating label ── */
.itds-select__label {
  position: absolute;
  left: 12px;
  top: 50%;
  transform: translateY(-50%);
  font-size: var(--text-base);
  font-weight: var(--weight-medium);
  color: var(--color-neutral-default);
  background: transparent;
  padding: 0 2px;
  pointer-events: none;
  transition: top 200ms ease, font-size 200ms ease, left 200ms ease, background-color 200ms ease;
  z-index: 1;
  white-space: nowrap;
  max-width: 90%;
  overflow: hidden;
  text-overflow: ellipsis;
}

/* Con leading icon: label se desplaza a la derecha */
.itds-select__label--with-icon {
  left: calc(12px + var(--spacing-6) + 4px);
}

/* Flotado: vuelve a left:12px independientemente del icon */
.itds-select__label--float {
  top: 0;
  transform: translateY(-50%);
  font-size: var(--text-xs);
  background: var(--color-neutral-white);
  left: 12px;
}

/* ── Chevron button ── */
.itds-select__chevron-btn {
  display: flex;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
  border: none;
  background: transparent;
  cursor: pointer;
  padding: 0;
  color: var(--color-neutral-strongest);
  font-size: 20px;
}

/* ── Dropdown panel (Popover) ── */
.itds-dropdown {
  position: absolute;
  top: calc(100% + 4px);
  left: 0;
  right: 0;
  z-index: 100000;
  background: var(--color-neutral-white);
  border-radius: var(--radius-box);  /* 8px — siempre, independiente de radius-input */
  box-shadow: var(--shadow-down-l);
  padding: 8px;
  display: flex;
  flex-direction: column;
  gap: 4px;
  max-height: 80dvh;
  overflow-y: auto;
  scrollbar-width: thin;
  scrollbar-color: var(--color-neutral-softer) transparent;
}

.itds-dropdown__item {
  display: flex;
  align-items: center;
  gap: 8px;
  padding: 8px 12px;
  border-radius: var(--radius-box);
  font-family: var(--font-family);
  font-size: var(--text-base);
  font-weight: var(--weight-medium);
  color: var(--color-neutral-default);
  cursor: pointer;
  width: 100%;
  box-sizing: border-box;
  transition: background-color 150ms ease;
}

.itds-dropdown__item:hover      { background-color: var(--color-tonal-default); }
.itds-dropdown__item--selected  {
  background-color: var(--color-theme-softest);
  color: var(--color-theme-primary);
  font-weight: var(--weight-bold);
}

.itds-dropdown__item-label { flex: 1; }
.itds-dropdown__icon       { font-size: 20px; flex-shrink: 0; }
.itds-dropdown__empty {
  padding: 8px 12px;
  color: var(--color-neutral-default);
  font-size: var(--text-sm);
  text-align: center;
}

/* ── States ── */
.itds-select--error .itds-select__container { border-color: var(--color-error-default); }
.itds-select--error .itds-select__label     { color: var(--color-error-default); }
.itds-select--error .itds-select__helper    { color: var(--color-error-default); }
.itds-select--disabled                       { opacity: 0.4; pointer-events: none; }
.itds-select--sm .itds-select__container    { height: 40px; }

/* ── Helper text ── */
.itds-select__helper {
  display: flex;
  align-items: center;
  gap: 4px;
  font-size: var(--text-xs);
  font-weight: var(--weight-medium);
  color: var(--color-neutral-default);
}

.itds-select__helper-icon {
  width: 14px;
  height: 14px;
  min-width: 14px;
  flex-shrink: 0;
}
```

```
Estados del Select (verificado en Storybook 2026-05-12):
  default  → label como placeholder centrado · sin valor · dropdown cerrado
  open     → borde primary · label flota · expand_less · filtreable por texto
  filled   → label flota · valor como placeholder del input · borde neutral-soft
  error    → borde rojo · label rojo · helper rojo
  disabled → opacity 0.4 · pointer-events none

✅ Combobox filtreable: input[type=text, role=combobox, aria-autocomplete=list]
✅ Valor seleccionado = placeholder del input (value="" cuando cerrado)
✅ Dos SVGs separados (expand_more / expand_less) — NO un chevron rotado
✅ Clase --filled en container → activa label flotante y borde neutral-soft
✅ Helper text con ícono info SVG adelante
✅ Leading icon opcional — label desplaza a la derecha y vuelve al flotar
✅ Dropdown z-index: 100000 (es un Popover posicionado fuera del componente)
✅ Dropdown: border-radius 8px SIEMPRE · shadow-down-l · max-height 80dvh
✅ Al cerrar sin seleccionar: filterText se limpia

❌ No usar <select> nativo
❌ No mostrar valor en <span> — va como placeholder del input
❌ No rotar un solo chevron — usar expand_more / expand_less según estado
❌ No z-index: 50 — el dropdown va a z-index: 100000
```

---

### NavbarMobile

```jsx
const NavbarMobile = ({ title = '', onBack, showBack = false, actions = [] }) => (
  <nav className="itds-navbar-mobile">
    <div className="itds-navbar-mobile__left">
      {showBack && (
        <button className="itds-navbar-mobile__back" onClick={onBack} aria-label="Volver">
          ‹
        </button>
      )}
    </div>
    <h1 className="itds-navbar-mobile__title">{title}</h1>
    <div className="itds-navbar-mobile__actions">
      {actions.map((action, i) => (
        <button key={i} className="itds-navbar-mobile__action" onClick={action.onClick} aria-label={action.label}>
          {action.icon}
        </button>
      ))}
    </div>
  </nav>
);
```

```css
.itds-navbar-mobile {
  display: flex;
  align-items: center;
  justify-content: space-between;
  width: 100%;
  height: 56px;
  padding: 0 var(--spacing-4);
  background: var(--color-screen-base);
  border-bottom: 1px solid var(--color-neutral-softer);
  box-sizing: border-box;
}

.itds-navbar-mobile__title {
  font-size: var(--text-xl);
  font-weight: 700;
  color: var(--color-neutral-strongest);
  margin: 0;
  font-family: var(--font-family); /* DM Sans */
}

.itds-navbar-mobile__back,
.itds-navbar-mobile__action {
  background: none;
  border: none;
  cursor: pointer;
  color: var(--color-theme-primary);
  font-size: var(--text-xl);
  padding: var(--spacing-1);
}
```

---

### Card

```jsx
const Card = ({ title = '', description = '', children, onClick }) => (
  <div
    className="itds-card"
    onClick={onClick}
    role={onClick ? 'button' : undefined}
    tabIndex={onClick ? 0 : undefined}
  >
    {title && <h2 className="itds-card__title">{title}</h2>}
    {description && <p className="itds-card__description">{description}</p>}
    {children}
  </div>
);
```

```css
.itds-card {
  width: 100%;
  padding: var(--spacing-4);
  background: var(--color-screen-base);
  border-radius: var(--radius-box);
  border: 1px solid var(--color-neutral-softer);
  box-sizing: border-box;
  display: flex;
  flex-direction: column;
  gap: var(--spacing-2);
}

.itds-card__title {
  font-size: var(--text-base);
  font-weight: 700;
  color: var(--color-neutral-strongest);
  margin: 0;
  font-family: var(--font-family); /* DM Sans */
}

.itds-card__description {
  font-size: var(--text-sm);
  color: var(--color-neutral-default);
  margin: 0;
  font-family: var(--font-family); /* DM Sans */
}
```

---

### Badge

**Penpot:** `Badge / Gray · Blue · Red · Notifications · Theme · Disabled` · Sizes L/M/S · Prop `Indeterminate` (dot sin texto).
**Storybook verificado 2026-05-12.** Computed: height 20px · padding 2px 4px · font 12px · border-radius 9999px.

```jsx
const Badge = ({
  label = '',          // número o texto — vacío si variant=dot
  variant = 'theme',  // theme | gray | neutral | notifications | blue | red | disabled
  size = 'md',        // sm | md | lg
  dot = false,        // true → solo punto sin texto (Indeterminate: true en Penpot)
}) => (
  <span className={[
    'itds-badge',
    `itds-badge--${variant}`,
    `itds-badge--${size}`,
    dot ? 'itds-badge--dot' : '',
  ].filter(Boolean).join(' ')}>
    {!dot && label}
  </span>
);
```

```css
/* ── Badge base ── */
.itds-badge {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  padding: 2px 4px;
  border-radius: 9999px;
  font-family: var(--font-family);
  font-size: var(--text-xs);     /* 12px */
  font-weight: var(--weight-medium);
  line-height: 16px;
  white-space: nowrap;
  box-sizing: border-box;
  min-width: 20px;
  height: 20px;
}

/* ── Variantes de color ── */
/* Theme (Penpot: #2563eb · Storybook: bg-theme-accent) */
.itds-badge--theme        { background: var(--color-theme-primary); color: var(--color-neutral-white); }

/* Gray (Penpot: #f1f5f9 bg · #475569 text) */
.itds-badge--gray         { background: var(--color-neutral-softest); color: var(--color-neutral-default); }

/* Neutral — igual que Gray, alias usado en Tabs inactivos */
.itds-badge--neutral      { background: var(--color-tonal-default); color: var(--color-neutral-default); }

/* Notifications (Penpot: #dc2626 · con stroke) */
.itds-badge--notifications {
  background: var(--color-error-default);
  color: var(--color-neutral-white);
  outline: 2px solid var(--color-neutral-white);
  outline-offset: -1px;
}

/* Blue / Info */
.itds-badge--blue         { background: var(--color-info-softest); color: var(--color-info-stronger); }

/* Red / Error */
.itds-badge--red          { background: var(--color-error-softest); color: var(--color-error-stronger); }

/* Disabled */
.itds-badge--disabled     { background: var(--color-neutral-softest); color: var(--color-neutral-disabled); opacity: 0.4; }

/* ── Sizes ── */
.itds-badge--sm { height: 16px; min-width: 16px; padding: 1px 3px; font-size: 10px; line-height: 14px; }
/* md = default = 20px (Storybook computed) */
.itds-badge--lg { height: 24px; min-width: 24px; padding: 3px 6px; font-size: var(--text-sm); line-height: 18px; }

/* ── Dot / Indeterminate ── */
.itds-badge--dot {
  width: 8px;
  height: 8px;
  min-width: 8px;
  padding: 0;
  font-size: 0;
}
```

```
Variantes de Badge en Penpot:
  theme         → --color-theme-primary bg · blanco texto  (más frecuente)
  gray          → --color-neutral-softest bg · neutral-default texto
  neutral       → --color-tonal-default bg · neutral-default texto  (alias de gray, usado en Tabs inactivos)
  notifications → --color-error-default bg · blanco · outline 2px white
  blue          → --color-info-softest bg · info-stronger texto
  red           → --color-error-softest bg · error-stronger texto
  disabled      → neutral-softest bg · opacity 0.4

⚠️ DIFERENCIA ARCUS — Badge / Theme usa Theme.Accent, no Theme.Primary:
  IT    → badge--theme: bg #2563EB (Blue) · color #FFFFFF
  Arcus → badge--theme: bg #2CDFA6 (Shamrock) · color #1D1D1D (texto oscuro)

  CSS override requerido en components.css:
  [data-theme="arcus"] .itds-badge--theme {
    background-color: var(--color-theme-accent);   /* #2CDFA6 */
    color: var(--color-neutral-strongest);          /* #1D1D1D */
  }

  Aplica en TODAS las vistas donde aparece badge--theme:
  · NavListItem trailing (contador de items por categoría)
  · BottomSheet headline (badge de cantidad)
  · Tabs activo (badge de tareas pendientes)

Prop Indeterminate (Penpot) = prop dot (React):
  dot=false → muestra label (número o texto)
  dot=true  → 8×8px punto sin texto

✅ Usar itds-badge--neutral en tab inactivo, itds-badge--theme en tab activo
✅ Usar itds-badge--notifications para contadores sobre íconos (NavbarMobile, ActionIcon)
✅ Siempre border-radius: 9999px — nunca rectangulares
❌ No usar para etiquetas de categoría → usar Tag en su lugar
❌ Arcus: NO usar bg negro (Theme.Primary) para badge--theme — usar Shamrock (Theme.Accent)
```

---

### BottomNavigation

```jsx
const BottomNavigation = ({ items = [], activeItem = '' }) => (
  <nav className="itds-bottom-nav">
    {items.map((item) => (
      <button
        key={item.id}
        className={`itds-bottom-nav__item ${activeItem === item.id ? 'itds-bottom-nav__item--active' : ''}`}
        onClick={item.onClick}
        aria-label={item.label}
        aria-current={activeItem === item.id ? 'page' : undefined}
      >
        <span className="itds-bottom-nav__icon">{item.icon}</span>
        <span className="itds-bottom-nav__label">{item.label}</span>
      </button>
    ))}
  </nav>
);
```

```css
.itds-bottom-nav {
  display: flex;
  width: 100%;
  height: 64px;
  background: var(--color-screen-base);
  border-top: 1px solid var(--color-neutral-softer);
  align-items: center;
  justify-content: space-around;
  box-sizing: border-box;
}

.itds-bottom-nav__item {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: var(--spacing-1);
  background: none;
  border: none;
  cursor: pointer;
  color: var(--color-neutral-soft);
  font-family: var(--font-family); /* DM Sans */
  flex: 1;
  padding: var(--spacing-2) 0;
}

.itds-bottom-nav__item--active {
  color: var(--color-theme-primary);
}

.itds-bottom-nav__icon { font-size: var(--text-xl); }
.itds-bottom-nav__label { font-size: var(--text-xs); font-weight: 500; }
```

---

## Layout principal — pantalla completa

**Regla absoluta:** Usar flex layout — nunca `position: sticky/fixed` en footer ni `padding-bottom` de compensación.

```jsx
const ScreenLayout = ({ header, body, footer }) => (
  <div className="itds-screen">
    {header && <header className="itds-screen__header">{header}</header>}
    <main className="itds-screen__body">{body}</main>
    {footer && <footer className="itds-screen__footer">{footer}</footer>}
  </div>
);
```

```css
/* El flow wrapper y la pantalla deben ser height:100% para que el footer quede natural al fondo */
.itds-flow {
  position: relative;   /* contexto para overlays position:absolute */
  width: 100%;
  height: 100%;
}

.itds-screen {
  display: flex;
  flex-direction: column;
  height: 100%;              /* ← OBLIGATORIO: no usar min-height */
  background-color: var(--color-neutral-white);
}

.itds-screen__header {
  width: 100%;
  flex-shrink: 0;            /* header nunca se comprime */
  position: sticky;
  top: 0;
  z-index: 10;
  background-color: var(--color-neutral-white);
}

.itds-screen__body {
  flex: 1;                   /* ← body llena el espacio disponible */
  overflow-y: auto;          /* scroll interno del body */
  width: 100%;
  padding: var(--spacing-4);
  display: flex;
  flex-direction: column;
  gap: var(--spacing-4);
  background-color: var(--color-neutral-white);
}

.itds-screen__footer {
  flex-shrink: 0;            /* ← footer siempre al fondo, sin position:sticky */
  width: 100%;
  background-color: var(--color-neutral-white);
}
```

❌ `position: sticky` en footer → footer nunca queda anclado si el body desborda
❌ `position: fixed` en footer → escapa del mockup frame
❌ `padding-bottom` de compensación → frágil, rompe con distintos contenidos
✅ `height: 100%` en screen + `flex: 1` en body + `flex-shrink: 0` en footer

---

## PageHeader / Default (mobile)

**Estructura Penpot confirmada por y-coordinates:** `Content` (action icons) está físicamente ARRIBA (menor y), `Headline` (título/saludo) está ABAJO (mayor y). Orden DOM debe reflejar el orden visual.

```jsx
const PageHeader = ({ onBack, title, subtitle, rightIcon = 'tune' }) => (
  <header className="itds-screen__header">
    <div className="itds-page-header">
      {/* NAV PRIMERO (action icons arriba) */}
      <nav className="itds-page-header__navbar">
        <button className="itds-action-icon" onClick={onBack} aria-label="Volver">
          <Icon name="arrow_back" />
        </button>
        <div className="itds-page-header__navbar-right">
          <button className="itds-action-icon" aria-label="Acción">
            <Icon name={rightIcon} />
          </button>
        </div>
      </nav>
      {/* HEADLINE DESPUÉS (título/saludo abajo) */}
      <div className="itds-page-header__headline">
        <h1 className="itds-page-header__title">{title}</h1>
        {subtitle && <p className="itds-page-header__subtitle">{subtitle}</p>}
      </div>
    </div>
  </header>
);
```

```css
.itds-page-header {
  display: flex;
  flex-direction: column;   /* column: navbar primero (top), headline segundo (below) */
  gap: var(--spacing-2);
  padding: var(--spacing-4);
}

.itds-page-header__navbar {
  display: flex;
  align-items: center;
  justify-content: space-between;
  min-height: 40px;
}
```

Si la pantalla no tiene back button (ej. 01-Home), poner `<div />` en el lado izquierdo del navbar para mantener el layout `space-between`.

---

## Card / CardFeature / SideImage_Size=MD

**Dimensiones exactas de Penpot:** Card 343×127px · Image `rectangle` 88×88px (fijo, no estira) · gap 16px · padding 16px.

```jsx
<button className="itds-card-feature" onClick={onClick}>
  <div className="itds-card-feature__image" style={{ backgroundColor: color }}>
    <span className="material-symbols-rounded" aria-hidden="true">image</span>
  </div>
  <div className="itds-card-feature__content">
    <div className="itds-card-feature__text">
      <span className="itds-card-feature__title">{title}</span>
      <span className="itds-card-feature__subtitle">{subtitle}</span>
    </div>
    <span className="itds-action-icon" aria-hidden="true">
      <Icon name="chevron_right" />
    </span>
  </div>
</button>
```

```css
.itds-card-feature {
  display: flex;
  align-items: flex-start;   /* ← NO usar stretch (la imagen no rellena el alto total) */
  width: 100%;
  padding: var(--spacing-4); /* 16px en la tarjeta, NO en los hijos */
  gap: var(--spacing-4);
  border-radius: var(--radius-box);
  overflow: hidden;
  box-shadow: var(--shadow-down-s);
  background-color: var(--color-neutral-white);
  border: none;
  cursor: pointer;
}

.itds-card-feature__image {
  width: 88px;
  height: 88px;              /* ← FIJO: nunca min-height ni sin height */
  flex-shrink: 0;
  border-radius: var(--radius-md);
  display: flex;
  align-items: center;
  justify-content: center;
}

.itds-card-feature__content {
  flex: 1;
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: var(--spacing-3);
  align-self: stretch;       /* content sí puede estirarse al alto del card */
}
```

❌ `min-height` en la imagen → se estira al alto total del card (127px en vez de 88px)
❌ padding en `.itds-card-feature__content` → doble padding (el card ya tiene 16px)
✅ `height: 88px` fijo + `align-items: flex-start` en el card

---

## Tabs / Default Box (mobile)

**Regla:** En mobile, Tabs siempre implementa:
1. Variante Box: cada tab es un contenedor con borde completo (no solo border-bottom)
2. Swipe horizontal con `touchstart` / `touchend` (`deltaX > 50px`)
3. Todos los elementos visibles en estado inactivo (icon + label + badge)

```jsx
const TABS = [
  { id: 0, label: 'Tareas', icon: 'content_paste', badge: '12' },
  { id: 1, label: 'Otro',   icon: 'construction',  badge: null },
];

const TabsComponent = ({ activeTab, setActiveTab, panels }) => {
  const touchStartX = useRef(null);

  const handleTouchStart = (e) => { touchStartX.current = e.touches[0].clientX; };
  const handleTouchEnd = (e) => {
    if (touchStartX.current === null) return;
    const delta = e.changedTouches[0].clientX - touchStartX.current;
    if (delta < -50 && activeTab < TABS.length - 1) setActiveTab(t => t + 1);
    if (delta >  50 && activeTab > 0)               setActiveTab(t => t - 1);
    touchStartX.current = null;
  };

  return (
    <div className="itds-tabs">
      <div className="itds-tabs__nav" role="tablist">
        {TABS.map(tab => (
          <button
            key={tab.id}
            className={`itds-tab${activeTab === tab.id ? ' itds-tab--active' : ''}`}
            onClick={() => setActiveTab(tab.id)}
            role="tab"
            aria-selected={activeTab === tab.id}
          >
            <Icon name={tab.icon} />
            <span className="itds-tab__badge-row">
              {tab.label}
              {tab.badge && (
                <span className={`itds-badge ${activeTab === tab.id ? 'itds-badge--theme' : 'itds-badge--neutral'}`}>
                  {tab.badge}
                </span>
              )}
            </span>
          </button>
        ))}
      </div>
      <div className="itds-tabs__content-wrapper" onTouchStart={handleTouchStart} onTouchEnd={handleTouchEnd}>
        <div className="itds-tabs__content-track" style={{ transform: `translateX(calc(-${activeTab} * ${100/TABS.length}%))` }}>
          {panels.map((panel, i) => (
            <div key={i} className="itds-tabs__panel" role="tabpanel">{panel}</div>
          ))}
        </div>
      </div>
    </div>
  );
};
```

```css
.itds-tabs__nav {
  display: flex;
  overflow-x: auto;
  scrollbar-width: none;
  padding: var(--spacing-2) var(--spacing-4);
  gap: var(--spacing-2);
  flex-shrink: 0;
  /* ← sin border-bottom: el Box variant NO tiene línea divisoria */
}

.itds-tab {
  display: inline-flex;
  align-items: center;
  gap: var(--spacing-2);
  padding: 0 var(--spacing-3);
  height: 40px;
  white-space: nowrap;
  flex-shrink: 0;
  background: transparent;
  border: 1px solid #94a3b8;        /* Neutral.Soft — estado inactivo */
  border-radius: var(--radius-button);
  cursor: pointer;
  font-size: var(--text-sm);
  font-weight: var(--weight-medium);
  color: var(--color-neutral-default);
  transition: color 200ms ease, border-color 200ms ease, background-color 200ms ease;
}

.itds-tab--active {
  color: var(--color-theme-primary);
  border-color: var(--color-theme-primary);  /* #2563eb */
  background-color: var(--color-theme-softest);
  font-weight: var(--weight-bold);
}

/* Badge inactivo: gris · Badge activo: azul */
.itds-badge--neutral {
  background-color: var(--color-tonal-default);
  color: var(--color-neutral-default);
}

/* Track de swipe */
.itds-tabs__content-wrapper { overflow: hidden; flex: 1; }
.itds-tabs__content-track {
  display: flex;
  width: calc(100% * N); /* N = número de tabs */
  transition: transform 300ms ease;
  will-change: transform;
}
.itds-tabs__panel {
  width: calc(100% / N);
  flex-shrink: 0;
  overflow-y: auto;
}
```

❌ `border-bottom: 2px` → variante underline, no Box
❌ Mostrar badge solo en tab activo → todos los tabs con badge deben mostrarlo siempre
❌ `background-color: var(--color-theme-softest)` en tab activo → Penpot confirma fills:[] (transparente)
✅ `border: 1px solid` completo en cada tab (Box variant)
✅ Tab activo: solo cambian border-color y color (texto/ícono) → background siempre transparent
✅ Badge usa `itds-badge--theme` (activo) / `itds-badge--neutral` (inactivo)
✅ Swipe SIEMPRE en mobile para Tabs

---

## BottomSheet

**Estructura Penpot confirmada por x/y-coordinates:**
- `icon/close` x=right, y=top → arriba a la derecha (primer hijo, `align-self: flex-end`)
- `[Text]` (title+subtitle) x=left → a la izquierda
- `[Badge]` x=right, misma x que close → a la derecha del título
- El overlay DEBE usar `ReactDOM.createPortal` para cubrir el status bar

```jsx
/* Portal para cubrir frame completo incluyendo status bar */
const OverlayPortal = ({ children }) => {
  const el = useMemo(() => document.getElementById('overlay-root'), []);
  if (!el) return null;
  return ReactDOM.createPortal(children, el);
};

/* En el HTML del mockup: agregar dentro de .mockup__frame */
// <div id="overlay-root"></div>
// CSS: #overlay-root { position: absolute; inset: 0; z-index: 50; pointer-events: none; }

const BottomSheet = ({ onApprove, onCancel, isClosing }) => (
  <div className={`itds-overlay${isClosing ? ' itds-overlay--closing' : ''}`} role="dialog">
    <div className="itds-overlay__backdrop" onClick={onCancel} />
    <div className={`itds-bottomsheet${isClosing ? ' itds-bottomsheet--closing' : ''}`}>
      <div className="itds-bottomsheet__handle" />

      {/* Headline: close arriba-derecha · título izq + badge der · subtitle abajo */}
      <div className="itds-bs-headline">
        <button className="itds-action-icon itds-bs-close" onClick={onCancel} aria-label="Cerrar">
          <Icon name="close" />
        </button>
        <div className="itds-bs-title-section">
          <div className="itds-bs-text-group">
            <h2 className="itds-bs-title">Título del sheet</h2>
            <p className="itds-bs-subtitle">Subtítulo del sheet</p>
          </div>
          <span className="itds-badge itds-badge--theme">1</span>
        </div>
      </div>

      {/* Body content */}
      {/* ... */}

      {/* Action Buttons — sin padding propio, el sheet ya provee 16px */}
      <div className="itds-action-buttons itds-action-buttons--sheet">
        <button className="itds-button itds-button--primary" onClick={onApprove}>Aprobar</button>
        <button className="itds-button itds-button--secondary" onClick={onCancel}>Cancelar</button>
      </div>
    </div>
  </div>
);

/* Uso en el flow root */
{showBottomSheet && (
  <OverlayPortal>
    <BottomSheet onApprove={...} onCancel={...} isClosing={isClosingSheet} />
  </OverlayPortal>
)}
```

```css
.itds-overlay {
  position: absolute;
  inset: 0;
  z-index: 100;
  display: flex;
  flex-direction: column;
  justify-content: flex-end;
  pointer-events: auto;      /* necesario cuando el portal root tiene pointer-events:none */
  animation: overlay-in 200ms ease forwards;
}

.itds-bottomsheet {
  position: relative;
  z-index: 1;
  background-color: var(--color-neutral-white);
  border-radius: var(--radius-2xl) var(--radius-2xl) 0 0;
  box-shadow: var(--shadow-sheet);
  display: flex;
  flex-direction: column;
  gap: var(--spacing-4);
  padding: var(--spacing-3) var(--spacing-4) var(--spacing-4);
}

/* Headline */
.itds-bs-headline {
  display: flex;
  flex-direction: column;
  gap: var(--spacing-2);
}
.itds-bs-close        { align-self: flex-end; }       /* close queda arriba-derecha */
.itds-bs-title-section { display: flex; align-items: flex-start; gap: var(--spacing-2); }
.itds-bs-text-group    { flex: 1; display: flex; flex-direction: column; gap: 4px; }
.itds-bs-title    { font-size: var(--text-2xl); font-weight: var(--weight-bold); color: var(--color-neutral-strongest); line-height: 1.25; }
.itds-bs-subtitle { font-size: var(--text-base); font-weight: var(--weight-medium); color: #64748b; }

/* Action buttons en sheet — sin padding, el bottomsheet ya provee 16px laterales */
.itds-action-buttons--sheet { padding: 0; background-color: transparent; }
```

❌ `position: absolute; inset: 0` en `.itds-overlay` sin portal → no cubre status bar
❌ Badge a la izquierda del título → Badge va a la derecha (confirmado por Penpot x-pos)
❌ Close icon al lado del título → Close va ARRIBA de badge+title (confirmado por Penpot y-pos)
❌ Padding en `.itds-action-buttons--sheet` → doble padding (el bottomsheet ya tiene 16px)
✅ Usar `ReactDOM.createPortal` hacia `#overlay-root` dentro de `.mockup__frame`
✅ `pointer-events: auto` en `.itds-overlay` cuando el portal root tiene `pointer-events: none`

---

## ProductFile — inputs

**Estructura Penpot:** 4 inputs apilados verticalmente (columna única). Cada input es un row horizontal: label izquierda (gris) + valor derecha (oscuro).

```jsx
<div className="itds-product-info__grid">
  {[
    { label: 'Input 1', value: '0000000' },
    { label: 'Input 2', value: '0000000' },
    { label: 'Input 3', value: '0000000' },
    { label: 'Input 4', value: '0000000' },
  ].map(input => (
    <div key={input.label} className="itds-product-info__field">
      <span className="itds-product-info__label">{input.label}</span>
      <span className="itds-product-info__value">{input.value}</span>
    </div>
  ))}
</div>
```

```css
.itds-product-info__grid {
  display: flex;
  flex-direction: column;    /* ← columna única, NO grid de 2 columnas */
  gap: var(--spacing-2);
}

.itds-product-info__field {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
}

.itds-product-info__label {
  font-size: var(--text-sm);  /* 14px */
  font-weight: var(--weight-medium);
  color: #94a3b8;             /* Neutral.Soft — label gris */
}

.itds-product-info__value {
  font-size: var(--text-sm);  /* 14px */
  font-weight: var(--weight-bold);
  color: var(--color-neutral-strongest);  /* #0f172a — valor oscuro */
}
```

❌ `grid-template-columns: 1fr 1fr` → inputs en 2 columnas (incorrecto)
❌ `justify-content: space-between` en .field → separa label y valor a extremos opuestos (incorrecto)
✅ `display: flex; flex-direction: column` → inputs apilados verticalmente
✅ `.itds-product-info__field`: justify-content flex-start + gap 4px → label y valor pegados (Penpot: 4px entre ellos)

---

## Alert — floating

**Penpot:** fill `#dcfce7` + stroke `#16803c 1px`. Texto en una sola línea. Posición: `absolute top:16px left:16px right:16px`.

```jsx
<div className={`itds-alert itds-alert--success itds-alert--floating${visible ? '' : ' itds-alert--hidden'}`} role="alert">
  <Icon name="check_circle" className="itds-alert__icon" />
  <span className="itds-alert__title">Producto aprobado</span>
  <button className="itds-alert__close" aria-label="Cerrar alerta">
    <Icon name="close" className="itds-alert__close-icon" />
  </button>
</div>
```

```css
.itds-alert--floating {
  position: absolute;
  top: var(--spacing-4);     /* 16px desde el top del contenedor */
  left: var(--spacing-4);
  right: var(--spacing-4);
  z-index: 200;
  box-shadow: var(--shadow-down-m);
}

.itds-alert--success {
  background-color: var(--color-success-softest);  /* #dcfce7 */
  border: 1px solid var(--color-success-default);  /* #16803c */
}

.itds-alert__title {
  flex: 1;
  font-size: var(--text-base);   /* 16px */
  font-weight: var(--weight-bold);
  color: var(--color-success-default);
  white-space: nowrap;           /* ← una sola línea, siempre */
  overflow: hidden;
  text-overflow: ellipsis;
}

.itds-alert--hidden {
  opacity: 0;
  transform: translateY(-8px);
  pointer-events: none;
}
```

✅ Texto corto (ej. "Producto aprobado") + `white-space: nowrap` garantiza línea única
✅ `border: 1px solid` confirmado por Penpot strokes

---

---

### Rating

**Verificado MCP 2026-05-13.** Componente de valoración con estrellas. 7 colores × 3 sizes. Sin componentProperties — seleccionar por path + name.

#### Estructura Penpot (confirmada MCP)

| Elemento | Size=L | Size=M | Size=S |
|---|---|---|---|
| Hit area (Items) | 48×48px | 40×40px | 30×30px |
| Estrella SVG | 24×24px | 20×20px | 14×14px |
| Vector path interno | 17×16px | 14×14px | 10×10px |
| Hover bg Rectangle | 48×48 · r=0 · #f1f5f9 | 40×40 · r=0 | 30×30 · r=0 |

**Íconos:** Material Symbols Rounded — `star` (fill) + `star_border` (outline). Excepción acordada al patrón SVG custom de Penpot — visualmente equivalente y más simple de mantener.

**Estrella inactiva:** `#475569` (Neutral.Default Lynch) — igual para todos los colores.

**Colores activos verificados (token → hex IT):**

| Variante Penpot | CSS var | Hex IT |
|---|---|---|
| `Star_theme` | `--color-theme-primary` | `#2563EB` |
| `Star_blue` | `--color-theme-primary` | `#2563EB` |
| `Star_yellow` | `--itds-rating-color` | `#FBBF24` (Yellow.400) |
| `Star_green` | `--color-success-default` | `#16A34A` |
| `Star_grey` | `--color-neutral-strong` | `#64748B` |
| `Star_purple` | `--color-accent-default` | token |
| `Star_red` | `--color-error-default` | `#EF4444` |

> ⚠️ El MCP retorna `#2563EB` para todas las variantes activas porque los fills usan tokens de librería. El color real se controla vía `--itds-rating-color` por variante CSS.

#### Penpot paths (sin componentProperties)

```
Rating / Size=L    → name: 'Theme' | 'Yellow' | 'Blue' | 'Green' | 'Grey' | 'Purple' | 'Red'
Rating / Size=M    → igual
Rating / Size=S    → igual
Rating / Utilities / Items      → name: 'Size=L' | 'Size=M' | 'Size=S'  (hit area individual)
Rating / Utilities / Active     → por size y color: name='Star_theme', 'Star_yellow', etc.
Rating / Utilities / Inactive   → name: 'Star_blue' (color único — inactivo siempre gris azulado)
```

#### CDN requerido

```html
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded" rel="stylesheet">
```

#### Implementación React

```jsx
const Rating = ({
  value = 0,
  max = 5,
  color = 'theme',   // theme | yellow | blue | green | grey | purple | red
  size = 'md',       // sm (30px hit) | md (40px hit) | lg (48px hit)
  readOnly = false,
  onChange,
}) => {
  const [hovered, setHovered] = useState(null);
  const display = hovered ?? value;

  return (
    <div
      className={`itds-rating itds-rating--${color} itds-rating--${size}`}
      role={readOnly ? 'img' : 'radiogroup'}
      aria-label={`${value} de ${max} estrellas`}
    >
      {Array.from({ length: max }, (_, i) => {
        const active = i < display;
        return (
          <button
            key={i}
            type="button"
            className={`itds-rating__item${active ? ' itds-rating__item--active' : ''}`}
            onClick={() => !readOnly && onChange?.(i + 1)}
            onMouseEnter={() => !readOnly && setHovered(i + 1)}
            onMouseLeave={() => !readOnly && setHovered(null)}
            aria-label={`${i + 1} estrella${i !== 0 ? 's' : ''}`}
            disabled={readOnly}
          >
            <span className="material-symbols-rounded itds-rating__icon" aria-hidden="true">
              {active ? 'star' : 'star_border'}
            </span>
          </button>
        );
      })}
    </div>
  );
};
```

```css
/* ── Contenedor ── */
.itds-rating {
  display: inline-flex;
  align-items: center;
  gap: 0;        /* gap=0 — el espaciado lo da el hit area de cada ítem */
}

/* ── Hit area por item — tamaños verificados MCP ── */
.itds-rating__item {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  border: none;
  background: transparent;
  cursor: pointer;
  border-radius: 0;       /* r=0 confirmado MCP */
  transition: background-color 120ms ease;
  padding: 0;
}

/* Sizes — hit area exacto según Penpot */
.itds-rating--lg .itds-rating__item { width: 48px; height: 48px; }
.itds-rating--md .itds-rating__item { width: 40px; height: 40px; }
.itds-rating--sm .itds-rating__item { width: 30px; height: 30px; }

/* Hover background — Rectangle fill #f1f5f9 confirmado MCP */
.itds-rating__item:hover:not(:disabled) {
  background-color: #f1f5f9;
}

.itds-rating__item:disabled { cursor: default; }

/* ── Ícono — Material Symbols Rounded: star (fill) · star_border (outline) ── */
.itds-rating__icon {
  font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
  color: #475569;             /* Neutral.Default — inactivo */
  transition: color 120ms ease;
}

.itds-rating__item--active .itds-rating__icon {
  font-variation-settings: 'FILL' 1, 'wght' 400, 'GRAD' 0, 'opsz' 24;
  color: var(--itds-rating-color);
}

/* Sizes de ícono — verificados MCP */
.itds-rating--lg .itds-rating__icon { font-size: 24px; }
.itds-rating--md .itds-rating__icon { font-size: 20px; }
.itds-rating--sm .itds-rating__icon { font-size: 14px; }

/* ── Colores activos por variante ── */
.itds-rating--theme  { --itds-rating-color: var(--color-theme-primary); }  /* #2563EB */
.itds-rating--blue   { --itds-rating-color: var(--color-theme-primary); }  /* #2563EB */
.itds-rating--yellow { --itds-rating-color: #FBBF24; }                     /* Yellow.400 */
.itds-rating--green  { --itds-rating-color: var(--color-success-default); }
.itds-rating--grey   { --itds-rating-color: var(--color-neutral-strong); }
.itds-rating--purple { --itds-rating-color: var(--color-accent-default); }
.itds-rating--red    { --itds-rating-color: var(--color-error-default); }
```

```
✅ Hit areas: lg=48×48 · md=40×40 · sm=30×30 (verificados MCP)
✅ Ícono: Material Symbols Rounded · star (fill) · star_border (outline) · tamaños: 24/20/14px
✅ Hover bg: #f1f5f9 · r=0 (Square — confirmado MCP, diferente de CSAT que es r=8)
✅ Inactivo: #475569 (Neutral.Default) — igual para todos los colores
✅ Activo: color vía --itds-rating-color por variante CSS
✅ gap=0 en el contenedor — el espacio lo da el tamaño del hit area
✅ font-variation-settings: 'FILL' 1 en activo · 'FILL' 0 en inactivo (Material Symbols)

❌ No usar material-icons (familia antigua) — usar material-symbols-rounded
❌ No usar gap entre items — el hit area ya incluye el espaciado visual
❌ No poner border-radius en el hover bg — Rating usa r=0 (distinto de CSAT r=8)

Penpot path: 'Rating / Size=L' → name='Theme'
Seleccionar por size + color; no usar switchVariant().
```

---

### CSAT

**Verificado MCP 2026-05-13.** Componente de satisfacción con 5 niveles emocionales. Sin componentProperties — seleccionar por path + name.

#### Estructura Penpot (confirmada MCP)

| Elemento | Size=L | Size=M | Size=S |
|---|---|---|---|
| Componente total | 304×108px | 264×94px | 214×84px |
| Items_CSAT (fila) | — | 264×40px | — |
| Hit area por ítem | 48×48px | 40×40px | 30×30px |
| Emoji image | 24×24px | 20×20px | 14×14px |
| Hover bg Rectangle | 48×48 · **r=8** · #f1f5f9 | 40×40 · **r=8** | 30×30 · **r=8** |
| Gap entre ítems | ~16px | ~16px | ~16px |
| Label texto | 12px · 500 · #475569 | 12px · 500 · #475569 | 12px · 500 · #475569 |

**⚠️ Los emojis son IMAGE FILLS — no SVGs ni paths.** En Penpot cada emoji es un `rectangle` con fill de tipo imagen importada (`fillImage`). El MCP retorna `{ opacity: 1 }` sin color porque es un asset de imagen, no un color.

**⚠️ CSAT hover bg usa `r=8` (radius-box) — diferente de Rating que usa `r=0`.**

**Gap entre ítems:** `(264 - 5×40) / 4 = 16px` · verificado desde dimensiones totales del componente.

#### Penpot paths (sin componentProperties)

```
CSAT                              → name: 'Size=L' | 'Size=M' | 'Size=S'
CSAT / Utilities / Items          → name: 'Size=L' | 'Size=M' | 'Size=S'  (hit area individual)
CSAT / Utilities / Emoji / Active   → path: 'Size=L|M|S' · name: 'very-negative_active' | 'negative_active' | 'neutral_active' | 'positive_active' | 'very-positive_active'
CSAT / Utilities / Emoji / Inactive → path: 'Size=L|M|S' · name: 'very-negative_inactive' | ... | 'very-positive_inactive'
```

#### Assets de emojis — exportación on-demand durante build

**Los emojis NO son archivos pre-generados.** Se exportan automáticamente vía Penpot MCP cada vez que el skill construye una pantalla que contiene el componente CSAT. El Desktop fue solo para verificar factibilidad (2026-05-13).

**Flujo de exportación en Paso 4 del build:**

Cuando se detecta un componente CSAT en el board, ejecutar por cada uno de los 10 emojis:

```
// 1. Localizar el rectangle hijo con fillImage para cada emoción
execute_code → shapes.filter(s => s.type === 'rect' && s.fills?.some(f => f.fillType === 'image'))
              → recuperar s.id por nombre (ej: 'very-negative_active')

// 2. Exportar directamente al output del proyecto
export_shape(shapeId=<rectId>, format='png', mode='fill')
→ guardar como: <output_dir>/public/assets/csat/<key>_<state>.png
```

Los 10 archivos a generar en `public/assets/csat/`:

| Clave | Estado | Archivo destino |
|---|---|---|
| `very-negative` | active / inactive | `very-negative_active.png` · `very-negative_inactive.png` |
| `negative` | active / inactive | `negative_active.png` · `negative_inactive.png` |
| `neutral` | active / inactive | `neutral_active.png` · `neutral_inactive.png` |
| `positive` | active / inactive | `positive_active.png` · `positive_inactive.png` |
| `very-positive` | active / inactive | `very-positive_active.png` · `very-positive_inactive.png` |

> Penpot paths para localizar: `CSAT / Utilities / Emoji / Active / Size=M` → `name='positive_active'`, etc. Los rectangles con `fillImage` son los hijos directos de cada Emoji atom — usar `execute_code` sobre el board del proyecto para obtener los IDs en el contexto de ese archivo.

#### Implementación React

```jsx
// Assets en /public/assets/csat/ — exportados on-demand desde Penpot MCP al hacer build
const CSAT_EMOTIONS = [
  { key: 'very-negative', label: 'Muy insatisfecho' },
  { key: 'negative',      label: 'Insatisfecho' },
  { key: 'neutral',       label: 'Neutral' },
  { key: 'positive',      label: 'Satisfecho' },
  { key: 'very-positive', label: 'Muy satisfecho' },
];

const CSAT = ({
  size = 'md',      // sm | md | lg
  value = null,     // key seleccionado o null
  onChange,
}) => (
  <div className={`itds-csat itds-csat--${size}`} role="radiogroup" aria-label="¿Qué tan satisfecho estás?">
    {CSAT_EMOTIONS.map(({ key, label }) => {
      const active = value === key;
      return (
        <button
          key={key}
          type="button"
          className={`itds-csat__item${active ? ' itds-csat__item--active' : ''}`}
          onClick={() => onChange?.(key)}
          aria-pressed={active}
          aria-label={label}
        >
          <img
            src={`/assets/csat/${key}_${active ? 'active' : 'inactive'}.png`}
            alt=""
            aria-hidden="true"
            className="itds-csat__emoji"
            draggable={false}
          />
        </button>
      );
    })}
  </div>
);
```

```css
/* ── Contenedor ── */
.itds-csat {
  display: inline-flex;
  align-items: center;
  gap: 16px;      /* verificado MCP: (264 - 5×40) / 4 = 16px */
}

/* ── Hit area por item ── */
.itds-csat__item {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  border: none;
  background: transparent;
  cursor: pointer;
  border-radius: var(--radius-box);   /* r=8 confirmado MCP — diferente de Rating (r=0) */
  position: relative;
  transition: background-color 150ms ease;
  padding: 0;
}

/* Sizes — hit areas verificados MCP */
.itds-csat--lg .itds-csat__item { width: 48px; height: 48px; }
.itds-csat--md .itds-csat__item { width: 40px; height: 40px; }
.itds-csat--sm .itds-csat__item { width: 30px; height: 30px; }

/* Hover + selected background — #f1f5f9 · r=8 (Rectangle Penpot) */
.itds-csat__item:hover:not(:disabled),
.itds-csat__item--active {
  background-color: #f1f5f9;
}

/* Selected: borde theme encima del bg */
.itds-csat__item--active {
  outline: 2px solid var(--color-theme-primary);
  outline-offset: -2px;
}

/* ── Emoji image — sizes verificados MCP ── */
.itds-csat__emoji {
  display: flex;
  align-items: center;
  justify-content: center;
  line-height: 1;
}
.itds-csat--lg .itds-csat__emoji { width: 24px; height: 24px; font-size: 20px; }
.itds-csat--md .itds-csat__emoji { width: 20px; height: 20px; font-size: 16px; }
.itds-csat--sm .itds-csat__emoji { width: 14px; height: 14px; font-size: 12px; }
```

```
✅ Hit areas: lg=48×48 · md=40×40 · sm=30×30 (verificados MCP)
✅ Emoji display: lg=24×24 · md=20×20 · sm=14×14 (verificados MCP)
✅ Gap entre ítems: 16px (calculado desde dimensiones totales del componente)
✅ Hover bg: #f1f5f9 · r=8 (radius-box) — confirmado MCP
✅ Emojis son IMAGE FILLS en Penpot — exportar on-demand vía export_shape al hacer build, nunca pre-generados
✅ Label: 12px · weight 500 · color #475569 (Neutral.Default)

❌ No usar border-radius: 0 — CSAT usa r=8 (distinto de Rating que es r=0)
❌ No usar gap distinto de 16px — verificado desde dimensiones MCP
❌ No usar gap=8px (--spacing-2) — el gap real es 16px, no 8px
❌ No renderizar emojis como texto plano en producción — son image assets del DS

Penpot path: 'CSAT / Size=M' → name se infiere del path (Size=M)
Emojis atom: 'CSAT / Utilities / Emoji / Active / Size=M' → name='positive_active'
```

---

### OtpInput

Input para códigos de verificación. 3, 4 o 6 caracteres × 2 tamaños. Sin componentProperties en Penpot.

```jsx
const OtpInput = ({
  length = 6,     // 3 | 4 | 6
  size = 'lg',   // lg | md
  value = '',
  onChange,
  onComplete,
}) => {
  const inputsRef = useRef([]);
  const chars = value.split('').slice(0, length);

  const handleChange = (idx, char) => {
    const newVal = chars.slice();
    newVal[idx] = char.replace(/\D/g, '').slice(-1);
    const joined = newVal.join('');
    onChange?.(joined);
    if (char && idx < length - 1) inputsRef.current[idx + 1]?.focus();
    if (joined.length === length) onComplete?.(joined);
  };

  const handleKeyDown = (idx, e) => {
    if (e.key === 'Backspace' && !chars[idx] && idx > 0) {
      inputsRef.current[idx - 1]?.focus();
    }
  };

  return (
    <div className={`itds-otp itds-otp--${size} itds-otp--${length}chars`}>
      {Array.from({ length }, (_, i) => (
        <input
          key={i}
          ref={el => inputsRef.current[i] = el}
          type="text" inputMode="numeric" maxLength={1}
          value={chars[i] || ''}
          onChange={e => handleChange(i, e.target.value)}
          onKeyDown={e => handleKeyDown(i, e)}
          className="itds-otp__input"
          aria-label={`Dígito ${i + 1} de ${length}`}
        />
      ))}
    </div>
  );
};
```

```css
.itds-otp { display: flex; gap: var(--spacing-2); align-items: center; }
.itds-otp__input {
  text-align: center; font-family: var(--font-family);
  font-weight: var(--weight-semibold);
  border: 1px solid var(--color-neutral-softer);
  border-radius: var(--radius-lg);
  background: var(--color-neutral-white);
  transition: border-color 150ms ease;
  outline: none;
}
.itds-otp__input:focus { border-color: var(--color-theme-primary); }
/* Sizes */
.itds-otp--lg .itds-otp__input { width: 48px; height: 56px; font-size: var(--text-xl); }
.itds-otp--md .itds-otp__input { width: 40px; height: 48px; font-size: var(--text-lg); }
```

```
Penpot path: 'OtpInput / LG' → name='6 Characters' (sin componentProperties)
```

---

### Skeleton

Placeholders de carga. 9 tipos de átomos. Implementar como divs con animación shimmer pura en CSS — sin dependencias JS.

```jsx
const Skeleton = ({ type = 'text', width, height, className = '' }) => (
  <div
    className={`itds-skeleton itds-skeleton--${type} ${className}`}
    style={{ width, height }}
    aria-hidden="true"
    role="presentation"
  />
);

// Uso compuesto
const SkeletonCard = () => (
  <div className="itds-skeleton-card">
    <Skeleton type="img" />
    <div className="itds-skeleton-card__body">
      <Skeleton type="text" />
      <Skeleton type="text" width="60%" />
      <Skeleton type="button" />
    </div>
  </div>
);
```

```css
/* Base shimmer — todos los skeletons comparten esta animación */
@keyframes itds-shimmer {
  0%   { background-position: -400px 0; }
  100% { background-position: 400px 0; }
}

.itds-skeleton {
  background: linear-gradient(
    90deg,
    var(--color-neutral-softest) 25%,
    var(--color-tonal-hover)     50%,
    var(--color-neutral-softest) 75%
  );
  background-size: 800px 100%;
  animation: itds-shimmer 1.4s ease-in-out infinite;
  border-radius: var(--radius-sm);
}

/* Tipos — dimensiones por defecto */
.itds-skeleton--text   { height: 14px; width: 100%; border-radius: var(--radius-sm); }
.itds-skeleton--button { height: 44px; width: 120px; border-radius: var(--radius-button); }
.itds-skeleton--avatar { width: 40px; height: 40px; border-radius: var(--radius-full); }
.itds-skeleton--img    { width: 100%; height: 160px; border-radius: var(--radius-lg); }
.itds-skeleton--icon   { width: 24px; height: 24px; border-radius: var(--radius-sm); }
.itds-skeleton--input  { height: 48px; width: 100%; border-radius: var(--radius-button); }
.itds-skeleton--tag    { height: 24px; width: 64px; border-radius: var(--radius-full); }
.itds-skeleton--card   { width: 100%; height: 120px; border-radius: var(--radius-box); }
.itds-skeleton--ProductFile { width: 100%; height: 72px; border-radius: var(--radius-lg); }
```

```
Penpot path: 'Skeleton' → name='card' (sin componentProperties)
Implementar como CSS puro — sin imágenes ni JS de estado.
```

---

## Select — Arcus pill: gap visual al abrir dropdown

**Hallazgo:** `border-radius: 999px` (pill) genera gap visual entre el container y el dropdown rectangular al abrirse.

```css
/* Override solo cuando Arcus + Select abierto */
[data-theme="arcus"] .itds-select__container--open {
  border-bottom-left-radius: var(--radius-lg);   /* suaviza la transición */
  border-bottom-right-radius: var(--radius-lg);
}
```

```
✅ Aplicar solo en el override [data-theme="arcus"]
✅ El dropdown siempre usa border-radius: var(--radius-box) (8px) — independiente del radius-input
```

---

## Desktop — Layout y Overlays

### Regla crítica: overlays desktop = `position: absolute`, no `position: fixed`

**En flujos desktop, el wrapper del flujo es el stacking context.** `position: fixed` escapa del contenedor 1280×832 y cubre toda la ventana del browser.

```css
/* ✅ CORRECTO para flujos desktop */
.itds-overlay--desktop {
  position: absolute;
  inset: 0;           /* cubre AppBar + Sidebar + contenido dentro del wrapper */
  z-index: 50;
}

/* ❌ INCORRECTO — escapa del contenedor del flujo */
.itds-overlay--desktop {
  position: fixed;
  inset: 0;
}
```

```
Aplica a: Drawer, Modal, Toast, cualquier overlay en flujos desktop
El wrapper del flujo debe tener: position: relative; width: 1280px; height: 832px; overflow: hidden;
```

---

### Sidebar Desktop — hover expand (CSS puro, sin React state)

**Hallazgo:** Penpot tiene 2 boards para el sidebar (collapsed / expanded), pero la diferencia es solo el width. Es un estado CSS hover, no una transición de pantalla ni React state.

```css
.itds-sidebar {
  width: 76px;              /* collapsed: solo íconos */
  overflow: hidden;
  transition: width 250ms ease;
}

.itds-sidebar:hover {
  width: 271px;             /* expanded: íconos + labels */
}

/* Labels: ocultas en collapsed, visibles con hover */
.itds-sidebar__label {
  opacity: 0;
  white-space: nowrap;
  transition: opacity 200ms ease;
}

.itds-sidebar:hover .itds-sidebar__label {
  opacity: 1;
}
```

```
✅ CSS :hover puro — sin useState, sin onClick, sin className condicional
✅ transition: width 250ms ease en el sidebar
✅ Labels con opacity transition (no display:none → no animación)
❌ No crear 2 estados React para collapsed/expanded si el diseño es solo hover
```

---

## Desktop — Componentes específicos

### UserMenu / Right top

**Dimensiones Penpot exactas:** avatar 53×54px (oval-pill, no cuadrado), texto right-aligned, role encima del nombre, sin padding izquierdo.

```jsx
const UserMenu = ({ name, role, initials }) => (
  <div className="itds-user-menu">
    <div className="itds-user-menu__text">
      <span className="itds-user-menu__role">{role}</span>
      <span className="itds-user-menu__name">{name}</span>
    </div>
    <div className="itds-user-menu__avatar">
      <span className="itds-user-menu__initials">{initials}</span>
    </div>
  </div>
);
```

```css
.itds-user-menu {
  display: flex;
  align-items: center;
  gap: 8px;
}

.itds-user-menu__text {
  display: flex;
  flex-direction: column;
  align-items: flex-end;   /* texto right-aligned */
}

.itds-user-menu__role  { font-size: 11px; color: var(--color-neutral-default); }
.itds-user-menu__name  { font-size: 13px; font-weight: var(--weight-medium); color: var(--color-neutral-strongest); }

.itds-user-menu__avatar {
  width: 53px;
  height: 54px;           /* oval-pill: NO es cuadrado */
  border-radius: 999px;
  background: var(--color-theme-softest);
  display: flex;
  align-items: center;
  justify-content: center;
}

.itds-user-menu__initials {
  font-size: 18px;
  font-weight: var(--weight-bold);
  color: var(--color-theme-primary);
}
```

```
⚠️ avatar es 53×54px (oval-pill) — NO cuadrado (53×53)
✅ role va ENCIMA del nombre en el stack vertical
✅ texto right-aligned (align-items: flex-end)
```

---

### Badge / Notifications — Desktop (dot sin número)

**Hallazgo:** En desktop IT DS, el badge de notificaciones es un dot 12×12 sin texto. Es diferente al badge mobile (con contador numérico).

```jsx
<div className="itds-notification-badge-wrapper">
  <button className="itds-action-icon">
    <span className="material-icons-outlined">notifications</span>
  </button>
  <span className="itds-notification-badge" aria-label="Tienes notificaciones" />
</div>
```

```css
.itds-notification-badge-wrapper { position: relative; display: inline-flex; }

.itds-notification-badge {
  position: absolute;
  top: 2px;
  right: 2px;
  width: 12px;
  height: 12px;
  background: #dc2626;          /* Danger.Default — hardcoded, sin token dot */
  border-radius: 50%;
  border: 2px solid var(--color-neutral-white);
}
```

```
✅ Desktop: dot 12×12 sin texto (Penpot: Badge/Notifications desktop)
✅ Mobile: badge con número (Penpot: Badge/Notifications mobile)
❌ No intentar mostrar número en el dot desktop
```

---

### Table Header — Desktop (colores Penpot, no tokens semánticos)

**Hallazgo:** El header de tabla usa fills directos leídos de Penpot — no coinciden con los tokens `--color-divider` ni `--color-surface-tertiary`. Siempre inspeccionar `Table/Cells/Head` en Penpot antes de asumir.

```css
.itds-table thead th {
  background-color: #f1f5f9;    /* Penpot fill — no --color-surface-* */
  border-right: 1px solid #cbd5e1;   /* Penpot stroke inner 1px */
  border-bottom: 1px solid #cbd5e1;
}
```

```
⚠️ #f1f5f9 y #cbd5e1 son valores hardcoded leídos de Penpot — no usar tokens semánticos
✅ Verificar siempre vía execute_code antes de asumir colores del header
```

---

### Breadcrumb — Dual CDN (Material Icons + Material Symbols)

**Hallazgo:** El Breadcrumb IT DS requiere 2 CDNs distintos. Material Icons Outlined para íconos generales de la app, Material Symbols Outlined para el breadcrumb (usa `font-variation-settings`).

```html
<!-- En <head> — ambos son requeridos -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet">
```

```css
/* Selector separado por familia */
.itds-breadcrumb .material-symbols-outlined {
  font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 20;
  font-size: 16px;
  color: var(--color-neutral-soft);
}
```

```jsx
<nav className="itds-breadcrumb">
  {links.map((link, i) => (
    <React.Fragment key={link.id}>
      <a href={link.href} className="itds-breadcrumb__link">
        <span className="material-symbols-outlined">{link.icon}</span>
        {link.label}
      </a>
      {i < links.length - 1 && (
        <span className="material-symbols-outlined itds-breadcrumb__sep">chevron_right</span>
      )}
    </React.Fragment>
  ))}
</nav>
```

```
✅ Incluir AMBOS <link> en <head> — el breadcrumb usa Material Symbols, no Material Icons
✅ Ícono por cada link (home, grid_view, category, etc.) — verificar nombres en Penpot
✅ Separador: chevron_right con Material Symbols Outlined
❌ No usar material-icons-outlined en breadcrumb — las ligatures son distintas
```

---

### Pagination / Desktop Default

**Hallazgo crítico:** La paginación IT DS Desktop tiene una estructura específica de Penpot — no es una paginación numérica estándar. Leer el árbol completo desde MCP antes de implementar.

```
Estructura Penpot:
  [nav izquierdo]  ←  |  input-página  |  de  |  30  |  →
  [result derecho]  1-10  de  300 resultados  |  10 ▼  |
```

```jsx
const PaginationDesktop = ({ page, totalPages, pageSize, totalItems, onPageChange, onPageSizeChange }) => (
  <div className="itds-pagination">
    {/* Nav izquierdo */}
    <div className="itds-pagination__nav">
      <button className="itds-pagination__arrow" onClick={() => onPageChange(page - 1)} disabled={page <= 1}>
        <span className="material-icons-outlined">arrow_back</span>
      </button>
      <input
        className="itds-pagination__page-input"
        type="number" min={1} max={totalPages}
        value={page}
        onChange={e => onPageChange(Number(e.target.value))}
      />
      <span className="itds-pagination__sep">de</span>
      <span className="itds-pagination__total-pages">{totalPages}</span>
      <button className="itds-pagination__arrow" onClick={() => onPageChange(page + 1)} disabled={page >= totalPages}>
        <span className="material-icons-outlined">arrow_forward</span>
      </button>
    </div>

    {/* Separador */}
    <div className="itds-pagination__divider" />

    {/* Result derecho */}
    <div className="itds-pagination__result">
      <span className="itds-pagination__range">
        {(page - 1) * pageSize + 1}–{Math.min(page * pageSize, totalItems)} de {totalItems} resultados
      </span>
      <div className="itds-pagination__rows-selector">
        <span>{pageSize}</span>
        <button onClick={onPageSizeChange}>
          <span className="material-icons-outlined">expand_more</span>
        </button>
      </div>
    </div>
  </div>
);
```

```css
.itds-pagination {
  display: flex;
  align-items: center;
  gap: 16px;
  height: 74px;           /* h leído de Penpot */
  padding: 0 16px;
  border-top: 2px solid #f1f5f9;   /* separador top — color Penpot */
}

.itds-pagination__nav {
  display: flex;
  align-items: center;
  gap: 8px;
  color: #94a3b8;         /* Neutral.Soft Lynch — hardcoded */
}

.itds-pagination__page-input {
  width: 40px;
  text-align: center;
  border: 1px solid var(--color-neutral-soft);
  border-radius: var(--radius-sm);
  font-family: var(--font-family);
  font-size: var(--text-sm);
  color: #0f172a;         /* Neutral.Strongest */
}

.itds-pagination__total-pages { font-weight: var(--weight-bold); color: #0f172a; }

.itds-pagination__arrow {
  background: none; border: none; cursor: pointer;
  color: var(--color-theme-primary);
  display: flex; align-items: center;
}
.itds-pagination__arrow:disabled { color: var(--color-neutral-soft); cursor: not-allowed; }

.itds-pagination__divider {
  width: 1px;
  height: 40px;
  background: #f1f5f9;
}

.itds-pagination__result { display: flex; align-items: center; gap: 12px; }
.itds-pagination__range { font-size: var(--text-sm); color: #94a3b8; }
.itds-pagination__rows-selector {
  display: flex; align-items: center; gap: 4px;
  color: var(--color-theme-primary);
  font-weight: var(--weight-medium);
  cursor: pointer;
}
```

```
⚠️ Estructura Penpot es: nav izq (flechas + input + de + N) | divider | result der (rango + rows selector)
❌ No implementar como paginación numérica estándar (1 2 3 ... N)
✅ Altura 74px · separador top #f1f5f9 2px — leídos de Penpot
✅ Colores de texto: nav = #94a3b8 (Neutral.Soft) · números bold = #0f172a (Neutral.Strongest)
```

---

### ProductFile / Default — 4 secciones (Drawer)

**Hallazgo:** `ProductFile / Default` en el drawer tiene 4 secciones distintas — no es un formulario simple. Leer el árbol completo desde MCP antes de implementar.

```
Estructura Penpot — en orden top → bottom:
  1. [Tags row]           → fila horizontal de Tags (sin íconos, solo texto)
  2. [Product Information] → imagen 64×64 + key-values (label gris · valor oscuro)
  3. [ItemsCardValues]    → TextInput LG full-width
  4. [ItemsCardValues]    → 2×TextInput LG half-width (lado a lado)
```

```jsx
const ProductFileDrawer = ({ tags, product, inputs }) => (
  <div className="pf-root">
    {/* 1. Tags row */}
    <div className="pf-tags-row">
      {tags.map(tag => (
        <span key={tag} className="pf-tag">{tag}</span>
      ))}
    </div>

    {/* 2. Product Information */}
    <div className="pf-product-info">
      <img src={product.image} alt={product.name} className="pf-product-image" />
      <div className="pf-key-values">
        {product.fields.map(f => (
          <div key={f.label} className="pf-field">
            <span className="pf-field__label">{f.label}</span>
            <span className="pf-field__value">{f.value}</span>
          </div>
        ))}
      </div>
    </div>

    {/* 3. TextInput full-width */}
    <div className="pf-inputs-full">
      <TextInput label={inputs.full.label} value={inputs.full.value} onChange={inputs.full.onChange} />
    </div>

    {/* 4. 2 × TextInput half-width */}
    <div className="pf-inputs-half">
      <TextInput label={inputs.half1.label} value={inputs.half1.value} onChange={inputs.half1.onChange} />
      <TextInput label={inputs.half2.label} value={inputs.half2.value} onChange={inputs.half2.onChange} />
    </div>
  </div>
);
```

```css
.pf-root { display: flex; flex-direction: column; gap: 16px; }

/* Tags: sin íconos, solo texto */
.pf-tags-row { display: flex; flex-wrap: wrap; gap: 8px; }
.pf-tag {
  background: var(--color-info-softest);   /* #dbeafe */
  color: var(--color-info-stronger);       /* #1d4ed8 */
  border-radius: 999px;
  padding: 2px 10px;
  font-size: var(--text-xs);
  font-weight: var(--weight-medium);
}

/* Product info */
.pf-product-info { display: flex; gap: 12px; align-items: flex-start; }
.pf-product-image { width: 64px; height: 64px; border-radius: var(--radius-lg); object-fit: cover; flex-shrink: 0; }

.pf-key-values { display: flex; flex-direction: column; gap: 4px; flex: 1; }
.pf-field { display: flex; justify-content: space-between; align-items: center; }
.pf-field__label { font-size: var(--text-sm); color: var(--color-neutral-soft); }
.pf-field__value { font-size: var(--text-sm); font-weight: var(--weight-bold); color: var(--color-neutral-strongest); }

/* Inputs half-width */
.pf-inputs-half { display: flex; gap: 8px; }
.pf-inputs-half > * { flex: 1; }
```

```
✅ 4 secciones exactas: tags → info(imagen+kv) → input full → inputs half×2
✅ Tags: sin íconos — solo texto con pill azul (#dbeafe / #1d4ed8)
✅ Inputs: sin íconos leading/trailing en ItemsCardValues
❌ No implementar como formulario genérico — respetar la estructura de Penpot
```

---

### deletedIds — Patrón de eliminación inmutable de filas

**Hallazgo:** Para eliminar filas de tabla sin mutar el dataset original, usar un array `deletedIds`. Permite restaurar sin refetch y mantiene el dataset limpio.

```jsx
const [deletedIds, setDeletedIds] = useState([]);

const handleDelete = (id) => {
  setDeletedIds(ids => [...ids, id]);
  // Mostrar toast de éxito
};

// Filtrar en render
const visibleRows = products.filter(p => !deletedIds.includes(p.id));
```

```
✅ Inmutable: nunca mutar el array original de datos
✅ Permite restaurar (undo) sin refetch: setDeletedIds(ids => ids.filter(id => id !== targetId))
✅ Combinar con Toast auto-dismiss para confirmar la acción
```

---

### Modal — Ícono sobre título (column layout)

**Hallazgo IT DS:** El ícono de warning/info en modales de confirmación va en `flex-direction: column` (sobre el título), no al lado. Color: `--color-theme-primary` (azul), no `color-warning-*`.

```jsx
<div className="itds-modal__header">
  <div className="itds-modal__icon-row">
    <span className="material-icons-outlined itds-modal__icon">info</span>
  </div>
  <h2 className="itds-modal__title">¿Eliminar producto?</h2>
  <p className="itds-modal__body">Esta acción no se puede deshacer.</p>
</div>
```

```css
.itds-modal__icon-row {
  display: flex;
  justify-content: center;
  margin-bottom: 8px;
}

.itds-modal__icon {
  font-size: 32px;
  color: var(--color-theme-primary);           /* azul — no warning */
  background: var(--color-theme-softest);      /* #dbeafe */
  border-radius: 50%;
  padding: 8px;
}
```

```
✅ Ícono en column (sobre el título) — confirmar layout en Penpot
✅ Color: --color-theme-primary — para acciones de confirmación destructiva
❌ No usar color-warning-* (amarillo) — el IT DS usa azul theme para este modal
❌ No poner ícono en row (al lado del título)
```

---

## Convenciones de naming

| Elemento | Convención | Ejemplo |
|---|---|---|
| Componente | PascalCase | `TextInput`, `NavbarMobile` |
| CSS class base | `itds-[nombre-kebab]` | `itds-text-input` |
| CSS modifier | `itds-[nombre]--[modificador]` | `itds-button--primary` |
| CSS element | `itds-[nombre]__[elemento]` | `itds-card__title` |
| Props | camelCase | `variant`, `size`, `helperText` |
| Variante size | `sm` / `md` / `lg` | `size="md"` |
| Variante state | `default` / `hover` / `disabled` / `error` | `state="error"` |
