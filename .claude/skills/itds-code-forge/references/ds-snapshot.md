# IT DS — Penpot Design System Snapshot
> **Archivo Penpot:** IT DS | Components
> Cencosud IT Design System — Extraído directamente desde Penpot vía MCP
> **Fecha de extracción:** 2026-05-13 (actualizado — original: 2026-05-06)
> **Total componentes en librería:** 459 | **Total páginas:** 65

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

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `Accordion / Default Close` | Variant | Default, Default + Checkbox, Trailing Items, Trailing Items + Checkbox | 4 |
| `Accordion / Default Open Content` | Variant | Default, Default + Checkbox, Tailing Items, Tailing Items + Checkbox | 4 |
| `Accordion / Default Open Text` | Variant | Default, Default+ Checkbox, Trailing Items, Trailing Items + Checkbox | 4 |
| `Accordion / Box Close` | Variant | Default, Default + Checkbox, Trailing Items, Trailing Items + Checkbox | 4 |
| `Accordion / Box Open Content` | Variant | Default, Default + Checkbox, Trailing Items, Trailing Items + Checkbox | 4 |
| `Accordion / Box Open Text` | Variant | Default, Default + Checkbox, Tailing Items, Tailing Items + Checkbox | 4 |

**Resumen:** 2 estilos (Default / Box) × 3 estados apertura (Close / Open Content / Open Text) × 4 variantes de contenido.

---

### ACTION BUTTONS
**Página:** `↳ ActionButtons`

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `ActionButtons / Default` | Variant | Vertical Buttons, Filled Buttons, Hugged Buttons | 3 |
| `ActionButtons / Utilities / FilledButtons` | Size, Has Button 2 | L/M/S × True/False | 6 |
| `ActionButtons / Utilities / HuggedButtons` | Size, Has Button 2, Has Button 3 | L/M/S × T/F × T/F | 9 |
| `ActionButtons / Utilities / VerticalButtons` | Size, Has Button 2, Has Button 3 | L/M/S × T/F × T/F | 9 |

---

### ACTION ICON
**Página:** `↳ ActionIcon`

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `ActionIcon / Size= L` | Variant, State | Neutral/Theme × Default/Disabled | 3 |
| `ActionIcon / Size=M` | Variant, State | Neutral/Theme × Default/Disabled | 3 |
| `ActionIcon / Size=S` | Variant, State | Neutral/Theme × Default/Disabled | 3 |

**Variant:** Neutral, Theme — **State:** Default, Disabled

---

### ALERT
**Página:** `↳ Alert`

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `Alert / Alert` | Variant | Success, Info, Error, Warning | 4 |

---

### APP BAR
**Página:** `↳ AppBar` *(antes: App Bar 🚧)*

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `AppBar / Utilities / Menu States / Desktop` | — | Default, Hover, Active | 3 |
| `AppBar / Utilities / Menu States / Mobile` | — | Default, Hover, Active | 3 |

*Nota: Properties vacías en el VariantContainer — los estados se acceden directamente.*

---

### ATTACHMENT
**Página:** `↳ Attachment`
> Sin variant containers definidos. Componente sin variantes formales en Penpot.

---

### AVATAR
**Página:** `↳ Avatar`

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `Avatar / Size=L` | Variant, State | Name/Image × Default/Hover/Pressed | 6 |
| `Avatar / Size=M` | Variant, State | Name/Image × Default/Hover/Pressed | 6 |
| `Avatar / Size=S` | Variant, State | Name/Image × Default/Hover/Pressed | 6 |

**Variant:** Name (iniciales), Image — **State:** Default, Hover, Pressed

---

### BADGE
**Página:** `↳ Badge`

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `Badge / Gray` | Size, Indeterminate | L/M/S × True/False | 4 |
| `Badge / Blue` | Size, Indeterminate | L/M/S × True/False | 4 |
| `Badge / Red` | Size, Indeterminate | L/M/S × True/False | 4 |
| `Badge / Notifications` | Size, Indeterminate | L/M/S × True/False | 4 |
| `Badge / Theme` | Size, Indeterminate | L/M/S × True/False | 4 |
| `Badge / Disabled` | Size, Indeterminate | L/M/S × True/False | 4 |

**Colores:** Gray, Blue, Red, Notifications, Theme, Disabled

---

### BOTTOM SHEET
**Página:** `↳ BottomSheet`
> Sin variant containers definidos.

---

### BREADCRUMB
**Página:** `↳ Breadcrumb` *(antes: Breadcrumb 🚧)*

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `Breadcrumb / Utilities / Page link` | isActive, State | True/False × Default/Hover/Disabled | 6 |

---

### BUTTON
**Página:** `↳ Button`

