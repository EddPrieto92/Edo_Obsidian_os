#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
  echo "Usage: $0 <repo-root> [output-directory]" >&2
  exit 2
fi

repo_root=$(cd "$1" && pwd)
output_directory=${2:-"$repo_root/dist"}
mkdir -p "$output_directory"
output_directory=$(cd "$output_directory" && pwd)

bash "$repo_root/agent-kit/scripts/validate-kit.sh" "$repo_root"

version=$(tr -d '[:space:]' < "$repo_root/agent-kit/VERSION")
package_name="dual-llm-continuity-kit-v$version"
archive_path="$output_directory/$package_name.zip"

if [ -e "$archive_path" ]; then
  echo "Archive already exists: $archive_path" >&2
  exit 1
fi

stage_dir=$(mktemp -d "${TMPDIR:-/tmp}/dual-llm-kit.XXXXXX")
trap 'rm -rf "$stage_dir"' EXIT
package_dir="$stage_dir/$package_name"

mkdir -p \
  "$package_dir/.codex/skills" \
  "$package_dir/.claude/skills" \
  "$package_dir/.obsidian/plugins" \
  "$package_dir/.vscode" \
  "$package_dir/Edo/Cencosud" \
  "$package_dir/Edo/IA" \
  "$package_dir/Edo/Proyectos" \
  "$package_dir/Edo/Archivo"

cp "$repo_root/AGENTS.md" "$package_dir/AGENTS.md"
cp "$repo_root/CLAUDE.md" "$package_dir/CLAUDE.md"
cp "$repo_root/.gitignore" "$package_dir/.gitignore"
cp -R "$repo_root/agent-kit" "$package_dir/agent-kit"
cp -R "$repo_root/workspaces" "$package_dir/workspaces"
cp -R "$repo_root/Machines" "$package_dir/Machines"
cp "$repo_root/.vscode/tasks.json" "$package_dir/.vscode/tasks.json"
cp -R "$repo_root/Edo/IA/Agentes" "$package_dir/Edo/IA/Agentes"
cp -R "$repo_root/Edo/Cencosud/." "$package_dir/Edo/Cencosud/"
cp -R "$repo_root/Edo/Proyectos/Panel Edu y Schema Workbench" "$package_dir/Edo/Proyectos/Panel Edu y Schema Workbench"
cp "$repo_root/Edo/README.md" "$package_dir/Edo/README.md"
cp "$repo_root/Edo/MOC - Edu.md" "$package_dir/Edo/MOC - Edu.md"
cp "$repo_root/Edo/Estado del Vault.md" "$package_dir/Edo/Estado del Vault.md"
cp "$repo_root/Edo/Taxonomía.md" "$package_dir/Edo/Taxonomía.md"
cp "$repo_root/Edo/Reglas - Push Pull Histórico.md" "$package_dir/Edo/Reglas - Push Pull Histórico.md"
cp "$repo_root/Edo/Proyectos/Proyectos activos.md" "$package_dir/Edo/Proyectos/Proyectos activos.md"
cp "$repo_root/Edo/Archivo/Histórico de cambios.md" "$package_dir/Edo/Archivo/Histórico de cambios.md"
cp "$repo_root/Edo/Archivo/Release notes v0.4.0.md" "$package_dir/Edo/Archivo/Release notes v0.4.0.md"
cp "$repo_root/Edo/Archivo/Timeline.md" "$package_dir/Edo/Archivo/Timeline.md"
cp "$repo_root/Edo/Archivo/Decisiones.md" "$package_dir/Edo/Archivo/Decisiones.md"
cp "$repo_root/.claude/settings.json" "$package_dir/.claude/settings.json"
cp "$repo_root/.obsidian/app.json" "$package_dir/.obsidian/app.json"
cp "$repo_root/.obsidian/community-plugins.json" "$package_dir/.obsidian/community-plugins.json"
cp "$repo_root/.obsidian/core-plugins.json" "$package_dir/.obsidian/core-plugins.json"
cp -R "$repo_root/.obsidian/plugins/eihwazos-v1" "$package_dir/.obsidian/plugins/eihwazos-v1"
cp "$repo_root/agent-kit/adapters/codex/.codex/config.toml.example" "$package_dir/.codex/config.toml.example"
cp -R "$repo_root/agent-kit/skills/dual-llm-continuity" "$package_dir/.codex/skills/dual-llm-continuity"
cp -R "$repo_root/agent-kit/skills/dual-llm-continuity" "$package_dir/.claude/skills/dual-llm-continuity"
cp -R "$repo_root/.claude/skills/itds-board-composer" "$package_dir/.claude/skills/itds-board-composer"
cp -R "$repo_root/.claude/skills/itds-code-forge" "$package_dir/.claude/skills/itds-code-forge"
cp -R "$repo_root/.claude/skills/mock-frontend" "$package_dir/.claude/skills/mock-frontend"

rm -f \
  "$package_dir/agent-kit/config/machine.local.json" \
  "$package_dir/agent-kit/config/machines.local.json"

(
  cd "$package_dir"
  find . -type f ! -name CHECKSUMS.sha256 -print | LC_ALL=C sort | while IFS= read -r file_path; do
    shasum -a 256 "$file_path"
  done
) > "$package_dir/CHECKSUMS.sha256"

(
  cd "$stage_dir"
  zip -qry "$archive_path" "$package_name"
)

echo "$archive_path"
