# Design Tokens — IT DS (valores exactos del archivo Penpot)

> **Skill:** itds-code-forge v1.2 · **Fuente:** IT DS Penpot · Cencosud
> **Actualizado:** 2026-05-13 — sincronizado contra `tokens penpot.json` exportado desde Penpot
> Font Family IT DS: **DM Sans** · Font Family Arcus: **Open Sans** · Line-height: 1.25

---

## Font Families

| Theme | Font | Token Penpot | CSS variable |
|---|---|---|---|
| IT | **DM Sans** | `FontFamily = ["DM Sans"]` | `--font-family: 'DM Sans', -apple-system, sans-serif` |
| Arcus | **Open Sans** | `FontFamily = ["Open Sans"]` | `--font-family: 'Open Sans', -apple-system, sans-serif` |

**Pesos utilizados:** 400 (Regular) · 500 (Medium) · 700 (Bold)

**Line-height:** `1.25` en ambos themes — token `lineHeight` en todos los estilos de texto

**Familias adicionales en primitivos (marcas Cencosud con branding propio):**
`Poppins` · `Montserrat`

### Carga vía Google Fonts CDN

```html
<!-- Cargar ambas fuentes juntas (IT + Arcus) -->
<link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&family=Open+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
```

```html
<!-- Solo IT (DM Sans) -->
<link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">

<!-- Solo Arcus (Open Sans) -->
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
```

> Incluir siempre el `<link>` antes de `tokens.css` en el `<head>`. Usar el link combinado cuando el HTML soporta ambos themes.

---

## CSS Variables — IT Theme (tokens.css)

