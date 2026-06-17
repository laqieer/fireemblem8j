# NO permuter running — both attempts retired as non-converge (2026-06-17)

**Permuter is NOT a viable lever for the FE8J reg-alloc/instruction-ordering tail.**
Two genuine runs both failed to converge: efxHitQuake_Loop (852 B, best stuck at base 330
over 1.3M iters) and ColorFadeSetupFromBlack (128 B, best 475 vs base 480 over 7k iters).
The reorderings agbcc needs are not in the permuter's transformation space. Don't re-launch
without a fundamentally different residual class.

## CURRENT high-yield lever — static-screen DATA-DIFF carves (the Sio family vein)
The static mnemonic screen (`/tmp/mscreen.py`, names from `/tmp/named_asm.txt`) on the
remaining ~84 named-asm surfaced the winnable DATA-DIFF / CLOSE functions. **WON this iter:
SioResult_NewHS_Init (0/572), SioResult_Init (0/500)** — both Sio link-arena result screens
with the SAME layout-const decode:
  - 4 rank-header text X-offsets shifted (JP wider): ~12->16, 84->92/94, 120->129/132, 150->156
  - 4 header msg-IDs MSG_772/773/774/775 -> JP indices 0x5a/0x5b/0x5d/0x5f
  - help-text PutSioText id (MSG_744 -> 0x6cf)
  Method: `/tmp/carve_one.py` SUBST (autobind + per-fn body replace), iterate (fix msg-IDs +
  X-offsets, the ldr->movs change cascades to fix literal-pool-offset diffs). See the SioResult_*
  entries already in /tmp/carve_one.py for the exact SUBST.
**STILL OPEN (next iter):** `SioRuleSettings_Init` (0.921) — same class but ENTANGLED: 2+ consts
go ldr->movs and the literal-pool cascade is sensitive (a wrong single SUBST went 39->96).
Decode needs reading the JP asm pool entries directly, not guessing. The other CLOSE were the
4 ColorFade* (reg-alloc, permuter-confirmed dead-end). 66 CODE-DIFF + 11 CMPL = agbcc dead-ends.

**ITER UPDATE (2026-06-17, screen winnable bucket EXHAUSTED — no new clean win this iter):**
- CMPL bucket triaged: `SoundRoom_InitText` compiles after a DECL fix (struct Unknown201F148 from
  US soundroom.c:42 + `extern struct ... gUnk_SoundRoom_0;` — autobind's auto-decl `int X()` was the
  wrong TYPE for a struct instance) BUT then byte-diffs 50/232 with a CODE-LENGTH delta (my code is
  4 B longer; +1 ldr-offset shifts persist regardless of the 0x5AA->0x535 / 0x5AE->0xe9 msg-id fix)
  = codegen dead-end, NOT a const-diff. The other CMPL (ClassInfoDisplay_Init, ClassIntro_Init) need
  multiple struct-decls + binds (gOpinfo_0/1, gUnk_58) and are likely the same code-diff outcome;
  MultiBootMain/DrawItemMenuLineLong/libc = known dead-ends; AutolevelSecondaryLord = no recipe.
- Borderline CODE-DIFF (ratio>=0.85 + same len) check: ZERO — the 66 CODE-DIFF are genuine.
- `SioRuleSettings_Init` re-attempted: instruction-correlation hampered by the cascade; the JP
  movs `#0xda` @ func+0x14e is NOT MSG_745 (that SUBST went 39->96). Needs full objdump-vs-asm
  instruction alignment by bl-callee sequence — a focused ~30-min task, deferred.