**Estilos:** Primary, Secondary, Tertiary, Tonal, Danger, Danger Text, Overlay — **Sizes:** L, M, S

Todas las variantes comparten las mismas propiedades:

| Propiedad | Valores |
|-----------|---------|
| State | Default, Hover, Pressed, Disabled, Loading |
| Has left icon | True, False |
| Has right icon | True, False |

**Total variantes por contenedor:** 17

| Contenedor |
|-----------|
| `Button / Primary / Size=L` · `Button / Primary / Size=M` · `Button / Primary / Size=S` |
| `Button / Secondary / Size=L` · `Button / Secondary / Size=M` · `Button / Secondary / Size=S` |
| `Button / Tertiary / Size=L` · `Button / Tertiary / Size=M` · `Button / Tertiary / Size=S` |
| `Button / Tonal / Size=L` · `Button / Tonal / Size=M` · `Button / Tonal / Size=S` |
| `Button / Danger / Size=L` · `Button / Danger / Size=M` · `Button / Danger / Size=S` |
| `Button / Danger / Danger Text / Size=L` · `/Size=M` · `/Size=S` |
| `Button / Overlay / Size=L` · `Button / Overlay / Size=M` · `Button / Overlay / Size=S` |

---

### CARD
**Página:** `↳ Cards`

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `Card / CardImage_Horizontal` | Style | Outline, Shadow, Tonal | 3 |
| `Card / CardImage_Vertical` | Style | Outline, Shadow, Tonal | 3 |
| `CardFeature_BGImage_Size=LG` | — | — | 1 |
| `CardFeature_BGImage_Size=MD` | — | — | 1 |
| `CardFeature_SideImage_Size=LG` | — | — | 1 |
| `CardFeature_SideImage_Size=MD` | — | — | 1 |

**Estilos:** Outline, Shadow, Tonal — **Layouts:** Horizontal, Vertical, Feature BGImage, Feature SideImage

---

### CAROUSEL *(NUEVO)*
**Página:** `↳ Carousel`

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `Carousel / Utilities / Dot` | Property 1 | Active, Default | 2 |

*El dot indicator es el único componente formal. El carousel completo se compone en pantalla.*

---

### CHECKBOX
**Página:** `↳ Checkbox`

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `Checkbox / Utilities / Checkbox` | State, Selected, Indeterminated | Default/Hover/Disabled × True/False × True/False | 12 |
| `Checkbox / Default` | State, Selected | Default/Disabled/Hover × True/False | 6 |
| `Checkbox / Box` | State, Selected | Default/Disabled/Hover × True/False | 6 |

**State:** Default, Hover, Disabled — **Selected:** True, False — **Indeterminated:** True, False (solo utility)

---

### COUNTER
**Página:** `↳ Counter`

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `Counter / Horizontal` | State, Variant | Default/Disabled/Invalid/Pressed × at-min/at-max/at-disabled/at-range | 10 |
| `Counter / Vertical` | State, Variant | Default/Disabled/Invalid/Pressed × at-min/at-max/at-disabled/at-range | 10 |

**State:** Default, Disabled, Invalid, Pressed — **Variant (posición):** at-min, at-max, at-disabled, at-range

---

### CSAT *(NUEVO)*
**Página:** `↳ CSAT`

Componente de satisfacción del cliente (Customer Satisfaction). Usa emojis animados en 5 niveles emocionales.

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `CSAT / Size=L` | — | — | 1 |
| `CSAT / Size=M` | — | — | 1 |
| `CSAT / Size=S` | — | — | 1 |
| `CSAT / Utilities / Items / Size=L` | — | — | 1 |
| `CSAT / Utilities / Items / Size=M` | — | — | 1 |
| `CSAT / Utilities / Items / Size=S` | — | — | 1 |
| `CSAT / Utilities / Emoji / Active / Size=L/M/S` | Emotion | very-negative, negative, neutral, positive, very-positive | 5 × 3 |
| `CSAT / Utilities / Emoji / Inactive / Size=L/M/S` | Emotion | very-negative, negative, neutral, positive, very-positive | 5 × 3 |

**Sizes:** L, M, S — **Emociones:** very-negative, negative, neutral, positive, very-positive — **Estado emoji:** Active / Inactive
> Sin componentProperties — seleccionar por path + name. Usar `CSAT / Size=L` para el componente principal; `CSAT / Utilities / Emoji / Active / Size=L` + name `positive_active` para el emoji individual.

---

### DATA LIST
**Página:** `↳ DataList`

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `Data List / Data List` | Variant | Default, Default + Icon | 2 |

---