```css
/* =============================================
   IT DS Design Tokens — IT Theme
   Skill: itds-code-forge v1.2
   Fuente: tokens penpot.json · Cencosud · 2026-05-13
   Font: DM Sans · Line-height: 1.25
   ============================================= */

:root {
  /* ── COLORES SEMÁNTICOS — IT Theme ── */

  /* Theme (Blue) */
  --color-theme-primary:   #2563EB;   /* Theme.Primary   → Blue.600 */
  --color-theme-hover:     #1D4ED8;   /* Theme.Hover     → Blue.700 */
  --color-theme-pressed:   #1E40AF;   /* Theme.Pressed   → Blue.800 */
  --color-theme-filled:    #1E3A8A;   /* Theme.Filled    → Blue.900 */
  --color-theme-disabled:  #60A5FA;   /* Theme.Disabled  → Blue.400 */
  --color-theme-accent:    #2563EB;   /* Theme.Accent    → Blue.600 */
  --color-theme-contrast:  #FFFFFF;   /* Theme.Contrast  → White */
  --color-theme-softest:   #DBEAFE;   /* Theme.Softest   → Blue.100 */
  --color-theme-softer:    #93C5FD;   /* Theme.Softer    → Blue.300 */
  --color-theme-soft:      #60A5FA;   /* Theme.Soft      → Blue.400 */
  --color-theme-strong:    #3B82F6;   /* Theme.Strong    → Blue.500 */
  --color-theme-stronger:  #1D4ED8;   /* Theme.Stronger  → Blue.700 */
  --color-theme-strongest: #1E3A8A;   /* Theme.Strongest → Blue.900 */

  /* Neutral (Lynch/Slate) */
  --color-neutral-default:   #475569;  /* Neutral.Default   → Lynch.600 */
  --color-neutral-hover:     #334155;  /* Neutral.Hover     → Lynch.700 */
  --color-neutral-pressed:   #1E293B;  /* Neutral.Pressed   → Lynch.800 */
  --color-neutral-filled:    #0F172A;  /* Neutral.Filled    → Lynch.900 */
  --color-neutral-disabled:  #94A3B8;  /* Neutral.Disabled  → Lynch.400 */
  --color-neutral-softest:   #F1F5F9;  /* Neutral.Softest   → Lynch.100 */
  --color-neutral-softer:    #CBD5E1;  /* Neutral.Softer    → Lynch.300 */
  --color-neutral-soft:      #94A3B8;  /* Neutral.Soft      → Lynch.400 */
  --color-neutral-strong:    #64748B;  /* Neutral.Strong    → Lynch.500 */
  --color-neutral-stronger:  #334155;  /* Neutral.Stronger  → Lynch.700 */
  --color-neutral-strongest: #0F172A;  /* Neutral.Strongest → Lynch.900 */
  --color-neutral-white:     #FFFFFF;
  --color-neutral-black:     #000000;

  /* Screen */
  --color-screen-base:    #FFFFFF;    /* Screen.Base    → Monochrome.White */
  --color-screen-soft:    #F1F5F9;    /* Screen.Soft    → Lynch.100 */
  --color-screen-softest: #FCF8F8;    /* Screen.Softest → Lynch.50 */

  /* Tonal */
  --color-tonal-default: #F1F5F9;    /* Tonal.Default  → Lynch.100 */
  --color-tonal-hover:   #E2E8F0;    /* Tonal.Hover    → Lynch.200 */
  --color-tonal-pressed: #CBD5E1;    /* Tonal.Pressed  → Lynch.300 */

  /* Error (Red) */
  --color-error-default:   #DC2626;  /* Error.Default   → Red.600 */
  --color-error-hover:     #B91C1C;  /* Error.Hover     → Red.700 */
  --color-error-pressed:   #991B1B;  /* Error.Pressed   → Red.800 */
  --color-error-disabled:  #F87171;  /* Error.Disabled  → Red.400 */
  --color-error-softest:   #FEE2E2;  /* Error.Softest   → Red.100 */
  --color-error-softer:    #FECACA;  /* Error.Softer    → Red.200 */
  --color-error-soft:      #FCA5A5;  /* Error.Soft      → Red.300 */
  --color-error-strong:    #EF4444;  /* Error.Strong    → Red.500 */
  --color-error-stronger:  #B91C1C;  /* Error.Stronger  → Red.700 */
  --color-error-strongest: #7F1D1D;  /* Error.Strongest → Red.900 */
  --color-error-filled:    #531313;  /* Error.Filled    → Red.950 */

  /* Success (Green) */
  --color-success-default:   #16A34A; /* Success.Default   → Green.600 */
  --color-success-hover:     #16803C; /* Success.Hover     → Green.700 */
  --color-success-pressed:   #166534; /* Success.Pressed   → Green.800 */
  --color-success-disabled:  #4ADE80; /* Success.Disabled  → Green.400 */
  --color-success-softest:   #DCFCE7; /* Success.Softest   → Green.100 */
  --color-success-softer:    #BBF7D0; /* Success.Softer    → Green.200 */
  --color-success-soft:      #86EFAC; /* Success.Soft      → Green.300 */
  --color-success-strong:    #22C55E; /* Success.Strong    → Green.500 */
  --color-success-stronger:  #16803C; /* Success.Stronger  → Green.700 */
  --color-success-strongest: #14532D; /* Success.Strongest → Green.900 */
  --color-success-filled:    #0A2916; /* Success.Filled    → Green.950 */

  /* Warning (Yellow) */
  --color-warning-default:   #D97706; /* Warning.Default   → Yellow.600 */
  --color-warning-hover:     #B45309; /* Warning.Hover     → Yellow.700 */
  --color-warning-pressed:   #92400E; /* Warning.Pressed   → Yellow.800 */
  --color-warning-disabled:  #FBBF24; /* Warning.Disabled  → Yellow.400 */
  --color-warning-softest:   #FEF3C7; /* Warning.Softest   → Yellow.100 */
  --color-warning-softer:    #FDE68A; /* Warning.Softer    → Yellow.200 */
  --color-warning-soft:      #FCD34D; /* Warning.Soft      → Yellow.300 */
  --color-warning-strong:    #F59E0B; /* Warning.Strong    → Yellow.500 */
  --color-warning-stronger:  #B45309; /* Warning.Stronger  → Yellow.700 */
  --color-warning-strongest: #78350F; /* Warning.Strongest → Yellow.900 */
  --color-warning-filled:    #5B280B; /* Warning.Filled    → Yellow.950 */

  /* Alert (Orange) */
  --color-alert-default:   #EA580C;  /* Alert.Default   → Orange.600 */
  --color-alert-hover:     #C2410C;  /* Alert.Hover     → Orange.700 */
  --color-alert-pressed:   #9A3412;  /* Alert.Pressed   → Orange.800 */
  --color-alert-disabled:  #FB923C;  /* Alert.Disabled  → Orange.400 */
  --color-alert-softest:   #FFEDD5;  /* Alert.Softest   → Orange.100 */
  --color-alert-softer:    #FED7AA;  /* Alert.Softer    → Orange.200 */
  --color-alert-soft:      #FDBA74;  /* Alert.Soft      → Orange.300 */
  --color-alert-strong:    #F97316;  /* Alert.Strong    → Orange.500 */
  --color-alert-stronger:  #C2410C;  /* Alert.Stronger  → Orange.700 */
  --color-alert-strongest: #7C2D12;  /* Alert.Strongest → Orange.900 */
  --color-alert-filled:    #59200D;  /* Alert.Filled    → Orange.950 */

  /* Info (Blue — mismo que Theme en IT DS) */
  --color-info-default:   #2563EB;   /* Info.Default   → Blue.600 */
  --color-info-hover:     #1D4ED8;   /* Info.Hover     → Blue.700 */
  --color-info-pressed:   #1E40AF;   /* Info.Pressed   → Blue.800 */
  --color-info-disabled:  #60A5FA;   /* Info.Disabled  → Blue.400 */
  --color-info-softest:   #DBEAFE;   /* Info.Softest   → Blue.100 */
  --color-info-softer:    #BFDBFE;   /* Info.Softer    → Blue.200 */
  --color-info-soft:      #93C5FD;   /* Info.Soft      → Blue.300 */
  --color-info-strong:    #3B82F6;   /* Info.Strong    → Blue.500 */
  --color-info-stronger:  #1D4ED8;   /* Info.Stronger  → Blue.700 */
  --color-info-strongest: #1E3A8A;   /* Info.Strongest → Blue.900 */
  --color-info-filled:    #122354;   /* Info.Filled    → Blue.950 */

  /* Accent (Purple) */
  --color-accent-default:   #7C3AED;  /* Accent.Default   → Purple.600 */
  --color-accent-hover:     #6D28D9;  /* Accent.Hover     → Purple.700 */
  --color-accent-pressed:   #5B21B6;  /* Accent.Pressed   → Purple.800 */
  --color-accent-disabled:  #A78BFA;  /* Accent.Disabled  → Purple.400 */
  --color-accent-softest:   #EDE9FE;  /* Accent.Softest   → Purple.100 */
  --color-accent-softer:    #DDD6FE;  /* Accent.Softer    → Purple.200 */
  --color-accent-soft:      #C4B5FD;  /* Accent.Soft      → Purple.300 */
  --color-accent-strong:    #8B5CF6;  /* Accent.Strong    → Purple.500 */
  --color-accent-stronger:  #6D28D9;  /* Accent.Stronger  → Purple.700 */
  --color-accent-strongest: #4C1D95;  /* Accent.Strongest → Purple.900 */
  --color-accent-filled:    #2C1155;  /* Accent.Filled    → Purple.950 */

  /* ── COLORES TRANSPARENTES (Transparent.Black) ── */
  /* Fuente directa JSON · usados en sombras y overlays */
  --color-black-0:   rgba(0, 0, 0, 0.00);
  --color-black-50:  rgba(0, 0, 0, 0.05);
  --color-black-100: rgba(0, 0, 0, 0.10);
  --color-black-200: rgba(0, 0, 0, 0.20);
  --color-black-300: rgba(0, 0, 0, 0.30);
  --color-black-400: rgba(0, 0, 0, 0.40);
  --color-black-500: rgba(0, 0, 0, 0.50);
  --color-black-600: rgba(0, 0, 0, 0.60);
  --color-black-700: rgba(0, 0, 0, 0.70);
  --color-black-800: rgba(0, 0, 0, 0.80);
  --color-black-900: rgba(0, 0, 0, 0.90);
  --color-black-950: rgba(0, 0, 0, 0.95);

  /* ── COLORES BRAND — Cadenas Cencosud ── */
  /* Fuente: IT DS/Primitive · Brand · tokens penpot.json */
  --color-brand-paris:          #006DFF;  /* Paris */
  --color-brand-gbarbosa:       #E30918;  /* G.Barbosa */
  --color-brand-prezunic:       #005CB9;  /* Prezunic */
  --color-brand-perini:         #C10230;  /* Perini */
  --color-brand-giga:           #00673C;  /* Giga */
  --color-brand-jumbo:          #19AD49;  /* Jumbo */
  --color-brand-bretas:         #F08700;  /* Bretas */
  --color-brand-wong:           #C01717;  /* Wong */
  --color-brand-metro-bg:       #FFEC00;  /* Metro (fondo) */
  --color-brand-metro-text:     #E30016;  /* Metro (texto) */
  --color-brand-mercantil-bg:   #FFCD00;  /* Mercantil (fondo) */
  --color-brand-mercantil-text: #003595;  /* Mercantil (texto) */
  --color-brand-spid:           #E8308A;  /* Spid */
  --color-brand-easy:           #DF1122;  /* Easy */
  --color-brand-blaisten:       #5B6670;  /* Blaisten */
  --color-brand-vea-bg:         #FFCD00;  /* Vea (fondo) */
  --color-brand-vea-text:       #E1251B;  /* Vea (texto) */
  --color-brand-santa-isabel:   #DF0F20;  /* Santa Isabel */
  --color-brand-disco:          #E82227;  /* Disco */

  /* ── SPACING ── */
  /* ⚠️ Naming no convencional — spacing.1 = 2px, spacing.0-5 = 4px */
  --spacing-0:   0px;    /* spacing.0   */
  --spacing-0-5: 4px;    /* spacing.0-5 → ⚠️ valor real = 4px */
  --spacing-1:   2px;    /* spacing.1   → ⚠️ valor real = 2px */
  --spacing-2:   8px;    /* spacing.2   */
  --spacing-3:   12px;   /* spacing.3   */
  --spacing-4:   16px;   /* spacing.4   ← gap entre secciones (OBLIGATORIO) */
  --spacing-6:   24px;   /* spacing.6   ← gap entre componentes body (OBLIGATORIO) */
  --spacing-8:   32px;   /* spacing.8   */
  --spacing-12:  48px;   /* spacing.12  */
  --spacing-16:  64px;   /* spacing.16  → Icon Box size */
  --spacing-24:  96px;   /* spacing.24  */
  --spacing-32:  128px;  /* spacing.32  */

  /* Spacing negativo — para overlaps y pulls */
  --spacing-neg-1: -4px;   /* negative.-1 */
  --spacing-neg-2: -8px;   /* negative.-2 */
  --spacing-neg-3: -12px;  /* negative.-3 */
  --spacing-neg-4: -16px;  /* negative.-4 */
  --spacing-neg-6: -24px;  /* negative.-6 */

  /* ── BORDER RADIUS ── */
  --radius-none:   0px;   /* none   */
  --radius-sm:     4px;   /* sm     */
  --radius-lg:     8px;   /* lg     */
  --radius-xl:     12px;  /* xl     */
  --radius-2xl:    16px;  /* 2xl    */
  --radius-3xl:    24px;  /* 3xl    */
  --radius-custom: 26px;  /* custom */
  --radius-full:   999px; /* full   */

  /* Semánticos IT — todos apuntan a lg (8px) */
  --radius-button: 8px;   /* Button       → {lg} */
  --radius-input:  8px;   /* Border-Input → {lg} */
  --radius-box:    8px;   /* Box          → {lg} */
  --radius-base:   8px;   /* Radius       → {lg} */

  /* ── TIPOGRAFÍA ── */
  --font-family: 'DM Sans', -apple-system, sans-serif;  /* IT Theme */
  --line-height: 1.25;

  --text-xxs:  10px;  /* XXS — solo IT, no existe en Arcus */
  --text-xs:   12px;  /* XS  */
  --text-sm:   14px;  /* SM  */
  --text-base: 16px;  /* Base */
  --text-lg:   18px;  /* LG  */
  --text-xl:   20px;  /* XL  */
  --text-2xl:  24px;  /* 2XL */
  --text-3xl:  30px;  /* 3XL */
  --text-4xl:  36px;  /* 4XL */
  --text-5xl:  48px;  /* 5XL */
  --text-6xl:  60px;  /* 6XL */
  --text-7xl:  72px;  /* 7XL */
  --text-8xl:  96px;  /* 8XL */

  /* Font Weights semánticos */
  --weight-bold:     700;
  --weight-semibold: 600;
  --weight-medium:   500;
  --weight-regular:  400;

  /* ── LETTER SPACING ── */
  /* Fuente: IT DS/Primitive · letter-spacing · tokens penpot.json */
  /* Usar en titulares grandes: text-6xl a text-8xl requieren tracking negativo */
  --letter-spacing-none: 0;
  --letter-spacing-100:  -0.4px;
  --letter-spacing-200:  -0.5px;
  --letter-spacing-300:  -0.6px;
  --letter-spacing-400:  -0.7px;
  --letter-spacing-500:  -0.8px;
  --letter-spacing-600:  -0.9px;
  --letter-spacing-700:  -1px;
  --letter-spacing-800:  -1.2px;
  --letter-spacing-900:  -1.4px;
  --letter-spacing-1000: -1.5px;
  --letter-spacing-1100: -2.4px;
  --letter-spacing-1200: -2.8px;
  --letter-spacing-1300: -3.4px;
  --letter-spacing-1400: -4.8px;  /* text-8xl (96px) */

  /* ── SOMBRAS ── */
  /* ⚠️ Valores exactos desde tokens penpot.json · Shadow-Down / Shadow-Up */
  /* Fuente: Transparent.Black.200 = 0.20, .300 = 0.30, .400 = 0.40 */
  --shadow-down-s: 0 1px 3px 0 rgba(0, 0, 0, 0.20);
  --shadow-down-m: 0 1px 8px -1px rgba(0, 0, 0, 0.30);
  --shadow-down-l: 0 2px 15px -3px rgba(0, 0, 0, 0.40);
  --shadow-up-s:   0 -1px 3px 0 rgba(0, 0, 0, 0.20);
  --shadow-up-m:   0 -1px 8px -1px rgba(0, 0, 0, 0.30);
  --shadow-up-l:   0 -2px 15px -3px rgba(0, 0, 0, 0.40);

  /* ── OPACIDAD ── */
  /* Escala desde IT DS/Primitive · confirmada vía Penpot MCP · 2026-05-13 */
  /* ⚠️ La escala llega hasta 90% — NO existe token "100%" en Penpot Primitive */
  /* El token "100" existe pero es fontWeights="thin", no opacity */
  --opacity-0:      0;     /* 0%  — Primitive.0  */
  --opacity-10:     0.10;  /* 10% — Primitive.10 */
  --opacity-soft:   0.20;  /* 20% — Primitive.20 → IT Semantics: Opacity.Soft   */
  --opacity-30:     0.30;  /* 30% — Primitive.30 */
  --opacity-medium: 0.40;  /* 40% — Primitive.40 → IT Semantics: Opacity.Medium */
  --opacity-50:     0.50;  /* 50% — Primitive.50 */
  --opacity-strong: 0.60;  /* 60% — Primitive.60 → IT Semantics: Opacity.Strong */
  --opacity-70:     0.70;  /* 70% — Primitive.70 */
  --opacity-80:     0.80;  /* 80% — Primitive.80 */
  --opacity-90:     0.90;  /* 90% — Primitive.90 (último token del set) */
}
```

