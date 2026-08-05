---
tipo: registro
estado: activo
actualizado: 2026-08-05
fuentes:
  - solicitud-del-usuario-2026-08-03
  - solicitud-del-usuario-2026-08-04
---

# Registro de proyectos

## Activos

| Proyecto | Estado | Repositorio | Agente propietario | Próxima acción |
|---|---|---|---|---|
| Dual-LLM Continuity Kit | versión 0.3.0, handoff piloto Codex→Claude cerrado | `Edo_Obsidian_os-1` | Compartido (Codex/Claude) | Completar onboarding de `Mac Air Edu`; publicar y validar v0.3.0 en los equipos |
| Portal de Capacidades Agénticas (Cencosud) | frente activo del equipo; mock frontend con 5 pantallas, ver [[../../Cencosud/Applied IA/Portal de Capacidades/00 - Portal de Capacidades\|contexto Cencosud]] | `VernoVentures/mock` (ruta local heredada; clasificación Cencosud; sin remoto Git verificado) | Claude (mock) / Codex (contexto) | Resolver el fixture único y confirmar si el código debe salir de `VernoVentures/` para respetar la separación Cencosud–VERNO |
| Sistema Operativo Personal Asistido por IA | niveles 1–2 operables; nivel 3 en desarrollo | `Edo_Obsidian_os-1` | Compartido (usuario/Codex/Claude) | Probar formación y briefing manual; definir fuentes para automatización |

## Por incorporar

Los proyectos adicionales se registrarán solo después de verificar su ruta local o remoto Git. El árbol de equipos se mantiene en `Machines/registry.yml`.

## Regla de incorporación

Cada proyecto debe declarar:

- nombre y objetivo;
- ruta local y remoto Git;
- rama principal;
- comandos de validación;
- ubicación de fuentes externas;
- agente y worktree propietarios de la tarea actual.
