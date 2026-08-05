---
tipo: contexto-producto
estado: activo
actualizado: 2026-08-05
fuentes:
  - git-local-2026-08-05
  - release-v0.4.0
---

# EihwazOS

## Propósito

EihwazOS es la capa visual de entrada del vault Edo: una portada de "constelación" con un núcleo central, búsqueda universal y nodos por cada área real del vault. Vive sobre la estructura existente sin moverla ni reorganizarla.

Handoff de origen: [[IA/Agentes/Handoffs/2026-08-05 - codex a vscode - eihwazos-v1 - implementar-mvp|2026-08-05 - codex a vscode - eihwazos-v1 - implementar-mvp]].

## Cómo activarla

1. Abrir este repositorio (`Edo_Obsidian_os-1`) como vault en Obsidian.
2. Verificar que los plugins de comunidad estén habilitados (Configuración → Plugins de comunidad).
3. Confirmar que `eihwazos-v1` aparece activado en la lista de plugins instalados.
4. Usar el comando **"Abrir EihwazOS"** (paleta de comandos) o el ícono en la barra lateral para abrir la vista manualmente.

## Cómo desactivarla

Desactivar el plugin `eihwazos-v1` desde Configuración → Plugins de comunidad. El vault Markdown sigue funcionando igual: todas las notas, MOC y el Quick Switcher nativo permanecen intactos. EihwazOS es una interfaz, no una fuente de datos.

## Cómo funciona (V1)

- El núcleo central enlaza a [[MOC - Edu]].
- Los nodos se generan dinámicamente a partir de las carpetas reales bajo `Edo/` — no hay una lista fija hardcodeada de dominios.
- Un nodo con nota real disponible (verde, activo) abre esa nota. Incluye, entre otros, `Cencosud`, `IA`, `Proyectos`, `Archivo` y `Tecnología`.
- Un nodo de un área sin notas (solo `.gitkeep`) aparece atenuado y, al hacer clic, revela la carpeta vacía en el explorador de archivos — no simula contenido que no existe.
- El buscador usa la API nativa de Obsidian (título, ruta, alias, tags) sin depender de Dataview, que no está instalado en este vault.

## Cómo ampliar dominios

No hace falta tocar el plugin para que un área nueva aparezca como nodo activo: basta con agregar una nota Markdown dentro de esa carpeta (idealmente `README.md` o un `MOC`). El plugin la detecta automáticamente la próxima vez que se abre la vista.

Para cambiar qué nota específica se usa como entrada de un área con contenido ambiguo, editar el mapa `KNOWN_ENTRY_NOTES` en `.obsidian/plugins/eihwazos-v1/main.js`.

## Fuera de alcance de V1

- Indexación semántica o vectorial.
- Cualquier edición automática de notas por parte del plugin.
- Migración o reorganización de carpetas.
- Animaciones complejas o dependencias externas a la API de Obsidian.
