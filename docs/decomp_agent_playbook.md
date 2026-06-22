# FE8J decomp agent playbook (read this FIRST)

Canonical knowledge for any agent matching a JP function to C. Supersedes the per-workflow
lever snippets. The JP ROM was built with `tools/agbcc/bin/agbcc` (GCC 2.95, `-O2 -mthumb-interwork
-fhex-asm`) from C, so **every Thumb function compiled from C has matching C by construction.**

## 0. Epistemic stance (important)
There is **no such thing as an "agbcc wall."** A Thumb function written in C HAS source that
reproduces its bytes — your job is to find it. The only honest outcomes are:
- **MATCHED** — your C byte-matches (`make compare` → OK).
- **UNSOLVED** — you could not crack it *yet*; report the **exact differing instructions**
  (objdump your `.o` vs the JP asm at the diff offsets) so a human can judge. NOT "impossible."

Do **not** mark DEADEND for a codegen/scheduling/register difference. DEADEND is reserved ONLY for:
(a) the fe8u source is hand-written ASM (no C exists), (b) ARM-mode function, or (c) the target is
actually DATA mis-split as code (decodes to garbage / incoherent control flow). Everything else is
UNSOLVED at worst. If you're tempted to give up, you're missing a lever below.

## 1. Codegen levers (empirically proven against this exact agbcc)
- **lsr vs asr = signedness of the shifted operand ONLY.** `(u32)x>>n`→lsr, `(s32)x>>n`→asr.
  Signed sub-word sign-extends fused: `s16 field >>n` = `lsl#16;asr#(16+n)` (unsigned = lsl;lsr).
  Same rule for `ldrb`/`ldrsb` and `ldrh`/`ldrsh`. **Fix: cast at the shift/load site.**
- **int-local-widen (highest yield).** When JP sign-extends a s8/s16 param/field once at entry
  (an `asrs` at top), copy it to an int local up front: `int v = s8param;`. Removes re-extension
  bloat AND often nudges agbcc into JP's register choice for free.
- **register asm() pin.** `register int x asm("r5");` pins a hard register — use ONLY for a clean
  register permutation; it can add shuffle movs / break the prologue push list. Prefer
  int-local-widen, then **declaration / first-use ORDER** (earlier local → lower r4<r5<r6), then a
  pin as last resort.
