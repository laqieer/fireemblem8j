# Doc-maintenance discipline

Trustworthy docs are load-bearing on this project. Misleading/outdated docs have
caused real wasted work — teams were once dispatched onto an **already-carved**
frontier because a stale classification cache (`layout/nofuncmap_*.tsv`) was read
as the work list. This page is the standing checklist every session/integration
must run so the docs stay ground-truth and self-maintaining.

CLAUDE.md ("Working autonomously") carries the short version; this is the full one.

## The single source of truth for "what's left"

**`docs/frontier.md` is the ONLY place that defines the remaining work.** Anywhere
else that needs to describe what's left should link to it, never fork it.

- Refresh `docs/frontier.md` numbers from `scripts/calcprogress.py` and its target
  lists from ground truth **whenever an axis moves**.
- The real unmatched code frontier ≈ the `asm/sub_*.s` stubs still present (plus
  any named region-diff `.s` and functions still inside the `asm/baserom.s`
  incbin) — that is what `calcprogress` counts. A target is REAL **iff** it is
  still in `asm/` and is **not** already a `src/*.c` (incl. carved
  `src/<module>_<addr>.c`). **Spot-check a sample before dispatching a team.**

### Do NOT define a frontier from `layout/nofuncmap_*.tsv`
`layout/nofuncmap_region_*.tsv` is a **stale, un-pruned classification cache**
(~3,900 entries vs. ~389 truly unmatched ≈ **10× inflated**; addresses for
region-different rows are also stale). It is a diagnostic artifact, **not** the
work list. Reconcile any scope discrepancy against `scripts/calcprogress.py`
before spending team effort. See `docs/nofuncmap_classification.md` for what it is.

## Per-session / per-integration checklist

Run this before ending any session that moved an axis:

1. **Frontier** — update `docs/frontier.md` (numbers + target source). Never read
   `nofuncmap_*.tsv` as the frontier. Spot-check that candidate targets aren't
   already carved.
2. **README scorecard** — if a 4-axis number changed, refresh the README table
   from `scripts/calcprogress.py`. Keep the honest 4-axis framing
   (build self-containment / matching-C / extracted-data / named). **Do not** inline
   per-carve `D###` history into the README — that belongs in `docs/decisions.md`.
3. **Decisions log** — record any fork/approach/next-phase decision + rationale in
   `docs/decisions.md` (and project board #14). Read it first so you don't re-open
   or contradict a settled decision.
4. **No invented numbers** — every figure comes from `scripts/calcprogress.py` or
   `scripts/check_selfcontained.py`. Cross-check; don't guess. If you can't run the
   tool, mark the figure "(snapshot at …)" rather than asserting it as current.
5. **"Walls" are provisional** — if a doc declares a permanent agbcc
   "wall / dead-end / ceiling", treat it as provisional and cross-reference
   `docs/agbcc_codegen_levers.md`. Most former walls (lsr/asr signedness,
   reg-alloc, cross-jump, arg-order, prologue) were dissolved into forceable
   levers; abandoning a function on a stale "dead-end" label loses real matches.

## How to read the four axes (so docs stay honest)

| Axis | Tool | What it means |
|---|---|---|
| Build self-containment | `scripts/check_selfcontained.py` | `make` builds the byte-identical ROM with `baserom.gba` absent — `0 .incbin "baserom.gba"`. The only ungameable number. |
| Matching-C functions | `scripts/calcprogress.py` | funcs whose bytes come from compiling `src/*.c` (+ libc/libgcc). The remaining ~389 are the real code frontier. |
| Extracted data | `scripts/calcprogress.py` | genuinely-extracted asset bytes ÷ measured data total. Named `.incbin "baserom.gba"` is **not** extraction. |
| Named symbols | `scripts/calcprogress.py` | meaningfully-named labels ÷ total. Structurally < 100% (~1,611 `banim_`/`gfx_`/`snd_` asset labels fe8u itself leaves auto-named). |

## Intentionally-local (gitignored) reference corpora — NOT missing

These directories are referenced by the docs but are **gitignored on purpose**
(local-only; some are redistribution-restricted). Do not "fix" a doc by deleting
the reference, and do not commit these:

- `docs/refs/decompme_fe/` — 167 solved community FE functions (decomp.me).
  Requires a `cf_clearance` cookie to (re)harvest. Gitignored.
- `docs/refs/discord/` and `docs/refs/discord_findings/` — raw chat logs. **Raw
  logs are redistribution-restricted (treat as PIRACY); never commit.** Only
  distilled/paraphrased findings may enter committed docs (e.g.
  `docs/discord_findings.md`).

If `docs/refs/` is absent in a worktree, that is expected — it is a local cache,
not part of the tracked tree.