**UPDATE 2: SioRuleSettings_Init WON (7180->7181) via the SYSTEMATIC CONST-SEQUENCE method.**
The "entangled cascade" was ONE const: MSG_745 = 0x6D0, which agbcc encodes as `movs #0xda; lsls #3`
(0xDA<<3, shorter than a pool load) — so my pool `ldr` shifted every later ldr-offset. METHOD that
cracks entangled DATA-DIFF cascades (don't guess bytes): objdump my .o + parse the JP asm, extract
the LOADED-CONST sequence (movs #imm + ldr pool .4byte) from each, diff the sequences — the one extra
JP `movs N` (where mine has a `ldr`) is the cascade const; read its asm context (`movs #N; lsls #k`
=> source value N<<k) to get the source SUBST. This is in /tmp/carve_one.py-style flow.

**CODE-DIFF re-screen (movs-seq similarity) = DEAD END / false signal.** Re-screened the 66 CODE-DIFF
by movs-immediate-sequence similarity; ~14 scored 0.93-1.00, but carving them gave HUGE diffs
(77-559 B, >50%): high movs-sim just means the few small immediates coincide — the ldr/branch/struct
code genuinely differs. The original screen's CODE-DIFF ratio (full mnemonic seq <0.9) was CORRECT.
Don't re-chase the CODE-DIFF bucket by movs-sim.

**CONCLUSION: the static-screen winnable bucket is now FULLY EXHAUSTED (3 Sio DATA-DIFFs done:
SioResult_NewHS_Init, SioResult_Init, SioRuleSettings_Init; ColorFade*=reg-alloc dead-end; 66
CODE-DIFF + 11 CMPL = genuine region/codegen dead-ends, re-confirmed). matching-C at 84.20% (7181).
Remaining matching-C = genuine agbcc codegen hand-decomp (very slow). Named axis at ceiling.**

---
(prior detached run, retired:)
# Detached permuter run — ColorFadeSetupFromBlack

**Launched:** 2026-06-17. **Function:** ColorFadeSetupFromBlack (sub_8001870, 128 B).
**Residual:** 10-byte diff @0xa-0x14 — a literal-load / instruction-ORDERING swap at the
function start (two ~5-byte setup blocks emitted in opposite order vs JP; base sets up loop
counter + pointer BEFORE zero-extending the u8 param, mine does the param-extend first).
Pure ordering/reg-alloc → permuter's domain; the C body is a plain nested loop with no
statement to reorder, so NOT source-forceable. base score = 480.

**State:** `nonmatchings/ColorFadeSetupFromBlack/` (imported). Running detached:
`setsid bash scripts/permuter/permute.sh bg nonmatchings/ColorFadeSetupFromBlack/ -j4 --stop-on-zero`.
Log: `nonmatchings/ColorFadeSetupFromBlack/permute.log`.

**NEXT ITERATION — check it:**
```
grep -c 'score = 0' nonmatchings/ColorFadeSetupFromBlack/permute.log   # >0 = WIN
ls nonmatchings/ColorFadeSetupFromBlack/output-*                        # winning sources
pgrep -af '[p]ermuter.py'                                              # still alive?
```
- If `score = 0` / an `output-*/source.c` exists: copy → `src/ColorFadeSetupFromBlack.c`,
  wire (handdecomp tsv + baseline_syms_drop + `git rm` asm/sub_8001870.s + gbadisasm tsv +
  gen_layout), COLD `make compare`, commit, push. The SAME fix likely ports to the 3 siblings
  (ColorFadeSetupFromColorToBlack/White, ColorFadeSetupFromWhite — identical 10-byte structure) → +4.
- Also read `output-<low>/source.c` even if not 0 — **permuter-as-diagnostic** may show a
  source statement-order/cast fix to apply directly (see memory decomp-permuter-workflow).
- If alive but no win after many turns: like efxHitQuake (no win in 1.3M iters), it's the
  reg-alloc/ordering dead-end tail — `pkill -f '[p]ermuter.py'` and move on.

**PRIOR run (efxHitQuake_Loop, 852 B):** NO WIN — best score stuck at base 330 over 1.3M iters;
instruction-scheduling reorders are low-probability for the permuter. ColorFade is smaller
(128 B) so a faster/more-thorough search, but temper expectations.

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
