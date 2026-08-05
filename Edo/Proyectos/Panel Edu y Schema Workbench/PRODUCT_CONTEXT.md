---
tipo: contexto-producto
estado: planificado
actualizado: 2026-08-03
---

# Product Context — Panel Edu y Schema Workbench

> Contexto personal de EihwazOS/VERNO. No mezclar con la documentación corporativa de Cencosud.

## Modelo mental

    Edu
    ├── Mac Coders
    │   └── Proyectos
    ├── Mac Air Edu
    │   └── Proyectos
    └── Asus Rog
        └── Proyectos

Las máquinas son puntos de acceso, no copias autoritativas. Un proyecto conserva la misma identidad y repositorio aunque se abra desde equipos distintos.

## Layout de escritorio

El shell global mantiene navegación y contexto. El espacio de trabajo usa tres columnas:

| Columna | Responsabilidad | Ancho inicial |
|---|---|---|
| Navegación | Equipo, proyecto, carpetas, búsqueda y filtros | 280 px |
| Contenido | Metadatos, Markdown o configuración del artefacto | 400 px |
| Contenido secundario | Grafo, benchmark, diagnóstico o relaciones | Flexible, mínimo 520 px |

Cuando el usuario está dentro de una capacidad, las mismas responsabilidades se expresan como `Explorador → Configuración → Grafo`.

## Fuentes y autoridad

| Capa | Fuente | Regla |
|---|---|---|
| Versión publicada | Git `main` | Canónica |
| Trabajo en curso | Árbol local | No se sobrescribe |
| Fuentes y adjuntos | Drive | Se enlazan o indexan; no crean otra historia |
| Navegación humana | Obsidian | Edita Markdown local |
| UI | Snapshot normalizado | Read-only en MVP |

## Estado global visible

La cabecera debe mostrar:

- equipo activo;
- proyecto activo;
- rama y commit;
- estado `Actualizado`, `Cambios locales`, `Remoto disponible`, `Conflicto` o `Desconocido`;
- momento del último chequeo;
- acción explícita `Comprobar versión`.

`Actualizar` solo se habilita cuando el árbol está limpio, la rama es `main` y el avance puede ser fast-forward.

## Navegación y selección

- Seleccionar un proyecto conserva el equipo activo como contexto.
- Seleccionar un artefacto actualiza contenido e inspector visual.
- Seleccionar un nodo del grafo sincroniza el árbol y el panel central.
- Cambiar de equipo no duplica un proyecto; cambia su disponibilidad y estado local.

## Responsive

- Desktop: tres columnas redimensionables.
- Menos de 1200 px: navegación colapsable.
- Tablet: vistas conmutables `Navegación | Contenido | Diagrama`.
- Móvil: una vista por vez; no comprimir tres columnas.

## Accesibilidad

- navegación completa por teclado;
- foco visible y contraste AA;
- estados con texto e icono además de color;
- tabla alternativa al grafo;
- orden de lectura equivalente al orden visual.

## Privacidad

El snapshot y los registros versionados no incluyen rutas absolutas, identificadores privados de Drive, credenciales ni contenido fuera de la allowlist del proyecto.