---

## CSS Variables — Arcus Theme (override)

> Verificado contra `tokens penpot.json` · `IT DS/Arcus Semantics` set · 2026-05-13
>
> **Concepto del tema Arcus:**
> — Primary = **Negro (#000000)** como color CTA/botón principal (no verde)
> — Shamrock verde = color de accent/suave (no primary)
> — Neutral = paleta **Boulder** (grises puros, sin tinte azul)
> — IT usa paleta **Lynch/Slate** (grises con tinte azul)

```css
/* =============================================
   IT DS Design Tokens — Arcus Theme Override
   Aplicar con [data-theme="arcus"] en el wrapper
   Fuente: tokens penpot.json · IT DS/Arcus Semantics
   ============================================= */

[data-theme="arcus"] {

  /* ── FONT ── */
  --font-family: 'Open Sans', -apple-system, sans-serif;

  /* ── THEME (Black primary · Shamrock como accent/suave) ──
     ⚠️ DIFERENCIA CRÍTICA vs IT:
     IT    → Theme.Primary = Blue.600 (#2563EB)
     Arcus → Theme.Primary = Monochrome.Black (#000000)
  */
  --color-theme-primary:   #000000;   /* Theme.Primary   → Monochrome.Black */
  --color-theme-hover:     #2D2D2D;   /* Theme.Hover     → Boulder.800 */
  --color-theme-pressed:   #1D1D1D;   /* Theme.Pressed   → Boulder.900 */
  --color-theme-filled:    #000000;   /* Theme.Filled    → Monochrome.Black */
  --color-theme-disabled:  #A6A6A6;   /* Theme.Disabled  → Boulder.400 */
  --color-theme-contrast:  #000000;   /* Theme.Contrast  → Monochrome.Black ⚠️ (IT=White) */
  --color-theme-accent:    #2CDFA6;   /* Theme.Accent    → Shamrock.400 */
  --color-theme-soft:      #2CDFA6;   /* Theme.Soft      → Shamrock.400 */
  --color-theme-softer:    #65F0BF;   /* Theme.Softer    → Shamrock.300 */
  --color-theme-softest:   #CEFDE7;   /* Theme.Softest   → Shamrock.100 */
  --color-theme-strong:    #04C58E;   /* Theme.Strong    → Shamrock.500 */
  --color-theme-stronger:  #008061;   /* Theme.Stronger  → Shamrock.700 */
  --color-theme-strongest: #015341;   /* Theme.Strongest → Shamrock.900 */

  /* ── NEUTRAL (Boulder — grises puros, sin tinte azul) ──
     ⚠️ TODA la paleta Neutral cambia: Lynch/Slate → Boulder
     IT    usa Lynch (blue-gray · #475569 base)
     Arcus usa Boulder (gray puro · #585858 base)
  */
  --color-neutral-default:   #585858;  /* Neutral.Default   → Boulder.600 */
  --color-neutral-hover:     #444444;  /* Neutral.Hover     → Boulder.700 */
  --color-neutral-pressed:   #2D2D2D;  /* Neutral.Pressed   → Boulder.800 */
  --color-neutral-filled:    #1D1D1D;  /* Neutral.Filled    → Boulder.900 */
  --color-neutral-disabled:  #A6A6A6;  /* Neutral.Disabled  → Boulder.400 */
  --color-neutral-softest:   #F5F5F5;  /* Neutral.Softest   → Boulder.100 */
  --color-neutral-softer:    #D6D6D6;  /* Neutral.Softer    → Boulder.300 */
  --color-neutral-soft:      #A6A6A6;  /* Neutral.Soft      → Boulder.400 */
  --color-neutral-strong:    #787878;  /* Neutral.Strong    → Boulder.500 */
  --color-neutral-stronger:  #444444;  /* Neutral.Stronger  → Boulder.700 */
  --color-neutral-strongest: #1D1D1D;  /* Neutral.Strongest → Boulder.900 */

  /* ── SCREEN (Boulder) ── */
  --color-screen-soft:    #F5F5F5;    /* Screen.Soft    → Boulder.100 */
  --color-screen-softest: #E9E9E9;    /* Screen.Softest → Boulder.200 */

  /* ── TONAL (Boulder) ── */
  --color-tonal-default: #F5F5F5;    /* Tonal.Default  → Boulder.100 */
  --color-tonal-hover:   #E9E9E9;    /* Tonal.Hover    → Boulder.200 */
  --color-tonal-pressed: #D6D6D6;    /* Tonal.Pressed  → Boulder.300 */

  /* ── BORDER RADIUS (pill style) ── */
  --radius-button: 999px;   /* Button       → {full} = 999px */
  --radius-input:  999px;   /* Border-Input → {full} = 999px */
  --radius-box:    24px;    /* Box          → {2XL} = 24px ⚠️ (IT=8px, no confundir con 2xl=16px) */
  --radius-base:   26px;    /* Radius       → {custom} = 26px */

  /* ── SIN CAMBIOS vs IT ──
     Info, Success, Warning, Error, Alert, Accent → mismos valores en ambos themes
     Screen.Base, Neutral.White/Black → mismos valores
     Spacing, Typography sizes, Shadows, Letter-spacing, Brand → sin cambios
     ⚠️ text-xxs NO existe en Arcus Semantics (omitir si se usa Open Sans)
  */
}
```

---

## Tabla de diferencias IT vs Arcus — fuente tokens penpot.json · 2026-05-13

> Total: 33 tokens difieren entre `IT DS/IT Semantics` y `IT DS/Arcus Semantics`

### Font

| Token | IT | Arcus |
|---|---|---|
| `FontFamily` | `DM Sans` | `Open Sans` |

### Radius

| Token | IT → valor | Arcus → valor |
|---|---|---|
| `Button` | `{lg}` = **8px** | `{full}` = **999px** (pill) |
| `Border-Input` | `{lg}` = **8px** | `{full}` = **999px** (pill) |
| `Box` | `{lg}` = **8px** | `{2XL}` = **24px** ⚠️ |
| `Radius` | `{lg}` = **8px** | `{custom}` = **26px** |

> ⚠️ `Box` en Arcus usa el token `{2XL}` (uppercase) del primitivo = fontSizes 24px. No confundir con `{2xl}` (lowercase) = borderRadius 16px. El JSON exportado desde Penpot usa `{2XL}` → valor resuelto = **24px**.

### Theme

| Token | IT (Blue) | IT hex | Arcus (Black/Shamrock) | Arcus hex |
|---|---|---|---|---|
| `Theme.Primary` | Blue.600 | `#2563EB` | Monochrome.Black | `#000000` |
| `Theme.Hover` | Blue.700 | `#1D4ED8` | Boulder.800 | `#2D2D2D` |
| `Theme.Pressed` | Blue.800 | `#1E40AF` | Boulder.900 | `#1D1D1D` |
| `Theme.Filled` | Blue.900 | `#1E3A8A` | Monochrome.Black | `#000000` |
| `Theme.Disabled` | Blue.400 | `#60A5FA` | Boulder.400 | `#A6A6A6` |
| `Theme.Contrast` | Monochrome.White | `#FFFFFF` | Monochrome.Black | `#000000` ⚠️ |
| `Theme.Accent` | Blue.600 | `#2563EB` | Shamrock.400 | `#2CDFA6` |
| `Theme.Soft` | Blue.400 | `#60A5FA` | Shamrock.400 | `#2CDFA6` |
| `Theme.Softer` | Blue.300 | `#93C5FD` | Shamrock.300 | `#65F0BF` |
| `Theme.Softest` | Blue.100 | `#DBEAFE` | Shamrock.100 | `#CEFDE7` |
| `Theme.Strong` | Blue.500 | `#3B82F6` | Shamrock.500 | `#04C58E` |
| `Theme.Stronger` | Blue.700 | `#1D4ED8` | Shamrock.700 | `#008061` |
| `Theme.Strongest` | Blue.900 | `#1E3A8A` | Shamrock.900 | `#015341` |

> ⚠️ `Theme.Contrast` en Arcus = `#000000`. El botón primary usa `color: #FFFFFF` hardcodeado en components.css — **nunca** usar `var(--color-theme-contrast)` para texto sobre fondo negro en Arcus.

### Neutral (Lynch → Boulder)

| Token | IT Lynch | IT hex | Arcus Boulder | Arcus hex |
|---|---|---|---|---|
| `Neutral.Softest` | Lynch.100 | `#F1F5F9` | Boulder.100 | `#F5F5F5` |
| `Neutral.Softer` | Lynch.300 | `#CBD5E1` | Boulder.300 | `#D6D6D6` |
| `Neutral.Soft` | Lynch.400 | `#94A3B8` | Boulder.400 | `#A6A6A6` |
| `Neutral.Disabled` | Lynch.400 | `#94A3B8` | Boulder.400 | `#A6A6A6` |
| `Neutral.Default` | Lynch.600 | `#475569` | Boulder.600 | `#585858` |
| `Neutral.Strong` | Lynch.500 | `#64748B` | Boulder.500 | `#787878` |
| `Neutral.Stronger` | Lynch.700 | `#334155` | Boulder.700 | `#444444` |
| `Neutral.Hover` | Lynch.700 | `#334155` | Boulder.700 | `#444444` |
| `Neutral.Pressed` | Lynch.800 | `#1E293B` | Boulder.800 | `#2D2D2D` |
| `Neutral.Filled` | Lynch.900 | `#0F172A` | Boulder.900 | `#1D1D1D` |
| `Neutral.Strongest` | Lynch.900 | `#0F172A` | Boulder.900 | `#1D1D1D` |

### Tonal y Screen

| Token | IT | IT hex | Arcus | Arcus hex |
|---|---|---|---|---|
| `Tonal.Default` | Lynch.100 | `#F1F5F9` | Boulder.100 | `#F5F5F5` |
| `Tonal.Hover` | Lynch.200 | `#E2E8F0` | Boulder.200 | `#E9E9E9` |
| `Tonal.Pressed` | Lynch.300 | `#CBD5E1` | Boulder.300 | `#D6D6D6` |
| `Screen.Soft` | Lynch.100 | `#F1F5F9` | Boulder.100 | `#F5F5F5` |
| `Screen.Softest` | Lynch.50 | `#FCF8F8` | Boulder.200 | `#E9E9E9` |

### Tokens solo en IT (no existen en Arcus)

| Token | Valor |
|---|---|
| `Opacity.Soft` | 20% → `--opacity-soft: 0.20` |
| `Opacity.Medium` | 40% → `--opacity-medium: 0.40` |
| `Opacity.Strong` | 60% → `--opacity-strong: 0.60` |
| `Input` (spacing) | `{spacing.3}` = 12px |
| `text-xxs.*` | 10px — NO existe en Arcus Semantics |

### Tokens idénticos en ambos themes

Accent.\* (Purple) · Alert.\* (Orange) · Error.\* (Red) · Info.\* (Blue) · Success.\* (Green) · Warning.\* (Yellow) · Neutral.Black · Neutral.White · Screen.Base · Weight-Bold/Medium/Regular · Spacing · Shadows · Letter-spacing · Brand · Transparent.Black

---

## Paleta primitiva Boulder (Arcus neutral) — valores exactos Penpot

> Fuente directa: `IT DS/Primitive` token set · tokens penpot.json

| Token Penpot | Hex | Variable CSS equivalente |
|---|---|---|
| `Boulder.50` | `#FAFAFA` | — |
| `Boulder.100` | `#F5F5F5` | `--color-neutral-softest` / `--color-tonal-default` / `--color-screen-soft` (Arcus) |
| `Boulder.200` | `#E9E9E9` | `--color-tonal-hover` / `--color-screen-softest` (Arcus) |
| `Boulder.300` | `#D6D6D6` | `--color-neutral-softer` / `--color-tonal-pressed` (Arcus) |
| `Boulder.400` | `#A6A6A6` | `--color-neutral-soft` / `--color-neutral-disabled` / `--color-theme-disabled` (Arcus) |
| `Boulder.500` | `#787878` | `--color-neutral-strong` (Arcus) |
| `Boulder.600` | `#585858` | `--color-neutral-default` (Arcus) |
| `Boulder.700` | `#444444` | `--color-neutral-hover` / `--color-neutral-stronger` (Arcus) |
| `Boulder.800` | `#2D2D2D` | `--color-neutral-pressed` / `--color-theme-hover` (Arcus) |
| `Boulder.900` | `#1D1D1D` | `--color-neutral-filled` / `--color-neutral-strongest` / `--color-theme-pressed` (Arcus) |

---

## Tipografía — valores confirmados vía Penpot MCP · 2026-05-13

### Line-height: 1.25 en todos los niveles — uniforme

> Confirmado MCP en vivo: **todos** los tokens de tipografía (text-xxs → text-8xl, Regular/Medium/Bold) usan `lineHeight: "1.25"` sin excepción. No hay variación por nivel ni por peso.

```css
/* Regla absoluta: siempre usar --line-height en todos los textos IT DS */
line-height: var(--line-height); /* = 1.25 */
```

### Letter-spacing: escala independiente, NO vinculada por nivel

> **Hallazgo crítico MCP:** Los tokens de tipografía en Penpot (`text-xs.Regular`, `text-6xl.Bold`, etc.) **NO incluyen letter-spacing** en su definición. La escala `letter-spacing.*` existe como set primitivo separado que los diseñadores aplican manualmente por componente.

**Consecuencia para el skill:** No hay un mapeo canónico "text-6xl usa letter-spacing-X" extraíble desde Penpot. El skill **no debe asumir** qué letter-spacing corresponde a cada nivel tipográfico a menos que el diseño en Penpot lo especifique explícitamente en el componente.

| Cuándo aplicar letter-spacing | Cómo determinarlo |
|---|---|
| Titulares grandes (text-4xl+) | Leer el valor `letterSpacing` del shape de texto en Penpot MCP |
| Componentes con texto body | Generalmente `letter-spacing: normal` (no se aplica token) |
| Componentes con labels/badges | Leer del shape — puede ser none o un valor pequeño |

**Regla de inspección:** Al encontrar un shape de tipo `Text` en Penpot, leer `shape.letterSpacing` antes de generar el CSS. Si el valor es 0 o vacío, no aplicar ningún token de letter-spacing.

### Escala de tipografía — niveles disponibles en IT y Arcus

| Variable CSS | Token Penpot | Tamaño | Pesos disponibles | Solo en |
|---|---|---|---|---|
| `--text-xxs` | `XXS` | 10px | Regular · Medium · Bold | IT únicamente |
| `--text-xs` | `XS` | 12px | Regular · Medium · Bold | IT + Arcus |
| `--text-sm` | `SM` | 14px | Regular · Medium · Bold | IT + Arcus |
| `--text-base` | `Base` | 16px | Regular · Medium · Bold | IT + Arcus |
| `--text-lg` | `LG` | 18px | Regular · Medium · Bold | IT + Arcus |
| `--text-xl` | `XL` | 20px | Regular · Medium · Bold | IT + Arcus |
| `--text-2xl` | `2XL` | 24px | Regular · Medium · Bold | IT + Arcus |
| `--text-3xl` | `3XL` | 30px | Regular · Medium · Bold | IT + Arcus |
| `--text-4xl` | `4XL` | 36px | Regular · Medium · Bold | IT + Arcus |
| `--text-5xl` | `5XL` | 48px | Regular · Medium · Bold | IT + Arcus |
| `--text-6xl` | `6XL` | 60px | Regular · Medium · Bold | IT + Arcus |
| `--text-7xl` | `7XL` | 72px | Regular · Medium · Bold | IT + Arcus |
| `--text-8xl` | `8XL` | 96px | Regular · Medium · Bold | IT + Arcus |

> ⚠️ `text-xxs` (10px) solo existe en `IT DS/IT Semantics`. El set de Arcus Semantics no lo incluye — no usar con Open Sans.

---

## ⚠️ Notas críticas de spacing

El naming de tokens de spacing en Penpot **no es secuencial** — tener en cuenta:

| Token Penpot | Variable CSS | Valor real |
|---|---|---|
| `spacing.0-5` | `--spacing-0-5` | **4px** (no 2px) |
| `spacing.1` | `--spacing-1` | **2px** (no 4px) |
| `spacing.2` | `--spacing-2` | 8px |
| `spacing.3` | `--spacing-3` | 12px |
| `spacing.4` | `--spacing-4` | **16px ← padding body + gap secciones** |
| `spacing.6` | `--spacing-6` | **24px ← gap entre componentes body** |
| `spacing.8` | `--spacing-8` | 32px |
| `spacing.12` | `--spacing-12` | 48px |
| `spacing.16` | `--spacing-16` | 64px (Icon Box size) |
| `spacing.24` | `--spacing-24` | 96px |
| `spacing.32` | `--spacing-32` | 128px |

> ⚠️ **No existen** `spacing.5` (20px) ni `spacing.7` (28px) en el IT DS. Usar el valor en `px` directamente.

### Spacing negativo

| Token Penpot | Variable CSS | Valor |
|---|---|---|
| `negative.-1` | `--spacing-neg-1` | -4px |
| `negative.-2` | `--spacing-neg-2` | -8px |
| `negative.-3` | `--spacing-neg-3` | -12px |
| `negative.-4` | `--spacing-neg-4` | -16px |
| `negative.-6` | `--spacing-neg-6` | -24px |

---

## ⚠️ Notas críticas de sombras

Las sombras usan los colores `Transparent.Black.200/300/400` del primitivo:

| Variable | Valor exacto Penpot | Cómo se traduce |
|---|---|---|
| `--shadow-down-s` | offsetY:1 · blur:3 · spread:0 · Black.200 | `0 1px 3px 0 rgba(0,0,0,0.20)` |
| `--shadow-down-m` | offsetY:1 · blur:8 · spread:-1 · Black.300 | `0 1px 8px -1px rgba(0,0,0,0.30)` |
| `--shadow-down-l` | offsetY:2 · blur:15 · spread:-3 · Black.400 | `0 2px 15px -3px rgba(0,0,0,0.40)` |
| `--shadow-up-s` | offsetY:-1 · blur:3 · spread:0 · Black.200 | `0 -1px 3px 0 rgba(0,0,0,0.20)` |
| `--shadow-up-m` | offsetY:-1 · blur:8 · spread:-1 · Black.300 | `0 -1px 8px -1px rgba(0,0,0,0.30)` |
| `--shadow-up-l` | offsetY:-2 · blur:15 · spread:-3 · Black.400 | `0 -2px 15px -3px rgba(0,0,0,0.40)` |

---

## Tabla rápida de tokens de color por rol

| Rol en UI | Variable CSS | Token IT DS |
|---|---|---|
| Fondo base | `var(--color-screen-base)` | `Screen.Base` = #FFFFFF |
| Fondo suave | `var(--color-screen-soft)` | `Screen.Soft` IT=#F1F5F9 · Arcus=#F5F5F5 |
| Color primario | `var(--color-theme-primary)` | `Theme.Primary` IT=#2563EB · Arcus=#000000 |
| Hover primario | `var(--color-theme-hover)` | `Theme.Hover` |
| Texto principal | `var(--color-neutral-strongest)` | `Neutral.Strongest` |
| Texto secundario | `var(--color-neutral-default)` | `Neutral.Default` |
| Borde / divisor | `var(--color-neutral-softer)` | `Neutral.Softer` |
| Superficie tonal | `var(--color-tonal-default)` | `Tonal.Default` |
| Error | `var(--color-error-default)` | `Error.Default` |
| Éxito | `var(--color-success-default)` | `Success.Default` |
| Advertencia | `var(--color-warning-default)` | `Warning.Default` |
| Info / Theme IT | `var(--color-info-default)` | `Info.Default` = Blue.600 |
| Overlay oscuro | `var(--color-black-500)` | `Transparent.Black.500` = rgba(0,0,0,0.50) |
| Paris (brand) | `var(--color-brand-paris)` | `Brand.Paris` = #006DFF |
