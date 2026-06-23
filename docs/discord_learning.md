# Discord learning loop (reusable)

The decomp.me / pret / Fire Emblem Universe Discords are a living source of
matching tricks, agbcc lore, and new tooling. We periodically pull NEW messages,
distil the useful bits into [`discord_findings.md`](discord_findings.md), and
commit **only the distilled findings** — never the raw logs.

## Why raw logs are never committed

`docs/refs/discord/` is gitignored (IP / redistribution boundary — the raw chat
export is other people's content). Only our own distilled, attributed learnings
go into the committed `discord_findings.md`. Treat the raw `*.json` as a local
scratch corpus, like `baserom.gba`.

## Persistent setup (already in place)

| Piece | Location | Notes |
|-------|----------|-------|
| DCE binary | `~/tools/dce/DiscordChatExporter.Cli` | self-contained .NET build (no system `dotnet` needed), v2.47.x. Persistent — do not delete. |
| Auth token | `~/.config/fe8j-decomp/discord.env` | **outside the git tree**, `chmod 600`, `DISCORD_TOKEN=...`. NEVER commit, NEVER echo. Override path via `FE8J_DISCORD_ENV`. |
| Fetch script | `scripts/discord_fetch.sh` | committed; reads the token from the env var (DCE picks up `DISCORD_TOKEN` automatically, so it never appears on the command line / in `ps`). |
| Raw logs + state | `docs/refs/discord/` (+ `.state/`) | gitignored. Per-channel watermark in `.state/<label>.last`. |

If the token is ever lost/rotated: recreate `~/.config/fe8j-decomp/discord.env`
with `chmod 600` and a fresh `DISCORD_TOKEN=...` from Discord. If the DCE binary
is gone, re-fetch a self-contained Linux-x64 release of DiscordChatExporter into
`~/tools/dce/` (it bundles its own runtime).

## How to fetch (incremental — new messages only)

```bash
scripts/discord_fetch.sh                 # all tracked channels, since last run
scripts/discord_fetch.sh ai tools        # only the named channels
FE8J_DISCORD_AFTER=2026-06-01 scripts/discord_fetch.sh ai   # override lower bound
```

Each run fetches only messages **after** that channel's stored watermark, writes
a `delta_<label>_<id>_<after>.json` (dropped if empty), and advances the
watermark to the run time. So re-running never re-pulls the whole history — it is
true incremental. First run after the 2026-06-22 base export uses a
`2026-06-22T00:00:00` lower bound.

## Tracked channels

| label | channel | id |
|-------|---------|----|
| `ai` | decomp.me / decompilation / ai (AI-decomp tooling) | 1399506904979345408 |
| `tools` | decomp.me / decompilation / tools | 1224198647097593876 |
| `decomp-general` | decomp.me / decompilation / decomp-general | 1232647864337829940 |
| `decomp-help` | decomp.me / decompilation / decomp-help | 967856276350574673 |
| `asm2c` | pret / Contributing / asm2c | 597616808023031819 |
| `fireemblem8` | pret / Not Pokémon / fireemblem8 | 442465614104231937 |
| `feu-projects-decomp` | Fire Emblem Universe / Projects / decomp | 416236460002377730 |

## The loop each session (optional, low-cost)

1. `scripts/discord_fetch.sh` — pull deltas.
2. If any `delta_*.json` appeared, skim them (or hand a read-only subagent the
   file paths) for: new tools, agbcc/codegen tricks, FE8-specific matching notes.
3. Append distilled, attributed learnings to `discord_findings.md`.
4. Commit **docs only** (`git add docs/discord_findings.md docs/discord_learning.md`).
   Never `git add docs/refs/discord/` (gitignored anyway) and never the env file.