### DATE INPUT
**Página:** `↳ DateInput`

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `DateInput / Size=LG` | Filled, State | True/False × Default/Hover/Pressed/Error/Disabled | 10 |
| `DateInput / Size=SM` | Filled, State | True/False × Default/Hover/Pressed/Error/Disabled | 10 |
| `DateInput / Calendar / Inline / days` | — | — | 1 |
| `DateInput / Calendar / Inline / months` | — | — | 1 |
| `DateInput / Calendar / Inline / years` | — | — | 1 |
| `DateInput / Calendar / Overlay / days` | — | — | 1 |
| `DateInput / Calendar / Overlay / months` | — | — | 1 |
| `DateInput / Calendar / Overlay / years` | — | — | 1 |
| `DateInput / Utilities / CalendarDays` | State | Active, Disabled, Range-middle, Range-start, Range-end, Hover, Default | 7 |

**Sizes:** LG, SM — **Modos de calendario:** Inline, Overlay — **Vistas de calendario:** days, months, years
**State:** Default, Hover, Pressed, Error, Disabled — **Filled:** True, False

---

### DIVIDER *(NUEVO)*
**Página:** `↳ Divider`

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `Divider / Horizontal` | label | True, False | 2 |
| `Divider / Vertical` | Label | True, False | 2 |

**label/Label:** True (con texto), False (línea sola)

---

### DRAWER
**Página:** `↳ Drawer`

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `Drawer / Drawer` | — | — | 1 |
| `Drawer / Utilities / Container` | — | — | 1 |

---

### DROPDOWN
**Página:** `↳ Dropdown`

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `Dropdown / Utilities / SlectSingle` | State, Selected | Default/Disabled/Hover × True/False | 6 |
| `Dropdown / Utilities / SlectMulti` | State, Selected | Default/Disabled/Hover × True/False | 6 |
| `Dropdown / Dropdown` | Variant | selectSingle, Empty, selectMulti | 3 |

---

### EMPTY STATE *(NUEVO)*
**Página:** `↳ EmptyState`
> Sin variant containers definidos. Componente sin variantes formales en Penpot.

---

### FAB BUTTON *(antes: FAB Button 🚧)*
**Página:** `↳ FabButton`

**Estilos:** Default, Tonal — **Sizes:** L, M, S

| Propiedad | Valores |
|-----------|---------|
| State | Default, Hover, Pressed, Disabled, Loading |

**Total variantes por contenedor:** 5

| Contenedor |
|-----------|
| `FabButton / Default / Size=L` · `FabButton / Default / Size=M` · `FabButton / Default / Size=S` |
| `FabButton / Tonal / Size=L` · `FabButton / Tonal / Size=M` · `FabButton / Tonal / Size=S` |

---

### FILE INPUT
**Página:** `↳ FileInput`

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `FileInput / Size=MD` | Property 1 | Default, Filled, Error, Loading, Disabled | 5 |
| `FileInput / Size=LG` | State | Default, Filled, Error, Loading, Disabled | 5 |

**Sizes:** MD, LG — **State:** Default, Filled, Error, Loading, Disabled
> Sin componentProperties — seleccionar por `path='FileInput' && name='Size=LG'`. State embebido en el diseño del frame, no switcheable vía MCP.
*Nota: Size=MD usa `Property 1` como nombre de propiedad (typo sin normalizar).*

---

### FILTER PANEL *(NUEVO)*
**Página:** `↳ FilterPanel`

Panel de filtros con soporte para 3 tamaños. Incluye utilidad de Panel interno.

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `FilterPanel / Size=L` | — | — | 1 |
| `FilterPanel / Size=M` | — | — | 1 |
| `FilterPanel / Size=S` | — | — | 1 |
| `FilterPanel / Utilities / Panel` | — | — | 1 |

**Sizes:** L, M, S
> Sin componentProperties — seleccionar por `path='FilterPanel' && name='Size=L'`.

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

### ICON BUTTON
**Página:** `↳ IconButton`

**Estilos:** Theme, Tonal, Danger — **Sizes:** L, M, S

| Propiedad | Valores |
|-----------|---------|
| State | Default, Hover, Pressed, Disabled, Loading, Filled/Default, Filled/Hover, Filled/Pressed, Filled/Disabled, Filled/Loading |

**Total variantes por contenedor:** 10

| Contenedor |
|-----------|
| `Icon Button / Theme / Size=L` · `/Size=M` · `/Size=S` |
| `Icon Button / Tonal / Size=L` · `/Size=M` · `/Size=S` |
| `Icon Button / Danger / Size=L` · `/Size=M` · `/Size=S` |

---

