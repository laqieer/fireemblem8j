# decomp.dev integration (FE8J)

[decomp.dev](https://decomp.dev) is the per-project decompilation-progress
tracker. It charts each project's matched-code / matched-data / matched-functions
over time from an [objdiff](https://github.com/encounter/objdiff)-format progress
report that the project's CI uploads as a GitHub Actions **artifact**. This is the
same mechanism the US sibling decomp (`../fireemblem8u`,
`FireEmblemUniverse/fireemblem8u`) uses.

## How it works here

> **Consolidated into `ci.yml`.** There is no standalone `decomp-dev.yml`
> workflow file anymore — the steps below are steps inside the single
> [`.github/workflows/ci.yml`](../.github/workflows/ci.yml) job, reusing the
> `make compare`/`make shiftcheck` build from the same run instead of paying
> for a second agbcc+toolchain build. `decomp-dev.yml` and `progress.yml` were
> folded into `ci.yml` together by commit `6e22d4c61` (2026-06-15); `pages.yml`
> was folded in separately, later, by issue **#144** / D347-D348 (2026-07-04).
> See "Relationship to the other progress steps" below for exactly which
> conditions gate which step.

`ci.yml` runs on every push (`main` and pull requests) and on
`workflow_dispatch`. The steps below are gated by `github.event_name !=
'pull_request'` — i.e. they run on a push to **any** branch and on
`workflow_dispatch` on any branch, and are skipped only for pull-request runs
(unlike GitHub Pages generation/deploy, which is additionally restricted to
`main`-push — see below):

1. Installs `agbcc` + `binutils-arm-none-eabi` (the C toolchain) and runs
   `make compare` / `make shiftcheck` (these two gate every push and PR).
2. Non-PR only: `scripts/calcprogress.py` → `progress.txt` — coarse
   progress (code/data bytes from the carve manifest `layout/*.tsv`;
   functions/symbols from the decompiled `src/*.o`). **No `baserom.gba` is
   needed** — building `src/*.o` needs only agbcc + binutils, not the ROM incbin.
3. `scripts/gen-report.py progress.txt report.json` — converts that into an
   objdiff-format `report.json` (the top-level `measures` block decomp.dev reads).
4. `actions/upload-artifact` (pinned `v7.0.1`) uploads it as an artifact named
   **`jp_report`**.

decomp.dev scrapes the `<version>_report` artifact from default-branch runs; our
version slug is `jp`, so the artifact name is `jp_report` (the US repo uploads
`us_report`).

### Why not `objdiff-cli report generate`?

`objdiff-cli report generate` needs a carved **target object** per unit in
`objdiff.json` (the "expected" `.o`, derived from `baserom.gba`), and it is
all-or-nothing: if any unit's `target_path` is missing it fails and writes no
report (see [`docs/tools/objdiff.md`](tools/objdiff.md)). This incbin-baseline
decomp has no committed tooling to produce a full set of those targets, so — like
`fireemblem8u` — we synthesise the same `measures` block from `calcprogress.py`
instead. `objdiff.json` + `objdiff-cli` remain useful locally for per-symbol
diffing (`objdiff-cli diff`), just not for the whole-project CI report.

## Prerequisites only the repo owner / admin can complete

`ci.yml` uploads the `jp_report` artifact with **no API key and no repository
secret** — the artifact upload alone is enough. But decomp.dev will not show the
project until a repo admin registers it:

1. **Land this on `main`** and let a push run once so a `jp_report` artifact
   exists on the default branch (decomp.dev only scrapes default-branch runs;
   see above).
2. **Register the project**: as a repo admin, visit
   <https://decomp.dev/manage/new> and add `laqieer/fireemblem8j` (version slug
   `jp`). You must be logged in via GitHub with admin rights on the repo.
3. **Install the decomp.dev GitHub App** on the repo (or org) so decomp.dev is
   notified when a workflow run finishes and picks up the new report immediately
   instead of polling.

No GitHub Actions secret is required for the decomp.dev report. (The separate
"Publish progress to frogress" step in `ci.yml`, and the standalone
`backfill-progress.yml` workflow, feed the frogress portal instead and use the
`PROGRESS_API_KEY` secret — that is unrelated to decomp.dev.)

## Relationship to the other progress steps

`decomp-dev.yml`, `progress.yml`, and `pages.yml` no longer exist as separate
workflow files — they were folded into one `ci.yml` job so the expensive
agbcc+toolchain build and `make compare`/`make shiftcheck` run once per push
instead of being repeated per workflow, but **not in the same change**:
`decomp-dev.yml` and `progress.yml` were consolidated together by commit
`6e22d4c61` (2026-06-15); `pages.yml` was consolidated separately, later, via
issue #144 / D347-D348 (2026-07-04). `ci.yml` steps, by destination and actual
gating condition:

| Step in `ci.yml` | Destination | Secret | Gating condition |
| --- | --- | --- | --- |
| `make compare` / `make shiftcheck` | — (byte-match + shiftability CI) | none (build is self-contained; no `BASEROM_URL`) | every push (any branch) and every PR |
| "Generate/Upload decomp.dev report artifact" | decomp.dev | none | `event_name != 'pull_request'` — push to any branch or `workflow_dispatch`, not PRs |
| "Publish progress to frogress" | frogress portal (progress.deco.mp) | `PROGRESS_API_KEY` | `event_name != 'pull_request'` (same as above) **and** the secret being set |
| "Generate/Upload Pages site" + `deploy` job | GitHub Pages | `pages: write` (separate least-privilege job) | `github.ref == 'refs/heads/main' && event_name == 'push'` — main-push only, stricter than the steps above |

`backfill-progress.yml` remains a separate, manually-triggered
(`workflow_dispatch`) workflow: it replays the entire git history once to seed
the frogress timeline; the step above then keeps it current.
