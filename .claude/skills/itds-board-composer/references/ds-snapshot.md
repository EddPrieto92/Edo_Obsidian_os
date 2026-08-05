# IT DS — Penpot Design System Snapshot
> **Archivo Penpot:** IT DS | Components
> Cencosud IT Design System — Extraído directamente desde Penpot vía MCP
> **Fecha de extracción:** 2026-05-26 (v4.1 — audit completo con validación cruzada)
> **Total componentes en librería:** 1354 | **Total páginas:** 68

---

## ÍNDICE
1. [Token Sets](#1-token-sets)
2. [Tokens Primitivos](#2-tokens-primitivos)
3. [Tokens Semánticos — IT DS](#3-tokens-semánticos--it-ds)
4. [Tokens Semánticos — Arcus](#4-tokens-semánticos--arcus)
5. [Componentes — Referencia completa](#5-componentes--referencia-completa)
6. [Páginas del archivo](#6-páginas-del-archivo)
7. [Notas de calidad](#7-notas-de-calidad)

---

## 1. TOKEN SETS

El archivo tiene 3 sets de tokens activos:

| Set | Descripción |
|-----|-------------|
| `IT DS/Primitive` | Valores base: paletas de color, spacing, radius, tipografía, sombras |
| `IT DS/IT Semantics` | Semántica aplicada al tema IT DS (Blue como Theme) |
| `IT DS/Arcus Semantics` | Semántica aplicada al tema Arcus (variante de marca) |

---

## 2. TOKENS PRIMITIVOS

### 2.1 Colores — Paletas cromáticas

| Token | Hex |
|-------|-----|
| `Shamrock.50` | #EBFEF6 |
| `Shamrock.100` | #CEFDE7 |
| `Shamrock.200` | #A2F8D4 |
| `Shamrock.300` | #65F0BF |
| `Shamrock.400` | #2CDFA6 |
| `Shamrock.500` | #04C58E |
| `Shamrock.600` | #00A074 |
| `Shamrock.700` | #008061 |
| `Shamrock.800` | #00654E |
| `Shamrock.900` | #015341 |
| `Shamrock.950` | #013227 |
| `Shamrock.1000` | #001A15 |
| `Purple.25` | #FBFAFF |
| `Purple.50` | #F5F3FF |
| `Purple.100` | #EDE9FE |
| `Purple.200` | #DDD6FE |
| `Purple.300` | #C4B5FD |
| `Purple.400` | #A78BFA |
| `Purple.500` | #8B5CF6 |
| `Purple.600` | #7C3AED |
| `Purple.700` | #6D28D9 |
| `Purple.800` | #5B21B6 |
| `Purple.900` | #4C1D95 |
| `Purple.950` | #2C1155 |
| `Purple.1000` | #16082B |
| `Red.25` | #FEF6F6 |
| `Red.50` | #FEF2F2 |
| `Red.100` | #FEE2E2 |
| `Red.200` | #FECACA |
| `Red.300` | #FCA5A5 |
| `Red.400` | #F87171 |
| `Red.500` | #EF4444 |
| `Red.600` | #DC2626 |
| `Red.700` | #B91C1C |
| `Red.800` | #991B1B |
| `Red.900` | #7F1D1D |
| `Red.950` | #531313 |
| `Red.1000` | #2A0909 |
| `Orange.25` | #FFFBF6 |
| `Orange.50` | #FFF7ED |
| `Orange.100` | #FFEDD5 |
| `Orange.200` | #FED7AA |
| `Orange.300` | #FDBA74 |
| `Orange.400` | #FB923C |
| `Orange.500` | #F97316 |
| `Orange.600` | #EA580C |
| `Orange.700` | #C2410C |
| `Orange.800` | #9A3412 |
| `Orange.900` | #7C2D12 |
| `Orange.950` | #59200D |
| `Orange.1000` | #2D1006 |
| `Yellow.25` | #FFFDF5 |
| `Yellow.50` | #FFFBEB |
| `Yellow.100` | #FEF3C7 |
| `Yellow.200` | #FDE68A |
| `Yellow.300` | #FCD34D |
| `Yellow.400` | #FBBF24 |
| `Yellow.500` | #F59E0B |
| `Yellow.600` | #D97706 |
| `Yellow.700` | #B45309 |
| `Yellow.800` | #92400E |
| `Yellow.900` | #78350F |
| `Yellow.950` | #5B280B |
| `Yellow.1000` | #2D1406 |
| `Green.25` | #FAFEFC |
| `Green.50` | #F0FDF4 |
| `Green.100` | #DCFCE7 |
| `Green.200` | #BBF7D0 |
| `Green.300` | #86EFAC |
| `Green.400` | #4ADE80 |
| `Green.500` | #22C55E |
| `Green.600` | #16A34A |
| `Green.700` | #16803C |
| `Green.800` | #166534 |
| `Green.900` | #14532D |
| `Green.950` | #0A2916 |
| `Green.1000` | #02180A |
| `Blue.25` | #F5FAFF |
| `Blue.50` | #E6F2FE |
| `Blue.100` | #DBEAFE |
| `Blue.200` | #BFDBFE |
| `Blue.300` | #93C5FD |
| `Blue.400` | #60A5FA |
| `Blue.500` | #3B82F6 |
| `Blue.600` | #2563EB |
| `Blue.700` | #1D4ED8 |
| `Blue.800` | #1E40AF |
| `Blue.900` | #1E3A8A |
| `Blue.950` | #122354 |
| `Blue.1000` | #09122A |
| `Boulder.50` | #FAFAFA |
| `Boulder.100` | #F5F5F5 |
| `Boulder.200` | #E9E9E9 |
| `Boulder.300` | #D6D6D6 |
| `Boulder.400` | #A6A6A6 |
| `Boulder.500` | #787878 |
| `Boulder.600` | #585858 |
| `Boulder.700` | #444444 |
| `Boulder.800` | #2D2D2D |
| `Boulder.900` | #1D1D1D |
| `Lynch.50` | #FCF8F8 |
| `Lynch.100` | #F1F5F9 |
| `Lynch.200` | #E2E8F0 |
| `Lynch.300` | #CBD5E1 |
| `Lynch.400` | #94A3B8 |
| `Lynch.500` | #64748B |
| `Lynch.600` | #475569 |
| `Lynch.700` | #334155 |
| `Lynch.800` | #1E293B |
| `Lynch.900` | #0F172A |
| `Monochrome.White` | #FFFFFF |
| `Monochrome.Black` | #000000 |

### 2.2 Colores — Transparencias (Transparent.Black)
Tokens `Transparent.Black.0` → `Transparent.Black.950` — todos resuelven a #000000 con opacidad variable.

### 2.3 Colores — Marcas Cencosud

| Token | Hex | Marca |
|-------|-----|-------|
| `Brand.Paris` | #006DFF | París |
| `Brand.Jumbo` | #19AD49 | Jumbo |
| `Brand.SantaIsabel` | #DF0F20 | Santa Isabel |
| `Brand.Easy` | #DF1122 | Easy |
| `Brand.Spid` | #E8308A | Spid |
| `Brand.Disco` | #E82227 | Disco |
| `Brand.Metro-BG` | #FFEC00 | Metro (fondo) |
| `Brand.MetroText` | #E30016 | Metro (texto) |
| `Brand.Wong` | #C01717 | Wong |
| `Brand.Vea-BG` | #FFCD00 | Vea (fondo) |
| `Brand.Vea-Text` | #E1251B | Vea (texto) |
| `Brand.Bretas` | #F08700 | Bretas |
| `Brand.Perini` | #C10230 | Perini |
| `Brand.Prezunic` | #005CB9 | Prezunic |
| `Brand.Blaisten` | #5B6670 | Blaisten |
| `Brand.Mercantil-BG` | #FFCD00 | Mercantil (fondo) |
| `Brand.Mercantil-Text` | #003595 | Mercantil (texto) |
| `Brand.GBarbosa` | #E30918 | GBarbosa |
| `Brand.Giga` | #00673C | Giga |

### 2.4 Spacing

| Token | Valor (px) |
|-------|-----------|
| `spacing.0` | 0 |
| `spacing.1` | 2 |
| `spacing.0-5` | 4 |
| `spacing.2` | 8 |
| `spacing.3` | 12 |
| `spacing.4` | 16 |
| `spacing.6` | 24 |
| `spacing.8` | 32 |
| `spacing.12` | 48 |
| `spacing.16` | 64 |
| `spacing.24` | 96 |
| `spacing.32` | 128 |
| `negative.-1` | -4 |
| `negative.-2` | -8 |
| `negative.-3` | -12 |
| `negative.-4` | -16 |
| `negative.-6` | -24 |

### 2.5 Border Radius

| Token | Valor (px) |
|-------|-----------|
| `none` | 0 |
| `sm` | 4 |
| `lg` | 8 |
| `xl` | 12 |
| `2xl` | 16 |
| `3xl` | 24 |
| `custom` | 26 |
| `full` | 999 |

### 2.6 Border Width

| Token | Valor (px) |
|-------|-----------|
| `1` | 1 |
| `2` | 2 |

### 2.7 Opacity

| Token | Valor |
|-------|-------|
| `0` | 0 |
| `10` | 0.1 |
| `20` | 0.2 |
| `30` | 0.3 |
| `40` | 0.4 |
| `50` | 0.5 |
| `60` | 0.6 |
| `70` | 0.7 |
| `80` | 0.8 |
| `90` | 0.9 |

### 2.8 Font Sizes

| Token | Valor (px) |
|-------|-----------|
| `XXS` | 10 |
| `XS` | 12 |
| `SM` | 14 |
| `Base` | 16 |
| `LG` | 18 |
| `XL` | 20 |
| `2XL` | 24 |
| `3XL` | 30 |
| `4XL` | 36 |
| `5XL` | 48 |
| `6XL` | 60 |
| `7XL` | 72 |
| `8XL` | 96 |

### 2.9 Font Weights

| Token | Valor |
|-------|-------|
| `100` | thin |
| `200` | extralight |
| `300` | light |
| `400` | regular |
| `500` | medium |
| `600` | semibold |
| `700` | bold |
| `800` | extrabold |

### 2.10 Font Families

| Token | Familia |
|-------|---------|
| `DMSans` | DM Sans |
| `Poppins` | Poppins |
| `Montserrat` | Montserrat |
| `OpenSans` | Open Sans |

### 2.11 Letter Spacing

| Token | Valor (px) |
|-------|-----------|
| `letter-spacing.none` | 0 |
| `letter-spacing.100` | -0.4 |
| `letter-spacing.200` | -0.5 |
| `letter-spacing.300` | -0.6 |
| `letter-spacing.400` | -0.7 |
| `letter-spacing.500` | -0.8 |
| `letter-spacing.600` | -0.9 |
| `letter-spacing.700` | -1.0 |
| `letter-spacing.800` | -1.2 |
| `letter-spacing.900` | -1.4 |
| `letter-spacing.1000` | -1.5 |
| `letter-spacing.1100` | -2.4 |
| `letter-spacing.1200` | -2.8 |
| `letter-spacing.1300` | -3.4 |
| `letter-spacing.1400` | -4.8 |

### 2.12 Shadows

Tokens disponibles: `Shadow-Down.S` | `Shadow-Down.M` | `Shadow-Down.L` | `Shadow-Up.S` | `Shadow-Up.M` | `Shadow-Up.L`

---

## 3. TOKENS SEMÁNTICOS — IT DS

> El tema IT DS usa **Blue** como color primario (Theme). Font: **DM Sans**.

### 3.1 Colores semánticos

#### Theme (Primario — Blue)
| Token | Referencia | Hex |
|-------|-----------|-----|
| `Theme.Primary` | {Blue.600} | #2563EB |
| `Theme.Hover` | {Blue.700} | #1D4ED8 |
| `Theme.Pressed` | {Blue.800} | #1E40AF |
| `Theme.Filled` | {Blue.900} | #1E3A8A |
| `Theme.Disabled` | {Blue.400} | #60A5FA |
| `Theme.Accent` | {Blue.600} | #2563EB |
| `Theme.Contrast` | {Monochrome.White} | #FFFFFF |
| `Theme.Softest` | {Blue.100} | #DBEAFE |
| `Theme.Softer` | {Blue.300} | #93C5FD |
| `Theme.Soft` | {Blue.400} | #60A5FA |
| `Theme.Strong` | {Blue.500} | #3B82F6 |
| `Theme.Stronger` | {Blue.700} | #1D4ED8 |
| `Theme.Strongest` | {Blue.900} | #1E3A8A |

#### Info (Blue)
| Token | Hex | | Token | Hex |
|-------|-----|-|-------|-----|
| `Info.Default` | #2563EB | | `Info.Softest` | #DBEAFE |
| `Info.Hover` | #1D4ED8 | | `Info.Softer` | #BFDBFE |
| `Info.Pressed` | #1E40AF | | `Info.Soft` | #93C5FD |
| `Info.Filled` | #122354 | | `Info.Strong` | #3B82F6 |
| `Info.Disabled` | #60A5FA | | `Info.Stronger` | #1D4ED8 |
| | | | `Info.Strongest` | #1E3A8A |

#### Success (Green)
| Token | Hex | | Token | Hex |
|-------|-----|-|-------|-----|
| `Success.Default` | #16A34A | | `Success.Softest` | #DCFCE7 |
| `Success.Hover` | #16803C | | `Success.Softer` | #BBF7D0 |
| `Success.Pressed` | #166534 | | `Success.Soft` | #86EFAC |
| `Success.Filled` | #0A2916 | | `Success.Strong` | #22C55E |
| `Success.Disabled` | #4ADE80 | | `Success.Stronger` | #16803C |
| | | | `Success.Strongest` | #14532D |

#### Warning (Yellow)
| Token | Hex | | Token | Hex |
|-------|-----|-|-------|-----|
| `Warning.Default` | #D97706 | | `Warning.Softest` | #FEF3C7 |
| `Warning.Hover` | #B45309 | | `Warning.Softer` | #FDE68A |
| `Warning.Pressed` | #92400E | | `Warning.Soft` | #FCD34D |
| `Warning.Filled` | #5B280B | | `Warning.Strong` | #F59E0B |
| `Warning.Disabled` | #FBBF24 | | `Warning.Stronger` | #B45309 |
| | | | `Warning.Strongest` | #78350F |

#### Alert (Orange)
| Token | Hex | | Token | Hex |
|-------|-----|-|-------|-----|
| `Alert.Default` | #EA580C | | `Alert.Softest` | #FFEDD5 |
| `Alert.Hover` | #C2410C | | `Alert.Softer` | #FED7AA |
| `Alert.Pressed` | #9A3412 | | `Alert.Soft` | #FDBA74 |
| `Alert.Filled` | #59200D | | `Alert.Strong` | #F97316 |
| `Alert.Disabled` | #FB923C | | `Alert.Stronger` | #C2410C |
| | | | `Alert.Strongest` | #7C2D12 |

#### Error (Red)
| Token | Hex | | Token | Hex |
|-------|-----|-|-------|-----|
| `Error.Default` | #DC2626 | | `Error.Softest` | #FEE2E2 |
| `Error.Hover` | #B91C1C | | `Error.Softer` | #FECACA |
| `Error.Pressed` | #991B1B | | `Error.Soft` | #FCA5A5 |
| `Error.Filled` | #531313 | | `Error.Strong` | #EF4444 |
| `Error.Disabled` | #F87171 | | `Error.Stronger` | #B91C1C |
| | | | `Error.Strongest` | #7F1D1D |

#### Accent (Purple)
| Token | Hex | | Token | Hex |
|-------|-----|-|-------|-----|
| `Accent.Default` | #7C3AED | | `Accent.Softest` | #EDE9FE |
| `Accent.Hover` | #6D28D9 | | `Accent.Softer` | #DDD6FE |
| `Accent.Pressed` | #5B21B6 | | `Accent.Soft` | #C4B5FD |
| `Accent.Filled` | #2C1155 | | `Accent.Strong` | #8B5CF6 |
| `Accent.Disabled` | #A78BFA | | `Accent.Stronger` | #6D28D9 |
| | | | `Accent.Strongest` | #4C1D95 |

#### Neutral (Lynch / Slate)
| Token | Hex | | Token | Hex |
|-------|-----|-|-------|-----|
| `Neutral.Default` | #475569 | | `Neutral.Softest` | #F1F5F9 |
| `Neutral.Hover` | #334155 | | `Neutral.Softer` | #CBD5E1 |
| `Neutral.Pressed` | #1E293B | | `Neutral.Soft` | #94A3B8 |
| `Neutral.Filled` | #0F172A | | `Neutral.Strong` | #64748B |
| `Neutral.Disabled` | #94A3B8 | | `Neutral.Stronger` | #334155 |
| `Neutral.White` | #FFFFFF | | `Neutral.Strongest` | #0F172A |
| `Neutral.Black` | #000000 | | | |

#### Tonal y Screen
| Token | Hex |
|-------|-----|
| `Tonal.Default` | #F1F5F9 |
| `Tonal.Hover` | #E2E8F0 |
| `Tonal.Pressed` | #CBD5E1 |
| `Screen.Base` | #FFFFFF |
| `Screen.Soft` | #F1F5F9 |
| `Screen.Softest` | #FCF8F8 |

### 3.2 Otros tokens semánticos (IT DS)

| Tipo | Token | Referencia | Valor |
|------|-------|-----------|-------|
| borderRadius | `Button` | {lg} | 8px |
| borderRadius | `Border-Input` | {lg} | 8px |
| borderRadius | `Radius` | {lg} | 8px |
| borderRadius | `Box` | {lg} | 8px |
| fontFamilies | `FontFamily` | — | DM Sans |
| fontWeights | `Weight-Bold` | — | bold |
| fontWeights | `Weight-Medium` | — | medium |
| fontWeights | `Weight-Regular` | — | regular |
| opacity | `Soft` | — | 0.2 (20%) |
| opacity | `Medium` | — | 0.4 (40%) |
| opacity | `Strong` | — | 0.6 (60%) |
| spacing | `Input` | {spacing.3} | 12px |

### 3.3 Tipografías (IT DS)
> Font: **DM Sans** | Line-height: **1.25** para todos los tokens

| Token | Font Size | Weight |
|-------|-----------|--------|
| `text-xxs.Regular` | 10px | Regular |
| `text-xxs.Medium` | 10px | Medium |
| `text-xxs.Bold` | 10px | Bold |
| `text-xs.Regular` | 12px | Regular |
| `text-xs.Medium` | 12px | Medium |
| `text-xs.Bold` | 12px | Bold |
| `text-sm.Regular` | 14px | Regular |
| `text-sm.Medium` | 14px | Medium |
| `text-sm.Bold` | 14px | Bold |
| `text-base.Regular` | 16px | Regular |
| `text-base.Medium` | 16px | Medium |
| `text-base.Bold` | 16px | Bold |
| `text-lg.Regular` | 18px | Regular |
| `text-lg.Medium` | 18px | Medium |
| `text-lg.Bold` | 18px | Bold |
| `text-xl.Regular` | 20px | Regular |
| `text-xl.Medium` | 20px | Medium |
| `text-xl.Bold` | 20px | Bold |
| `text-2xl.Regular` | 24px | Regular |
| `text-2xl.Medium` | 24px | Medium |
| `text-2xl.Bold` | 24px | Bold |
| `text-3xl.Regular` | 30px | Regular |
| `text-3xl.Medium` | 30px | Medium |
| `text-3xl.Bold` | 30px | Bold |
| `text-4xl.Regular` | 36px | Regular |
| `text-4xl.Medium` | 36px | Medium |
| `text-4xl.Bold` | 36px | Bold |
| `text-5xl.Regular` | 48px | Regular |
| `text-5xl.Medium` | 48px | Medium |
| `text-5xl.Bold` | 48px | Bold |
| `text-6xl.Regular` | 60px | Regular |
| `text-6xl.Medium` | 60px | Medium |
| `text-6xl.Bold` | 60px | Bold |
| `text-7xl.Regular` | 72px | Regular |
| `text-7xl.Medium` | 72px | Medium |
| `text-7xl.Bold` | 72px | Bold |
| `text-8xl.Regular` | 96px | Regular |
| `text-8xl.Medium` | 96px | Medium |
| `text-8xl.Bold` | 96px | Bold |

---

## 4. TOKENS SEMÁNTICOS — ARCUS

> Arcus usa la misma estructura semántica que IT DS pero con valores de paleta propios.
> Mismos tipos: Theme, Info, Success, Warning, Alert, Error, Accent, Neutral, Tonal, Screen.
> Mismos tokens de tipografía (text-xs → text-8xl × Regular/Medium/Bold), sin text-xxs.
> Font Family Arcus: definida en `IT DS/Arcus Semantics > FontFamily`.

---

## 5. COMPONENTES — REFERENCIA COMPLETA

> **Convenciones de uso:**
> - Nombre exacto del VariantContainer para instanciar vía `lib.components.find(c => c.name === '...')`
> - Properties = dimensiones de variación disponibles en Penpot
> - Valores posibles por propiedad
> - Total = número de variantes en el contenedor
>
> **Nota — componentes sin componentProperties (validado MCP 2026-05-13):**
> Los siguientes componentes devuelven `props: []` en MCP — no tienen `componentProperties` en Penpot.
> Su "variante" se selecciona eligiendo el contenedor correcto por **path completo**, no via `switchVariant()`.
> Afecta a: CSAT · FilterPanel · FileUploader · ImageUpload · Menu · OtpInput · PhoneInput · ProductEcommerce · ProgressCheckpoint · ProgressCircle · Rating · Skeleton
> ```js
> // ✅ Correcto para componentes sin componentProperties
> const comp = lib.components.find(c => c.path === 'Rating / Size=L' && c.name === 'Theme');
> // ❌ Incorrecto — switchVariant() no funcionará en estos componentes
> ```

---

### ACCORDION
**Página:** `↳ Accordion`

| Contenedor | variantProps | Total |
|-----------|-------|-------|
| path | name | Total |
|-----------|-------|-------|
| `Accordion` | `Default Close` | 1 |
| `Accordion` | `Default Open Content` | 1 |
| `Accordion` | `Default Open Text` | 1 |
| `Accordion` | `Box Close` | 1 |
| `Accordion` | `Box Open Content` | 1 |
| `Accordion` | `Box Open Text` | 1 |

⚠️ v3: el path es solo `Accordion` — el variant es el **name**. `findComponent("Accordion", "Default Open Content")`.
**Resumen:** 6 componentes principales + 4 TrailingItems + 1 Utilities/Container = **11 total**.

**Paths MCP — texto:** cada main instance es una galería de 4 filas (simple / con checkbox / con trailing items ×2)
- Título: `inst.children[0].children[0].children[0].characters`
- Subtítulo: `inst.children[0].children[0].children[1].characters`

**Utilities trailing items:** `Accordion / Utilities TrailingItems / Tag|Badge|Button|Icon` — variantProps null ✅
**Utilities container:** `Accordion / Utilities` (name=`Container`) — board estructural base ✅

---

### ACTION BUTTONS
**Página:** `↳ ActionButtons`

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `ActionButtons / FilledButtons` | — | Size=LG / Size=MD / Size=SM | 3 |
| `ActionButtons / HuggedButtons` | — | Size=LG / Size=MD / Size=SM | 3 |
| `ActionButtons / VerticalButtons` | — | Size=LG / Size=MD / Size=SM | 3 |

⚠️ v3: `ActionButtons / Default` (con variantProp Variant) ya no existe. Los 3 tipos son ahora boards
   directos bajo `ActionButtons / {FilledButtons|HuggedButtons|VerticalButtons}` con nombre `Size=LG/MD/SM`.
   El prefijo `Utilities/` también fue eliminado.

---

### ACTION ICON
**Página:** `↳ ActionIcon`

| Contenedor | variantProps | Total |
|-----------|-------|-------|
| `ActionIcon / Size=LG / Theme / Default` | null ✅ | 1 |
| `ActionIcon / Size=LG / Neutral / Default` | null ✅ | 1 |
| `ActionIcon / Size=LG / Neutral / Disabled` | null ✅ | 1 |
| `ActionIcon / Size=MD / ...` | null ✅ | 3 |
| `ActionIcon / Size=SM / ...` | null ✅ | 3 |

**Sizes:** SM, MD, LG — **Color:** Theme, Neutral — **State:** Default, Disabled — Total: 9 componentes separados
**Sin texto** — componente icon-only. No aplicar `.characters`.

---

### ALERT
**Página:** `↳ Alert`

| path | name | variantProps | Total |
|------|------|-------|-------|
| `Alert` | `Success` | null ✅ | 1 |
| `Alert` | `Info` | null ✅ | 1 |
| `Alert` | `Error` | null ✅ | 1 |
| `Alert` | `Warning` | null ✅ | 1 |

⚠️ v3: path/name split — `findComponent("Alert", "Info")`. NO `Alert / Alert` (obsoleto) · NO requiere switchVariant.
**Paths de texto (validados 2026-05-19):**
- Title: `children[1].children[1].children[1].characters`
- Body: `children[1].children[1].children[0].characters`
- Primary action: `children[1].children[0].children[1].children[0].children[1].characters`
- Secondary action: `children[1].children[0].children[0].children[0].children[1].characters`
- `children[0]` = icon/close · `children[2]` = icono de tipo (fijo por variante)

---

### APP BAR
**Página:** `↳ AppBar` *(antes: App Bar 🚧)*

⚠️ v3: el path base es `AppBar / Mobile` o `AppBar / Desktop / {Outline|Shadow}` — el variant/style es el **name**.

| path | name | Descripción |
|-----------|-------|-------|
| `AppBar / Mobile` | `Open_Button` | Menú expandido con CTA button |
| `AppBar / Mobile` | `Open_UserMenu` | Menú expandido con avatar usuario |
| `AppBar / Mobile` | `Shadow Close` | Header cerrado con sombra (uso en contenido) |
| `AppBar / Mobile` | `Outline Close` | Header cerrado con outline |
| `AppBar / Desktop / Outline` | `UserMenu` | AppBar desktop outline con menú de usuario |
| `AppBar / Desktop / Outline` | `Button` | AppBar desktop outline con CTA button *(nuevo)* |
| `AppBar / Desktop / Shadow` | `UserMenu` | AppBar desktop shadow con menú de usuario *(nuevo)* |
| `AppBar / Desktop / Shadow` | `Button` | AppBar desktop shadow con CTA button *(nuevo)* |
| `AppBar / Utilities / Menu States` | `Mobile` | Container de estados de menú mobile |
| `AppBar / Utilities / Menu States` | `Desktop` | Container de estados de menú desktop |
| `AppBar / Utilities / Menu Section` | `Mobile` | Sección de menú mobile *(nuevo)* |
| `AppBar / Utilities / Menu Section` | `Desktop` | Sección de menú desktop *(nuevo)* |

⚠️ `Menu States` ahora son 2 componentes directos (Mobile/Desktop como name), **no** 6 sub-ítems Default/Hover/Active.

**Paths MCP (AppBar / Mobile → Open_Button):**
- CTA button text: `children[0].children[1].characters`
- Nav item N (0..4): `children[1].children[N].children[0].characters`
- Search placeholder: `children[2].children[0].children[0].characters`

---

### ATTACHMENT
**Página:** `↳ Attachment`

| path | name | Total |
|-----------|-------|-------|
| `Attachment / Horizontal` | `Default`, `Disabled`, `Charging`, `Filled`, `Error` | 5 |
| `Attachment / Preview` | `Default`, `Disabled`, `Charging`, `Filled`, `Error` | 5 |

⚠️ v4: path colapsado de 3 → 2 niveles (`Attachment / Horizontal / Default` → `Attachment / Horizontal` name=`Default`).
Agregados estados **Filled** y **Error** en ambos layouts. **10 componentes separados.**
Instanciar: `findComponent("Attachment / Horizontal", "Default")`.
Paths MCP: `children[1].children[0].characters` = filename · `children[1].children[1].characters` = filesize

---

### AVATAR
**Página:** `↳ Avatar`

| Contenedor | variantProps | Total |
|-----------|-------|-------|
| `Avatar / Size=LG / Name / Default` | null ✅ | 1 |
| `Avatar / Size=LG / Name / Hover` | null ✅ | 1 |
| `Avatar / Size=LG / Name / Pressed` | null ✅ | 1 |
| `Avatar / Size=LG / Image / ...` | null ✅ | 3 |
| `Avatar / Size=MD / ...` | null ✅ | 6 |
| `Avatar / Size=SM / ...` | null ✅ | 6 |

**Sizes:** SM (30px/14px), MD (40px/20px), LG (54px/24px) — **Tipo:** Name (iniciales), Image — 18 componentes separados
**Path MCP texto:** `children[0].characters` = iniciales (solo variante Name)

---

### BADGE
**Página:** `↳ Badge`

| path | name | Total |
|-----------|-------|-------|
| `Badge` | `Gray`, `Blue`, `Red`, `Notifications`, `Theme`, `Disabled` | 6 |

⚠️ v4: los colores son ahora **6 componentes directos** bajo el path `Badge` — instanciar por name directo.
Size e Indeterminate son variant props **switchables internamente** dentro de cada instancia.
Instanciar: `findComponent("Badge", "Gray")` / `findComponent("Badge", "Theme")` etc.

**Colores:** Gray, Blue, Red, Notifications, Theme, Disabled
**Size:** SM (18×19px) / MD (20×21px) / LG (24×25px — default)
**Indeterminate=True** → 12×12px, sin hijos (solo punto de color, sin número)
**Indeterminate=False** → con número visible

**switchVariant:**
- `inst.switchVariant(0, 'SM')` — cambia tamaño (prop 0 = Size)
- `inst.switchVariant(1, 'True')` — activa modo punto/indeterminado (prop 1 = Indeterminate)

**Path MCP — texto:** `inst.children[0].characters` (solo cuando Indeterminate=False)
⚠️ Cuando Indeterminate=True → `children` está vacío, no acceder a children[0]
⚠️ Badge = contador numérico únicamente — usar Tag para texto de rol/estado

---

### BOTTOM NAVIGATION *(NUEVO)*
**Página:** `↳ BottomNavigation`

Barra de navegación inferior mobile. Contiene 5 ítems con icono + etiqueta; uno de ellos puede estar activo o tener badge.

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `BottomNavigation / BottomNavigation` | — | — | 1 (con Divider) |
| `BottomNavigation / Utilities / Item / Default` | — | — | 1 |
| `BottomNavigation / Utilities / Item / Active` | — | — | 1 |
| `BottomNavigation / Utilities / Item / Default` | `Badge` | — | 1 |
| `BottomNavigation / Utilities / Item / Active` | `Badge` | — | 1 |

**Estructura del componente principal (path:** `BottomNavigation / BottomNavigation`**):**
- `children[0]` = Divider (rectangle separador)
- `children[1]` = Content (flex `row-reverse`, 5 ítems)
  - Cada ítem: `children[N].children[0]` = ActionIcon · `children[N].children[1]` = Label (text)
  - **Label text path:** `inst.children[1].children[N].children[1].characters`
  - ⚠️ `row-reverse`: `children[0]` es el ítem más a la derecha visualmente (normalmente el activo)

**Item states:** Default, Active, Default/Badge, Active/Badge
> Sin componentProperties — un solo contenedor principal. Seleccionar por `path='BottomNavigation' && name='BottomNavigation'`.

---

### BOTTOM SHEET
**Página:** `↳ BottomSheet`

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `BottomSheet / Content / Default` | — | — | 1 |
| `BottomSheet / Content / Sticky Header` | — | — | 1 |
| `BottomSheet / Text / Default` | — | — | 1 |
| `BottomSheet / Text / Sticky Header` | — | — | 1 |
| `BottomSheet / Utilities` | `Container` | — | 1 |

**Tipos:** Content (área de contenido compuesto), Text (solo texto) — **Modos:** Default, Sticky Header
⚠️ v3: el contenedor `BottomSheet / Default` fue reemplazado por 4 boards explícitos (Content/Text × Default/Sticky Header).
**Path MCP — estructura del main instance:**
- Handle: `children[0]` → drag indicator
- Headline: `children[1]` → título y controles
  - Título: `children[1].children[0].children[1].characters` (dentro del board "Text")
- Content/body: `children[2]` y siguientes
⚠️ Componente estructural — el contenido interior (listas, botones) se compone en pantalla, no es switcheable.

---

### BREADCRUMB
**Página:** `↳ Breadcrumb` *(antes: Breadcrumb 🚧)*

| path | name | Total |
|-----------|-------|-------|
| `Breadcrumb` | `Breadcrumb` | 1 |
| `Breadcrumb / Utilities` | `Page link` | 1 |

⚠️ v4: `Breadcrumb / Utilities / Page link` (6 variantes con isActive/State) → `Breadcrumb / Utilities` (name=`Page link`, **1 sola instancia** sin sub-variantes separadas).

**Estructura:** 4 niveles jerárquicos (Home → Nivel2 → Nivel3 → Página activa)
**Paths MCP — texto (variantProps null ✅):**
- Nivel 1 (Home): `inst.children[0].children[1].characters`
- Nivel 2: `inst.children[1].children[1].characters`
- Nivel 3: `inst.children[2].children[1].characters`
- Página activa (último nivel): `inst.children[3].children[1].characters`
⚠️ El último nivel se muestra en color #2563EB (Theme.Primary) — es el nivel activo

---

### BUTTON
**Página:** `↳ Button`

**Estilos:** Primary, Secondary, Tertiary, Tonal, Danger, Danger Text, Overlay — **Sizes:** LG, MD, SM

Todas las variantes comparten las mismas propiedades:

| Propiedad | Valores |
|-----------|---------|
| State | Default, Hover, Pressed, Disabled, Loading |

⚠️ v4: Las propiedades **Has left icon** y **Has right icon** fueron eliminadas — los iconos se configuran directamente en la instancia. **Total variantes por contenedor: 5.**
Excepción: `Button / Overlay / Size=LG` tiene Loading como path separado (`Button / Overlay / Size=LG / Loading` name=`False`).

| Contenedor |
|-----------|
| `Button / Primary / Size=LG` · `Button / Primary / Size=MD` · `Button / Primary / Size=SM` |
| `Button / Secondary / Size=LG` · `Button / Secondary / Size=MD` · `Button / Secondary / Size=SM` |
| `Button / Tertiary / Size=LG` · `Button / Tertiary / Size=MD` · `Button / Tertiary / Size=SM` |
| `Button / Tonal / Size=LG` · `Button / Tonal / Size=MD` · `Button / Tonal / Size=SM` |
| `Button / Danger / Size=LG` · `Button / Danger / Size=MD` · `Button / Danger / Size=SM` |
| `Button / Danger / Danger Text / Size=LG` · `/Size=MD` · `/Size=SM` |
| `Button / Overlay / Size=LG` · `Button / Overlay / Size=MD` · `Button / Overlay / Size=SM` |

---

### CARD
**Página:** `↳ Cards`

| path | name | Total |
|-----------|-------|-------|
| `Card / CardImage` | `Horizontal`, `Vertical` | 2 |
| `Card / CardFeature` | `BGImage_Size=LG`, `BGImage_Size=MD`, `SideImage_Size=LG`, `SideImage_Size=MD` | 4 |
| `Card / CardSwap` | `CardSwap` | 1 *(nuevo)* |
| `Card / Utilities` | `Container` | 1 *(nuevo)* |

⚠️ v4: `Card / CardImage_Horizontal` y `Card / CardImage_Vertical` (3 Style variants c/u) → **`Card / CardImage`** con names `Horizontal` y `Vertical` (sin variantes Style Outline/Shadow/Tonal).
Instanciar: `findComponent("Card / CardImage", "Horizontal")` · `findComponent("Card / CardFeature", "SideImage_Size=MD")`

**Layouts:** Horizontal, Vertical, Feature BGImage, Feature SideImage, Swap

---

### CAROUSEL *(NUEVO)*
**Página:** `↳ Carousel`

| path | name | Total |
|-----------|-------|-------|
| `Carousel / Carousel` | `Theme`, `Neutral` | 2 *(nuevo)* |
| `Carousel / Utilities` | `Dot`, `ControlsTheme`, `ControlsNeutral` | 3 |

⚠️ v4: El carousel completo ahora tiene componentes instanciables — `findComponent("Carousel / Carousel", "Theme")`.
El dot sigue disponible en utilities. Controls disponibles en Theme y Neutral. **5 componentes total.**

---

### CHECKBOX
**Página:** `↳ Checkbox`

| path | names | Total |
|-----------|-------|-------|
| `Checkbox / Utilities` | `Checkbox` | 1 |
| `Checkbox / Default` | `Default`, `Default-Active`, `Hover`, `Hover-Active`, `Disabled`, `Disabled-Active` | 6 |
| `Checkbox / Box` | `Default`, `Default-Active`, `Hover`, `Hover-Active`, `Disabled`, `Disabled-Active` | 6 |

⚠️ v4: State/Selected como variantProps → **combined names** (ej. `Default-Active` = State=Default + Selected=True).
Sin switchVariant — instanciar el componente del estado deseado directamente.
**Path MCP — texto:** `inst.children[0].characters` = label
⚠️ Typo corregido: `Deafult` → `Default` ✅

---

### COUNTER
**Página:** `↳ Counter`

| path | names | Total |
|-----------|-------|-------|
| `Counter / Horizontal / Default` | `at-min`, `at-max`, `at-range` | 3 |
| `Counter / Horizontal / Invalid` | `at-min`, `at-max`, `at-range` | 3 |
| `Counter / Horizontal / Pressed` | `at-min`, `at-max`, `at-range` | 3 |
| `Counter / Horizontal / Disabled` | `at-disabled` | 1 |
| `Counter / Vertical / Default` | `at-min`, `at-max`, `at-range` | 3 |
| `Counter / Vertical / Invalid` | `at-min`, `at-max`, `at-range` | 3 |
| `Counter / Vertical / Pressed` | `at-min`, `at-max`, `at-range` | 3 |
| `Counter / Vertical / Disabled` | `at-disabled` | 1 |

⚠️ v4: **La dimensión de tamaño (LG/MD/SM) fue eliminada** — Counter ya no tiene variantes de size.
8 paths total × ~3 variantes = **20 componentes**.
State: Default, Disabled, Invalid, Pressed — Variant (posición): at-min, at-max, at-range, at-disabled.
Instanciar: `findComponent("Counter / Horizontal / Default", "at-range")`.

**Paths MCP — texto:**
- Título: `inst.children[1].children[1].characters`
- Subtítulo: `inst.children[1].children[0].characters`

---

### CSAT *(NUEVO)*
**Página:** `↳ CSAT`

Componente de satisfacción del cliente (Customer Satisfaction). Usa emojis animados en 5 niveles emocionales.

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| path | names | Total |
|-----------|-------|-------|
| `CSAT / Size=LG` | `Default`, `Disabled` | 2 |
| `CSAT / Size=MD` | `Default`, `Disabled` | 2 |
| `CSAT / Size=SM` | `Default`, `Disabled` | 2 |
| `CSAT / Utilities / Items / Size=L` | `Default`, `Hover`, `Active` | 3 |
| `CSAT / Utilities / Items / Size=M` | `Default`, `Hover`, `Active` | 3 |
| `CSAT / Utilities / Items / Size=S` | `Default`, `Hover`, `Active` | 3 |
| `CSAT / Utilities / Emoji / Active / Size=LG` | very-negative_active, negative_active, neutral_active, positive_active, very-positive_active | 5 |
| `CSAT / Utilities / Emoji / Active / Size=MD` | (ídem) | 5 |
| `CSAT / Utilities / Emoji / Active / Size=SM` | (ídem) | 5 |
| `CSAT / Utilities / Emoji / Inactive / Size=LG` | very-negative_inactive, ..., very-positive_inactive | 5 |
| `CSAT / Utilities / Emoji / Inactive / Size=MD` | (ídem) | 5 |
| `CSAT / Utilities / Emoji / Inactive / Size=SM` | (ídem) | 5 |

⚠️ v4: Sizes renombradas L/M/S → **LG/MD/SM** en componentes principales y emojis.
Cada size ahora tiene estados **Default + Disabled**. Items utilities añaden estado **Hover**.
**Total: 45 componentes.**
> Sin componentProperties — `findComponent("CSAT / Size=LG", "Default")` · `findComponent("CSAT / Utilities / Emoji / Active / Size=LG", "positive_active")`

---

### DATA LIST
**Página:** `↳ DataList`

| path | names | Total |
|-----------|-------|-------|
| `DataList` | `DataList`, `Or List` | 2 |
| `DataList / Utilities TrailingItems` | `Date`, `Tag`, `Badge`, `Label` | 4 |

⚠️ v4: path renombrado `Data List` → **`DataList`** (sin espacio). Variante `Default + Icon` → **`Or List`**.
Nuevas utilities TrailingItems (Date, Tag, Badge, Label). **6 componentes total.**
Instanciar: `findComponent("DataList", "DataList")` · `findComponent("DataList", "Or List")`
**Nota de uso:** 6 filas por defecto — ocultar sobrantes con `row.hidden = true` después de instanciar

---

### DATE INPUT
**Página:** `↳ DateInput`

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `DateInput / Size=LG` | State | Default, Default-Filled, Hover, Hover-Filled, Pressed, Pressed-Filled, Error, Error-Filled, Disabled, Disabled-Filled | 10 |
| `DateInput / Size=MD` | State | Default, Default-Filled, Hover, Hover-Filled, Pressed, Pressed-Filled, Error, Error-Filled, Disabled, Disabled-Filled | 10 |
| `DateInput / Calendar / Inline` | name | `days`, `months`, `years` | 3 |
| `DateInput / Calendar / Overlay` | name | `days`, `months`, `years` | 3 |
| `DateInput / Utilities` | name | `CalendarDays` | 1 |

**Total: 27 componentes.**

⚠️ v4: paths de calendario consolidados — `DateInput / Calendar / Inline / days` → `DateInput / Calendar / Inline` (name=`days`). Instanciar: `findComponent("DateInput / Calendar / Inline", "days")`.
⚠️ v4 [2026-05-26]: `DateInput / Utilities / CalendarDays` (7 componentes por estado) → **`DateInput / Utilities`** (name=`CalendarDays`, **1 solo componente** — los estados Active/Disabled/Range-\*/Hover/Default son variantProps internos).
Instanciar: `findComponent("DateInput / Utilities", "CalendarDays")`.
**Sizes:** MD (h=59, 14px), LG (h=71, 16px) — **Modos de calendario:** Inline, Overlay — **Vistas de calendario:** days, months, years
**States:** Default, Hover, Pressed, Error, Disabled — cada uno con variante Filled (valor ingresado) y sin Filled (vacío)

**Paths MCP — acceso a texto:**
- Estado Default/Hover/Pressed/Error/Disabled: `children[1].children[0].characters` → label/placeholder
- Estado \*-Filled: `children[2].children[0].characters` → valor "DD/MM/AAAA" · `children[0].children[1].characters` → float label

---

### DIVIDER *(NUEVO)*
**Página:** `↳ Divider`

| path | names | Total |
|-----------|-------|-------|
| `Divider` | `Horizontal`, `Vertical` | 2 |

⚠️ v4: variante de label (True/False) eliminada — **2 componentes directos**. Instanciar: `findComponent("Divider", "Horizontal")`.

---

### DRAWER
**Página:** `↳ Drawer`

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `Drawer / Drawer` | — | — | 1 |
| `Drawer / Utilities / Container` | — | — | 1 |

**Paths MCP — texto (variantProps null ✅):** ⚠️ Actualizado 2026-05-18 — ahora 5 children
- Título: `inst.children[1].children[0].characters`
- Subtítulo: `inst.children[1].children[1].characters`
- Tag text: `inst.children[2].children[1].characters` [children[2] HIDDEN por defecto]
- Body container: `inst.children[3]` — agregar contenido aquí
- Primary button: `inst.children[4].children[1].children[1].children[1].characters`
- Secondary button: `inst.children[4].children[1].children[0].children[0].children[1].characters`
- Tertiary button: `inst.children[4].children[0].children[2].characters` [HIDDEN]

---

### DROPDOWN
**Página:** `↳ Dropdown`

| path | names | Total |
|-----------|-------|-------|
| `Dropdown` | `Dropdown` | 1 |
| `Dropdown / Utilities` | `SlectSingle`, `SlectMulti` | 2 |

⚠️ v4: utilities reducidas de 12 (6+6 con State/Selected props) a **2 componentes directos**. Dropdown principal de 3 variantes → 1.
Instanciar: `findComponent("Dropdown", "Dropdown")`.

---

### EMPTY STATE
**Página:** `↳ EmptyState`

| path | name | Total |
|-----------|-------|-------|
| `EmptyState` | `EmptyState` | 1 |

✅ Componente de librería real — instanciable vía MCP. `findComponent("EmptyState", "EmptyState")`.

---

### FAB BUTTON *(antes: FAB Button 🚧)*
**Página:** `↳ FabButton`

**Estilos:** Default, Tonal — **Sizes:** LG, MD, SM

| Propiedad | Valores |
|-----------|---------|
| State | Default, Hover, Pressed, Disabled, Loading |

**Total variantes por contenedor:** 5

| Contenedor |
|-----------|
| `FabButton / Default / Size=LG` · `FabButton / Default / Size=MD` · `FabButton / Default / Size=SM` |
| `FabButton / Tonal / Size=LG` · `FabButton / Tonal / Size=MD` · `FabButton / Tonal / Size=SM` |

⚠️ v3: Size=L → Size=LG · Size=M → Size=MD · Size=S → Size=SM

---

### FILE INPUT
**Página:** `↳ FileInput`

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `FileInput / Size=MD` | Property 1 | Default, Filled, Error, Loading, Disabled | 5 |
| `FileInput / Size=LG` | State | Default, Filled, Error, Loading, Disabled | 5 |

**Sizes:** MD, LG — **State:** Default, Filled, Error, Loading, Disabled
**variantProps null ✅** — seleccionar por `path='FileInput' && name='Size=LG'`. State embebido en el diseño del frame, no switcheable vía MCP.
*Nota: Size=MD usa `Property 1` como nombre de propiedad (typo sin normalizar).*

**Paths MCP — texto:**
- Estructura: `children[0]` = HelpText · `children[1]` = Input Container
- Placeholder/label: `inst.children[1].children[0].characters`

---

### FILTER PANEL *(NUEVO)*
**Página:** `↳ FilterPanel`

Panel de filtros con soporte para 3 tamaños. Incluye utilidad de Panel interno.

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `FilterPanel / Size=LG` | — | — | 1 |
| `FilterPanel / Size=MD` | — | — | 1 |
| `FilterPanel / Size=SM` | — | — | 1 |
| `FilterPanel / Utilities / Panel` | — | — | 1 |

**Sizes:** LG, MD, SM
⚠️ v3: Size=L → Size=LG · Size=M → Size=MD · Size=S → Size=SM
> Sin componentProperties — seleccionar por `path='FilterPanel' && name='Size=LG'`.

---

### FILE UPLOADER *(NUEVO)*
**Página:** `↳ FileUploader`

Componente de carga de archivos. Soporta 3 layouts de visualización y 2 tamaños de dropzone.

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `FileUploader / Column` | — | — | 1 |
| `FileUploader / Grid` | — | — | 1 |
| `FileUploader / List` | — | — | 1 |
| `FileUploader / Dropzone / Size=LG` | — | — | 1 |
| `FileUploader / Dropzone / Size=MD` | — | — | 1 |

**Layouts:** Column, Grid, List — **Dropzone sizes:** LG, MD
> Sin componentProperties — seleccionar layout por `path='FileUploader' && name='Column'`; dropzone por `path='FileUploader / Dropzone' && name='Size=LG'`.

---

### FOOTER
**Página:** `↳ Footer`

| path | name | Total |
|-----------|-------|-------|
| `Footer / Desktop` | `Outline` | 1 |
| `Footer / Desktop` | `Shadow` | 1 |
| `Footer / Mobile` | `Outline` | 1 |
| `Footer / Mobile` | `Shadow` | 1 |

⚠️ El estilo (Outline/Shadow) es el **name**, NO parte del path. `findComponent("Footer / Mobile", "Outline")`.
**Breakpoints:** Desktop, Mobile — **Estilos:** Outline, Shadow — 4 componentes separados
⚠️ v3: path cambió de `Theme/Neutral × Desktop/Mobile` a `Desktop/Mobile × Outline/Shadow`.
**Uso:** Componente estructural de layout — ocupa el ancho completo del board. Agregar al fondo del frame.

---

### ICON BUTTON
**Página:** `↳ IconButton`

**Estilos:** Theme, Tonal, Danger — **Sizes:** LG, MD, SM

⚠️ v4: estructura de Filled inconsistente entre sizes:

**Size=LG** — todas las variantes en el **mismo path** (10 por contenedor):

| path | States |
|-----------|-------|
| `IconButton / Theme / Size=LG` | Default, Hover, Pressed, Disabled, Loading, Filled-Default, Filled-Hover, Filled-Pressed, Filled-Disabled, Filled-Loading |
| `IconButton / Tonal / Size=LG` | Default, Hover, Pressed, Disabled, Loading, Filled-Default, Filled-Hover, Filled-Pressed, Filled-Disabled |
| `IconButton / Tonal / Size=LG / Filled` | Loading *(sub-path separado — 1 componente extra)* |
| `IconButton / Danger / Size=LG` | Default, Hover, Pressed, Disabled, Loading, Filled-Default, Filled-Hover, Filled-Pressed, Filled-Disabled, Filled-Loading |

**Size=MD y Size=SM** — Filled en **sub-path separado** (5 estados c/u):

| path base | path Filled |
|-----------|------------|
| `IconButton / Theme / Size=MD` (5) | `IconButton / Theme / Size=MD / Filled` (5) |
| `IconButton / Tonal / Size=MD` (5) | `IconButton / Tonal / Size=MD / Filled` (5) |
| `IconButton / Danger / Size=MD` (5) | `IconButton / Danger / Size=MD / Filled` (5) |
| `IconButton / Theme / Size=SM` (5) | `IconButton / Theme / Size=SM / Filled` (5) |
| `IconButton / Tonal / Size=SM` (5) | `IconButton / Tonal / Size=SM / Filled` (5) |
| `IconButton / Danger / Size=SM` (5) | `IconButton / Danger / Size=SM / Filled` (5) |

**Total: 90 componentes.**
Instanciar filled en SM/MD: `findComponent("IconButton / Theme / Size=SM / Filled", "Default")`

---

### IMAGE UPLOADER *(NUEVO)*
**Página:** `↳ ImageUploader`
⚠️ **Typo de naming:** la página se llama `ImageUploader` pero el path en librería es `ImageUpload` (sin "r").

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `ImageUpload / Size=LG` | — | — | 1 |
| `ImageUpload / Size=XL` | — | — | 1 |
| `ImageUpload / Size=MD` | — | — | 1 |
| `ImageUpload / Size=SM` | — | — | 1 |
| `ImageUpload / Size=XS` | — | — | 1 |

**Sizes:** XS, SM, MD, LG, XL — **Instanciar con path:** `ImageUpload` (no `ImageUploader`)
⚠️ v3: nombre cambió de `ImageUpload / LG` a `ImageUpload / Size=LG` (con prefijo `Size=`).
> Sin componentProperties — seleccionar por `path='ImageUpload' && name='Size=LG'`.

---

### LINK
**Página:** `↳ Link`

**Estilos:** Theme, Neutral — **Sizes:** LG, MD, SM

| Contenedor | State values | Total |
|-----------|-------------|-------|
| `Link / Theme / Size=LG` | Default, Hover, Pressed, Disabled | 4 |
| `Link / Theme / Size=MD` | Default, Hover, Pressed, Disabled | 4 |
| `Link / Theme / Size=SM` | Default, Hover, Pressed, Disabled | 4 |
| `Link / Neutral / Size=LG` | Default, Hover, Pressed, Disabled | 4 |
| `Link / Neutral / Size=MD` | Default, Hover, Pressed, Disabled | 4 |
| `Link / Neutral / Size=SM` | Default, Hover, Pressed, Disabled | 4 |

---

### LIST
**Página:** `↳ List`

**Tipos:** NavigationList, ActionList, ToggleList — **Estilos:** Default, Outline, Box
⚠️ v3: nombres sin espacios — `NavigationList` (no `Navigation List`), `ActionList`, `ToggleList`.

| Contenedor | Variantes | Total |
|-----------|-----------|-------|
| `List / NavigationList / Default` | Default, Disabled, Selectable | 3 |
| `List / NavigationList / Outline` | Outline, Disabled, Selectable | 3 |
| `List / NavigationList / Box` | Default, Disabled, Selectable | 3 |
| `List / ActionList / Default` | Default, Disabled, Selectable | 3 |
| `List / ActionList / Outline` | Default, Disabled, Selectable | 3 |
| `List / ActionList / Box` | Default, Disabled, Selectable | 3 |
| `List / ToggleList / Default` | Default, Disabled, Selectable | 3 |
| `List / ToggleList / Outline` | Default, Disabled, Selectable | 3 |
| `List / ToggleList / Box` | Default, Disabled, Selectable | 3 |

**Utilities (15 componentes):**

| path | names | Total |
|-----------|-------|-------|
| `List / Utilities / Action Items` | `Button`, `icon`, `ActionIcon` | 3 |
| `List / Utilities / Trailing Items` | `Badge`, `Tag`, `Label`, `Date` | 4 |
| `List / Utilities / Leading Items` | `Number Indicator`, `Icon`, `Avatar`, `Image`, `Icon Box` | 5 |
| `List / Utilities / Toggle Items` | `Toggle Button`, `Toggle Binary`, `Atom_Switch` | 3 |

⚠️ v4 [2026-05-26]: Las utilities de List ahora contienen 4 sub-categorías con átomos intercambiables:
- **Action Items** (3): items con acciones (Button, icon, ActionIcon)
- **Trailing Items** (4): decoradores trailing (Badge, Tag, Label, Date)
- **Leading Items** (5): decoradores leading (Number Indicator, Icon, Avatar, Image, Icon Box)
- **Toggle Items** (3): items con toggle (Toggle Button, Toggle Binary, Atom_Switch)
**Total: 42 componentes** (27 principales + 15 utilities).
Instanciar utility: `findComponent("List / Utilities / Trailing Items", "Badge")`

---

### LOADER *(NUEVO)*
**Página:** `↳ Loader`

Componentes de estado de carga. Dos variantes: Logo (barra de progreso lineal) y Spinner (círculo de progreso). ✅ **Ambos son componentes de librería** — `findComponent("Loader", "Logo")` / `findComponent("Loader", "Spinner")`. Validado en Penpot 2026-05-19.

| Contenedor | path | name | Dims |
|-----------|------|------|------|
| `Loader / Logo` | `Loader` | `Logo` | 328×132px |
| `Loader / Spinner` | `Loader` | `Spinner` | 328×86px c/u |

**Estructura Loader / Logo** (flex `column-reverse`, rowGap 16):
- `children[0]` = ProgressBar (flex column, rowGap 4)
  - `children[0].children[0]` = Text board (flex row-reverse)
    - `children[0].children[0].children[0]` = "50%" (porcentaje) → `.characters`
    - `children[0].children[0].children[1]` = "Cargando..." (label) → `.characters`
  - `children[0].children[1]` = ProgressBar / Utilities / Theme (barra real)
- `children[1]` = Rectangle (placeholder del logo, 184×80px) — visual, sin texto editable

**Estructura Loader / Spinner** (flex `column-reverse`, rowGap 8):
- `children[0]` = Text (label, ej. "Cargando...") → `.characters`
- `children[1]` = ProgressCircle / Utilities / Size=SM / {Neutral|Theme} — visual

---

### MENU *(NUEVO)*
**Página:** `↳ Menu`

Menú contextual. Soporta dos tipos de trigger (IconButton / Button) y utilidades internas.

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `Menu / IconButton` | — | — | 1 |
| `Menu / Button` | — | — | 1 |
| `Menu / Utilities / Dropdown` | — | — | 1 |
| `Menu / Utilities / ItemMenu` | — | — | 1 |

**Triggers:** IconButton, Button
> Sin componentProperties — seleccionar por `path='Menu' && name='IconButton'` o `name='Button'`.

---

### MODAL *(antes: Modal 🚧)*
**Página:** `↳ Modal`
> Sin variant containers definidos. Componente disponible pero sin variantes formales.

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `Modal / Default` | — | — | 1 |
| `Modal / Swap content` | — | — | 1 |
| `Modal / Utilities / Container` | — | — | 1 |

**Paths MCP — texto (variantProps null ✅):** ⚠️ Actualizado 2026-05-18 — Title/Subtitle corregidos
- Title (headline): `inst.children[2].children[0].children[0].children[0].characters`
- Subtitle: `inst.children[2].children[0].children[0].children[1].characters` (ocultar si no aplica)
- Body text: `inst.children[1].children[1].characters`
- Primary button: `inst.children[0].children[1].children[1].characters`
- Secondary button: `inst.children[0].children[0].children[0].children[1].characters`

---

### NOTIFICATION
**Página:** `↳ Notification`

| Contenedor | path | name | Total |
|-----------|------|------|-------|
| `Notification / Default` | `Notification / Default` | `Info`\|`Success`\|`Warning`\|`Error` | 4 |
| `Notification / Inverse` | `Notification / Inverse` | `Info`\|`Success`\|`Warning`\|`Error` | 4 |

**path/name split ✅ validado 2026-05-19** — `findComponent("Notification / Default", "Info")`
**Estructura interna (children):**
- `children[0]` = icono semántico (visual — varía por tipo)
- `children[1]` = Content
  - `children[1].children[0]` = Text board → `children[0]`=body · `children[1]`=Title
  - `children[1].children[1]` = Actions → `children[0]`=Secondary text · `children[1].children[0]`=Primary text
- `children[2]` = icon/close → `.hidden = true` si no se puede cerrar

---

### NUMBER INDICATOR
**Página:** `↳ NumberIndicator`

| path | names | Total |
|-----------|-------|-------|
| `NumberIndicator` | `Size=LG`, `Size=MD`, `Size=SM` | 3 |

⚠️ v4: 3 componentes directos (no 9). Colors (Neutral/Theme/Disabled) son variant props **switchables internamente**.
Instanciar: `findComponent("NumberIndicator", "Size=LG")` → `inst.switchVariant(0, 'Theme')`

---

### OTP INPUT *(NUEVO)*
**Página:** `↳ OtpInput`

Input para códigos de verificación de un solo uso. Soporta 3 longitudes × 2 tamaños.

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `OtpInput / Size=LG / 3 Characters` | — | — | 1 |
| `OtpInput / Size=LG / 4 Characters` | — | — | 1 |
| `OtpInput / Size=LG / 6 Characters` | — | — | 1 |
| `OtpInput / Size=MD / 3 Characters` | — | — | 1 |
| `OtpInput / Size=MD / 4 Characters` | — | — | 1 |
| `OtpInput / Size=MD / 6 Characters` | — | — | 1 |
| `OtpInput / Utilities / Size=LG / Default` | `Empty`, `Filled`, `Hidden` | 3 |
| `OtpInput / Utilities / Size=LG / Hover` | `Empty`, `Filled`, `Hidden` | 3 |
| `OtpInput / Utilities / Size=LG / Pressed` | `Empty`, `Filled`, `Hidden` | 3 |
| `OtpInput / Utilities / Size=LG / Error` | `Empty`, `Filled`, `Hidden` | 3 |
| `OtpInput / Utilities / Size=LG / Disabled` | `Empty`, `Filled`, `Hidden` | 3 |
| `OtpInput / Utilities / Size=LG / Success` | `Empty`, `Filled`, `Hidden` | 3 |
| `OtpInput / Utilities / Size=MD / ...` | (ídem 6 states × 3 fills) | 18 |

⚠️ v4: utilities completamente reestructuradas:
- States: Default/Hover/Pressed/Error/Disabled + **Success** (nuevo)
- Filled: True/False → **Empty / Filled / Hidden** (nuevo: Hidden)
- **36 utilities total** (vs 20 en v3)

**Sizes:** LG, MD — **Longitudes:** 3, 4, 6 caracteres — **Total: 42 componentes**
> Sin componentProperties — `findComponent("OtpInput / Size=LG", "6 Characters")` · `findComponent("OtpInput / Utilities / Size=LG / Success", "Filled")`

---

### PAGE HEADER
**Página:** `↳ PageHeader`

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `PageHeader / Default` | — | — | 1 |
| `PageHeader / Sticky` | — | — | 1 |

---

### PASSWORD INPUT
**Página:** `↳ PasswordInput`

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `PasswordInput / Size=MD` | State, Filled, Show Password | Default/Hover/Pressed/Error/Disabled/Success × True/False × True/False | 17 |
| `PasswordInput / Size=LG` | State, Filled, Show Password | Default/Hover/Pressed/Error/Disabled/Success × True/False × True/False | 17 |

**State:** Default, Hover, Pressed, Error, Disabled, Success — **Filled:** True/False — **Show Password:** True/False

---

### PHONE INPUT *(NUEVO)*
**Página:** `↳ PhoneInput`

Input especializado para números de teléfono. Soporta 2 tamaños.

| path | names | Total |
|-----------|-------|-------|
| `PhoneInput / Size=LG` | Default, Default-Filled, Hover, Hover-Filled, Pressed, Pressed-Filled, Error, Error-Filled, Disabled, Disabled-Filled, Dropdown, Dropdown-Filled | 12 |
| `PhoneInput / Size=MD` | (ídem) | 12 |

⚠️ v4: Estado **Success eliminado** → reemplazado por **Dropdown** (estado con selector de país abierto).
**Sizes:** LG, MD — **States:** Default, Hover, Pressed, Error, Disabled, Dropdown — **Filled:** combinado en name.
Instanciar: `findComponent("PhoneInput / Size=LG", "Default")` · `findComponent("PhoneInput / Size=MD", "Dropdown-Filled")`

---

### PRODUCT ECOMMERCE *(antes: NUEVO)*
**Página:** `↳ ProductEcommerce`
✅ **Typo corregido en v3 (2026-05-19):** la página ahora se llama `ProductEcommerce` (doble m), consistente con el path de librería.

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `ProductEcommerce / Horizontal` | — | — | 1 |
| `ProductEcommerce / Vertical` | — | — | 1 |

**Layouts:** Horizontal, Vertical
> Sin componentProperties — seleccionar por `path='ProductEcommerce' && name='Horizontal'`.

---

### PRODUCT FILE
**Página:** `↳ ProductFile`

| path | names | Total |
|-----------|-------|-------|
| `ProductFile` | `Default`, `Box`, `Actions`, `Items_Product File` | 4 |

⚠️ v4: todos los componentes bajo path único `ProductFile` — **4 componentes directos** (sin sub-variantes Select/Action).
Instanciar: `findComponent("ProductFile", "Default")` · `findComponent("ProductFile", "Box")`

---

### PROGRESS BAR
**Página:** `↳ ProgressBar`

| path | names | Total |
|-----------|-------|-------|
| `ProgressBar / Size=LG` | `Theme`, `Success`, `Warning`, `Error`, `Neutral` | 5 |
| `ProgressBar / Size=MD` | (ídem) | 5 |
| `ProgressBar / Size=SM` | (ídem) | 5 |
| `ProgressBar / Utilities` | `Theme`, `Success`, `Warning`, `Error`, `Neutral` | 5 |

⚠️ v4: estructura **completamente cambiada** — antes `ProgressBar / {Color} / Size={LG,MD,SM}` con 5 variantes de progreso (0%/25%/50%/75%/100%). Ahora `ProgressBar / Size={LG,MD,SM}` con **color como name**. Las variantes de porcentaje ya no están en paths separados.
Instanciar: `findComponent("ProgressBar / Size=LG", "Theme")` — **20 componentes total.**

---

### PROGRESS CHECKPOINT *(NUEVO)*
**Página:** `↳ ProgressCheckpoint`

Indicador de progreso por checkpoints. Soporta tema claro y oscuro × 3 sizes × 4 variantes de estado.

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `ProgressCheckpoint / Light` | name | `Size=LG`, `Size=MD`, `Size=SM` | 3 |
| `ProgressCheckpoint / Dark` | name | `Size=LG`, `Size=MD`, `Size=SM` | 3 |
| `ProgressCheckpoint / Utilities / Light / Size=LG` | name | Theme, Success, Warning, Error | 4 |
| `ProgressCheckpoint / Utilities / Light / Size=MD` | name | Theme, Success, Warning, Error | 4 |
| `ProgressCheckpoint / Utilities / Light / Size=SM` | name | Theme, Success, Warning, Error | 4 |
| `ProgressCheckpoint / Utilities / Dark / Size=LG/MD/SM` | name | Theme, Success, Warning, Error | 4 × 3 |

**Themes:** Light, Dark — **Sizes:** LG, MD, SM — **Variantes:** Theme, Success, Warning, Error
⚠️ v3: Size=L → Size=LG · Size=M → Size=MD · Size=S → Size=SM
> Sin componentProperties — seleccionar por `path='ProgressCheckpoint / Light' && name='Size=LG'`; atoms por `path='ProgressCheckpoint / Utilities / Light / Size=LG' && name='Theme'`.

---

### PROGRESS CIRCLE *(NUEVO)*
**Página:** `↳ ProgressCircle`

Indicador de progreso circular. Expandido en v3: ahora ofrece boards individuales por color × size × porcentaje/indeterminate, eliminando la necesidad de swap manual de variant.

| Contenedor | Valores | Total |
|-----------|---------|-------|
| `ProgressCircle / {Color} / Size=LG` | Variant: 0%, 25%, 50%, 75%, 100%, Indeterminate | 6 × color |
| `ProgressCircle / {Color} / Size=MD` | (ídem) | 6 × color |
| `ProgressCircle / {Color} / Size=SM` | (ídem) | 6 × color |
| `ProgressCircle / Utilities / Size=LG` | Variant: Theme, Success, Warning, Error, Neutral | 5 |
| `ProgressCircle / Utilities / Size=MD` | (ídem) | 5 |
| `ProgressCircle / Utilities / Size=SM` | (ídem) | 5 |

**Colores:** Theme, Success, Warning, Error, Neutral — **Sizes:** LG, MD, SM
**Estados de progreso:** 0%, 25%, 50%, 75%, 100%, Indeterminate

⚠️ v3 breaking change: Los wrappers `ProgressCircle / Size=L/M/S` fueron reemplazados por boards explícitos `{Color} / Size={LG|MD|SM}`.
   Los atoms de utilities se renombraron: `Size=L` → `Size=LG` · `Size=M` → `Size=MD` · `Size=S` → `Size=SM`.
> Para instanciar: `path='ProgressCircle / Theme' && name='Size=LG'` + variantProps `{Variant:"75%"}`.
> Utilities siguen disponibles para construcción con swap manual: `path='ProgressCircle / Utilities / Size=LG' && name='Theme'`.

---

### RATING *(NUEVO)*
**Página:** `↳ Rating`

Componente de valoración con estrellas. Soporta 7 colores × 3 sizes. Atoms de estrella activa/inactiva por color.

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `Rating / Size=LG` | Color | Blue, Green, Grey, Purple, Red, Theme, Yellow | 7 |
| `Rating / Size=MD` | Color | Blue, Green, Grey, Purple, Red, Theme, Yellow | 7 |
| `Rating / Size=SM` | Color | Blue, Green, Grey, Purple, Red, Theme, Yellow | 7 |
| `Rating / Utilities / Items / Size=LG` | Default, Hover, Active | 3 |
| `Rating / Utilities / Items / Size=MD` | Default, Hover, Active | 3 |
| `Rating / Utilities / Items / Size=SM` | Default, Hover, Active | 3 |
| `Rating / Utilities / Active / Size=LG` | Star_blue, Star_green, Star_grey, Star_purple, Star_red, Star_theme, Star_yellow | 7 |
| `Rating / Utilities / Active / Size=MD` | (ídem) | 7 |
| `Rating / Utilities / Active / Size=SM` | (ídem) | 7 |
| `Rating / Utilities / Inactive / Size=LG` | `Star_blue` | 1 ⚠️ |
| `Rating / Utilities / Inactive / Size=MD` | `Star_blue` | 1 ⚠️ |
| `Rating / Utilities / Inactive / Size=SM` | `Star_blue` | 1 ⚠️ |

⚠️ v4: `Utilities/Icons` → separado en `Utilities/Active` (7 colores c/u) y `Utilities/Inactive` (**solo Star_blue** — posible regresión en el archivo, faltarían los otros 6 colores).

**Sizes:** SM (444×84px · 30px/estrella) · MD (544×94px · 40px/estrella) · LG (624×108px)
**Colores:** Blue, Green, Grey, Purple, Red, Theme, Yellow

> Sin componentProperties — seleccionar por `path='Rating / Size=MD' && name='Yellow'`.

**Paths MCP — texto (variantProps undefined ✅):** ⚠️ Verificado 2026-05-18
- Body text label: `inst.children[0].characters` (ej. "4.5 / 5")
- Items_Rating: `inst.children[1]` → 10 estrellas, todas Active/visibles por defecto
  - Ocultar estrella N: `inst.children[1].children[N].hidden = true` (para rating parcial)
- Title text: `inst.children[2].characters` (ej. "Calificación del producto")
- ⚠️ El color viene dado por el componente instanciado (name="Yellow"/"Blue"/etc.) — sin fills manuales

---

### RADIOBUTTON
**Página:** `↳ Radiobutton`

| path | names | Total |
|-----------|-------|-------|
| `Radiobutton / Utilities` | `Radiobutton` | 1 |
| `Radiobutton / Default` | `Default`, `Default-Active`, `Hover`, `Hover-Active`, `Disabled`, `Disabled-Active` | 6 |
| `Radiobutton / Box` | `Default`, `Default-Active`, `Hover`, `Hover-Active`, `Disabled`, `Disabled-Active` | 6 |

⚠️ v4: State/Selected variantProps → **combined names** (mismo patrón que Checkbox/Switch). Sin switchVariant.
Instanciar: `findComponent("Radiobutton / Default", "Default-Active")`

---

### SEARCH INPUT
**Página:** `↳ SearchInput`

**Estilos:** Default, Outline — **Sizes:** LG, MD

| Contenedor | Props | Total |
|-----------|-------|-------|
| `SearchInput / Default / Size=LG` | State (Default/Hover/Pressed/Disabled), Filled (T/F) | 8 |
| `SearchInput / Default / Size=MD` | State, Filled | 8 |
| `SearchInput / Outline / Size=LG` | State, Filled | 8 |
| `SearchInput / Outline / Size=MD` | State, Filled | 8 |

⚠️ v3: path sin espacio — `SearchInput` (no `Search Input`).

---

### SELECT
**Página:** `↳ Select`

**Tipos:** Single, Multi — **Sizes:** SM, MD

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `Select / Single / Size=SM` | Stete*, Filled | Default/Hover/Pressed/Error/Disabled × True/False | 10 |
| `Select / Multi / Size=SM` | Stete*, Filled | Default/Hover/Pressed/Error/Disabled × True/False | 10 |
| `Select / Single / Size=MD` | State, Filled | Default/Hover/Pressed/Error/Disabled × True/False | 10 |
| `Select / Multi / Size=MD` | State, Filled | Default/Hover/Pressed/Error/Disabled × True/False | 10 |

*"Stete" es typo del archivo original en las variantes SM.*

---

### SCAN TEMPLATE *(NUEVO)*
**Página:** `↳ ScanTemplate`

Templates de pantalla completa mobile (360×780px) para flujos de escaneo de código QR/barras.
✅ **Son componentes de librería reales — instanciables vía MCP** (validado 2026-05-25).

| Template | Descripción |
|---------|-------------|
| `ScanTemplate / OpenBottomSheet` | Pantalla de escaneo con BottomSheet abierto en la parte inferior |
| `ScanTemplate / StickyBottomSheet` | Pantalla de escaneo con BottomSheet sticky (siempre visible) |
| `ScanTemplate / ActionsButtons` | Pantalla de escaneo con botones de acción superpuestos |

**Estructura común (todos los templates):** Image (fondo) + Overlay + Header + Body Section + Footer Section + Loader/Spinner + Notification
- Header: Headline (título + subtítulo) + Content (arrow_back + TagBusiness + Tag + ActionIcon)
- Body: Scanner (TopVectors + BottomVectors + Image) + CameraButtons (2× IconButton filled)
- Footer: BottomSheet > ActionButtons (Primary + Secondary + Tertiary)

Instanciar: `findComponent("ScanTemplate", "StickyBottomSheet")` · `"OpenBottomSheet"` · `"ActionsButtons"`

---

### SIDEBAR *(antes: Sidebar 🚧)*
**Página:** `↳ Sidebar`

| path | names | Total |
|-----------|-------|-------|
| `Sidebar / Expand / Outline` | `Click Expand`, `Hover Expand` | 2 |
| `Sidebar / Expand / Shadow` | `Click Expand`, `Hover Expand` | 2 |
| `Sidebar / Collapse / Outline` | `Click Expand`, `Hover Expand` | 2 |
| `Sidebar / Collapse / Shadow` | `Click Expand`, `Hover Expand` | 2 |
| `Sidebar / Expand items` | `Section`, `Submenu`, `Menu` | 3 *(nuevo)* |
| `Sidebar / Collapse items` | `Section`, `Menu` | 2 *(nuevo)* |

**Modos:** Collapse / Expand — **Estilos:** Outline / Shadow — **Tipos:** Click Expand / Hover Expand
**Items:** Section, Submenu (solo Expand), Menu — **13 componentes total.**
⚠️ v4: agregados item-level components (`Sidebar / Expand items` y `Sidebar / Collapse items`).
Instanciar sidebar: `findComponent("Sidebar / Expand / Shadow", "Click Expand")` (Desktop dashboards).

---

### SKELETON *(NUEVO)*
**Página:** `↳ Skeleton`

Placeholders de carga para distintos tipos de contenido. Cada átomo representa el esqueleto de un tipo de elemento UI.

| Contenedor | Tipo de elemento |
|-----------|-----------------|
| `Skeleton / avatar` | Avatar / imagen de perfil |
| `Skeleton / button` | Botón |
| `Skeleton / card` | Tarjeta |
| `Skeleton / icon` | Ícono |
| `Skeleton / img` | Imagen |
| `Skeleton / input` | Input de texto |
| `Skeleton / tag` | Tag / etiqueta |
| `Skeleton / text` | Texto / párrafo |
| `Skeleton / ProductFile` | Ítem de Product File |

**Átomos:** 9 tipos de placeholder — sin variantes formales (cada uno es un shape fijo)
> Sin componentProperties — seleccionar por `path='Skeleton' && name='card'`. Usar en HTML como `<div class="itds-skeleton itds-skeleton--card">` con animación shimmer pura en CSS.

---

### STEPPER
**Página:** `↳ Stepper`

**Tipos:** Full, Compact — **Orientaciones:** Horizontal, Vertical — **Sizes:** LG, SM

| path | names | Total |
|-----------|-------|-------|
| `Stepper / Full / Horizontal / Size=LG` | Pending, In progress, Success, Error | 4 |
| `Stepper / Full / Horizontal / Size=SM` | Pending, In progress, Success, Error | 4 |
| `Stepper / Full / Vertical / Size=LG` | Pending, In progress, Success, Error | 4 |
| `Stepper / Full / Vertical / Size=SM` | Pending, In progress, Success, Error | 4 |
| `Stepper / Compact / Size=LG` | Pending, In progress, Success, Error | 4 |
| `Stepper / Compact / Size=SM` | Pending, In progress, Success, Error | 4 |
| `Stepper / Utilities / Step Indicator` | Number-Pending, Number-In-Progress, Icon-In-Progress, Icon-Pending | 4 *(nuevo)* |

⚠️ v4: `Stepper / Compact` **no incluye** `/Horizontal/` en el path (es `Compact / Size=LG`, no `Compact / Horizontal / Size=LG`).
Nuevo: `Stepper / Utilities / Step Indicator` con 4 átomos de indicador de paso. **28 componentes total.**

---

### SWITCH
**Página:** `↳ Switch`

| path | names | Total |
|-----------|-------|-------|
| `Switch / Utilities` | `Switch` | 1 |
| `Switch / Default` | `Default`, `Default-Selected`, `Hover`, `Hover-Selected`, `Disabled`, `Disabled-Selected` | 6 |
| `Switch / Box` | `Default`, `Default-Selected`, `Hover`, `Hover-Selected`, `Disabled`, `Disabled-Selected` | 6 |

⚠️ v4: State/Selected variantProps → **combined names** (mismo patrón que Checkbox/Radiobutton). Sin switchVariant.
Instanciar: `findComponent("Switch / Default", "Default-Selected")`

---

### TABLE
**Página:** `↳ Table`

| path | name | Descripción | Total |
|-----------|------|-------------|-------|
| `Table` | `Table` | Tabla completa con header + body + pagination | 1 |
| `Table / Table Header` | `Desktop` | Header con SearchInput + botones | 1 |
| `Table / Cells` | `Head` | Celda de encabezado (variantProps: Default/Active/Selectable/Loading) | 1 |
| `Table / Cells` | `Text` | Celda de texto (variantProps: Default/Disabled/Active/Selectable/Loading/Disabled-Loading) | 1 |
| `Table / Cells` | `Action_Menu` | Celda con menú de acción (variantProps: Default/Disabled/Active) | 1 |
| `Table / Cells` | `Action` | Celda de acción directa (variantProps: Default/Disabled/Active) | 1 |
| `Table / Cells` | `Tag` | Celda con Tag (variantProps: Default/Disabled/Active) | 1 |
| `Table / Pagination` | `Mobile_Default` | Paginación mobile | 1 |
| `Table / Pagination` | `Desktop Active` | Paginación desktop activa | 1 |
| `Table / Pagination` | `Desktop Default` | Paginación desktop default | 1 |

⚠️ v4 [2026-05-26]: **path/name split corregido** — las cells usan path=`Table / Cells` con el tipo como name.
Instanciar: `findComponent("Table", "Table")` · `findComponent("Table / Table Header", "Desktop")` · `findComponent("Table / Cells", "Head")`
**Las variantes (Default/Active/Selectable/Loading) son variantProps switchables dentro de cada celda, no componentes separados.**
⚠️ v3: `Table / Table` y `Table / Table Header / Desktop` son nuevos contenedores de nivel superior; paginación expandida con variantes Mobile/Desktop.
**Total: 10 componentes.**

---

### TABS
**Página:** `↳ Tabs`

| path | names | Total |
|-----------|-------|-------|
| `Tabs / Default` | Default, Hover, Disabled | 3 |
| `Tabs / Default / Active` | Default, Hover | 2 |
| `Tabs / Box` | Default, Hover, Disabled | 3 |
| `Tabs / Box / Active` | Default, Hover | 2 |
| `Tabs / Tonal` | Default, Hover, Disabled | 3 |
| `Tabs / Tonal / Active` | Default, Hover | 2 |

⚠️ v4: Active states separados en sub-path `{Style} / Active` — instanciar por path directo. **15 componentes total** (mismo que antes).
Instanciar activo: `findComponent("Tabs / Default / Active", "Default")`

---

### TAG
**Página:** `↳ Tag`

| path | name | Total |
|-----------|------|-------|
| `Tag / {Color}` | `Size=SM` | 9 |
| `Tag / {Color}` | `Size=MD` | 9 |
| `Tag` | `TagGroup` | 1 |
| `Tag` | `TagBusiness` | 1 |

⚠️ v4 [2026-05-26]: **path/name split** — el Size es el **name**, no parte del path. El path termina en el color.
Instanciar: `findComponent("Tag / Blue", "Size=MD")` · `findComponent("Tag / Green", "Size=SM")`
Especiales: `findComponent("Tag", "TagGroup")` · `findComponent("Tag", "TagBusiness")`

**Colores disponibles (9):** Blue, Yellow, Green, Red, Purple, Disabled, Accent, Theme, Gray
**Sizes:** SM (h=21, icon 12px, text 12px/500), MD (h=24, icon 16px, text 14px/500)
**Texto siempre en:** `children[1].characters` — estructura uniforme en todos los colores: `[0]=icon-leading · [1]=text · [2]=icon-close`
**TagGroup:** texto de cada sub-tag en `children[i].children[1].characters` (i = 0..3)
**TagBusiness:** es una galería de 32 frames hardcodeados (16 marcas × SM+MD). No tiene variantes switchables. Texto de marca en `children[i].children[1].characters`. Tipografía: 12px/700 SM, 14px/700 MD (Bold, a diferencia de los color variants que usan 500)

---

### TEXT (TIPOGRAFÍA)
> El componente `Text / Text` **no existe** en el IT DS — la página `↳ Text` fue eliminada.
> El texto se maneja con `penpot.createText()` + tokens tipográficos del DS. Ver §5e de SKILL.md para el patrón obligatorio completo.

**Jerarquía de uso — texto libre en el body:**

| Rol | Token | px / weight | Uso típico |
|-----|-------|-------------|-----------|
| **H1** | `text-2xl.Bold` | 24 / 700 | Título principal de pantalla (sin PageHeader) |
| **H2** | `text-xl.Bold` | 20 / 700 | Título de sección dentro del body |
| **H3** | `text-xl.Medium` | 20 / 500 | Subtítulo de H2, nombre de card |
| **H4** | `text-base.Bold` | 16 / 700 | Label de grupo de campos, heading de alert inline |
| **Body nav** | `text-base.Medium` | 16 / 500 | Navegación, labels de input, breadcrumb, sidebar |
| **Párrafo** | `text-base.Regular` | 16 / 400 | Descripción larga, cuerpo de modal/card |
| **Secundario** | `text-sm.Medium` | 14 / 500 | Nota aclaratoria, metadata, texto de apoyo |
| **Caption** | `text-sm.Regular` | 14 / 400 | Descripción de stepper, texto terciario |
| **Tag text** | `text-xs.Bold` | 12 / 700 | Texto dentro de tags, chips, badges |
| **Helper** | `text-xs.Medium` | 12 / 500 | Helper text de inputs, contadores |
| **Footer/legal** | `text-xs.Regular` | 12 / 400 | Copyright, notas legales, texto de pie |

**Font base IT DS:** DM Sans · **Line-height:** 1.25 (todos los tokens)

---

### TEXT AREA
**Página:** `↳ TextArea`

| path | names | Total |
|-----------|-------|-------|
| `TextArea` | Default, Default-Filled, Hover, Hover-Filled, Pressed, Pressed-Filled, Disabled, Disabled-Filled, Error-Filled | 9 |

⚠️ v4: todos bajo path único `TextArea` con combined names. **9 componentes total.**
⚠️ Nota: `Error` (sin Filled) no existe — solo `Error-Filled`.
Instanciar: `findComponent("TextArea", "Default-Filled")`

---

### TEXT INPUT
**Página:** `↳ TextInput`

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `TextInput / Size=MD` | State, Filled | Default/Hover/Pressed/Disabled/Error/Success × True/False | 11 |
| `TextInput / Size=LG` | State, Filled | Default/Hover/Pressed/Disabled/Error/Success × True/False | 11 |

**State:** Default, Hover, Pressed, Disabled, Error, Success — **Filled:** True, False

---

### TOGGLE BINARY
**Página:** `↳ ToggleBinary`

**Estilos:** Default Text, Default Icon, Outline Text, Outline Icon — **Sizes:** LG, MD, SM

| Propiedad | Valores |
|-----------|---------|
| State | Default, Accepted, Rejected |

**Total variantes por contenedor:** 3 — **Total contenedores:** 12 (4 estilos × 3 sizes)

⚠️ path en librería: `ToggleBinary` (sin espacio) — el size es el **name**, no parte del path.

| Contenedor (path / name) |
|-----------|
| `ToggleBinary / Default Text` name=`Size=LG` · `Size=MD` · `Size=SM` |
| `ToggleBinary / Default Icon` name=`Size=LG` · `Size=MD` · `Size=SM` |
| `ToggleBinary / Outline Text` name=`Size=LG` · `Size=MD` · `Size=SM` |
| `ToggleBinary / Outline Icon` name=`Size=LG` · `Size=MD` · `Size=SM` |

---

### TOGGLE BUTTON
**Página:** `↳ ToggleButton`

**Estilos:** Default, Outline, Tonal — **Sizes:** LG, MD, SM

**Estructura v3 — 4 niveles:** `ToggleButton / {Style} / Size={LG|MD|SM} / {Variant} / {State}`

| Contenedor | Sub-niveles (Variant × State) |
|-----------|-------------------------------|
| `ToggleButton / Default / Size=LG` | Default / Destructive / Success × Default/Hover/Pressed/Disabled/Active-Default/Active-Hover/Active-Pressed/Active-Disabled |
| `ToggleButton / Default / Size=MD` | (ídem — 3 variantes × 8 estados = 24 sub-boards) |
| `ToggleButton / Default / Size=SM` | (ídem) |
| `ToggleButton / Outline / Size=LG` · `/Size=MD` · `/Size=SM` | (ídem) |
| `ToggleButton / Tonal / Size=LG` · `/Size=MD` · `/Size=SM` | (ídem) |

⚠️ v3 breaking changes:
- Nombre sin espacio: `ToggleButton` (no `Toggle Button`)
- Size=M → Size=MD · Size=S → Size=SM
- Variant (Default/Destructive/Success) y State son sub-boards internos — NO variantProps switchables vía MCP.
  Instanciar el board del style/size correcto; la variante y estado se seleccionan en sub-nivel.

---

### TOOLTIP *(antes: Tooltip 🚧)*
**Página:** `↳ Tooltip`

| path | name | Total |
|-----------|------|-------|
| `Tooltip` | `Top` | 1 |
| `Tooltip` | `Right` | 1 |
| `Tooltip` | `Bottom` | 1 |
| `Tooltip` | `Left` | 1 |

**Posiciones:** Top, Right, Bottom, Left — componentes separados bajo path único `Tooltip`
⚠️ v3: La propiedad `Property 1` con variantes fue reemplazada por boards individuales por posición.
⚠️ v4 [2026-05-26]: **path/name split** — path=`Tooltip`, name=posición. Instanciar: `findComponent("Tooltip", "Top")` (NO `findComponent("Tooltip / Top", ...)`)

---

### USER MENU
**Página:** `↳ UserMenu`

| path | names | Total |
|-----------|-------|-------|
| `UserMenu / Right top` | Default, Hover, Active | 3 |
| `UserMenu / Left bottom` | Default, Hover, Active | 3 |
| `UserMenu / Dropdown` | `Default`, `Fullscreen` | 2 |
| `UserMenu / Utilities` | `SlectSingle` | 1 |

⚠️ v4: `UserMenu / Utilities / SlectSingle` (6 variantes con State/Selected) → `UserMenu / Utilities` (name=`SlectSingle`, **1 componente**).
`UserMenu / Dropdown / Default` → `UserMenu / Dropdown` (name=`Default`). **9 componentes total.**
Instanciar: `findComponent("UserMenu / Dropdown", "Fullscreen")`
*Nota: `SlectSingle` es typo en Penpot (debería ser `SelectSingle`).*

---

### VIEW MORE/LESS *(antes: ViewMoreLess 🚧)*
**Página:** `↳ ViewMoreLess`

| path | names | Total |
|-----------|-------|-------|
| `ViewMoreLess` | `Content`, `Text` | 2 |
| `ViewMoreLess / Utilities` | `Container` | 1 |

⚠️ v4: Content y Text ahora bajo path único `ViewMoreLess` (no sub-paths separados). **3 componentes total.**
Instanciar: `findComponent("ViewMoreLess", "Content")` · `findComponent("ViewMoreLess", "Text")`
**Tipos:** Content (contenido expandible), Text (solo texto expandible), Utilities/Container (base de posicionamiento)

---

## 6. PÁGINAS DEL ARCHIVO

**Total: 68 páginas** — Todas las páginas de componentes usan prefijo `↳`

| # | Página | Estado |
|---|--------|--------|
| 1 | Cover | — |
| 2 | ---Foundations--- | — |
| 3 | ---Components--- | — |
| 4 | ↳ Accordion | ✅ Activo |
| 5 | ↳ ActionButtons | ✅ Activo |
| 6 | ↳ ActionIcon | ✅ Activo |
| 7 | ↳ Alert | ✅ Activo |
| 8 | ↳ AppBar | ✅ Activo |
| 9 | ↳ Attachment | ✅ Activo |
| 10 | ↳ Avatar | ✅ Activo |
| 11 | ↳ Badge | ✅ Activo |
| 12 | ↳ BottomNavigation | ✅ Activo *(NUEVO v3)* |
| 13 | ↳ BottomSheet | ✅ Activo |
| 14 | ↳ Breadcrumb | ✅ Activo |
| 15 | ↳ Button | ✅ Activo |
| 16 | ↳ Cards | ✅ Activo |
| 17 | ↳ Carousel | ✅ Activo |
| 18 | ↳ Checkbox | ✅ Activo |
| 19 | ↳ Counter | ✅ Activo |
| 20 | ↳ CSAT | ✅ Activo *(NUEVO v2)* |
| 21 | ↳ DataList | ✅ Activo |
| 22 | ↳ DateInput | ✅ Activo |
| 23 | ↳ Divider | ✅ Activo |
| 24 | ↳ Drawer | ✅ Activo |
| 25 | ↳ Dropdown | ✅ Activo |
| 26 | ↳ EmptyState | ✅ Activo |
| 27 | ↳ FabButton | ✅ Activo |
| 28 | ↳ FileInput | ✅ Activo |
| 29 | ↳ FilterPanel | ✅ Activo *(NUEVO v2)* |
| 30 | ↳ FileUploader | ✅ Activo *(NUEVO v2)* |
| 31 | ↳ Footer | ✅ Activo |
| 32 | ↳ ImageUploader | ✅ Activo *(NUEVO v2)* ⚠️ path librería: `ImageUpload` |
| 33 | ↳ IconButton | ✅ Activo |
| 34 | ↳ Link | ✅ Activo |
| 35 | ↳ List | ✅ Activo |
| 36 | ↳ Loader | ✅ Activo *(NUEVO v3)* — `findComponent("Loader", "Logo"|"Spinner")` validado 2026-05-19 |
| 37 | ↳ Menu | ✅ Activo *(NUEVO v2)* |
| 38 | ↳ Modal | ✅ Activo |
| 39 | ↳ Notification | ✅ Activo |
| 40 | ↳ NumberIndicator | ✅ Activo |
| 41 | ↳ OtpInput | ✅ Activo *(NUEVO v2)* |
| 42 | ↳ Radiobutton | ✅ Activo |
| 43 | ↳ Rating | ✅ Activo *(NUEVO v2)* |
| 44 | ↳ PageHeader | ✅ Activo |
| 45 | ↳ PasswordInput | ✅ Activo |
| 46 | ↳ PhoneInput | ✅ Activo *(NUEVO v2)* |
| 47 | ↳ ProductEcommerce | ✅ Activo *(NUEVO v2 · typo corregido v3)* |
| 48 | ↳ ProductFile | ✅ Activo |
| 49 | ↳ ProgressBar | ✅ Activo |
| 50 | ↳ ProgressCheckpoint | ✅ Activo *(NUEVO v2)* |
| 51 | ↳ ProgressCircle | ✅ Activo *(NUEVO v2)* |
| 52 | ↳ SearchInput | ✅ Activo |
| 53 | ↳ ScanTemplate | ✅ Activo *(NUEVO v3)* — instanciable vía MCP (validado v4) |
| 54 | ↳ Select | ✅ Activo |
| 55 | ↳ Sidebar | ✅ Activo |
| 56 | ↳ Skeleton | ✅ Activo *(NUEVO v2)* |
| 57 | ↳ Stepper | ✅ Activo |
| 58 | ↳ Switch | ✅ Activo |
| 59 | ↳ Table | ✅ Activo |
| 60 | ↳ Tabs | ✅ Activo |
| 61 | ↳ Tag | ✅ Activo |
| 62 | ↳ TextArea | ✅ Activo |
| 63 | ↳ TextInput | ✅ Activo |
| 64 | ↳ ToggleButton | ✅ Activo |
| 65 | ↳ ToggleBinary | ✅ Activo |
| 66 | ↳ Tooltip | ✅ Activo |
| 67 | ↳ UserMenu | ✅ Activo |
| 68 | ↳ ViewMoreLess | ✅ Activo |

### Resumen de cambios vs versión anterior

**v3 → v4 (2026-05-19 → 2026-05-25)** — audit completo realizado 2026-05-25
| Cambio | Componentes |
|--------|------------|
| **Página eliminada** | `↳ Text` — tipografía migrada a reglas de uso en ds-snapshot §TEXT y SKILL.md §5e |
| **Typos corregidos** | `Activer-Default` → `Active-Default` (ToggleButton/Outline/LG) · `Value 9` → `Filled-Disabled` (IconButton/Tonal/LG) · `DIsabled` → `Disabled` (IconButton/Danger/MD) · `Deafult` → `Default` (Checkbox) |
| **Paths colapsados** | Attachment (3→2 niveles) · Breadcrumb Utilities (6 variantes→1) · DateInput Calendar (6 paths→2) · UserMenu Dropdown y Utilities |
| **Paths unificados** | Badge (36 sub→6 directos) · Divider (4→2) · Dropdown (15→3) · EmptyState (sin comp→1) · NumberIndicator (9→3) · ProductFile (4 paths→1) · TextArea (10→9 bajo path único) · ViewMoreLess (sub-paths→1) |
| **Estructura reestructurada** | Button (17 variantes→5, icon props eliminadas) · Counter (LG/MD/SM eliminados→8 paths state-based) · ProgressBar (Color/Size→Size/Color) · Tabs (Active embebido→sub-path `/Active`) |
| **Variantes renombradas** | Checkbox/Radiobutton/Switch: variantProps → combined names (Default-Active etc.) · PhoneInput: Success→Dropdown |
| **Nuevos componentes** | Accordion/Utilities/Container · AppBar/Desktop/Shadow (UserMenu+Button) · AppBar/Utilities/Menu Section · Card/CardSwap · Card/Utilities/Container · Carousel/Carousel (Theme+Neutral) · Carousel/Utilities (ControlsTheme+ControlsNeutral) · CSAT Default/Disabled por size · DataList/Or List · DataList/Utilities TrailingItems · List/Utilities (Action/Trailing/Leading/Toggle items) · OtpInput/Utilities Success state + Hidden fill · Sidebar/Expand items (Section+Submenu+Menu) · Sidebar/Collapse items (Section+Menu) · Stepper/Utilities/Step Indicator |
| **Expanded** | IconButton: Filled en sub-path `/Filled` para SM/MD; integrado en path base para LG · OtpInput utilities: 20→36 (State×Filled+Hidden) |
| **ScanTemplate** | Ahora son componentes instanciables vía MCP (antes solo referencia) |

**v2 → v3 (2026-05-18 → 2026-05-19)** — audit completo realizado 2026-05-19
| Cambio | Componentes |
|--------|------------|
| **Páginas nuevas** | BottomNavigation, Loader, ScanTemplate |
| **Typos corregidos** | `ProductEcomerce` → `ProductEcommerce` (página ahora tiene doble m) |
| **Renaming Size L/M/S → LG/MD/SM** | FabButton, FilterPanel, ProgressBar, ProgressCheckpoint, ToggleButton, Button, IconButton, **ToggleBinary, NumberIndicator** |
| **Renaming paths sin espacio** | `SearchInput` (no `Search Input`) · `ProductFile` (no `Product File`) · `NavigationList`/`ActionList`/`ToggleList` |
| **Renaming con prefijo Size=** | ImageUpload (`LG` → `Size=LG`) · OtpInput (`LG` → `Size=LG`) |
| **Renaming separador path** | Stepper (`Horizontal_Size=L` → `Horizontal / Size=LG`) |
| **Estructura ampliada** | BottomSheet (4 boards: Content/Text × Default/Sticky Header) |
| **Estructura ampliada** | Footer (Theme/Neutral → Outline/Shadow) |
| **Estructura ampliada** | ProgressCircle (wrappers → boards explícitos por Color/Size/%) |
| **Estructura ampliada** | ToggleButton (3 niveles → 4 niveles: Style/Size/Variant/State) |
| **Estructura ampliada** | PhoneInput (1 → 12 boards por size) |
| **Estructura ampliada** | Table (+Table header Desktop + Pagination Mobile/Desktop) |
| **Estructura ampliada** | Sidebar (Collapse/Expand × Outline/Shadow × Click/Hover Expand) |
| **Boards separados** | Tooltip (1 contenedor con prop → 4 boards por posición) |
| **Boards separados** | TextArea (`TextArea / TextArea` con variantProps → boards por estado) |
| **Nuevo contenido** | Rating: `Utilities/Active` + `Utilities/Inactive` → `Utilities/Icons` |
| **Nuevo contenido** | OtpInput utilities expandidas (State × Filled) |
| **Nuevo contenido** | CSAT: nuevo `Utilities/Emojis` |
| **Nuevo contenido** | ProductFile: nuevo `Items_Product File` |
| **Nuevo contenido** | ViewMoreLess: nuevo `Utilities/Container` |
| **Corrección** | Link/Theme/Size=SM: 3 → 4 estados (Disabled agregado) |

**v1 → v2 (2026-05-06 → 2026-05-13)**
| Cambio | Componentes |
|--------|------------|
| **Nuevos activos** | CSAT, FilterPanel, FileUploader, ImageUploader, Menu, OtpInput, PhoneInput, ProductEcomerce, ProgressCheckpoint, ProgressCircle, Rating, Skeleton |
| **v1 nuevos → ya establecidos** | Carousel, Divider, EmptyState, AppBar, Breadcrumb, FabButton, Modal, Sidebar, Tooltip, ViewMoreLess |
| **Promovidos a activo (antes 🚧)** | DateInput, Drawer, FileInput, UserMenu |
| **Typos de naming (página vs librería)** | `ImageUploader` → path `ImageUpload` · `ProductEcomerce` → path `ProductEcommerce` |

---

## 7. NOTAS DE CALIDAD

### Typos detectados en el archivo Penpot
| Componente | Tipo | Error | Correcto |
|-----------|------|-------|---------|
| Select / SM | Nombre de propiedad | `Stete` | `State` |
| Accordion / Default Open Content | Valor Variant | `Tailing Items` | `Trailing Items` |
| FileInput / Size=MD | Nombre de propiedad | `Property 1` | `State` |
| Carousel / Dot | Nombre de propiedad | `Property 1` | sin normalizar |
| Tooltip | Nombre de propiedad | `Property 1` | `Position` |
| ViewMoreLess | Nombre de propiedad | `Property 1` | `State` |
| ImageUploader | Nombre de página vs librería | `ImageUploader` (página) | `ImageUpload` (path en librería — sin "r") |
| UserMenu | Nombre de utility | `SlectSingle` | `SelectSingle` |
| Rating / Utilities / Inactive | Contenido | Solo `Star_blue` (debería tener 7 colores) | Posible regresión — verificar en Penpot |

### Typos corregidos en v4 (2026-05-25)
| Componente | Error anterior | Estado |
|-----------|---------------|--------|
| IconButton / Tonal / Size=LG | `Value 9` → `Filled-Disabled` | ✅ Corregido |
| IconButton / Danger / Size=MD | `DIsabled` → `Disabled` | ✅ Corregido |
| ToggleButton / Outline / Size=LG | `Activer-Default` → `Active-Default` | ⚠️ Pendiente — sigue en Penpot (verificado 2026-05-26 en paths Success y Destructive) |
| Checkbox / Default | `Deafult` → `Default` | ✅ Corregido |
| ProductEcommerce | `ProductEcomerce` → `ProductEcommerce` | ✅ Corregido v3 |

### Convenciones del archivo
- **Sizes:** `SM`, `MD`, `LG` — estándar v3 en todos los componentes
- **Estados interactivos:** Default → Hover → Pressed
- **Estados condicionales:** Active/Default, Active/Hover, Active/Pressed, Active/Disabled
- **Filled states:** Filled/Default, Filled/Hover, Filled/Pressed, Filled/Disabled
- **Booleanos:** `True` / `False`
- **Nombre de páginas:** Todas usan `↳ ComponentName` (camelCase, sin espacios)

### Instanciación en Penpot (referencia rápida)
```javascript
// Buscar y crear instancia de un componente
const lib = penpot.library.local;
const comp = lib.components.find(c => c.name === 'Size=M'); // nombre exacto
const instance = comp.instance();
instance.x = targetX;
instance.y = targetY;
board.appendChild(instance);

// Cambiar variante en una instancia
instance.switchVariant(propIndex, value);
// Ejemplo: cambiar State a "Hover" (prop en posición 0)
instance.switchVariant(0, 'Hover');

// Buscar componente por path completo (helper recomendado)
function findComponent(path, name) {
  return lib.components.find(c => c.path === path && c.name === name);
}
const btn = findComponent("Button / Primary / Size=LG", "Default");
```

---

*Documento generado desde Penpot MCP — IT DS | Components (Cencosud)*
*Última actualización: 2026-05-26 (v4.1) — audit completo + validación cruzada vía Claude Code + Penpot MCP*
*Fixes v4.1: DateInput/Utilities (7→1), List+15 utilities, Tag/Tooltip/Table path-name split, IconButton/Tonal/LG /Filled sub-path, ToggleButton typo revertido a ⚠️ Pendiente*