### IMAGE UPLOADER *(NUEVO)*
**Página:** `↳ ImageUploader`
⚠️ **Typo de naming:** la página se llama `ImageUploader` pero el path en librería es `ImageUpload` (sin "r").

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `ImageUpload / LG` | — | — | 1 |
| `ImageUpload / XL` | — | — | 1 |
| `ImageUpload / MD` | — | — | 1 |
| `ImageUpload / SM` | — | — | 1 |
| `ImageUpload / XS` | — | — | 1 |

**Sizes:** XS, SM, MD, LG, XL — **Instanciar con path:** `ImageUpload` (no `ImageUploader`)
> Sin componentProperties — seleccionar por `path='ImageUpload' && name='LG'`.

---

### LINK
**Página:** `↳ Link`

**Estilos:** Theme, Neutral — **Sizes:** LG, MD, SM

| Contenedor | State values | Total |
|-----------|-------------|-------|
| `Link / Theme / Size=LG` | Default, Hover, Pressed, Disabled | 4 |
| `Link / Theme / Size=MD` | Default, Hover, Pressed, Disabled | 4 |
| `Link / Theme / Size=SM` | Default, Hover, Pressed | 3 |
| `Link / Neutral / Size=LG` | Default, Hover, Pressed, Disabled | 4 |
| `Link / Neutral / Size=MD` | Default, Hover, Pressed, Disabled | 4 |
| `Link / Neutral / Size=SM` | Default, Hover, Pressed, Disabled | 4 |

---

### LIST
**Página:** `↳ List`

**Tipos:** Navigation List, Action List, Toggle List — **Estilos:** Default, Outline, Box

| Contenedor | Variantes | Total |
|-----------|-----------|-------|
| `List / Navigation List / Default` | Default, Disabled, Selectable | 3 |
| `List / Navigation List / Outline` | Outline, Disabled, Selectable | 3 |
| `List / Navigation List / Box` | Default, Disabled, Selectable | 3 |
| `List / Action List / Default` | Default, Disabled, Selectable | 3 |
| `List / Action List / Outline` | Default, Disabled, Selectable | 3 |
| `List / Action List / Box` | Default, Disabled, Selectable | 3 |
| `List / Toggle List / Default` | Default, Disabled, Selectable | 3 |
| `List / Toggle List / Outline` | Default, Disabled, Selectable | 3 |
| `List / Toggle List / Box` | Default, Disabled, Selectable | 3 |

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

---

### NOTIFICATION
**Página:** `↳ Notification`

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `Notification / Default` | Variant | Success, Warning, Error, Info | 4 |
| `Notification / Inverse` | Variant | Success, Warning, Error, Info | 4 |

---

### NUMBER INDICATOR
**Página:** `↳ NumberIndicator`

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `NumberIndicator / Size=L` | Color | Neutral, Theme, Disabled | 3 |
| `NumberIndicator / Size=M` | Color | Neutral, Theme, Disabled | 3 |
| `NumberIndicator / Size=S` | Color | Neutral, Theme, Disabled | 3 |

---

### OTP INPUT *(NUEVO)*
**Página:** `↳ OtpInput`

Input para códigos de verificación de un solo uso. Soporta 3 longitudes × 2 tamaños.

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `OtpInput / LG / 3 Characters` | — | — | 1 |
| `OtpInput / LG / 4 Characters` | — | — | 1 |
| `OtpInput / LG / 6 Characters` | — | — | 1 |
| `OtpInput / MD / 3 Characters` | — | — | 1 |
| `OtpInput / MD / 4 Characters` | — | — | 1 |
| `OtpInput / MD / 6 Characters` | — | — | 1 |
| `OtpInput / Utilities / LG` | — | — | 1 |
| `OtpInput / Utilities / MD` | — | — | 1 |

**Sizes:** LG, MD — **Longitudes:** 3, 4, 6 caracteres
> Sin componentProperties — seleccionar por `path='OtpInput / LG' && name='6 Characters'`.

---

### PAGE HEADER
**Página:** `↳ PageHeader`
> Sin variant containers definidos.

---

### PASSWORD INPUT
**Página:** `↳ PasswordInput`

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `Password Input / Size=MD` | State, Filled, Show Password | Default/Hover/Pressed/Error/Disabled/Success × True/False × True/False | 17 |
| `Password Input / Size=LG` | State, Filled, Show Password | Default/Hover/Pressed/Error/Disabled/Success × True/False × True/False | 17 |

**State:** Default, Hover, Pressed, Error, Disabled, Success — **Filled:** True/False — **Show Password:** True/False

---

### PHONE INPUT *(NUEVO)*
**Página:** `↳ PhoneInput`

Input especializado para números de teléfono. Soporta 2 tamaños.

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `PhoneInput / Size=LG` | — | — | 1 |
| `PhoneInput / Size=MD` | — | — | 1 |

