---
tipo: proyecto
estado: planificado
actualizado: 2026-08-03
fuentes:
  - PORTAL_CAPACIDADES_SCHEMA_WORKBENCH_HANDOFF
  - drive-audit-2026-08-03
  - git-audit-2026-08-03
---

# Project Overview — Portal de Capacidades

## Objetivo

Crear una interfaz SaaS simple para navegar el Second Brain y, como primer caso usable, incorporar un workbench de Schemas dentro del detalle de una capacidad.

La experiencia debe unir cuatro vistas del mismo sistema:

- equipos y proyectos;
- árbol de artefactos y notas;
- detalle del elemento seleccionado;
- relaciones visuales y contenido secundario.

## Situación observada

- El vault Edo existe en Markdown y usa Git como histórico.
- El repositorio remoto observado tiene una única rama `main`; no hay versionado por máquina.
- Drive contiene dos árboles `EduVaultMacCoders`, uno bajo `Mi Mac` y otro bajo `Mi MacBook Air`.
- El equipo local verificado es el MacBook Air de Coderslab y se registra como `Mac Coders`.
- `Asus Rog` no fue encontrado de forma verificable en Drive ni en el historial Git.
- El documento fuente describe un tab `Schemas`, un workbench de tres paneles y un MVP read-only.
- El repositorio, rutas, schemas y Design System reales del Portal de Capacidades no están disponibles en este vault.

## Decisión de producto

El primer release se divide en dos superficies coordinadas:

1. **Panel Edu:** navegación `Edu → Equipo → Proyecto → Artefacto`, estado Git y acceso al contenido.
2. **Schema Workbench:** explorador, inspector y grafo dentro del Portal de Capacidades.

Ambas superficies consumen modelos normalizados, pero ninguna escribe al vault durante el MVP.

## Usuario principal

Edu, trabajando alternadamente desde Mac Coders, Mac Air Edu y Asus Rog, con VS Code como punto de entrada técnico y Obsidian como interfaz de conocimiento.

## Resultado esperado del MVP

El usuario puede:

- identificar desde qué equipo trabaja;
- comprobar si `main` está actualizado;
- navegar proyectos y artefactos;
- seleccionar un schema o nota;
- ver metadatos y relaciones;
- abrir el archivo en Obsidian cuando existe un URI válido;
- entender errores, versiones y conflictos sin que el sistema los resuelva silenciosamente.

## Fuera de alcance

- sincronización automática al iniciar;
- escritura, borrado o renombre desde el portal;
- mezcla automática de cambios entre Drive y Git;
- editor visual no-code;
- ejecución de workflows;
- repositorio o API del portal inventados;
- marcar Asus Rog como conectado antes de validarlo.

## Riesgos principales

| Riesgo | Tratamiento |
|---|---|
| Dos copias de Drive parecen proyectos distintos | Mostrar identidad de máquina separada de identidad de proyecto |
| Cambios simultáneos en tres equipos | Actualización explícita, `fast-forward` y bloqueo ante cambios locales |
| Portal acoplado a rutas absolutas | Persistir rutas relativas y usar un adapter |
| Grafo inaccesible o demasiado denso | Vista tabular equivalente, filtros y progressive disclosure |
| Repositorio real del portal ausente | Mantener esta entrega en planificación hasta localizarlo |
