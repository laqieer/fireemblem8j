# Incident postmortem — self-push race + concurrent-build cascade (2026-06-13)

**Severity:** medium (origin/main `make compare` red for several hours; **zero permanent
data loss** — every carve was oracle-gated and recoverable). Net real repo damage: **one**
function carve. The rest was self-inflicted process noise.

**One-line:** A two-agent *self-push* race left a dangling carve; a sloppy `git add -A`
"fix" made it permanent; then **many concurrent `make` builds in one checkout** + a cron
auto-`make compare` produced a cascade of *false* build failures that took hours to see
through.

## What happened (timeline)

1. To beat an unreliable orchestrator loop (an earlier 4 h stall where my dynamic wakeup
   didn't fire), I had two carve agents **self-push** gated carves directly to `main`
   (`fetch → rebase origin/main → dedup → make compare → push HEAD:main`).
2. The two agents **raced**: one carved `ResetIconGraphics` via `perfrag` (added
   `perfrag_icon.tsv → src/icon_080034D0.o`) but, in the rebase/interleave, **`src/icon_080034D0.c`
   was never committed**. Same for `src/face_0800549C.c`. Result: `ldscript.txt` references an
   object whose source isn't in the repo → `ld: cannot find src/icon_080034D0.o` on any fresh
   checkout. This is a **dangling carve**.
3. My "race-fix" commit (`06c830c75`) used **`git add -A layout/`**, which *committed the
   dangling fragments* and *removed the asm fallback* (`asm/sub_80034D0.s`) — turning a
   recoverable mess into a permanently-broken `main`.
4. Diagnosis was then buried under **concurrent-build false failures**: every repair attempt
   started another `make compare` in the *same* `main` checkout, and a 17-min reliability
   **cron auto-ran `make compare`** too. 4-8 builds raced, corrupting shared generated
   `src/*.s` (signature: `bad instruction 'byte 0x..'` = the `.b` of `.byte` eaten by a
   concurrent writer). I chased these false FAILs across many cycles.
5. One repair script **pushed despite the build FAILing** (push not gated on the build
   result), re-broking `main`.
6. Resolution: the `funcmapExtend` agent independently produced the correct fix
   (`9d1f87fc6` — *revert the dangling icon/face perfrag carves to descriptive asm*); I merged
   it as the **single serialized build**, confirmed `COLD OK` + sha1 = `7da0456…`, and pushed.

## Root causes

| # | Cause | Why it bit |
|---|---|---|
| R1 | **Multi-agent self-push to `main`** | No serial integrator → a rebase race can commit a `perfrag_*.tsv` fragment without its `.c` (dangling carve). The serial integrator would have caught it. |
| R2 | **Blanket `git add -A` in a fix** | Committed the *dangling* fragments + removed the asm fallback, making a recoverable state permanent. |
| R3 | **Concurrent `make` in one checkout** | Multiple builds write the same generated `src/*.s` → corruption → **false** `bad instruction` FAILs. Amplified by a cron auto-`make compare`. |
| R4 | **Push not gated on build result** | Scripts ran `make compare && echo OK || echo FAIL; git push …` — the push fired regardless of FAIL. |
| R5 | **`pgrep -f` self-match** | Counting build procs by *cmdline* matched my own `grep 'make|agbcc…'` command → phantom "procs", confusing the drain logic. |

## Lessons / standing rules (now enforced)

1. **Prefer BRANCH-push + serial integration over multi-agent self-push.** Agents push to
   their own `feat/<branch>`; the coordinator integrates on cadence. Serial integration is the
   only place cross-branch overlap/dedup/dangling-carve checks happen correctly. (Self-push is
   acceptable only for a *single* agent with no sibling.)
2. **NEVER run two `make` in the same checkout.** Serialize: *drain first* (match build procs by
   **`comm`** — `make`/`cc1`/`as`/`agbcc` — with `cwd == repo root`, **not** by cmdline which
   self-matches your grep), then run ONE build. Do not auto-`make compare`-verify on a cron — it
   piles up.
3. **Gate every push on the cold build.** Confirm `COLD OK` (sha1 == `7da0456…`) **as a separate
   step**, then push. Never `make compare … ; git push` in one ungated chain.
4. **Dangling-carve check before/after integration:** for every `perfrag_<tu>.tsv` /
   `carved_rom` row → `src/<fn>.o`, assert `src/<fn>.c` is **git-tracked**. Symptom of a miss:
   `ld: cannot find src/<fn>.o`. Fix = commit the `.c`, or revert the row to descriptive asm.
5. **Never blanket `git add -A`** when fixing layout — it can commit dangling fragments. Stage
   explicitly and verify the `.c`/`.s` each row references exists.
6. **The reliable heartbeat is the problem, not the dashboard.** `scripts/wave_status.py`
   (integrate-on-cadence + exhausted-lever list) is correct; the *delivery* must be reliable
   without spamming builds. Use branch-push (main advances on integration) + a heartbeat that
   only *integrates actual branch commits* (one build per real integration), never a blind
   periodic `make compare`.

## Recovery playbook (fast path next time `ld: cannot find src/X.o` / spurious `bad instruction`)

1. **Stop the bleeding:** delete any auto-`make compare` cron (`CronDelete`); don't start new
   builds.
2. **Drain:** wait until `comm`-matched `make/cc1/as/agbcc` with `cwd==repo` is **0**.
3. **One clean build** (`git reset --hard origin/main && git clean -fdx src asm layout &&
   make clean && make compare`). `bad instruction 'byte 0x..'` that *disappears* on a serial
   build = race, not real.
4. **Real `ld: cannot find src/X.o`** = dangling carve → find the `perfrag/carved_rom` row, and
   either commit the `.c` or **revert the row to descriptive asm** (restore `asm/sub_<addr>.s`,
   drop the perfrag fragment + its `baseline_syms`/`carved_ram` siblings).
5. **Confirm green serially, then push.** CI (fresh checkout) is the authoritative race-free
   gate.

See `docs/decisions.md` D92 and memory `wave-integrate-on-cadence`.
