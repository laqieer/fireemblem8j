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

**BREAKTHROUGH 2026-06-17 — garbage-binding 'region-diff' verdicts are HAND-DECOMP CANDIDATES,
not dead-ends.** PutGuideBottomBarText was marked REGION 60/120 by the batch (find_real
found nothing) — but that 60-byte diff was JP LOGIC: JP swaps the two text strings
(PutDrawText shows the *category* string, Text_DrawString shows msgid 0x566; US has them
the other way: 0x05D4 'About' in PutDrawText, category in Text_DrawString). After porting
the swap → 4/120, and the last 4 bytes WERE the garbage binding (gTextIds_GuideCategoriesTopic
@0x566 → real 0x08BABB54). Fix both → 0/120. **The logic fix + binding fix COMPOUND.**
→ NEXT: revisit the other batch 'region-diff' targets as hand-decomp candidates, smallest
first: PutGuideBottomBarText(done), then the medium ones — read US source vs JP gbadisasm,
find the discrete logic delta (swapped args, different msgid/const, extra call), port it,
then the residual garbage binding (if any) drops out. Workflow that WORKS:
carve_recipe US body → diff vs JP gbadisasm by reading both → rewrite C to JP logic →
wire+build → any residual 4-byte literal diff = check cfbind_*.tsv for a garbage binding.

**Ranked hand-decomp candidates (garbage-binding targets, by fn size / batch diff):**
- SioTeamList_1 (140 B, 124/140=89% — near-total rewrite, hardest; gSioMain2_1)
- GmapTimeMons_ExecMonsterMergeMu (312 B, 125/312=40%; SetGmClassUnit)
- DifficultySelect_Loop_KeyHandler (340 B, 107/340=31%; DrawDifficultyModeText + DifficultySelect_PutModeText — 2 garbage callees)
- Title_SetupSpecialEffectGraphics (412 B, 100/412=24%; gPal_TitleSmallLightBubbles)
- PrepItem_CommandMenuLoop (960 B; gHelpTextIds_PrepItemScreen)
Tackle one per iteration: read US src vs JP gbadisasm, port the discrete logic delta, fix any
residual garbage binding. The byte-diff overstates difficulty (BL-offset shifts cascade from
one logic change — PutGuideBottomBarText was '60/120' but really ONE swap + one binding).

**REFINED SELECTION RULE (2026-06-17, after 2 dead-ends): clean hand-decomp wins need a DATA
difference (which value/string goes where, like PutGuide). CONTROL-FLOW / codegen / different-API
differences are agbcc dead-ends — SKIP them.** Explored + REJECTED this iter:
- DifficultySelect_Loop_KeyHandler — CODEGEN dead-end: JP's DPAD_UP path jumps straight to the
  action block (duplicated strb, no hasChanged flag) while DOWN uses the flag; asymmetric branch
  layout is agbcc-specific, not source-forceable. (callee real addrs found: DrawDifficultyModeText
  =0x080B0A94, DifficultySelect_PutModeText=0x080B0AE8 — but binding fix gave 0 improvement.)
- Title_SetupSpecialEffectGraphics — LARGE region-diff: (a) 8 Titlescreen_0/1/2 gfx/tsa/pal assets
  mis-bound by +0x24 (real = bound+0x24, in cfbind_titlescreen.tsv) — a genuine data-correctness
  bug; (b) case-3/4 uses a DIFFERENT palette API (sub_8000D68(pal, palram_off, size) instead of
  ApplyPalettes/ApplyPalette) AND adds a 3rd graphics layer (extra Decompress 0x08B4B200→0x06015800
  in case 4) with unnamed symbols. Multi-unknown research project, not a clean port.
- SioTeamList_1 (89% diff) — near-total rewrite, skip.
ALSO triaged + REJECTED (code-diff, not data-port):
- GmapTimeMons_ExecMonsterMergeMu (125/312, 0 data-literal slots = pure code diff).
- PrepItem_CommandMenuLoop (163/960, 58 clusters mostly differing b.n branch offsets = code
  structure; one const slot 0x10c mine 0x88b/base 0x6fc but won't fix the 57 other clusters).
  (needs `int CheckInLinkArena(void);` decl to compile.)

**ALL 4 garbage-binding region-diff candidates this iter were CODE/codegen differences — clean
data-port wins (PutGuide) are RARE (~1 in 5). TRIAGE METHOD that works:** carve+compile+wire,
diff, then count 4-byte literal slots where BOTH mine&base decode as pointer/const (0x08xxxxxx/
0x02xxxxxx/<0x10000) vs total diff clusters. High data-literal ratio = winnable; mostly code
clusters (differing b.n/instruction bytes) = agbcc dead-end, SKIP.

**NEXT-ITER STRATEGY (force-multiplier):** stop hand-picking the garbage-binding set (mostly
code-diff). Instead SCREEN the broader named-asm population (115 funcs) for DATA-difference
signature — carve+diff each, auto-classify data-literal-ratio, surface only the high-ratio
(PutGuide-like) ones. The clean wins hide among ALL region-diff funcs, not just garbage-bound.
Build this screen (slow per-func build is the cost; run bounded/monitored, NOT a runaway sweep).

**Closed this iter: single-signal fingerprint naming callee+caller (0/0 pass 2-signal);
data axis re-confirmed 100% (no headroom). WON: PutGuideBottomBarText 0/120 (1f7ef404a).**