**Sizes:** LG, MD
> Sin componentProperties — seleccionar por `path='PhoneInput' && name='Size=LG'`.

---

### PRODUCT ECOMERCE *(NUEVO)*
**Página:** `↳ ProductEcomerce`
⚠️ **Typo de naming:** la página se llama `ProductEcomerce` (una m) pero el path en librería es `ProductEcommerce` (doble m).

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `ProductEcommerce / Horizontal` | — | — | 1 |
| `ProductEcommerce / Vertical` | — | — | 1 |

**Layouts:** Horizontal, Vertical — **Instanciar con path:** `ProductEcommerce` (no `ProductEcomerce`)
> Sin componentProperties — seleccionar por `path='ProductEcommerce' && name='Horizontal'`.

---

### PRODUCT FILE
**Página:** `↳ ProductFile`

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `Product File / Default` | Variant | Default, Select, Action | 3 |
| `Product File / Box` | Variant | Box, Select, Action | 3 |
| `Product File / Actions` | Action | Chevron, Menu | 2 |

---

### PROGRESS BAR
**Página:** `↳ ProgressBar`

**Colores:** Theme, Success, Warning, Error, Neutral — **Sizes:** L, M, S

| Propiedad | Valores |
|-----------|---------|
| Variant (progreso) | 0%, 25%, 50%, 75%, 100% |

**Total:** 5 colores × 3 sizes = 15 contenedores + 5 utilities = 20 contenedores, 5 variantes cada uno.

---

### PROGRESS CHECKPOINT *(NUEVO)*
**Página:** `↳ ProgressCheckpoint`

Indicador de progreso por checkpoints. Soporta tema claro y oscuro × 3 sizes × 4 variantes de estado.

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `ProgressCheckpoint / Light / Size=L` | — | — | 1 |
| `ProgressCheckpoint / Light / Size=M` | — | — | 1 |
| `ProgressCheckpoint / Light / Size=S` | — | — | 1 |
| `ProgressCheckpoint / Dark / Size=L` | — | — | 1 |
| `ProgressCheckpoint / Dark / Size=M` | — | — | 1 |
| `ProgressCheckpoint / Dark / Size=S` | — | — | 1 |
| `ProgressCheckpoint / Utilities / Light / Size=L/M/S` | Variant | Theme, Success, Warning, Error | 4 × 3 |
| `ProgressCheckpoint / Utilities / Dark / Size=L/M/S` | Variant | Theme, Success, Warning, Error | 4 × 3 |

**Themes:** Light, Dark — **Sizes:** L, M, S — **Variantes:** Theme, Success, Warning, Error
> Sin componentProperties — seleccionar por `path='ProgressCheckpoint / Light' && name='Size=L'`; atoms por `path='ProgressCheckpoint / Utilities / Light / Size=L' && name='Theme'`.

---

### PROGRESS CIRCLE *(NUEVO)*
**Página:** `↳ ProgressCircle`

Indicador de progreso circular. Soporta 3 sizes × 5 colores semánticos.

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `ProgressCircle / Size=L` | — | — | 1 |
| `ProgressCircle / Size=M` | — | — | 1 |
| `ProgressCircle / Size=S` | — | — | 1 |
| `ProgressCircle / Utilities / Size=L` | Variant | Theme, Success, Warning, Error, Neutral | 5 |
| `ProgressCircle / Utilities / Size=M` | Variant | Theme, Success, Warning, Error, Neutral | 5 |
| `ProgressCircle / Utilities / Size=S` | Variant | Theme, Success, Warning, Error, Neutral | 5 |

**Sizes:** L, M, S — **Variantes:** Theme, Success, Warning, Error, Neutral
> Sin componentProperties — seleccionar por `path='ProgressCircle' && name='Size=L'`; atoms por `path='ProgressCircle / Utilities / Size=L' && name='Theme'`.

---

### RATING *(NUEVO)*
**Página:** `↳ Rating`

Componente de valoración con estrellas. Soporta 7 colores × 3 sizes. Atoms de estrella activa/inactiva por color.

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `Rating / Size=L` | Color | Blue, Green, Grey, Purple, Red, Theme, Yellow | 7 |
| `Rating / Size=M` | Color | Blue, Green, Grey, Purple, Red, Theme, Yellow | 7 |
| `Rating / Size=S` | Color | Blue, Green, Grey, Purple, Red, Theme, Yellow | 7 |
| `Rating / Utilities / Items / Size=L/M/S` | — | — | 3 |
| `Rating / Utilities / Active / Size=L/M/S` | Color | Star_blue, Star_green, Star_grey, Star_purple, Star_red, Star_theme, Star_yellow | 7 × 3 |
| `Rating / Utilities / Inactive / Size=L/M/S` | Color | Star_blue (solo inactive) | 3 |

