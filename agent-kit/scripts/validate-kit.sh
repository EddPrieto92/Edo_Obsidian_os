#!/usr/bin/env bash
set -euo pipefail

repo_root=${1:-.}
repo_root=$(cd "$repo_root" && pwd)
failures=0

required_paths=(
  "AGENTS.md"
  "CLAUDE.md"
  ".gitignore"
  ".claude/settings.json"
  ".vscode/tasks.json"
  "Machines/registry.yml"
  "agent-kit/VERSION"
  "agent-kit/MANIFEST.yml"
  "agent-kit/MULTI-MACHINE-STARTUP.md"
  "agent-kit/config/machine.local.example.json"
  "agent-kit/scripts/edo-start.sh"
  "agent-kit/scripts/edo-start.ps1"
  "agent-kit/skills/dual-llm-continuity/SKILL.md"
  "Edo/IA/Agentes/00 - Inicio rápido.md"
  "Edo/IA/Agentes/01 - Estado compartido.md"
  "Edo/Proyectos/Portal de Capacidades/IMPLEMENTATION_PLAN.md"
  "Edo/Proyectos/Portal de Capacidades/Sources/PORTAL_CAPACIDADES_SCHEMA_WORKBENCH_HANDOFF.md"
  "workspaces/edu-control.code-workspace"
  "workspaces/edo-codex.code-workspace"
  "workspaces/edo-claude.code-workspace"
)

for relative_path in "${required_paths[@]}"; do
  if [ ! -f "$repo_root/$relative_path" ]; then
    echo "MISSING: $relative_path" >&2
    failures=$((failures + 1))
  fi
done

json_paths=(
  ".claude/settings.json"
  ".vscode/tasks.json"
  "agent-kit/adapters/claude/.claude/settings.json"
  "agent-kit/config/machine.local.example.json"
  "workspaces/edu-control.code-workspace"
  "workspaces/edo-codex.code-workspace"
  "workspaces/edo-claude.code-workspace"
)

for relative_path in "${json_paths[@]}"; do
  if ! python3 -m json.tool "$repo_root/$relative_path" >/dev/null; then
    echo "INVALID JSON: $relative_path" >&2
    failures=$((failures + 1))
  fi
done

if ! bash -n "$repo_root/agent-kit/scripts/edo-start.sh"; then
  echo "INVALID BASH: agent-kit/scripts/edo-start.sh" >&2
  failures=$((failures + 1))
fi

if ! bash -n "$repo_root/agent-kit/scripts/build-export.sh"; then
  echo "INVALID BASH: agent-kit/scripts/build-export.sh" >&2
  failures=$((failures + 1))
fi

for instruction_file in AGENTS.md CLAUDE.md; do
  line_count=$(wc -l < "$repo_root/$instruction_file" | tr -d ' ')
  if [ "$line_count" -gt 200 ]; then
    echo "TOO LONG: $instruction_file has $line_count lines" >&2
    failures=$((failures + 1))
  fi
done

secret_pattern='(sk-[[:alnum:]_-]{32,}|ghp_[[:alnum:]]{30,}|AKIA[[:alnum:]]{16}|BEGIN[[:space:]]+(RSA[[:space:]]+)?PRIVATE[[:space:]]+KEY)'
if command -v rg >/dev/null 2>&1; then
  if rg -n --hidden --glob '!**/.git/**' --glob '!agent-kit/scripts/validate-kit.sh' "$secret_pattern" "$repo_root"; then
    echo "POSSIBLE SECRET: review matches above" >&2
    failures=$((failures + 1))
  fi
fi

personal_path_pattern='/(Users|home)/[^/]+/'
if command -v rg >/dev/null 2>&1; then
  if rg -n --hidden \
    --glob '!**/.git/**' \
    --glob '!agent-kit/scripts/validate-kit.sh' \
    "$personal_path_pattern" "$repo_root"; then
    echo "PERSONAL PATH: replace absolute local paths before publishing" >&2
    failures=$((failures + 1))
  fi
fi

if [ "$failures" -ne 0 ]; then
  echo "Validation failed with $failures issue(s)." >&2
  exit 1
fi

echo "Validation passed."
