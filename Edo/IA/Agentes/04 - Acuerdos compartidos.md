---
tipo: política
estado: activo
actualizado: 2026-08-03
fuentes:
  - solicitud-del-usuario-2026-08-03
  - Edo/README.md
---

# Acuerdos compartidos

## Fuente y verdad

- No inventar hechos, proyectos, decisiones ni antecedentes.
- Diferenciar `verificado`, `inferencia` y `pendiente`.
- Enlazar cada afirmación histórica relevante a un archivo, commit, URL o instrucción fechada.

## Propiedad del trabajo

- Una tarea tiene un agente propietario.
- Cada agente usa su rama o worktree.
- No editar archivos asignados al otro agente en un handoff activo.
- Integrar mediante Git después de revisión, nunca copiando carpetas completas entre entornos.

## Continuidad

- El estado actual vive en [[01 - Estado compartido]].
- Las decisiones durables viven en `Decisiones/`.
- Las transferencias viven en `Handoffs/`.
- Las transcripciones completas son archivo, no contexto permanente.

## Seguridad

- Excluir secretos, credenciales, `.env`, cachés y logs privados.
- No incluir rutas personales en documentos portables salvo que sean necesarias y estén marcadas como locales.
- Solicitar confirmación antes de publicar, hacer push, fusionar o ejecutar operaciones destructivas.

## Cierre de tarea

Registrar resultado, archivos modificados, verificaciones, pendientes y agente siguiente. Si no hay transferencia, actualizar el estado del proyecto en vez de crear un handoff vacío.