**Sizes:** L, M, S — **Colores:** Blue, Green, Grey, Purple, Red, Theme, Yellow
> Sin componentProperties — seleccionar por `path='Rating / Size=L' && name='Theme'`; star atom por `path='Rating / Utilities / Active / Size=L' && name='Star_theme'`.

---

### RADIOBUTTON
**Página:** `↳ Radiobutton`

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `Radiobutton / Utilities / Radiobutton` | State, Selected | Disabled/Hover/Default × True/False | 6 |
| `Radiobutton / Default` | State, Selected | Default/Disabled/Hover × True/False | 6 |
| `Radiobutton / Box` | State, Selected | Default/Disabled/Hover × True/False | 6 |

---

### SEARCH INPUT
**Página:** `↳ SearchInput`

**Estilos:** Default, Outline — **Sizes:** LG, MD

| Contenedor | Props | Total |
|-----------|-------|-------|
| `Search Input / Default / Size=LG` | State (Default/Hover/Pressed/Disabled), Filled (T/F) | 8 |
| `Search Input / Default / Size=MD` | State, Filled | 8 |
| `Search Input / Outline / Size=LG` | State, Filled | 8 |
| `Search Input / Outline / Size=MD` | State, Filled | 8 |

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

### SIDEBAR *(antes: Sidebar 🚧)*
**Página:** `↳ Sidebar`

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `Sidebar / Collapse items / Menu` | State | Default, Hover, Disabled, Active, Active / Hover | 5 |
| `Sidebar / Expand items / Menu` | State | Default, Hover, Disabled, Active, Active / Hover | 5 |
| `Sidebar / Expand items / Submenu` | State | Default, Hover, Disabled, Active, Active / Hover | 5 |

**State:** Default, Hover, Disabled, Active, Active / Hover
**Modos:** Collapse (icono solo) / Expand (icono + texto)

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

**Tipos:** Full, Compact — **Orientaciones:** Horizontal, Vertical — **Sizes:** L, S

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `Stepper / Full / Horizontal_Size=L` | State | Pending, In progress, Success, Error | 4 |
| `Stepper / Full / Horizontal_Size=S` | State | Pending, In progress, Success, Error | 4 |
| `Stepper / Full / Vertical_Size=L` | State | Pending, In progress, Success, Error | 4 |
| `Stepper / Full / Vertical_Size=S` | State | Pending, In progress, Success, Error | 4 |
| `Stepper / Compact / Horizontal_Size=L` | Variant | Pending, In progress, Success, Error | 4 |
| `Stepper / Compact / Horizontal_Size=S` | Variant | Pending, In progress, Success, Error | 4 |

---

### SWITCH
**Página:** `↳ Switch`

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `Switch / Utilities / Switch` | State, Selected | Default/Hover/Disabled × True/False | 6 |
| `Switch / Default` | State, Selected | Default/Hover/Disabled × True/False | 6 |
| `Switch / Box` | State, Selected | Default/Hover/Disabled × True/False | 6 |

---

### TABLE
**Página:** `↳ Table`

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `Table / Cells / Head` | Variant | Default, Active, Selectable, Loading | 4 |
| `Table / Cells / Text` | Variant | Default, Disabled, Active, Selectable, Loading, Disabled/Loading | 6 |
| `Table / Cells / Action_Menu` | Variant | Default, Disabled, Active | 3 |
| `Table / Cells / Action` | Variant | Default, Disabled, Active | 3 |
| `Table / Cells / Tag` | Variant | Default, Disabled, Active | 3 |

---

### TABS
**Página:** `↳ Tabs`

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `Tabs / Default` | State | Default, Hover, Disabled, Active/Default, Active/Hover | 5 |
| `Tabs / Box` | State | Default, Hover, Disabled, Active/Default, Active/Hover | 5 |
| `Tabs / Tonal` | State | Default, Hover, Disabled, Active/Default, Active/Hover | 5 |

---

### TAG
**Página:** `↳ Tag`

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `Tag / Tags` | Variant, Size | Blue/Yellow/Green/Red/Purple/Disabled/Accent/Theme/Gray × M/S | 18 |
| `Tag / TagBusiness` | State (marca), Size | París/Jumbo/SantaIsabel/Easy/Spid/Disco/Metro/Wong/Vea/Bretas/Perini/Prezunic/Blaisten/Mercantil/GBarbosa/Giga × M/S | 32 |