- **per-target -O1.** Some TUs match only at -O1 (check fe8u's Makefile, e.g. `src/agb_sram.o`).
  Add `src/<F>.o: CC1FLAGS := … -O1 …` (note: report this; the human wires the Makefile).
- **statement reordering.** agbcc materializes values in SOURCE-STATEMENT order. If JP computes A
  before B but you emit B first, reorder the source / hoist into an earlier temp / sink later.
  Removing a redundant cast also changes scheduling.
- **CROSS-JUMPING / tail-merge IS achievable** (proven). agbcc merges identical tail SEQUENCES of
  different predecessors into one block. If JP has one shared `…; bl f; …` block reached by two
  cases but your C emits two, make the two tails **textually identical** (same statements, same
  operands) — often by computing a pointer/value into a COMMON local in each case, then doing the
  shared call once via fallthrough/goto. agbcc will then cross-jump them. (Probe: two switch cases
  each ending `acc += g(p, flag)` compile to ONE `bl g`.)
- **branch-polarity.** `if ((c)==0) A; else B;` vs `if (c) B; else A;` to match JP's beq/bne order.
- **const-restore / JP-specific consts.** "region-diff" usually = a SMALL behavioral/const change,
  not a rewrite: (a) US has a block `#if 0`'d / commented "likely present in J version" → uncomment
  it; (b) a JP-specific message id / coordinate / table index — decode from the disasm (pool `ldr
  =0x…` or `movs;lsls` immediate) and substitute; (c) a small extra/removed branch or swapped arg.
- **arg-evaluation order / scratch-register choice** (the "hard" ones — under-tried, NOT walls):
  try ordered temporaries (`int a0=x; int a1=y; f(a0,a1);`), splitting the call, changing which
  value is live/recomputed at the call, or restructuring the expression. Report exact bytes if stuck.
- **struct-field offset diffs** (a literal resolves ±N): the struct layout in the header differs
  from JP — usually a JP-specific field offset; fix the struct or use the right field, don't force.

## 2. Identifying UNNAMED sub_ (no .global name)
A `sub_<addr>` with no US name is almost always a REAL function (FE8 dispatches heavily through
function-pointer tables — proc command lists, handler LUTs, AI scripts — so absence of a direct
`bl <name>` means nothing; the pointer lives as a raw `addr|1` word in incbin'd ROM data).
- **callee-fingerprint**: the NAMED `bl` targets + their ORDER identify the fe8u function. grep
  fe8u/src for the rarest callees; confirm the bl SEQUENCE matches `asm/sub_<H>.s`.
- **function vs DATA**: decide ONLY by disassembly coherence (valid instructions, sane control
  flow, prologue/epilogue or clean leaf). The call-graph CANNOT prove "data." If it decodes to
  garbage → DATA (report it for reclassification, don't carve as code).
- If no fe8u match: the JP function may be region-DIFFERENT or JP-only — hand-decompile from the
  asm + struct field offsets (this works; e.g. ProcEfx loops were reconstructed from scratch).

## 3. Wiring a carve + COLLISION SAFETY (read before writing files)
- `git rm asm/sub_<H>.s` + its `layout/carved_rom.d/gbadisasm_sub_<H>.tsv`; write
  `layout/carved_rom.d/handdecomp_<name>.tsv` = `<start>\t<end>\tsrc/<name>.o(.text)\th: <name>`.
- If you name it with a US name (not `sub_<H>`), callers still `bl sub_<H>` → add
  `layout/baseline_syms.d/cfbind_unnamed_<name>.tsv` = `sub_<H>\t<start>\tthumb\t<name>`.
- If the US name is ALREADY a baseline symbol (absolute `A` in the ELF / present in
  `layout/baseline_syms.d/`), add `layout/baseline_syms_drop.d/handdecomp_<name>.tsv` = `<name>`
  so your C definition owns the symbol (else multiple-definition).
- **NEVER overwrite or `os.remove` a file that `git ls-files <p>` shows as COMMITTED.** If the US
  name you picked already has a committed `src/<name>.c`, you MIS-IDENTIFIED — pick another name or
  keep `sub_<H>`. A committed-file overwrite/delete corrupts the repo and cascades.
- LINK-undefined data/callee → bind its JP addr (pool literal / bl target) as a `data`/`thumb`
  baseline alias in your cfbind file.

## 4. Verification (the only gate that counts)
`/tmp/sadiff.sh` (reloc-EXCLUDED `.o` byte-diff) is a fast screen, NOT proof — the full LINK can
still differ on resolved relocs. A MATCHED claim REQUIRES a full cold `make compare` →
`fireemblem8.gba: OK`. Re-run it; if a stale .o made a previous OK, rm the .o and rebuild.

## 5. Field-discovered techniques (harvested from agent runs — grows every cycle)
These were discovered by reconstruction agents and promoted here so every agent has them.
- **Identification by funcmap-neighbor / map-proximity**: an unnamed `sub_<addr>` immediately
  before/after a NAMED function (by address, see `layout/us_jp_funcmap.tsv` / the .map) is usually
  the next/prev function in that same fe8u TU — port from that .c file, that region. (Used to ID
  StartSpellAnimation, GMapScreen_OnWorldmapEventUpdate, GmMu_SetBlendEnabled, SaveMenuPostExtraMiscScreen.)
- **IDA pseudocode for ID** when callee-fingerprint is ambiguous: `mcp__ida__decompile` the JP addr,
  match its structure to a fe8u function. (StartEventWarpAnim_unused, Event14_BgmOverideRestore.)
- **JP region-diff signal — raw Shift-JIS string literal**: where US calls
  `GetStringFromIndex(msgId)`, JP often hardcodes a pointer to in-ROM Shift-JIS bytes (a `0x08…`
  addr). Bind that addr as a `data` alias and reference it (a UTF-8 string literal in the .c becomes
  SJIS via the build's iconv). (StartLinkArenaShowPointsAnimated, DebugChargeMenu_Draw 緑軍/赤軍/ＣＰ.)
- **JP-simplified variant**: JP frequently has a SHORTER version of a US function (drops cases /
  checks / a NECROMANCER branch). Read the JP disasm and keep ONLY the branches JP keeps; don't
  port the full US body. (BattleCheckSilencer.)
- **`int` vs `s16` local changes SCHEDULING, not only sign-ext**: choosing `int index` over
  `s16 index` made agbcc emit the `ldrsh` index load BEFORE the table-pointer load (matching JP). Try
  the type swap as a scheduling lever. (StartSpellAnimation.)
- **inline-made-standalone**: a US `static inline` (header) that JP emits out-of-line → port as a
  standalone non-inline function; inline any tiny helper it needs as `static inline` to avoid
  multiple-definition with an already-carved copy. (MapAddInBoundedRange, GetUnitRescueName.)
- **stale baseline alias**: a committed baseline alias may point at the WRONG address; the real
  function is elsewhere (`bl`/pool says so) — drop the stale alias, bind/define the real one.
  (GMapScreen: Sound_StopBgmImmediate alias 0x080B878A was stale; real def 0x08002A18.)
- **`_unused`/duplicate functions**: a fingerprint can match a function ALREADY carved at another
  addr (the "primary" copy). The unnamed one is the duplicate/`_unused` variant — carve it under the
  distinct US name (e.g. `MapAnim_PlayStealSe_Unused`), it is NOT a collision. Verify with
  `git ls-files` which name is taken.

## 6. Knowledge-sharing protocol (how this file stays current)
Every agent MUST, in its structured result, populate a `discovered_technique` field whenever it
finds a generalizable strategy (a new lever, an ID trick, a JP-divergence pattern, a wiring gotcha)
— a one-line rule + the function that proved it. The orchestrator harvests these after EACH workflow
and appends the novel ones to §5 here, so the NEXT cycle's agents start with them. (Without this,
discoveries die in per-function prose — the gap this protocol closes.)

## 7. agbcc asm-idiom → C dictionary (inverse compilation; verified against the binary)
Read the JP asm idiom, write the C that produces it. (Starter set — verified by compiling C through
tools/agbcc/bin/agbcc -O2; extend by mining fe8u's real .c↔agbcc-.s pairs.)
- `ldrb r,[b,#o]` (bare)                  → **u8** field/var.
- `ldrb r,[b,#o]; lsl#24; asr#24`         → **s8** field (sign-extended on read).
- `ldrh r,[b,#o]`                          → **u16** field.
- `mov rN,#o; ldrsh r,[b,rN]` (REGISTER-indexed, distinctive) → **s16** field. A `(s16)` cast on any
  memory read forces this signed register-indexed load; same with `ldrsb`+`(s8)`.
- `lsl#24; … add #0x01000000; … asr#24` (or lsl/asr#16 for shorts) → arithmetic on an **s8/s16 value
  KEPT narrow** (the "shifted-domain" op). Match by keeping the var `s8`/`s16` and operating directly;
  do NOT int-widen here. (int-widen is the OPPOSITE fix — for when JP sign-extends ONCE at entry.)
- `mov r1,#N; bl __divsi3` → `int / N`; `bl __udivsi3` → `unsigned / N`; `__modsi3`/`__umodsi3` → `%`.
  **agbcc never strength-reduces division** — every `/`,`%` by a non-pow2 is a libcall. (pow2: `>>`/`&`.)
- `… cmp #0; beq L; mov rX,#V; L:` with the OTHER value moved first → **ternary** `c ? V : other`
  (the "else" value is materialized first, the branch skips the override → drives branch polarity).
- `cmp #hi; bgt def; cmp #lo; blt def; lsl#1; …` → **dense switch** lowered to a bounds-check + jump
  table; a SPARSE switch lowers to a compare chain (`cmp #k; beq …`).
- `bl <name>` where name is a tiny veneer (`_call_via_rN`) → a **function-pointer call** through a LUT
  (`tbl[i](args)`); the LUT is data — bind it.

How to LEARN MORE from fe8u (the real corpus): fe8u is thousands of proven C→bytes functions. For a
JP idiom you don't recognize, `grep` fe8u/src for the C construct, compile that file's function with
this agbcc (or disassemble fe8u's `fireemblem8.elf` at the function and read its src/*.c), and read
off the asm↔C mapping. This is faster and surer than guessing.

## 8. Source map — where to look (use BEFORE writing C)
Matching is a *compiler* skill, so the corpus is every same-engine agbcc decomp + this compiler's
source. Ranked by usefulness for fe8j:
- **fe8u** (`../fireemblem8u`, US) — same exact agbcc → byte-level. Primary source for US-shared funcs.
- **fe6j** (`../fireemblem6j`, JP) — verified codegen-identical agbcc → **byte-level**. Primary JP source.
- **fe7j** (`../FireEmblem7J`, JP, MokhaLeee) — **VERIFIED codegen-identical (both `agbcc` and
  `old_agbcc`)** via the output test, despite building `pret/agbcc@master` vs fe8j's
  `StanHash@tpcs_frame` → **byte-level**. ~84 matched `.c`. Second primary JP source.
- **decomp.me harvested corpus** (`docs/refs/decompme_fe/`) — community-matched FE functions incl JP
  (`fe8_sub_*`, `fe7j_sub_*`, `func_fe6_*`). GREP THIS by name/`sub_<addr>` BEFORE reconstructing —
  someone may have already solved it. (agbcc build may differ → treat as a strong hint, re-verify.)
- **agbcc source** (`../fireemblem8u/.deps/agbcc/gcc`) — the deterministic-pass rules (§1).

**Output-equivalence test (run before trusting ANY source's bytes):** compile a probe through that
source's agbcc and through fe8j's, `diff` the emitted `.s`. Identical ⇒ byte-level (port directly,
then still re-verify against fe8j's `make compare`). Different ⇒ structure-only (adapt + re-match).
NEVER decide this from the binary's sha1 — two builds of the same source hash differently but emit
identical code (fe6j proved this). fe8u + fe6j + fe7j = ALL verified codegen-identical (fe7j: agbcc+old_agbcc).

**Router:** US-shared → fe8u. JP function → search decomp.me corpus + fe6j/fe7j for an analog → port
→ re-verify. No analog anywhere → §9 from-scratch.

## 9. From-scratch reconstruction (no analog in any corpus)
1. **Behavior**: `mcp__ida__decompile` the JP addr (+ read `asm/sub_<H>.s`). Identify struct field
   accesses, calls (named bl + fn-ptr LUTs), control flow, constants.
2. **Struct layout from asm**: each `ldr/ldrb/ldrh [base,#off]` is a field at byte `off`; a signed
   load (`ldrsh`/`ldrsb`, or `ldrb;lsl;asr`) ⇒ a *signed* field. Start from fe8u/fe6j headers; if an
   offset doesn't fit the known struct, the JP layout differs — derive it from the accesses.
3. **Write idiomatic C** using the §7 idiom dictionary so it lowers toward the target bytes (don't
   write "any correct C" — write the C whose codegen matches).
4. **Diff-refine** against the oracle; apply §1 levers. Byte-match ⇒ behavioral proof (identical bytes
   means identical behavior — you cannot be wrong about behavior once it matches).
5. **Name** per §0: meaningful name if you can infer logic/purpose (follow fe8u/fe6j/fe7j naming);
   else keep `sub_<addr>`. Never invent a misleading name when unsure.

## 0b. Naming policy (project directive)
Give a carved function a MEANINGFUL name only when you can infer its logic/usage/purpose (and match
the fe-family naming conventions). If unsure, keep `sub_<addr>` — a correct match under `sub_<addr>`
is better than a wrong name.
