#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -lt 4 ] || [ "$#" -gt 5 ]; then
  echo "Usage: $0 <origin> <destination> <project> <task> [repo-root]" >&2
  exit 2
fi

origin_agent=$1
destination_agent=$2
project_name=$3
task_name=$4
repo_root=${5:-.}

case "$origin_agent:$destination_agent" in
  codex:claude|claude:codex) ;;
  *)
    echo "Origin and destination must be different: codex/claude or claude/codex." >&2
    exit 2
    ;;
esac

repo_root=$(cd "$repo_root" && pwd)
template_path="$repo_root/Edo/IA/Agentes/Plantillas/Plantilla - Handoff.md"
handoff_dir="$repo_root/Edo/IA/Agentes/Handoffs"

if [ ! -f "$template_path" ]; then
  echo "Missing template: $template_path" >&2
  exit 1
fi

slugify() {
  printf '%s' "$1" \
    | tr '[:upper:]' '[:lower:]' \
    | tr -cs '[:alnum:]' '-' \
    | sed 's/^-//; s/-$//'
}

date_stamp=$(date +%F)
project_slug=$(slugify "$project_name")
task_slug=$(slugify "$task_name")
output_path="$handoff_dir/$date_stamp - $origin_agent a $destination_agent - $project_slug - $task_slug.md"

if [ -e "$output_path" ]; then
  echo "Handoff already exists: $output_path" >&2
  exit 1
fi

branch_name=$(git -C "$repo_root" branch --show-current 2>/dev/null || true)
commit_base=$(git -C "$repo_root" rev-parse --short HEAD 2>/dev/null || true)
branch_name=${branch_name:-sin-git}
commit_base=${commit_base:-sin-git}

mkdir -p "$handoff_dir"
temporary_path="$output_path.tmp"

awk \
  -v origin="$origin_agent" \
  -v destination="$destination_agent" \
  -v project="$project_name" \
  -v task="$task_name" \
  -v date_value="$date_stamp" \
  -v commit="$commit_base" \
  -v branch="$branch_name" '
  /^origen:/ { print "origen: " origin; next }
  /^destino:/ { print "destino: " destination; next }
  /^proyecto:/ { print "proyecto: \"" project "\""; next }
  /^tarea:/ { print "tarea: \"" task "\""; next }
  /^fecha:/ { print "fecha: " date_value; next }
  /^commit_base:/ { print "commit_base: " commit; next }
  /^rama:/ { print "rama: \"" branch "\""; next }
  /^# Handoff/ { print "# Handoff — " project " — " task; next }
  { print }
' "$template_path" > "$temporary_path"

mv "$temporary_path" "$output_path"
echo "$output_path"
