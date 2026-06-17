# Detached permuter run — efxHitQuake_Loop

**Launched:** 2026-06-17. **Function:** efxHitQuake_Loop (sub_80548A4, 852 B).
**Residual:** 13-byte CONTIG diff @0x198 — an instruction-SCHEDULING reorder
(JP emits the `(s16)` sign-extend `LSL/ASR` before a `LDR/LDRH/ADD` load-block;
mine emits them swapped). Pure ordering → permuter's domain, not a const-diff.

**State:** `nonmatchings/efxHitQuake_Loop/` (imported, base score = 330).
Running detached: `setsid ... permute.sh bg nonmatchings/efxHitQuake_Loop/ -j4 --stop-on-zero`.
Log: `nonmatchings/efxHitQuake_Loop/permute.log`.

**NEXT ITERATION — check it:**
```
grep -c 'score = 0' nonmatchings/efxHitQuake_Loop/permute.log     # >0 = WIN
ls nonmatchings/efxHitQuake_Loop/output-*                          # winning sources
ps -eo pid,cmd | grep '[p]ermuter.py'                             # still alive?
```
- If a `score = 0` / `output-*/source.c` exists: copy it to `src/efxHitQuake_Loop.c`,
  wire (handdecomp tsv + drop baseline_sym + gen_layout), COLD `make compare`, commit, push.
- Also read `output-<low>/diff.txt` even if not 0 — **permuter-as-diagnostic** may reveal
  a source statement-order/cast fix to apply directly (see [[decomp-permuter-workflow]]).
- If alive but stuck at 330 for many turns: it's a likely non-converge; kill via
  `ps -eo pid,cmd | grep '[p]ermuter.py'` then `kill`, and move on.

**NEXT permuter target after efxHitQuake: ColorFadeSetupFrom{Black,White,ColorToBlack,ColorToWhite}**
— all 4 share an identical 10-byte CONTIG @0xa scheduling diff (base sets up loop
counter r1=#31 + pointer→r9 BEFORE zero-extending the u8 param into sl; mine does the
param-extend first; also base uses r2 as the ldr→r9 temp, mine uses r0). Pure
scheduling/reg-alloc — a permuter win on ONE likely yields a source pattern that carves
all 4 (+4). Confirmed NOT a const-diff (disasm'd both sides 2026-06-17). My memory's
earlier "ColorFade reg-alloc dead-end" was the `u8 a`→int test on the main ColorFade; the
Setup* variants weren't permuter'd yet — worth a run.

**This iter's closed levers (don't re-run): garbage-binding batch (0 new — efxQuake was
the lone region-same target; rest are region-diff/frontier-data dead-ends) and
single-signal fingerprint naming (0 pass the 2-signal Jaccard≥0.6 bar).**