**Colores Tag:** Blue, Yellow, Green, Red, Purple, Disabled, Accent, Theme, Gray
**Marcas TagBusiness (16):** París, Jumbo, Santa Isabel, Easy, Spid, Disco, Metro, Wong, Vea, Bretas, Perini, Prezunic, Blaisten, Mercantil, GBarbosa, Giga

---

### TEXT
**Página:** `↳ Text`

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `Text / Text` | Type, Weight, Size | Headline/Title/Text/Caption × Bold/Medium/Regular × XL/L/M/S | 39 |

**Type:** Headline, Title, Text, Caption — **Weight:** Bold, Medium, Regular — **Size:** XL, L, M, S

---

### TEXT AREA
**Página:** `↳ TextArea`

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `TextArea / TextArea` | Filled, State | True/False × Default/Hover/Pressed/Disabled/Error | 9 |

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

**Estilos:** Default Text, Default Icon, Outline Text, Outline Icon — **Sizes:** L, M, S

| Propiedad | Valores |
|-----------|---------|
| State | Default, Accepted, Rejected |

**Total variantes por contenedor:** 3 — **Total contenedores:** 12 (4 estilos × 3 sizes)

| Contenedor |
|-----------|
| `Toggle Binary / Default Text / Size=L` · `/Size=M` · `/Size=S` |
| `Toggle Binary / Default Icon / Size=L` · `/Size=M` · `/Size=S` |
| `Toggle Binary / Outline Text / Size=L` · `/Size=M` · `/Size=S` |
| `Toggle Binary / Outline Icon / Size=L` · `/Size=M` · `/Size=S` |

---

### TOGGLE BUTTON
**Página:** `↳ ToggleButton`

**Estilos:** Default, Outline, Tonal — **Sizes:** LG, M, S

| Propiedad | Valores |
|-----------|---------|
| Variant | Default, Destructive, Success |
| State | Default, Hover, Pressed, Disabled, Active/Default, Active/Hover, Active/Pressed, Active/Disabled |

**Total variantes por contenedor:** 24 — **Total contenedores:** 9 (3 estilos × 3 sizes)

| Contenedor |
|-----------|
| `Toggle Button / Default / Size=LG` · `/Size=M` · `/Size=S` |
| `Toggle Button / Outline / Size=LG` · `/Size=M` · `/Size=S` |
| `Toggle Button / Tonal / Size=LG` · `/Size=M` · `/Size=S` |

---

### TOOLTIP *(antes: Tooltip 🚧)*
**Página:** `↳ Tooltip`

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `Tooltip / Tooltip` | Property 1 | Bottom, Left, Right, Top | 4 |

**Posiciones:** Bottom, Left, Right, Top

---

### USER MENU
**Página:** `↳ UserMenu`

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `UserMenu / Right top` | State | Default, Hover, Active | 3 |
| `UserMenu / Left bottom` | State | Default, Hover, Active | 3 |
| `UserMenu / Dropdown / Default` | — | — | 1 |
| `UserMenu / Dropdown / Fullscreen` | — | — | 1 |
| `UserMenu / Utilities / SlectSingle` | State, Selected | Default/Hover/Disabled × True/False | 6 |

**Posiciones:** Right top, Left bottom — **State:** Default, Hover, Active — **Dropdown:** Default, Fullscreen
*Nota: `SlectSingle` es typo en Penpot (debería ser `SelectSingle`).*

---

### VIEW MORE/LESS *(antes: ViewMoreLess 🚧)*
**Página:** `↳ ViewMoreLess`

| Contenedor | Props | Valores | Total |
|-----------|-------|---------|-------|
| `ViewMoreLess / Content` | Property 1 | Expanded, Collapsed | 2 |
| `ViewMoreLess / Text` | Property 1 | Collapsed, Expanded | 2 |

**Tipos:** Content (con contenido expandible), Text (solo texto expandible)

---

## 6. PÁGINAS DEL ARCHIVO

