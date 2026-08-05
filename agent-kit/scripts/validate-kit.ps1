param(
  [string]$RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot "../..")).Path
)

$ErrorActionPreference = "Stop"
$RepoRoot = (Resolve-Path $RepoRoot).Path
$Failures = 0

$RequiredPaths = @(
  "AGENTS.md", "CLAUDE.md", ".gitignore", ".claude/settings.json", ".vscode/tasks.json",
  "Machines/registry.yml", "agent-kit/VERSION", "agent-kit/MANIFEST.yml",
  "agent-kit/MULTI-MACHINE-STARTUP.md", "agent-kit/config/machine.local.example.json",
  "agent-kit/scripts/edo-start.sh", "agent-kit/scripts/edo-start.ps1",
  "agent-kit/scripts/validate-kit.ps1", "agent-kit/skills/dual-llm-continuity/SKILL.md",
  "Edo/IA/Agentes/01 - Estado compartido.md",
  "Edo/Cencosud/README.md",
  "Edo/Proyectos/Panel Edu y Schema Workbench/IMPLEMENTATION_PLAN.md",
  "Edo/Proyectos/Panel Edu y Schema Workbench/Sources/PORTAL_CAPACIDADES_SCHEMA_WORKBENCH_HANDOFF.md",
  ".claude/skills/itds-board-composer/SKILL.md",
  ".claude/skills/itds-code-forge/SKILL.md",
  ".claude/skills/mock-frontend/SKILL.md",
  "workspaces/edu-control.code-workspace", "workspaces/edo-codex.code-workspace",
  "workspaces/edo-claude.code-workspace"
)

foreach ($RelativePath in $RequiredPaths) {
  if (-not (Test-Path (Join-Path $RepoRoot $RelativePath) -PathType Leaf)) {
    Write-Error "MISSING: $RelativePath"
    $Failures++
  }
}

if (-not (Get-ChildItem -LiteralPath (Join-Path $RepoRoot "Edo/IA/Agentes") -Filter "00 - *.md" -File)) {
  Write-Error "MISSING: Edo/IA/Agentes/00 - Inicio rapido.md"
  $Failures++
}

$JsonPaths = @(
  ".claude/settings.json", ".vscode/tasks.json", "agent-kit/adapters/claude/.claude/settings.json",
  "agent-kit/config/machine.local.example.json", "workspaces/edu-control.code-workspace",
  "workspaces/edo-codex.code-workspace", "workspaces/edo-claude.code-workspace"
)

foreach ($RelativePath in $JsonPaths) {
  try {
    Get-Content -Raw (Join-Path $RepoRoot $RelativePath) | ConvertFrom-Json -ErrorAction Stop | Out-Null
  } catch {
    Write-Error "INVALID JSON: $RelativePath"
    $Failures++
  }
}

foreach ($InstructionFile in @("AGENTS.md", "CLAUDE.md")) {
  if ((Get-Content (Join-Path $RepoRoot $InstructionFile)).Count -gt 200) {
    Write-Error "TOO LONG: $InstructionFile has more than 200 lines"
    $Failures++
  }
}

if (Get-Command rg -ErrorAction SilentlyContinue) {
  $SecretPattern = '(sk-[A-Za-z0-9_-]{32,}|ghp_[A-Za-z0-9]{30,}|AKIA[A-Za-z0-9]{16}|BEGIN\s+(RSA\s+)?PRIVATE\s+KEY)'
  $SecretMatches = & rg -n --hidden --glob '!.git' --glob '!**/.git/**' --glob '!agent-kit/scripts/validate-kit.sh' $SecretPattern $RepoRoot
  if ($LASTEXITCODE -eq 0) {
    $SecretMatches
    Write-Error "POSSIBLE SECRET: review matches above"
    $Failures++
  } elseif ($LASTEXITCODE -gt 1) {
    Write-Error "Secret scan failed."
    $Failures++
  }
} else {
  Write-Host "rg no disponible en el PATH nativo: se omite el escaneo de secretos (ejecutar validate-kit.sh desde git-bash para cobertura completa)."
}

if ($Failures -gt 0) {
  throw "Validation failed with $Failures issue(s)."
}

Write-Host "Validation passed."
