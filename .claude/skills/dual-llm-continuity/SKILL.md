---
name: dual-llm-continuity
description: Maintain coherent, token-efficient continuity between Codex and Claude across multiple computers using shared Markdown state, safe Git startup, task packets, model routing, structured handoffs, and portable exports. Use when starting or resuming work from VS Code, checking or updating a machine from main, transferring work between LLMs, choosing a model, updating the Obsidian control-plane, or generating and validating a continuity ZIP.
---

# Dual-LLM Continuity

Keep the shared state factual and compact while isolating each agent's working branch or worktree.

## Choose the operation

- **Start or resume:** read the minimum context and claim ownership.
- **Transfer:** create a handoff with the exact next action.
- **Receive:** verify Git state and the handoff before editing.
- **Select a model:** route by complexity and risk.
- **Start a machine:** identify it, inspect local state, then check or update main explicitly.
- **Export:** validate the allowlisted kit before creating a ZIP.

## Start or resume

1. Read `Edo/IA/Agentes/00 - Inicio rápido.md`.
2. Read the shared state, active project note, and active handoff only.
3. Verify the current branch, commit, worktree status, and user-owned changes.
4. Confirm one agent owns the task and files being changed.
5. Load additional sources only when required by the task.

## Start a machine

1. Read the local identifier from `.edo-machine`; never commit that file.
2. Run `agent-kit/scripts/edo-start.sh status` or the PowerShell equivalent.
3. Use `check` before deciding whether an update is necessary.
4. Use `update` only on a clean `main`; the script must stop on local commits or divergence.
5. Treat Drive as a replica and source layer, not as the authority for Git version.
6. Read `agent-kit/MULTI-MACHINE-STARTUP.md` only when onboarding or diagnosing an equipment sync issue.

## Transfer work

1. Stop at a coherent boundary.
2. Record objective, completed work, changed files, validation, decisions, blockers, and next action.
3. Include the base commit and branch; do not paste the full conversation.
4. Mark the handoff `listo` only after checking it against `references/handoff-schema.md`.
5. Update `01 - Estado compartido.md` only when the shared state materially changed.

Create the draft with `scripts/create-handoff.sh` when the repository follows the Edo layout.

## Receive work

1. Compare the handoff's base commit and branch with the local repository.
2. Inspect the diff and tests named by the previous agent.
3. Resolve inconsistencies from source files and Git, not from assumptions.
4. Change the owner only after the receiving agent accepts the handoff.

## Route model and context

- Use an efficient model and low effort for mechanical work.
- Use a balanced coding model and medium effort for ordinary implementation.
- Use the strongest model and high effort for architecture, difficult debugging, security, or irreversible decisions.
- Escalate only after a concrete quality or verification signal.
- Keep always-on instructions under roughly 3,000 tokens and load history by summary.

## Validate and export

1. Run `bash agent-kit/scripts/validate-kit.sh .`.
2. Review the allowlist and exclusions.
3. Generate the ZIP with `bash agent-kit/scripts/build-export.sh . <output-directory>`.
4. Verify checksums and extract the ZIP into a temporary directory.
5. Confirm that both `AGENTS.md` and `CLAUDE.md` point to the same shared state.

## Safety

- Never include `.env`, credentials, private keys, agent transcripts, caches, or dependency folders.
- Do not commit, push, merge, tag, or publish unless the user explicitly requests it.
- Preserve user-owned worktree changes.
- Keep raw historical sources separate from the operational context.
