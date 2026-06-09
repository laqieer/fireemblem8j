# decomp.dev integration (FE8J)

[decomp.dev](https://decomp.dev) is the per-project decompilation-progress
tracker. It charts each project's matched-code / matched-data / matched-functions
over time from an [objdiff](https://github.com/encounter/objdiff)-format progress
report that the project's CI uploads as a GitHub Actions **artifact**. This is the
same mechanism the US sibling decomp (`../fireemblem8u`,
`FireEmblemUniverse/fireemblem8u`) uses.

## How it works here

The workflow [`.github/workflows/decomp-dev.yml`](../.github/workflows/decomp-dev.yml)
runs on every push to `main` (and on `workflow_dispatch`):

1. Installs `agbcc` + `binutils-arm-none-eabi` (the C toolchain).
2. `scripts/calcprogress.py` → `progress.txt` — coarse progress (code/data bytes
   from the carve manifest `layout/*.tsv`; functions/symbols from the decompiled
   `src/*.o`). **No `baserom.gba` is needed** — building `src/*.o` needs only
   agbcc + binutils, not the ROM incbin.
3. `scripts/gen-report.py progress.txt report.json` — converts that into an
   objdiff-format `report.json` (the top-level `measures` block decomp.dev reads).
4. `actions/upload-artifact@v4` uploads it as an artifact named **`jp_report`**.

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

The workflow uploads the `jp_report` artifact with **no API key and no repository
secret** — the artifact upload alone is enough. But decomp.dev will not show the
project until a repo admin registers it:

1. **Land this workflow on `main`** and let it run once so a `jp_report` artifact
   exists on the default branch.
2. **Register the project**: as a repo admin, visit
   <https://decomp.dev/manage/new> and add `laqieer/fireemblem8j` (version slug
   `jp`). You must be logged in via GitHub with admin rights on the repo.
3. **Install the decomp.dev GitHub App** on the repo (or org) so decomp.dev is
   notified when a workflow run finishes and picks up the new report immediately
   instead of polling.

No GitHub Actions secret is required for the decomp.dev report. (The separate
`progress.yml` / `backfill-progress.yml` workflows that feed the frogress portal
do use the `PROGRESS_API_KEY` secret — that is unrelated to decomp.dev.)

## Relationship to the other progress workflows

| Workflow | Destination | Secret | Mechanism |
| --- | --- | --- | --- |
| `decomp-dev.yml` | decomp.dev | none | uploads `jp_report` artifact |
| `progress.yml` | frogress portal (progress.deco.mp) | `PROGRESS_API_KEY` | POSTs to the frogress API |
| `compare.yml` | — (byte-match CI) | `BASEROM_URL` | `make compare` |

All three are independent; `decomp-dev.yml` is the decomp.dev-specific one and is
self-contained.
