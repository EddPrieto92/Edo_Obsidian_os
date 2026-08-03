param(
  [ValidateSet("menu", "status", "check", "update", "validate", "open")]
  [string]$Action = "menu"
)

$ErrorActionPreference = "Stop"
$RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot "../..")).Path
$MachineFile = Join-Path $RepoRoot ".edo-machine"
$MachineId = if (Test-Path $MachineFile) {
  (Get-Content $MachineFile -Raw).Trim()
} else {
  "unconfigured"
}

function Get-MachineName {
  switch ($MachineId) {
    "mac-coders" { "Mac Coders" }
    "mac-air-edu" { "Mac Air Edu" }
    "asus-rog" { "Asus Rog" }
    default { "Equipo sin configurar" }
  }
}

function Invoke-Git {
  param([Parameter(ValueFromRemainingArguments = $true)][string[]]$Arguments)
  & git -C $RepoRoot @Arguments
  if ($LASTEXITCODE -ne 0) {
    throw "Git terminó con código $LASTEXITCODE."
  }
}

function Test-Dirty {
  $Result = & git -C $RepoRoot status --porcelain
  return -not [string]::IsNullOrWhiteSpace(($Result -join ""))
}

function Show-VersionState {
  $Branch = (& git -C $RepoRoot branch --show-current).Trim()
  $Head = (& git -C $RepoRoot rev-parse --short HEAD).Trim()
  $Upstream = (& git -C $RepoRoot rev-parse --abbrev-ref --symbolic-full-name "@{upstream}" 2>$null)

  Write-Host "Equipo: $(Get-MachineName) [$MachineId]"
  Write-Host "Proyecto: Edo / Second Brain"
  Write-Host "Rama local: $Branch @ $Head"
  Write-Host ("Estado local: " + $(if (Test-Dirty) { "cambios pendientes" } else { "limpio" }))

  if ([string]::IsNullOrWhiteSpace($Upstream)) {
    Write-Host "Remoto: rama sin upstream"
    return
  }

  $Counts = (& git -C $RepoRoot rev-list --left-right --count "HEAD...$Upstream").Trim() -split "\s+"
  $Ahead = [int]$Counts[0]
  $Behind = [int]$Counts[1]
  Write-Host ("Comparación con {0}: +{1} / -{2}" -f $Upstream, $Ahead, $Behind)

  if ($Ahead -eq 0 -and $Behind -eq 0) {
    Write-Host "Versión: actualizada"
  } elseif ($Ahead -eq 0) {
    Write-Host "Versión: remoto disponible"
  } elseif ($Behind -eq 0) {
    Write-Host "Versión: commits locales por publicar"
  } else {
    Write-Host "Versión: divergencia; requiere revisión manual"
  }
}

function Check-Remote {
  Write-Host "Consultando origin/main..."
  Invoke-Git fetch --prune origin main
  Show-VersionState
}

function Update-Main {
  $Branch = (& git -C $RepoRoot branch --show-current).Trim()
  if ($Branch -ne "main") {
    throw "Actualización cancelada: la rama actual es '$Branch', no 'main'."
  }
  if (Test-Dirty) {
    throw "Actualización cancelada: hay cambios locales. Confírmalos o guárdalos antes."
  }

  Invoke-Git fetch --prune origin main
  $Counts = (& git -C $RepoRoot rev-list --left-right --count "HEAD...origin/main").Trim() -split "\s+"
  $Ahead = [int]$Counts[0]
  $Behind = [int]$Counts[1]

  if ($Ahead -gt 0 -and $Behind -gt 0) {
    throw "Actualización cancelada: main local y origin/main divergen."
  }
  if ($Ahead -gt 0) {
    throw "No se actualizó: existen commits locales por publicar."
  }
  if ($Behind -eq 0) {
    Write-Host "main ya está actualizado."
  } else {
    Invoke-Git pull --ff-only origin main
    Write-Host "main actualizado mediante fast-forward."
  }

  & bash (Join-Path $RepoRoot "agent-kit/scripts/validate-kit.sh") $RepoRoot
  if ($LASTEXITCODE -ne 0) {
    throw "La validación terminó con errores."
  }
}

function Open-Workspace {
  $Workspace = Join-Path $RepoRoot "workspaces/edu-control.code-workspace"
  $CodeCommand = Get-Command code -ErrorAction SilentlyContinue
  if (-not $CodeCommand) {
    throw "No se encontró el comando 'code'. Abre manualmente: $Workspace"
  }
  & code $Workspace
}

function Show-Menu {
  Show-VersionState
  Write-Host ""
  Write-Host "1) Comprobar la última versión"
  Write-Host "2) Actualizar main de forma segura"
  Write-Host "3) Validar configuración"
  Write-Host "4) Abrir panel Edu"
  Write-Host "5) Salir"
  $Choice = Read-Host "Elige una opción"
  switch ($Choice) {
    "1" { Check-Remote }
    "2" { Update-Main }
    "3" { & bash (Join-Path $RepoRoot "agent-kit/scripts/validate-kit.sh") $RepoRoot }
    "4" { Open-Workspace }
    "5" { return }
    default { throw "Opción no válida." }
  }
}

switch ($Action) {
  "menu" { Show-Menu }
  "status" { Show-VersionState }
  "check" { Check-Remote }
  "update" { Update-Main }
  "validate" { & bash (Join-Path $RepoRoot "agent-kit/scripts/validate-kit.sh") $RepoRoot }
  "open" { Open-Workspace }
}
