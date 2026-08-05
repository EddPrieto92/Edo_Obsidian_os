---
tipo: nota
estado: activo
actualizado: 2026-08-04
fuente: solicitud-del-usuario-2026-08-04
---

# Arquitectura y stack — Portal de Capacidades

Ver [[00 - Portal de Capacidades]] para contexto general. Decisiones tomadas por la skill `mock-frontend` (`.claude/skills/mock-frontend/` en este proyecto), sin repreguntar.

## Stack

- Vite + React 19 + TypeScript, scaffold no interactivo.
- Tailwind CSS v4 (`@theme` CSS-first) + `class-variance-authority` + `clsx`/`tailwind-merge` combinados en `cn()`.
- `react-router` (paquete nuevo, no `react-router-dom`), modo data (`createBrowserRouter`).
- Alias `@/` → `./src/*` (Vite + tsconfig, sin `baseUrl`).
- `lucide-react` para íconos.
- i18n listo desde el día uno (`useTranslation`/`t()`) aunque solo hay locale `es`.
- oxlint con límite de 200 líneas por archivo y 80 por función.
- Storybook y backend/auth explícitamente diferidos (es un mock de diseño+frontend).

## Árbol de carpetas

```
src/
├── app/            # App.tsx, router.tsx
├── pages/          # una carpeta por ruta: home, capabilities, administration, settings
│   └── <pagina>/components/  # sub-componentes propios de esa página
├── shared/
│   ├── ui/         # Badge, Card, ProgressBar, BarChart, Select, Tabs (barrel único)
│   ├── layout/     # Sidebar, Topbar, AppLayout
│   ├── lib/        # cn()
│   └── styles/     # tokens.css
├── data/           # fixtures tipadas — reemplaza al backend
└── i18n/
```

Reglas "nunca" (de `arquitectura-de-carpetas.md`) respetadas: `shared/ui` no importa de `data/` ni de páginas; `data/` es solo tipos/valores, cero JSX; páginas hermanas no se importan entre sí.

## Identidad visual (Tier 0)

Extraída del Figma Site vía inspección de estilos computados: fuente sans-serif del sistema, fondo blanco, radio de borde `0.625rem`, azul primario ~`oklch(0.546 0.245 262.881)` (equivalente a un Tailwind blue-600), tokens semánticos en `shared/styles/tokens.css` (`--background`, `--primary`, `--success`, `--sidebar-*`, etc.).

## Primitivas construidas (Tier 2)

Solo las que se necesitaron para las pantallas ya portadas: `Badge`, `Card`, `ProgressBar`, `BarChart` (SVG/CSS simple, sin librería de charts), `Select` (nativo estilizado), `Tabs` (controlado por el padre).

## Verificación por unidad

Cada pantalla portada pasó: `pnpm exec tsc -b`, `pnpm exec oxlint src`, render en `pnpm dev` + checkpoint visual contra el Figma Site antes de avanzar a la siguiente.
