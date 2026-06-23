# FE8J agent team

Project-scoped Claude Code **agent team** for the byte-perfect FE8J decomp. Enabled by
`CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1` (set in `.claude/settings.json` → `env`, and in the user
settings). Each `*.md` here is an addressable teammate; with teams on, the lead can spawn them as
background sessions and they can message each other (FleetView / SendMessage).

This roster is not generic — it encodes the project's hard-won topology (decision **D99** +
`docs/parallel-carving.md` + the `p9-team-safe-topology` memory). Read those before changing it.

> **Activation requires a restart.** New agent files and the new `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS`
> env var only load at session start — restart Claude Code after pulling this before the teammates are
> discoverable/addressable.

## The one invariant that makes teams SAFE here
The carve pipeline serializes on **one build tree + one git index + the single `make compare` sha1
oracle**. Naive parallelism corrupts it (D99: an Agent-tool worktree once leaked into the shared
HEAD). So the topology divides cleanly:

- **Read-only researchers** (`carve-researcher`, `decomp-verifier`, `data-extractor`) produce
  **recipes / verdicts** and must not build, commit, or edit the shared tree. Enforcement is
  `disallowedTools` (Edit/Write/NotebookEdit stripped) **+ instruction** — Bash stays, because they
  need `git show`/`objdump`/`grep`, so "no `make`, no `git commit`" is a PROMPT contract, not a
  harness lock. (A positive `tools:` allowlist would have severed their IDA/Ghidra MCP reads, so we
  keep the inherit-minus-Edit/Write grant.) Structural backstop: the lead spawns them without commit
  intent and **only the integrator lands work**. Safe to run many at once.
- **`carve-worker`** builds and verifies ONLY inside its **own git worktree** (`isolation: worktree`
  + `scripts/parallel/worktree_setup.sh`), then pushes a `feat/*` branch (never `main`/`integration`,
  never `--force`). Safe to parallelize on independent targets.
- **`carve-integrator`** is the **single oracle owner**: it merges/applies one at a time, runs the
  full `make compare`, and commits/pushes. **At most one integrator at a time** — it acquires an
  exclusive `scripts/parallel/claim.py claim integrator` lock at start and aborts if held, so a
  second one fails closed. Run two and you race the build tree — the exact failure mode D99 forbids.

A sub-agent can never self-certify a byte match; only the integrator's cold
`make compare → fireemblem8.gba: OK` certifies. (Harness-integrity = separated powers.)

## Roster
| Agent | Role | Writes? | Parallel? |
|---|---|---|---|
| `carve-researcher` | ID a JP fn → fe8u/fe6j/fe7j/decomp.me source; classify region-same/diff + exact diff; emit a carve recipe | read-only | yes, many |
| `carve-worker` | Claim one target, carve in its OWN worktree, `make compare` to OK, push a branch | own worktree only | yes, independent targets |
| `carve-integrator` | Merge/apply serially, full `make compare`, accept/reject, commit+push, keep main green | shared tree | **NO — singleton** |
| `decomp-verifier` | Adversarially refute a match claim; objdump diff + struct audit; recommend MATCH/NEAR/UNSOLVED | read-only | yes |
| `data-extractor` | DATA frontier: typed-INCBIN migration recipes (asm/dat → src/data) | read-only | yes |

## Typical flow (research-breadth → serial-bank)
1. Lead picks targets from `docs/frontier.md` (the ONLY worklist — never `layout/nofuncmap_*.tsv`,
   which is stale and ~10× inflated; spot-check a sample is still asm first).
2. Fan out `carve-researcher` over DISTINCT candidates → recipes (and `data-extractor` for data).
3. (Optional) `decomp-verifier` adversarially checks risky recipes.
4. **One** `carve-integrator` applies each recipe / merges each worker branch, gates on the full
   `make compare`, and banks one commit per carve (commit-cadence discipline — main advances on
   cadence, not on completion).

For high-throughput independent targets, swap step 2 for `carve-worker` agents that each carve in a
worktree and push branches; the single integrator then merges them serially via
`scripts/parallel/integrate.py`.

## Spawning (examples)
```
Spawn three carve-researcher teammates over these distinct targets and collect their recipes:
  - sub_<addrA>  - sub_<addrB>  - sub_<addrC>
```
```
Run one carve-integrator to apply the recipes above one at a time, gating each on a full make compare,
and commit+push every byte-match.
```
Worktree workers only AFTER an integration push has landed, so they branch off current origin/main
(the `worktree-dispatch-after-push` rule).

## Display (optional)
Teammates run in-process by default. To use split panes set `"teammateMode": "auto"` in settings
(falls back to in-process when tmux/iTerm2 aren't available — e.g. on plain WSL2).

## Caveats
- Empirically, researchers' region-same verdict is reliable for pure proc-management wrappers and
  unreliable for field-writers (param-width + struct-offset codegen) — expect the integrator to
  hand-tune or skip those.
- The pre-existing `pua` and `ralph-loop` plugins also contribute agents; those are orthogonal to
  this carve roster.
