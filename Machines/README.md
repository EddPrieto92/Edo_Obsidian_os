# Edu — equipos y proyectos

Esta carpeta es el panel lógico que VS Code y el futuro portal muestran como:

    Edu
    ├── Mac Coders
    ├── Mac Air Edu
    └── Asus Rog

No contiene copias completas de cada equipo. Cada subcarpeta registra su estado y apunta a los mismos proyectos canónicos en Git. Así se evita que Drive cree tres historias paralelas.

## Autoridades

- Git `main`: última versión publicada de Markdown, configuración y código.
- Directorio local: cambios todavía no publicados de un equipo.
- Drive: réplica, fuentes y adjuntos; no decide qué commit es el último.
- `Machines/registry.yml`: topología pública sin rutas privadas ni identificadores de Drive.
- `.edo-machine`: identidad local del equipo; está excluida de Git.

## Incorporar un equipo

1. Clonar el repositorio canónico.
2. Crear `.edo-machine` con uno de los identificadores de `registry.yml`.
3. Abrir `workspaces/edu-control.code-workspace`.
4. Ejecutar la tarea `Edo: Inicio seguro`.
5. Verificar la carpeta local de Drive sin publicar su ruta absoluta.

Asus Rog permanecerá en estado `pending` hasta completar estos pasos desde ese equipo.
