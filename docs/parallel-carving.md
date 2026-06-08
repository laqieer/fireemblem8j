# Parallel carving

How to run many decomp/carve tasks concurrently without conflicts. This is the
operational guide for the architecture decided in `docs/decisions.md` (D13 = the
fragment/build foundation; the parallel plan).

## Why it's conflict-free

The historical blocker to parallel carving was **shared mutable state**: every
carve edited the same `layout/*.tsv` manifests *and* the committed generated glue
(`ldscript.txt`, `asm/baserom.s`, `asm/jp_syms.s`). Phase 1 removed both:

- **Per-task fragments.** `scripts/gen_layout.py` reads each manifest as the union
  of the monolith `layout/<name>.tsv` **plus** per-task fragments
  `layout/<name>.d/*.tsv` (deduped; the ROM is order-invariant). A task writes only
  its own `layout/<name>.d/<task>.tsv` + its own `src/<name>.c` / `asm/<name>.s` —
  all per-task-unique, so two tasks never touch a shared file.
- **Generated glue is not committed.** It's gitignored and regenerated at build
  time from the manifests, so branches can't conflict on it.

The only remaining shared resource is the whole-ROM oracle (`make compare`), which
the **serial integrator** runs one carve at a time.

## The pieces (`scripts/parallel/`)

| Script | Role |
|---|---|
| `layout_frag.py` | Write/remove a task's manifest rows as fragments (`write`, `remove`, `read_all`). The carve primitive. |
| `claim.py` | Atomic task-claim registry (`claim`/`release`/`beat`/`reap`), so two agents never take the same target. TTL + heartbeat; expired claims are reclaimable. `layout/claims/` is gitignored. |
| `worktree_setup.sh` | Make a fresh git worktree build-ready: symlink the gitignored `tools/agbcc` + `baserom.gba`, hardlink a warm `.o` cache, so the first `make compare` is the ~0.3s incremental. |
| `integrate.py` | Serial integrator: merge each ready branch onto an integration branch, `make compare`, **accept** (keep) or **reject** (`reset --hard`, save the diff to `/tmp`). Periodic `make clean && make compare` durability gate. |

## Agent workflow (per task)

1. **Claim:** `scripts/parallel/claim.py claim <task> <agent>` (skip if BUSY).
2. **Isolate:** work in a fresh git worktree; run
   `scripts/parallel/worktree_setup.sh <main-repo-root>` so it can build. (Wire this
   to a `WorktreeCreate` hook to automate it, or run it once after creating the
   worktree.)
3. **Carve:** produce `src/<name>.c` or `asm/<name>.s`, and write the manifest rows
   as a fragment via `layout_frag.py` (never edit the monoliths).
4. **Self-verify (fast loop):** use objdiff/asm-differ per symbol; then
   `make compare` in the worktree until `fireemblem8.gba: OK`.
5. **Submit:** commit (fragment + src/asm only) and push a branch.
6. **Heartbeat** the claim periodically for long tasks.

## Integration (serial, by the lead / a single integrator)

```sh
git switch -c integration main          # never integrate on main directly
scripts/parallel/integrate.py <branchA> <branchB> ...        # accept/reject each
scripts/parallel/integrate.py --durability-every 10 <branch>...   # + clean-rebuild gate
```

Because fragments are per-task-unique and the glue isn't committed, the merges are
conflict-free; `make compare` after each is the gate. Rejected branches are rolled
back (their diff saved under `/tmp/integrate-reject-*.diff`) and left for the agent
to fix. Serial is the *safety* property (no racing build, no half-merged manifest)
and it's cheap because the verify is incremental (~0.3s, decision D7). The periodic
durability gate catches carves that pass the incremental verify but fail a clean
rebuild.

## Scale & limits

- The integrator's serial 0.3s verify clears thousands/hour — far above agent
  completion rate, so it is not the bottleneck; the real limits are API budget and
  the supply of *independent* tasks.
- Keep tasks independent: a task that must edit a shared header (`include/**/*.h`)
  is **not** safely parallel — route those to a single agent / serialize them.
- Use the durability gate every K integrations to catch non-durable carves early.

## Verified

Phase 2 scripts were exercised end-to-end: `claim` (claim/BUSY/release/reap),
`layout_frag` (fragment read by gen_layout, deduped), `integrate.py` (a good carve
**accepted**, an overlapping carve **rejected + rolled back**), and a fresh worktree
builds `fireemblem8.gba: OK` after `worktree_setup.sh`.
