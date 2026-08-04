# Asus Rog

- Estado: conectado y verificado (local + Drive) el 2026-08-03.
- `.edo-machine` presente con identificador `asus-rog`.
- `agent-kit/config/machine.local.json` configurado y coincide con `Machines/registry.yml`.
- Raíz de Drive verificada localmente (`VERNO OS/edo_obsidian_os`), con la estructura del vault presente.
- `agent-kit/scripts/validate-kit.ps1` no puede completar el escaneo de secretos en PowerShell nativo de este equipo porque `rg` solo está disponible dentro del entorno git-bash; se validó igualmente ese paso con una herramienta equivalente. Pendiente: instalar `ripgrep` en el PATH nativo o ejecutar la validación desde git-bash.

## Proyectos esperados

- [[../../Edo/README|Edo / Second Brain]]
- [[../../Edo/Proyectos/Portal de Capacidades/PROJECT_OVERVIEW|Portal de Capacidades]]