**Total: 65 páginas** — Todas las páginas de componentes usan prefijo `↳`

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
| 12 | ↳ BottomSheet | ✅ Activo |
| 13 | ↳ Breadcrumb | ✅ Activo |
| 14 | ↳ Button | ✅ Activo |
| 15 | ↳ Cards | ✅ Activo |
| 16 | ↳ Carousel | ✅ Activo |
| 17 | ↳ Checkbox | ✅ Activo |
| 18 | ↳ Counter | ✅ Activo |
| 19 | ↳ CSAT | ✅ Activo *(NUEVO v2)* |
| 20 | ↳ DataList | ✅ Activo |
| 21 | ↳ DateInput | ✅ Activo |
| 22 | ↳ Divider | ✅ Activo |
| 23 | ↳ Drawer | ✅ Activo |
| 24 | ↳ Dropdown | ✅ Activo |
| 25 | ↳ EmptyState | ✅ Activo |
| 26 | ↳ FabButton | ✅ Activo |
| 27 | ↳ FileInput | ✅ Activo |
| 28 | ↳ FilterPanel | ✅ Activo *(NUEVO v2)* |
| 29 | ↳ FileUploader | ✅ Activo *(NUEVO v2)* |
| 30 | ↳ ImageUploader | ✅ Activo *(NUEVO v2)* ⚠️ path: `ImageUpload` |
| 31 | ↳ IconButton | ✅ Activo |
| 32 | ↳ Link | ✅ Activo |
| 33 | ↳ List | ✅ Activo |
| 34 | ↳ Menu | ✅ Activo *(NUEVO v2)* |
| 35 | ↳ Modal | ✅ Activo |
| 36 | ↳ Notification | ✅ Activo |
| 37 | ↳ NumberIndicator | ✅ Activo |
| 38 | ↳ OtpInput | ✅ Activo *(NUEVO v2)* |
| 39 | ↳ Radiobutton | ✅ Activo |
| 40 | ↳ PageHeader | ✅ Activo |
| 41 | ↳ PasswordInput | ✅ Activo |
| 42 | ↳ PhoneInput | ✅ Activo *(NUEVO v2)* |
| 43 | ↳ ProductEcomerce | ✅ Activo *(NUEVO v2)* ⚠️ path: `ProductEcommerce` |
| 44 | ↳ ProductFile | ✅ Activo |
| 45 | ↳ ProgressBar | ✅ Activo |
| 46 | ↳ ProgressCheckpoint | ✅ Activo *(NUEVO v2)* |
| 47 | ↳ ProgressCircle | ✅ Activo *(NUEVO v2)* |
| 48 | ↳ Rating | ✅ Activo *(NUEVO v2)* |
| 49 | ↳ SearchInput | ✅ Activo |
| 50 | ↳ Select | ✅ Activo |
| 51 | ↳ Sidebar | ✅ Activo |
| 52 | ↳ Skeleton | ✅ Activo *(NUEVO v2)* |
| 53 | ↳ Stepper | ✅ Activo |
| 54 | ↳ Switch | ✅ Activo |
| 55 | ↳ Table | ✅ Activo |
| 56 | ↳ Tabs | ✅ Activo |
| 57 | ↳ Tag | ✅ Activo |
| 58 | ↳ Text | ✅ Activo |
| 59 | ↳ TextArea | ✅ Activo |
| 60 | ↳ TextInput | ✅ Activo |
| 61 | ↳ ToggleButton | ✅ Activo |
| 62 | ↳ ToggleBinary | ✅ Activo |
| 63 | ↳ Tooltip | ✅ Activo |
| 64 | ↳ UserMenu | ✅ Activo |
| 65 | ↳ ViewMoreLess | ✅ Activo |

### Resumen de cambios vs versión anterior

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
| Checkbox / Default | Valor State | `Deafult` | `Default` |
| Icon Button / Tonal / Size=L | Valor State | `Value 9` | `Filled/Disabled` |
| Icon Button / Danger / Size=M | Valor State | `DIsabled` | `Disabled` |
| Toggle Button / Outline / Size=LG | Valor State | `Activer/Default` | `Active/Default` |
| Accordion / Default Open Content | Valor Variant | `Tailing Items` | `Trailing Items` |
| FileInput / Size=MD | Nombre de propiedad | `Property 1` | `State` |
| Carousel / Dot | Nombre de propiedad | `Property 1` | sin normalizar |
| Tooltip | Nombre de propiedad | `Property 1` | `Position` |
| ViewMoreLess | Nombre de propiedad | `Property 1` | `State` |
| ImageUploader | Nombre de página vs librería | `ImageUploader` (página) | `ImageUpload` (path en librería — sin "r") |
| ProductEcomerce | Nombre de página vs librería | `ProductEcomerce` (página, una m) | `ProductEcommerce` (path en librería, doble m) |
| UserMenu | Nombre de utility | `SlectSingle` | `SelectSingle` |
| DateInput | Tamaño mayor | `Size=MD` (nombre anterior incorrecto) | `Size=LG` (confirmado vía MCP) |

### Convenciones del archivo
- **Sizes:** `S`, `M`, `L` (cortos) o `SM`, `MD`, `LG` (extendidos) — no hay consistencia entre componentes
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

// Buscar componente por path completo
const btn = lib.components.find(c => c.name.includes('Button') && c.name.includes('Primary'));
```

---

*Documento generado desde Penpot MCP — IT DS | Components (Cencosud)*
*Actualizar re-ejecutando el análisis vía Claude Code + Penpot MCP*
