---
tipo: catalogo-casos
estado: planificado
actualizado: 2026-08-03
---

# Use Case Catalog — MVP

## UC-01 — Iniciar una sesión desde VS Code

**Actor:** usuario del equipo local.
**Precondición:** repositorio clonado e identidad `.edo-machine` configurada.

1. El usuario abre `workspaces/edu-control.code-workspace`.
2. Ejecuta `Edo: Inicio seguro`.
3. El sistema muestra equipo, proyecto, rama, commit y cambios locales.
4. El usuario decide si consulta el remoto.
5. Si hay una actualización compatible y el árbol está limpio, puede aplicarla.

**Resultado:** se inicia con contexto verificable sin sobrescribir trabajo.

**Excepciones:**

- cambios locales: bloquear actualización;
- rama distinta de `main`: bloquear actualización;
- divergencia: pedir revisión manual;
- red no disponible: conservar el estado local y mostrar desconocido.

## UC-02 — Navegar por equipo y proyecto

1. El usuario abre el panel Edu.
2. Expande `Mac Coders`, `Mac Air Edu` o `Asus Rog`.
3. Ve los proyectos conocidos y su disponibilidad.
4. Selecciona `Edo / Second Brain` o `Portal de Capacidades`.
5. La columna central muestra el contenido del proyecto.

**Resultado:** la procedencia física queda visible sin duplicar la identidad lógica del proyecto.

## UC-03 — Explorar un schema

1. El usuario entra a una capacidad y abre `Schemas`.
2. El portal carga un snapshot read-only.
3. Selecciona un schema en el explorador.
4. El inspector muestra metadatos, versión, campos y diagnósticos.
5. El grafo centra el nodo y sus relaciones de primer nivel.

**Resultado:** entiende definición, origen y dependencias sin abandonar la capacidad.

## UC-04 — Navegar desde una relación

1. El usuario selecciona un nodo del grafo.
2. La selección se refleja en el explorador.
3. El contenido cambia al artefacto seleccionado.
4. El grafo conserva el contexto y baja el énfasis del resto.

**Resultado:** lista, contenido y grafo forman una sola navegación.

## UC-05 — Abrir el origen en Obsidian

1. El artefacto seleccionado tiene `obsidianUri`.
2. El usuario elige `Abrir en Obsidian`.
3. El sistema abre el vault y la ruta relativa codificada.

**Resultado:** el portal actúa como mapa; Obsidian continúa siendo el editor.

**Excepciones:** URI ausente, vault no disponible u Obsidian no instalado.

## UC-06 — Revisar un diagnóstico

1. El índice detecta vínculo roto, schema inválido o snapshot antiguo.
2. El árbol y el grafo muestran advertencia.
3. El inspector explica problema, evidencia y acción posible.
4. El sistema ofrece abrir la fuente, pero no la corrige.

**Resultado:** el problema es visible y trazable.

## UC-07 — Incorporar Asus Rog

1. Desde Asus Rog se clona el repositorio canónico.
2. Se crea `.edo-machine` con `asus-rog`.
3. Se comprueba `origin/main`.
4. Se valida la carpeta Drive local y se actualiza su estado.
5. Se registra evidencia en `Machines/registry.yml`.

**Resultado:** el tercer equipo pasa de `pending-onboarding` a verificado mediante un cambio Git auditable.

## Happy path seleccionado

`Inicio seguro → Mac Air Edu → Portal de Capacidades → Capacidad → Schemas → seleccionar artefacto → revisar grafo → abrir en Obsidian`.

Este recorrido determina el orden de prototipado y las pruebas del MVP.
