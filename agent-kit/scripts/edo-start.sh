#!/usr/bin/env bash
set -euo pipefail

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
repo_root=$(cd "$script_dir/../.." && pwd)
action=${1:-menu}

machine_file="$repo_root/.edo-machine"
machine_id=unconfigured
if [ -f "$machine_file" ]; then
  machine_id=$(tr -d '[:space:]' < "$machine_file")
fi

machine_name() {
  case "$machine_id" in
    mac-coders) echo "Mac Coders" ;;
    mac-air-edu) echo "Mac Air Edu" ;;
    asus-rog) echo "Asus Rog" ;;
    *) echo "Equipo sin configurar" ;;
  esac
}

require_repo() {
  if ! git -C "$repo_root" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "No se encontró un repositorio Git en: $repo_root" >&2
    exit 1
  fi
}

is_dirty() {
  [ -n "$(git -C "$repo_root" status --porcelain)" ]
}

version_state() {
  local branch head upstream counts ahead behind
  branch=$(git -C "$repo_root" branch --show-current)
  head=$(git -C "$repo_root" rev-parse --short HEAD)
  upstream=$(git -C "$repo_root" rev-parse --abbrev-ref --symbolic-full-name '@{upstream}' 2>/dev/null || true)

  echo "Equipo: $(machine_name) [$machine_id]"
  echo "Proyecto: Edo / Second Brain"
  echo "Rama local: ${branch:-detached} @ $head"

  if is_dirty; then
    echo "Estado local: cambios pendientes"
  else
    echo "Estado local: limpio"
  fi

  if [ -z "$upstream" ]; then
    echo "Remoto: rama sin upstream"
    return
  fi

  counts=$(git -C "$repo_root" rev-list --left-right --count "HEAD...$upstream")
  ahead=$(printf '%s' "$counts" | awk '{print $1}')
  behind=$(printf '%s' "$counts" | awk '{print $2}')
  echo "Comparación con $upstream: +$ahead / -$behind"

  if [ "$ahead" -eq 0 ] && [ "$behind" -eq 0 ]; then
    echo "Versión: actualizada"
  elif [ "$ahead" -eq 0 ]; then
    echo "Versión: remoto disponible"
  elif [ "$behind" -eq 0 ]; then
    echo "Versión: commits locales por publicar"
  else
    echo "Versión: divergencia; requiere revisión manual"
  fi
}

check_remote() {
  echo "Consultando origin/main..."
  git -C "$repo_root" fetch --prune origin main
  version_state
}

update_main() {
  local branch counts ahead behind
  branch=$(git -C "$repo_root" branch --show-current)

  if [ "$branch" != "main" ]; then
    echo "Actualización cancelada: la rama actual es '$branch', no 'main'." >&2
    exit 1
  fi

  if is_dirty; then
    echo "Actualización cancelada: hay cambios locales. Confírmalos o guárdalos antes." >&2
    exit 1
  fi

  git -C "$repo_root" fetch --prune origin main
  counts=$(git -C "$repo_root" rev-list --left-right --count HEAD...origin/main)
  ahead=$(printf '%s' "$counts" | awk '{print $1}')
  behind=$(printf '%s' "$counts" | awk '{print $2}')

  if [ "$ahead" -gt 0 ] && [ "$behind" -gt 0 ]; then
    echo "Actualización cancelada: main local y origin/main divergen." >&2
    exit 1
  fi

  if [ "$ahead" -gt 0 ]; then
    echo "No se actualizó: existen commits locales por publicar." >&2
    exit 1
  fi

  if [ "$behind" -eq 0 ]; then
    echo "main ya está actualizado."
  else
    git -C "$repo_root" pull --ff-only origin main
    echo "main actualizado mediante fast-forward."
  fi

  bash "$repo_root/agent-kit/scripts/validate-kit.sh" "$repo_root"
}

open_workspace() {
  local workspace="$repo_root/workspaces/edu-control.code-workspace"
  if ! command -v code >/dev/null 2>&1; then
    echo "No se encontró el comando 'code'. Abre manualmente: $workspace" >&2
    exit 1
  fi
  code "$workspace"
}

interactive_menu() {
  version_state
  echo
  echo "1) Comprobar la última versión"
  echo "2) Actualizar main de forma segura"
  echo "3) Validar configuración"
  echo "4) Abrir panel Edu"
  echo "5) Salir"
  printf "Elige una opción: "
  read -r choice
  case "$choice" in
    1) check_remote ;;
    2) update_main ;;
    3) bash "$repo_root/agent-kit/scripts/validate-kit.sh" "$repo_root" ;;
    4) open_workspace ;;
    5) exit 0 ;;
    *) echo "Opción no válida." >&2; exit 2 ;;
  esac
}

require_repo
case "$action" in
  menu) interactive_menu ;;
  status) version_state ;;
  check) check_remote ;;
  update) update_main ;;
  validate) bash "$repo_root/agent-kit/scripts/validate-kit.sh" "$repo_root" ;;
  open) open_workspace ;;
  *)
    echo "Uso: $0 [status|check|update|validate|open]" >&2
    exit 2
    ;;
esac
