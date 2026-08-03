# Handoff schema

## Required metadata

| Field | Rule |
|---|---|
| `estado` | `borrador`, `listo`, `aceptado` or `cerrado` |
| `origen` | Agent currently handing off work |
| `destino` | Intended receiving agent |
| `proyecto` | Stable project name |
| `tarea` | Short scoped task name |
| `fecha` | ISO date |
| `commit_base` | Verified short or full Git SHA, or `sin-git` |
| `rama` | Verified branch name, or `sin-git` |

## Required body

1. Objective and acceptance criteria.
2. Current state and completed work.
3. Exact changed files.
4. Commands and results used for validation.
5. Decisions that constrain the next agent.
6. Remaining work, blockers, and risks.
7. One exact next action.
8. Source links or file paths.

## Ready check

A handoff is ready only when the receiving agent can continue without reading the prior chat. Do not mark it ready when the diff, base commit, validation result, or next action is unknown.
