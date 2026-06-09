# coddog region-SAME / DIFFERENT classification (survey P0.3)

This is the **result + analysis** of standing up [`coddog`](https://github.com/ethteck/coddog)
as the cross-region (FE8U ↔ FE8J) function-similarity classifier called for by
survey action **P0.3** (`docs/gba-decomp-survey.md`). For how coddog works and is
set up, read [`coddog.md`](coddog.md) first; this file records the concrete run,
the numbers it produced, how those cross-check against what we already know
(`layout/us_jp_funcmap.tsv` and the gbadisasm region-different backlog), and the
recommendation on a CI re-confirmation gate.

**Bottom line up front.** coddog *works* and confirms the JP carved set is
overwhelmingly region-same vs US (11 054 / 12 050 read functions byte- or
opcode-identical). But its **marginal value over the existing funcmap + funclib
(D25) is low today**: it structurally **cannot see the un-carved region-different
backlog** (the work that actually remains), and on the carved set it mostly
re-confirms what we already know. Its one durable use is a **CI / pre-carve
re-confirmation gate** on already-carved code — recommended as *opt-in*, not a
required gate.

## How it was run

Binaries (both built, `make compare` → `OK` on the JP side):

| side | ELF | functions coddog reads |
|------|-----|------------------------|
| JP   | `fireemblem8.elf` (this repo, this branch) | 12 050 (real `.text` FUNC symbols) |
| US   | `/home/laqieer/fireemblem8u/fireemblem8.elf` | (matched against) |

Because this ran in a git worktree (where `../fireemblem8u` does not resolve), the
throwaway root configs `decomp.yaml` / `fe8u.coddog.yaml` were pointed at the
absolute US path; the tracked configs under `scripts/tools/coddog/` are unchanged.

```bash
CODDOG=tools/coddog/target/release/coddog
# capture the cross-version compare; -t 0.9 surfaces the near-match band too
$CODDOG compare2 decomp.yaml jp fe8u.coddog.yaml us --sort-by similarity -t 0.9 \
  > compare2_t09.txt
# classify + cross-check (read-only; touches no build input)
python3 scripts/tools/coddog/classify.py \
  --compare2 compare2_t09.txt \
  --jp-elf fireemblem8.elf --us-elf /home/laqieer/fireemblem8u/fireemblem8.elf \
  --funcmap layout/us_jp_funcmap.tsv \
  --backlog <gbadisasm --list addr/name dump> \
  --out reference/maps/coddog_classification.tsv
```

`compare2`'s algorithm (verified in `crates/cli/src/main.rs::do_compare_binaries`):
for each JP function (≥ `min_len` 5 instructions) it finds the **single
best-scoring** US function with similarity `> threshold`, and prints
`jp - us (NN.NN%)`; functions with no US match above the threshold are **omitted**.
Similarity is bounded edit-distance over the **opcode stream** (operands /
literal-pool words normalized out), with two load-bearing sentinels
(`crates/core/src/lib.rs::diff_symbols`):

- **100.00 %** — raw bytes identical (`exact_hash` equal) → region-SAME, exact.
- **99.99 %** — opcode stream identical but bytes differ → region-SAME modulo
  **pointer / literal-pool relocation** (auto-fixed at link). This is exactly the
  "literal-pool/pointer-only delta" near-match bucket the survey asked for.

Thresholds: 0.985 (default) and 0.9 both complete in ~3 min and give the same
buckets (0.9 adds only ~48 weak near-matches). `-t 0.5` is **intractable** (the
edit-distance early-exit bound `max_len·(1−t)` explodes → it was SIGKILLed past
the 280 s budget); don't run coddog below ~0.9 on FE8-size binaries.

## Numbers (the actual coddog output)

`reference/maps/coddog_classification.tsv` — 17 984 rows
(`jp_addr us_addr jp_name us_name similarity class decompiled name_agree`),
thumb bit cleared so addresses line up with funcmap / backlog:

| class | count | meaning |
|-------|-------|---------|
| `region-same-exact`  | **3 885** | 100.00 % — byte-identical → port US `.c` as-is |
| `region-same-reloc`  | **7 169** | 99.99 % — opcodes identical, pointer/literal delta only |
| `near-match`         | **929**   | 99.0–99.98 % — small real instruction delta |
| `weak-near`          | **67**    | <99 % matched (mostly mislabels / coincidence) |
| `region-different`   | **5 934** | gbadisasm backlog; **coddog cannot read these** (see below) — label asserted, `similarity=NA` |

So of the 12 050 JP functions coddog **can read**, **11 054 (91.7 %)** are
region-same (exact or relocation-only) — the JP carved set is overwhelmingly a
relink of US, as expected.

## Cross-check 1 — vs `layout/us_jp_funcmap.tsv` (byte-match ground truth)

The funcmap has 7 733 JP functions it has *proven* byte-match US (region-same).

- **2 935 of them coddog cannot read** — their JP symbol is an ABS `.set name,
  addr+1` entry (or below `min_len`), not a `.text` FUNC objdiff recognizes. This
  is a **coverage gap, not a disagreement**.
- Of the **4 824** funcmap functions coddog **can** read:
  - **4 427** coddog independently calls region-same (≥ 99.99 %),
  - **391** near-match (99.0–99.98 %), **6** weak — and crucially the **minimum
    similarity over all 4 824 is 90.62 %**; coddog never rated a known
    byte-matched function below 90 %.

So the fair agreement is:

> **FAIR funcmap agreement = 4 427 / 4 824 = 91.7 %** at the strict 99.99 % bar,
> and **100 %** at a "region-same-or-near (≥ 90 %)" bar.

The 391 near-matches are byte-matched (the funcmap proves it) but score 99.0–99.98 %
because coddog's name-blind best-match can land on a *near-duplicate* US function
rather than the true sibling — an artifact of best-match ties, not a real region
difference.

**New region-same coddog surfaced that the funcmap MISSED: effectively 0.** coddog
lists 6 653 region-same JP functions absent from the funcmap, but **6 651 of them
are already carved** (their JP address falls inside an existing `layout/carved_rom*`
range) — they are simply outside the narrower byte-match funcmap. The remaining
**2** are false positives: data tables mislabeled as functions
(`Unk_TerrainTable_3` ↔ `voicegroup090`, `Unk_TerrainTable_7` ↔ a song table),
coincidentally opcode-similar. coddog found **no genuinely-new shared
static-lib/libgcc carve target** (e.g. `__divsi3`/memcpy) beyond what the carved
set + funcmap already cover.

## Cross-check 2 — vs the gbadisasm region-different backlog

`scripts/carve_gbadisasm_asm.py --list` → **5 934 uncarved region-different code
functions**. Cross-checking against coddog:

- **0** of the 5 934 are readable by coddog. They live in the `asm/baserom.s`
  incbin gap as ABS `.set` symbols (176) or carry **no ELF symbol at all** (5 684);
  objdiff classifies none as `SymbolKind::Function`, so coddog **skips every one**.
- Consequently coddog produces **no match** for all 5 934 — it never (wrongly)
  calls one region-same (0 conflicts), but this is **structural coverage, not
  independent confirmation**: coddog *agrees on the label* (region-different) only
  because it cannot see them, adding no evidence.

The funclib (D25) region-different set could not be cross-checked directly: the
D25 ingest target `reference/maps/funclib_us_jp.tsv` is **not yet materialized**
(D25 is the decision; the ingester has not run). The gbadisasm backlog is the
operative region-different work queue and is the cross-check used here.

## Marginal value over funcmap + funclib (D25)

| capability | funcmap | funclib (D25) | coddog |
|---|---|---|---|
| Proves a carved JP fn byte-matches US | ✅ (oracle) | — | ✅ (re-derives, name-blind) |
| Maps US source name → JP addr for **un-carved** region-different fns | ✗ (structurally can't) | ✅ (its whole point) | ✗ (can't read them) |
| Finds renamed/moved/region-shuffled twins on the **carved** set | partial | name-based | ✅ (content-based) |
| Surfaces **new** shared-lib carve targets | — | — | ✗ (found 0 here) |
| Maintained tool + confidence score | home-grown | static table | ✅ |

coddog's **unique** contribution is *content-based* re-confirmation on the carved
set (catching a future regression where a carved function silently stops matching
its US sibling, or a renamed/moved twin). It does **not** help with the actual
remaining work — the 5 934 region-different functions — because that work is
exactly the set coddog is blind to until it is carved (the documented coverage
limitation in `coddog.md`). Its discovery value over funcmap+funclib **today is
near zero**.

## Recommendation: a coddog CI re-confirmation gate?

**Recommended: opt-in, not a required CI gate.**

- `make compare` (the sha1 oracle) already guarantees every carved function still
  byte-matches; a coddog `compare2 region-same ≥ N` gate would be **strictly
  weaker** and redundant for byte-exact code.
- coddog's residual value — flagging a carved function that *opcode*-matches a US
  function it should NOT (a wrong-twin carve), or a region-same fn that drifts to
  near-match — is real but rare, and is better caught by asm-differ-against-US (the
  P1 survey item) per-function than by a whole-binary coddog pass.
- A coddog run is ~3 min and needs **both** ELFs built; making it a required gate
  adds build cost and a second oracle to keep green for little signal.

Concretely: keep `scripts/tools/coddog/classify.py` as an **on-demand triage /
audit** tool (re-run after large carve batches to confirm the region-same count
hasn't regressed and to spot wrong-twin carves), and revisit a gate only if a
real wrong-twin carve slips past `make compare` (it cannot, by construction). The
higher-leverage cross-region investment remains the **asm-differ/objdiff
US-`.o`-as-target** per-function delta (survey P1), which *does* illuminate the
region-different backlog coddog cannot.

## Reproduce

```bash
scripts/tools/coddog/setup.sh                 # if tools/coddog is missing
make compare                                  # build the JP ELF (must say OK)
cp scripts/tools/coddog/fe8.coddog.yaml  decomp.yaml
cp scripts/tools/coddog/fe8u.coddog.yaml fe8u.coddog.yaml   # fix US path if in a worktree
tools/coddog/target/release/coddog compare2 decomp.yaml jp fe8u.coddog.yaml us \
  --sort-by similarity -t 0.9 > compare2.txt
GBADISASM_CFG=tools/gbadisasm/fe8j_full.cfg \
  python3 scripts/carve_gbadisasm_asm.py --list 99999 \
  | awk '/^ +[0-9A-F]{8} /{print $1"\t"$3}' > backlog.tsv
python3 scripts/tools/coddog/classify.py --compare2 compare2.txt \
  --jp-elf fireemblem8.elf --us-elf ../fireemblem8u/fireemblem8.elf \
  --funcmap layout/us_jp_funcmap.tsv --backlog backlog.tsv \
  --out reference/maps/coddog_classification.tsv
rm -f decomp.yaml fe8u.coddog.yaml            # throwaway copies
```
