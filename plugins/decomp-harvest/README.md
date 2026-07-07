# fe8j-decomp-harvest (Copilot CLI plugin)

A repeatable **match → integrate → learn → apply** loop for FE8J's axis-2
(matching-C) frontier. Ships one skill, `decomp-harvest`.

## Install

```sh
copilot plugin install laqieer/fireemblem8j:plugins/decomp-harvest
copilot skill list        # verify 'decomp-harvest' appears
```

Then invoke it by asking Copilot to "harvest decomp.me matches", "integrate the
matched function", or "apply the strategy to the remaining unmatched functions".

## What it does (5 steps — see `skills/decomp-harvest/SKILL.md`)

1. **Harvest** — `scripts/tools/decompme/harvest.py` polls every still-asm
   function's decomp.me family; classifies MATCHED / IMPROVED / STALE / NONE.
2. **Integrate** — pull a score-0 fork and carve it byte-exact into `make compare`
   (with the symbol-mapping gotcha check); adopt proven IMPROVED forks as
   `src/nonmatching/`.
3. **Learn** — diff matched vs old reconstruction, record the agbcc lever in the
   cookbook (`docs/agbcc_codegen_levers.md`, `docs/agbcc-matching-playbook.md`).
4. **Apply** — take that lever and **actually attempt to byte-match** the OTHER
   still-asm functions whose residual is the same pattern (real `make compare`
   attempts — not just re-polling decomp.me).
5. **Update decomp.me** — mark solved scratches, refresh axis-2 figures.

`make compare` (→ `fireemblem8.gba: OK`) is the only match oracle;
`make shiftcheck` (0 HIGH) is the second gate.

## Backing tools (repo)

- `scripts/tools/decompme/harvest.py` — the poller/classifier (+ `--pull <slug>`).
- `scripts/tools/decompme/integrate_matched.sh` — fetch a score-0 scratch's source.
- `scripts/tools/decompme/decomp_status.py` — legacy status view.
- `scripts/tools/decompme/registry.tsv` — fn → decomp.me slug map.
