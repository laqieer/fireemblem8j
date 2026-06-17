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

## NEXT-ITER LEVER (genuinely untried, switch away from hand-picking): coddog-on-backlog
PutFaceTm (this iter) confirmed: the small-diff CODE-DIFF functions are instruction-SCHEDULING
dead-ends (JP emits `lsls/asr` sign-extend BEFORE a ldrb-load block, mine after — same class the
permuter non-converges on). So hand-picking named-asm is exhausted.
**The one untried automation: coddog content-similarity on the 1202 un-carved sub_ functions.**
coddog IS built (tools/coddog/target/release/coddog) but skips the sub_ backlog because those
symbols have size=0 in the ELF (real `.text` syms but no `.size`). SETUP (multi-step, do in a
focused iter):
  1. Add `.size sub_X, .-sub_X` to each asm/sub_*.s (BYTE-NEUTRAL — doesn't change code, only the
     symbol table; `make compare` stays OK). CAUTION: structures vary (some start with a `.set`
     callee block; ensure the .size targets the function label, after its body). Script + verify
     COLD make compare.
  2. Recreate the (throwaway, uncommitted) `decomp.yaml` + `fe8.coddog.yaml` pointing jp=fireemblem8.elf,
     us=../fireemblem8u/fireemblem8.elf (see docs/tools/coddog-classification.md "How it was run").
  3. `coddog compare2` → for each sub_, similarity % to its best US match.
  4. PAYOFF (two axes): (a) any sub_ at ~100% similarity = region-SAME the funcmap missed -> CARVE
     it (+matching-C +named); (b) for region-diff sub_, the content-similarity is the 3rd signal
     (hook's "coddog 3-signal naming") to combine with fingerprint callee-set + positional-delta ->
     RELIABLY name it (byte-neutral, +named axis, which has ~10% headroom to the ~89.9% asset-sheet ceiling).
Yield uncertain (mechanical levers cleared most region-same) but it's the only untried automation
that can SEE the backlog. If it finds nothing region-same, it still feeds reliable naming.

## coddog-on-backlog — EXECUTION PLAN refined (pyelftools blocked; asm-sizing one-time analysis)
- pyelftools NOT available (system pip PEP-668-blocked, no --break-system-packages per HARD RULE;
  permuter-venv has no pip). So the clean ELF-symbol-table rewrite is out.
- External `.size sub_X, N` in a separate file FAILS (makes sub_X an undefined `U` ref; .size must be
  in the DEFINING asm file). NB the asm FILENAME (asm/sub_<addr>.s) != the .global inside (e.g.
  asm/sub_080D6B28.s defines `_vfprintf_r`).
- PATH (one-time analysis, NOT a permanent build change): script over the 2303
  `layout/carved_rom.d/gbadisasm_sub_*.tsv` (each: start end `asm/X.o(.text.SECT)` NAME) -> for each,
  append `.size <global_name>, <end-start>` to its asm file (BYTE-NEUTRAL; test 1 + COLD make compare).
  Then build the sized ELF, recreate `decomp.yaml`+`fe8.coddog.yaml` (jp=fireemblem8.elf,
  us=../fireemblem8u/fireemblem8.elf; see docs/tools/coddog-classification.md), run
  `tools/coddog/target/release/coddog compare2`, capture similarity %, then `git checkout -- asm/`
  to revert the .size. ACT on results: ~100% sim sub_ = region-same (CARVE); 0.5-0.95 sim = feed the
  fingerprint as the 3rd naming signal (byte-neutral +named). 1170 sub_ are size-0 T symbols today.

## ★ MAJOR LEVER FOUND: coddog-on-backlog carves the un-named sub_ functions (+matching-C +named)
**Executed the coddog-on-backlog plan — it WORKS.** `scripts/tools/coddog/size_backlog.py`
appends byte-neutral `.size` to the 1100+ un-carved `asm/sub_*.s`, making them visible to coddog.
`coddog compare2` then found **413 sub_ at 99.99%/100%** (region-SAME modulo relocation) — each a
US-function identification the funcmap LACKED. 144 unique (non-dup, not-already-carved) saved to
`reference/coddog/region_same_candidates.txt` (format: `US_name JP_addr`).

**Carve workflow (PROVEN, +6 this iter):** for `US_name JP_addr`:
  1. `SUB=sub_<addr-no-leading-0>` ; rename in its asm + callers:
     `sed -i 's/\.global $SUB\b/.global $US/; s/^$SUB:/$US:/' asm/$SUB.s`
     `for f in $(grep -rlE "\b$SUB\b" asm/ layout/); do sed -i "s/\b$SUB\b/$US/g" $f; done`
  2. `python3 -c "import sys;sys.path.insert(0,'scripts');sys.argv=['x'];import autobind;autobind.run('$US')"`
     -> autobind sentinel-binds the missing data/proc symbols and byte-checks; [MATCH] keeps, else reverts.
  3. if `src/$US.c` exists (matched): dedup_baseline_syms + gen_layout + COLD make compare + commit + push.
  4. else: `git checkout HEAD -- src/ asm/ layout/` + rm untracked strays (the rename must be reverted).
**WON +6:** DebugMenu_StartNameEntryEffect, ADJUSTFROMXI_MoveCameraOnSomeUnit, ConvoyMenuProc_StarMenu,
ConvoyMenuProc_ExecBootlegPopup, MenuCommand_DrawExtraItem, StartPikeTrapAnim. matching-C 7181->7187.

**WHY straight-port (graduate_jp_batch) gave 0:** it doesn't BIND the undefined data/proc symbols
(proc-scripts like ProcScr_PikeTrapAnim@085C3520). autobind's sentinel-bind is the fix.

**NEXT ITER (~138 candidates remain, high-yield):** run the per-function workflow as a SERIAL loop
(one function at a time = robust; the batch/global-sentinel version has a cascade bug — chunks >1 fail,
chunks=1 work but a prior chunk's incomplete revert poisons the next, so PRE-CLEAN each). AVOID `pkill`
in the launch cmd (self-matches the shell -> exit 144; use explicit pids). Some candidates are CONST-
different (Sio-like, won't straight-match) -> autobind reverts them; harvest the bind-only ones first.
Also: 5 sub_ at 100.00% (exact) + 604 at 95-99.9% (the 95-99.9 band = bigger reloc/const deltas, lower
priority). Re-run size_backlog + coddog after a batch to refresh (carving changes the ELF).

## coddog harvest — STATUS + const-decode (matching-C 7181 -> 7194, +13 coddog carves)
The bind-only autobind harvest (~22% of candidates) banked ~12 (harvester + manual). The
remaining ~130 candidates are mostly CONST-DIFFERENT (coddog 99.99% = opcode-identical, operands
differ) — these are NOT dead-ends, they're per-function const-decodes:
- **JP-VARIANT CALL** (ChapterIntro_DrawChapterTitle, WON 0/80): the US calls FuncX but JP calls a
  DUPLICATE at a nearby addr (DrawChapterTitleStrEx@0808B99C vs JP's bl sub_808B9C0@0808B9C0, +0x24).
  Fix: rename the call to FuncX_jp + bind it to the JP addr (from the `bl sub_<X>` in the asm).
- **JP-DIFFERENT FLAG/CONST** (ItemSelectMenu_Effect 1/112 @0x2e `movs #0xe0`->`#0xa0`): a single const
  differs; find it by objdump'ing the diff offset's instruction + matching to the US body. (NB the
  return MENU_ACT_SND6A=0xe0 is CORRECT — the 0xe0 at 0x2e is a DIFFERENT const, still undiagnosed.)
**HARVEST METHOD (main-thread, foreground):** per fn — rename sub_<addr>->US_name (def+callers),
autobind.run; [MATCH]->commit; [DIFF] small->objdump the diff instruction + decode the const/call;
[LINK]->a fn callee autobind couldn't bind (find its addr from `bl sub_<X>` in the asm). Candidates:
reference/coddog/region_same_candidates.txt (144). Re-run size_backlog+coddog after a batch (virtuous
cycle). DON'T run a detached background harvester (protocol = main-thread; also /tmp scripts vanish +
pkill self-matches exit-144). The 604 sub_ at 95-99.9% are a second wave (bigger deltas).

## coddog harvest — SKIP rules (build-fails diagnosed)
The harder coddog candidates fall into skip buckets (autobind reverts/builds-fail cleanly):
- **OVERLAP/RANGE** (DoUsePutTrap@0x29890: "overlap/order error ... prev end 0x298e4"): the coddog
  match is mid-function or the gbadisasm boundary differs from the US function boundary — the carve
  range overlaps a neighbour. SKIP (not a const-decode).
- **VARIABLE msg-id** (DoUseSpecialDance/DoUsePutTrap: `GetStringFromIndex(msgHelp)` — a fn arg, not a
  literal): no hardcoded const to substitute; the diff (if any) is elsewhere. Harder.
- **CLEAN WINS this iter:** DoUseRescueStaff (hardcoded `GetStringFromIndex(0x876)`->JP 0x7f4 msg-id).
The reliable quick decodes are: hardcoded-msg-id literals (GetStringFromIndex(0xNNN)), JP-variant
calls (bl sub_<X> to a duplicate), single-const movs. Triage by carving + objdump'ing the diff
offset's instruction. The bind-only autobind matches are mostly exhausted in the first ~30 candidates;
deeper ones are const-different/overlap. README scorecard refreshed (84.4%/7195, 79.8%/13313, D108).
