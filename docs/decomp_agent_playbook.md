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

## 7b. Mined asm-idiom catalog (agent-verified by compiling through fe8j agbcc)

Each entry's `example` is real agbcc output. Read JP asm idiom → write the C construct.


### int-types

- **`cmp #0; bge L; add #(N-1); L: asr #log2(N)  — round-toward-zero bias branch, NOT a bare asr`** ⟸ signed int / N where N is a power of 2 >= 4 (e.g. x/4, x/8, yIn/8 as in worldmap_face.c)  
  _HIGH-VALUE near-miss: agbcc does NOT lower signed pow2 division to a plain asr (that is only correct for unsigned >>). It adds (N-1) when negative first. Writing `x>>2` instead of `x/4` for a SIGNED value mismatches. Unsigned x/N is `lsr #log2` (§7-consistent). For a s16/s8 value the operand is first sign-extended (lsl#16;asr#16) before this block._  
  `ex: cmp r0, #0 ;  bge .L15 ;  add r0, r0, #0x3 ; .L15: ;  asr r0, r0, #0x2`
- **`lsr rB,rX,#0x1f; add rX,rX,rB; asr rX,rX,#1  — uses the sign bit (>>31) as the +1 bias`** ⟸ signed int / 2 specifically (x/2 on s32)  
  _Division by exactly 2 uses a DIFFERENT bias idiom than /4,/8 (sign-bit add instead of cmp/bge/add #N-1). Distinguish the two when matching._  
  `ex: lsr r1, r0, #0x1f ;  add r0, r0, r1 ;  asr r0, r0, #0x1`
- **`cmp #0; bge L; add #(N-1); L: asr #log2; lsl #log2; sub  — full remainder sequence, NOT `& mask``** ⟸ signed int % N where N is a power of 2 (e.g. x % 8 on s32/s16)  
  _Trap: signed `x % 8` is NOT `and r,#7`. Only UNSIGNED `x % pow2` lowers to `and` (mov #mask; and). Use unsigned type or `& mask` if the JP shows a single `and`._  
  `ex: cmp r1, #0 ;  bge .L3 ;  add r0, r1, #0x7 ; .L3: ;  asr r0, r0, #0x3 ;  lsl r0, r0, #0x3 ;  sub r0, r1, r0`
- **`...compute...; lsl #(32-w); asr #(32-w)  for signed narrow  /  lsl #(32-w); lsr #(32-w)  for unsigned narrow — applied at the END`** ⟸ narrowing the RESULT of an int expression to s8/s16/u8/u16 (return type narrowing or assign to narrow var): `s16 f(int x){return x*3;}`  
  _Return-value / narrow-assignment truncation is a trailing lsl;asr (signed) or lsl;lsr (unsigned), w = type width (8->#24, 16->#16). A stray trailing lsl/asr pair at function exit = the return type is narrower than int. Match by giving the function/variable the exact narrow type._  
  `ex: lsl r0, r0, #0x18 ;  asr r0, r0, #0x18   @ s8 return ;  ... or ... ;  lsl r0, r0, #0x10 ;  lsr r0, r0, #0x10   @ u16 return`
- **`ldrb/ldrh; add #k; lsl #(32-w); asr/lsr #(32-w) — re-narrow AFTER the add (NOT the shifted-domain add form)`** ⟸ incrementing/arithmetic on a narrow field, result kept narrow: `t->b + 1` (s8), `t->c + 1` (u16)  
  _When a narrow field is loaded, modified, and the narrow result is the value used, agbcc adds in the natural domain then re-narrows with a trailing shift pair (asr=signed, lsr=unsigned). Different from the shifted-domain (lsl-first) form below._  
  `ex: ldrb r0, [r0, #0x1] ;  add r0, r0, #0x1 ;  lsl r0, r0, #0x18 ;  asr r0, r0, #0x18`
- **`lsl #(32-w); mov #M; lsl #S (materialize const<<(32-w)); add; asr #(32-w) — operates in the high-shifted domain`** ⟸ shifted-domain arithmetic on a s8/s16 value (assign-and-keep-narrow): `s8 x; x = x + 5; return x;`  
  _Refines the §7 `add #0x01000000` note: the add immediate is the constant shifted into the top byte/halfword (here +5 in s8-domain = 0x05000000, built as 0xa0<<0x13 since Thumb can't load it directly; +1 = 0x01000000). Two-instruction const materialization (mov;lsl) before the add is the tell. Match by keeping the var s8/s16 and writing `x = x + k;` (assignment form), not int-widening._  
  `ex: lsl r0, r0, #0x18 ;  mov r1, #0xa0 ;  lsl r1, r1, #0x13 ;  add r0, r0, r1 ;  asr r0, r0, #0x18`
- **`mov rN,#off; ldrsb r,[base,rN]  (REGISTER-indexed signed byte load) — distinct from the ldrb;lsl;asr read form`** ⟸ field read then arithmetic then store-back to same narrow field: `t->b = t->b * 2;` (s8 field)  
  _A signed byte field whose value feeds further arithmetic uses ldrsb with a register-index (mov #off into a reg first), mirroring the s16 `mov #off; ldrsh` form in §7. A bare s8 read that is only returned uses ldrb;lsl#24;asr#24 instead — the access CONTEXT picks the form._  
  `ex: mov r1, #0x0 ;  ldrsb r1, [r0, r1] ;  lsl r1, r1, #0x1 ;  strb r1, [r0]`
- **`mov rN,#off; ldrsh r,[b,rN]; mov rX,#1; neg rX,rX; cmp r,rX; b{eq|ne}  — builds -1 via mov #1;neg, sign-extends operand to full int`** ⟸ `(s16)field == -1` / `s16 == -1` direct compare (sentinel)  
  _The straightforward `== -1` materializes -1 as `mov #1; neg` and compares the sign-extended (ldrsh / lsl;asr) value. This is the default form; the alternative shifted-domain `lsls#16;cmp #0xFFFF0000` form (see memory) is a SEPARATE selectable lowering for some contexts — try both when a `==-1` near-misses._  
  `ex: ldrsh r1, [r0, r3] ;  mov r0, #0x1 ;  neg r0, r0 ;  cmp r1, r0 ;  bne .L3`
- **`ldrsh; mvn r,r; neg rT,r; orr r,rT,r; lsr r,#0x1f  — nonzero->1 trick after bitwise-NOT`** ⟸ boolean `s16/s8 != -1` returned as int (not in a branch)  
  _Branchless `(x != -1)` as a 0/1 value: invert (mvn turns -1 into 0), then the (neg|x)>>31 nonzero-test. Seeing mvn;neg;orr;lsr#31 = an `!= CONST` boolean, not arithmetic._  
  `ex: ldrsh r1, [r0, r2] ;  mvn r1, r1 ;  neg r0, r1 ;  orr r0, r0, r1 ;  lsr r0, r0, #0x1f`
- **`>=0: mvn r,r; lsr r,#0x1f   ;   <0: (sign-extend); lsr r,#0x1f`** ⟸ boolean sign tests: `s16field >= 0` and `s8field < 0` returned as int  
  _`x < 0` as bool = extract sign bit (>>31). `x >= 0` = invert then sign bit (mvn;lsr#31). Distinct from a cmp/branch; appears when the result is stored/returned as a 0/1 int._  
  `ex: ldrsh r0, [r0, r1] ;  mvn r0, r0 ;  lsr r0, r0, #0x1f    @ >=0 ;  @ vs <0: ;  lsl r0,r0,#24; asr r0,r0,#24 ;  lsr r0, r0, #0x1f`
- **`each operand lsl#24;lsr#24 (zero-extend) BEFORE add, then lsl#24;lsr#24 AFTER — triple narrowing`** ⟸ unsigned 8-bit wraparound arithmetic kept as u8: `u8 f(u8 x,u8 y){return x+y;}`  
  _u8+u8->u8 zero-extends BOTH operands and re-narrows the sum (vs signed which sign-extends). A cluster of lsl#24;lsr#24 around an add = u8 wrap arithmetic; keep types u8 to reproduce._  
  `ex: lsl r0,r0,#0x18 ;  lsr r0,r0,#0x18 ;  lsl r1,r1,#0x18 ;  lsr r1,r1,#0x18 ;  add r0,r0,r1 ;  lsl r0,r0,#0x18 ;  lsr r0,r0,#0x18`
- **`strength-reduced to lsl/add chains, e.g. *3 = lsl#1;add ; *320 = lsl#2;add;lsl#6 (i.e. (x*5)<<6)`** ⟸ integer multiply by a constant (NOT division): `x*3`, `x*320`  
  _Complement to §7's division rule: agbcc DOES strength-reduce CONSTANT multiplication to shift/add (no __mulsi3 for constants). A `mul` instruction appears only for variable*variable. So a shift/add ladder may be a `* const`, not hand bit-twiddling._  
  `ex: lsl r0, r1, #0x1 ;  add r0, r0, r1        @ x*3 ;  @ x*320: ;  lsl r0, r1, #0x2 ;  add r0, r0, r1 ;  lsl r0, r0, #0x6`
- **`the cast just selects the load width: (u8)t->f -> ldrb at the field offset; (u16)t->f -> ldrh; no extra shifts`** ⟸ `(u8)x` / `(u16)x` cast applied to a WIDER field/value (narrowing read width)  
  _Casting a 32-bit field to u8/u16 on read emits a narrower ldrb/ldrh at the SAME offset (little-endian low bytes) rather than ldr+mask. Useful for matching field reads where the JP uses a narrow load but the struct field is declared wide._  
  `ex: ldrb r0, [r0, #0xc]    @ (u8) of a u32/s32 field ;  ldrh r0, [r0, #0xc]    @ (u16) of same field`
- **`compute in int; strh/strb directly — the store truncates, NO narrowing shifts emitted`** ⟸ store an int expression into a narrow field: `s->v = a*b;` (s16/u16 field)  
  _Assigning a wider int result to a narrow field needs only strb/strh (truncation is free on store). If you see narrowing shifts BEFORE a strh, the value was also USED at narrow width elsewhere; a clean strh = store-only._  
  `ex: mul r1, r1, r2 ;  strh r1, [r0]`
- **`ldrh/ldrb; lsr #log2(BIT); and #1 (or mov#1;and) — shifts the tested bit down to position 0`** ⟸ `(field & BIT) != 0` boolean where BIT is a single high bit (e.g. f & 0x40)  
  _For a SINGLE-bit mask test returned as 0/1, agbcc shifts the bit to bit0 and masks #1, rather than `and #0x40`. Match with `(f & 0x40) != 0` / a 1-bit bitfield. A bare `and #mask` (no shift) means the masked value itself is used, not a 0/1 boolean._  
  `ex: ldrh r0, [r0] ;  lsr r0, r0, #0x6 ;  mov r1, #0x1 ;  and r0, r0, r1`

### arithmetic

- **`add r1,r0,#0; lsl r0,r1,#a; add/sub r0,r0,r1; [lsl r0,r0,#b] ...`** ⟸ x * <small const>  (strength-reduced, NOT the `mul` instruction)  
  _agbcc ALWAYS copies x into r1 first (`add r1,r0,#0`) then builds the product in r0 from shift+add/sub of r1. Decode: read off the shift amounts and add/sub to reconstruct the constant. Common: *3=(x<<1)+x, *5=(x<<2)+x, *6=((x<<1)+x)<<1, *7=(x<<3)-x, *9=(x<<3)+x, *10=((x<<2)+x)<<1, *12=((x<<1)+x)<<2, *15=(x<<4)-x, *17=(x<<4)+x, *24=((x<<1)+x)<<3, *40/*0x28=((x<<2)+x)<<3, *0x18=((x<<1)+x)<<3. SAME sequence for signed and unsigned x (e.g. umul3 == mul3). A common near-miss: writing `mul` in C when the constant strength-reduces — you can't force `mul` for these small constants._  
  `ex: mul3:  add r1,r0,#0 / lsl r0,r1,#0x1 / add r0,r0,r1 / bx lr      (x*3 = (x<<1)+x) ; mul7:  add r1,r0,#0 / lsl r0,r1,#0x3 / sub r0,r0,r1 / bx lr      (x*7 = (x<<`
- **`mov r1,#K; mul r0,r0,r1   (literal multiply, NO shift-add chain)`** ⟸ x * <const that needs >~3 shift-add ops>  e.g. *11, *13, *100  
  _agbcc falls back to `mov rN,#K; mul` only when the constant does NOT decompose cheaply (it strength-reduces up to ~5-instruction chains, e.g. mul21=((x<<2)+x)<<2+x is still shift-add). So `mov #K;mul` in JP = `x * K` where K is a 'hard' constant (11,13,100,...). If you see strength-reduction shift-add in JP but your C emits `mul`, you mismatched the constant's representability — keep `x * K` literal; agbcc picks the form by K, you can't choose._  
  `ex: mul100: mov r1,#0x64 / mul r0,r0,r1 / bx lr ; mul11:  mov r1,#0xb  / mul r0,r0,r1 / bx lr ; mul13:  mov r1,#0xd  / mul r0,r0,r1 / bx lr`
- **`lsr r1,r0,#0x1f; add r0,r0,r1; asr r0,r0,#0x1`** ⟸ int x / 2   (signed divide-by-2 only — distinct biasing form)  
  _MATCHING-CRITICAL near-miss: signed `x / 2` is THREE instructions (round-toward-zero bias: add sign bit then asr), NOT a single `asr`. It is NOT the same as `x >> 1` (which is a lone `asr r0,r0,#0x1`). If JP shows the 3-insn lsr#31/add/asr form, the source is `/ 2` on a signed int; if a bare `asr#1`, the source is `>> 1`. Do not interchange. /2 uses lsr#31 bias, but /4,/8,... use the cmp;bge;add form below (different!)._  
  `ex: div2s: lsr r1,r0,#0x1f / add r0,r0,r1 / asr r0,r0,#0x1 / bx lr`
- **`[push{lr}]; cmp r0,#0; bge L; add r0,r0,#(2^n - 1); L: asr r0,r0,#n; [pop]`** ⟸ int x / <pow2 >= 4>   (signed divide by 4,8,16,...)  
  _Signed `/4,/8,/16` use a cmp;bge;add #(2^n-1) round-toward-zero bias before the asr (NOT the lsr#31 trick that /2 uses, and NOT a bare asr). The added immediate is 2^n-1 (3,7,0xf,...) which directly reveals the divisor pow2. A bare `asr#n` with no bias = `x >> n`, NOT `x / 2^n` on a signed value. Force the cheap single-asr by casting the dividend `(unsigned)` or by writing `>>` when the value is known non-negative._  
  `ex: div4s:  cmp r0,#0 / bge .L4 / add r0,r0,#0x3 / .L4: asr r0,r0,#0x2 ; div8s:  cmp r0,#0 / bge .L6 / add r0,r0,#0x7 / .L6: asr r0,r0,#0x3 ; div16s: cmp r0,#0 / bg`
- **`lsr r0,r0,#n   (lone logical shift, no bias)`** ⟸ (unsigned)x / 2^n   OR   unsigned >> n  
  _Unsigned divide-by-pow2 is a single `lsr` (no bias sequence at all). USEFUL LEVER: if JP divides by a pow2 with a single `lsr`/`asr` but your signed C emits the multi-insn bias form, cast the dividend to unsigned (`(unsigned)x / 8`) or use `>>` — that collapses it to the lone shift agbcc emitted._  
  `ex: div8u:  lsr r0,r0,#0x3 / bx lr        (unsigned x / 8) ; posdiv: lsr r0,r0,#0x3 / bx lr        ((unsigned)x / 8 — the cast lever)`
- **`add r1,r0,#0; mov r0,#(2^n - 1); and r0,r0,r1`** ⟸ (unsigned)x % 2^n   (unsigned modulo by power of two)  
  _Unsigned `% pow2` lowers to a simple `and #(2^n-1)` — NOT a libcall. The masked immediate (7,0xf,...) is 2^n-1. This is indistinguishable in bytes from `x & 0xN` so source can be either `% 8` or `& 7` on unsigned; pick whichever reads cleaner. SIGNED `% pow2` is completely different (see below) — do not write `& mask` for a signed remainder._  
  `ex: mod8u: add r1,r0,#0 / mov r0,#0x7 / and r0,r0,r1 / bx lr`
- **`[cmp r0,#0; bge L; add #(2^n-1); L:] asr #n; lsl #n; sub r0_orig, shifted   (div-back-and-subtract)`** ⟸ int x % 2^n   (SIGNED modulo by power of two)  
  _Signed `% 2^n` is computed as `x - (x/2^n)*2^n`: it embeds the SAME signed-divide bias (cmp;bge;add for n>=2, or lsr#31 for n==1), then `asr#n; lsl#n; sub`. This long sequence (~6-7 insns) is a strong signal the source is a signed `%`, not an `&` mask. `-(x % 8)` just appends/reorders the final sub (negmod swaps operands of the sub)._  
  `ex: mod8s: add r1,r0,#0 / cmp r1,#0 / bge .L15 / add r0,r1,#0x7 / .L15: asr r0,r0,#0x3 / lsl r0,r0,#0x3 / sub r0,r1,r0 ; mod2s: lsr r1,r0,#0x1f / add r1,r0,r1 / asr`
- **`(strength-reduced multiply chain) feeding directly into `mov r1,#K; bl __divsi3``** ⟸ x * <const1> / <const2>   (the stat-scaling pattern a*b/c)  
  _Very common in FE stat math (`stat * 24 / MAX`). The numerator multiply strength-reduces (here *24 = ((x<<1)+x)<<3) and the result is moved to r0 then divided by the literal denominator via __divsi3. Reconstruct as a single C expression `x * 24 / 60`; agbcc fuses the multiply but the divide stays a libcall (it NEVER strength-reduces or magic-multiplies division — even unsigned /10 is `mov #0xa; bl __udivsi3`)._  
  `ex: statscale (x*24/60): lsl r1,r0,#0x1 / add r1,r1,r0 / lsl r1,r1,#0x3 / add r0,r1,#0 / mov r1,#0x3c / bl __divsi3`
- **`neg r0,r0  (alone, or after a strength-reduce chain)`** ⟸ x * -1  (=> neg);  x * -K => (strength-reduce |K|) then neg  
  _Negative-constant multiply = strength-reduce the absolute value, then a trailing `neg`. `x * -1` is just `neg r0,r0` (write `-x` or `x * -1`). A trailing lone `neg` after a multiply chain signals a negative multiplier, not a separate negation statement._  
  `ex: mulneg1: neg r0,r0 / bx lr            (x * -1) ; mulneg3: add r1,r0,#0 / lsl r0,r1,#0x1 / add r0,r0,r1 / neg r0,r0   (x * -3)`

### memory-structs

- **`Shift-add multiply chain `lsl rT,ri,#a; add rT,rT,ri; lsl rT,rT,#b` (and `sub` for K=2^n-1). agbcc NEVER uses `mul` for a constant — it synthesizes K from shifts/adds. Decode K from the chain: e.g. lsl#2;add = x5, lsl#3;sub = x7, lsl#3;add = x9, lsl#4;sub = x15, lsl#4;add = x17, lsl#1;add = x3. A trailing `lsl#m` then multiplies by 2^m (the int/word size). So `lsl#1;add;lsl#4` = (x*3)*16 = x*48; `lsl#2;add;lsl#3` = (x*5)*8 = x*40.`** ⟸ Array/struct index by a non-power-of-2 element size (or any `i*K` with non-pow2 K): `arr[i]` where sizeof(elem) is 3,5,6,7,9,...; equivalently `i*K`.  
  _HIGH near-miss yield. To MATCH: use the element size / multiplier that factors EXACTLY as JP's chain. If JP shows `lsl#1;add;lsl#4` your struct stride is 48 (3*16), not 32 or 64. Verified in real fe8u worldmap_path.s (`lsl#1;add;lsl#2` = x5 stride)._  
  `ex: lsl r1, r0, #0x2 ;  add r1, r1, r0 ;  lsl r1, r1, #0x2   @ A[i*5]: (i*4+i)*4`
- **`Index scale uses the PADDED size: a 3-char struct scales by `lsl#2` (4), a 3-short struct by `lsl#3` (8). If your C struct is mis-sized vs JP, the scale shift is wrong.`** ⟸ Array of a small struct: agbcc PADS the struct size up to a multiple of its alignment (4 for any int member; 2 for short-only; 1 only for all-char). `struct{char a,b,c;} arr[]` indexes as size 4, NOT 3.  
  _Common cause of a wrong scale shift. Confirm the struct's natural size/alignment matches what JP's index scale implies before blaming codegen._  
  `ex: lsl r0, r0, #0x2   @ struct{char a,b,c;} arr[i]  -> stride 4 (padded), not 3`
- **`Inlined block copy, NOT a memcpy call. EXACTLY 2 words: two `ldr` then two `str` (with agbcc's `@ created by thumb_load_double_from_address` comment). 3+ words: `ldmia rS!,{r2,r3,r4}; stmia rD!,{...}` in groups of THREE registers, remainder 1-2 words via a final `ldmia/stmia {r2,r3}` or single `ldr;str`. Needs `push {r4,lr}`/`pop` because it uses r4.`** ⟸ Small struct copy by value: `*dst = *src;` (struct assignment) — appears in real fe8u (bmsave-misc SetGlobalSaveInfoPtr/SetPlayStPtr).  
  _To match a JP function full of ldmia/stmia r!,{r2,r3,r4} pairs (often pushing r4), write `*dst = *src;`. Group size is fixed at 3 regs/iteration; the tail handles remainder. Confirmed in fe8u worldmap_path.s._  
  `ex: ldmia r1!, {r2, r3, r4} ;  stmia r0!, {r2, r3, r4} ;  ldr r1, [r1] ;  str r1, [r0]   @ 16-byte (4-word) struct copy`
- **``sub r0,r0,r1; asr r0,r0,#log2(size)` — byte difference arithmetic-shifted right by log2(elem size). (For non-pow2 element size it becomes a `bl __divsi3` instead.)`** ⟸ Typed pointer difference `a - b` (pointer arithmetic), element size a power of 2.  
  _An `asr #n` right after a `sub` of two pointers = ptrdiff by 2^n element size. Don't mistake it for a signed-field shift._  
  `ex: sub r0, r0, r1 ;  asr r0, r0, #0x4   @ (Unit*)a - (Unit*)b, sizeof(Unit)==16`
- **``ldr r,[base]; lsl r,r,#(32-P-W); lsr r,r,#(32-W)` — the lsl/lsr pair: lsl clears bits above the field, lsr right-justifies. lsr amount = 32-width; lsl amount = 32-pos-width. Uses `lsr` (unsigned). A SIGNED bitfield uses `asr` for the second shift instead.`** ⟸ Unsigned bitfield read `p->field` where field is `unsigned int :W` at bit position P (not byte-aligned).  
  _Distinct from §7's `(u32)x>>n` (single shift) and from sign-ext (`lsl;asr`). Solve P and W from the two shift amounts: W=32-lsr, P=32-lsl-W. A byte-aligned bitfield (`:8` at offset 0) instead reads as plain `ldrb` (+lsl/asr#24 if signed)._  
  `ex: ldr r0, [r0] ;  lsl r0, r0, #0x1c ;  lsr r0, r0, #0x1d   @ unsigned :3 at bit 1  (lsl 28, lsr 29)`
- **`Field fits in a byte: `lsl r1,r1,#P; ldrb r3,[r0]; mov r2,#MASK; and r2,r2,r3; orr r2,r2,r1; strb r2,[r0]` (immediate mask via `mov #imm`). Field spans >8 bits or higher word: pool-loaded literal masks — `ldr =fieldmask; and; lsl#P; ldr [base]; ldr =~(fieldmask<<P); and; orr; str` (two `.word` constants: the value mask and the inverted clear mask).`** ⟸ Bitfield write `p->field = v;` (read-modify-write). Two shapes by field width/position.  
  _A `ldrb;and #mask;orr;strb` (or `str` with two pooled masks) = a bitfield assignment, not a normal store. Setting a single bit to 1 (`p->a=1`) collapses to `ldrb;mov #bit;orr;strb` with no mask/lsl._  
  `ex: lsl r1, r1, #0x4 ;  ldrb r3, [r0] ;  mov r2, #0xf ;  and r2, r2, r3 ;  orr r2, r2, r1 ;  strb r2, [r0]   @ p->c = v, c is :4 at bit 4`
- **`Pure address arithmetic ending WITHOUT a ldr/str: `lsl r0,#scale; add r0,r0,base` (and for a struct array member the field offset folds into the INDEX register: `add ri,#fieldoff; add base,ri`). The absence of a final load is the tell — it's a pointer, not a dereference.`** ⟸ `&array[i]` / `&u->arr[i]` used as a value (returned or passed as a pointer) — address-of an indexed element, no load.  
  _When a struct-member-array element's address is taken, agbcc adds the member offset to the INDEX (`i + off`) then adds base, rather than `base+off` then `+i`. Matching `&arr[i]` requires emitting the address WITHOUT a trailing load — write it as `&` / pointer, not a read._  
  `ex: add r1, r1, #0x8 ;  add r0, r0, r1 ;  str r0, [r2]   @ *out = &u->arr[i]; (arr at offset 8: i folded as i+8)`
- **``add base,base,#fieldoff; add base,base,index` — the constant member offset is added to BASE as a separate `add #imm`, then the (already-scaled) index is added, then the load. Contrasts with §7 where a simple `[base,#off]` immediate-offset load is used for a scalar field.`** ⟸ Deep field offset folded into the base register when an indexed array member is accessed: `u->arr[i]` (array member at non-zero struct offset).  
  _For a scalar field agbcc uses `ldr/strb [base,#off]`; for an INDEXED member at a non-zero offset it splits into two adds (`+off`, `+index`) then a base-only load/store. Don't expect a single immediate-offset access for `struct.array[i]`._  
  `ex: add r0, r0, #0x8 ;  add r0, r0, r1 ;  strb r2, [r0]   @ u->arr[i] = v, arr at offset 8`

### control-flow

- **`cmp #(hi); bhi default; [sub #lo if start!=0;] lsl r,r,#2; ldr r1,=PtrToTable; add r,r,r1; ldr r,[r]; mov pc,r  — DOUBLE indirection: pool word points to the .word .Lcase[] table`** ⟸ switch with 5+ contiguous case values (dense)  
  _THRESHOLD verified: exactly >=5 distinct contiguous cases -> jump table; <=4 -> compare chain. A non-zero-based span emits a leading `sub r0,r0,#lo` to rebase to 0 before the `cmp #(hi-lo); bhi`. A span with a HOLE (e.g. cases 0,1,3,4) stays a compare chain even if it has 4 cases. Pool literal -> .word .Ltable is a 2-level indirection unique to agbcc._  
  `ex: cmp r0, #0x4 ; 	bhi .L19 ; 	lsl r0, r0, #0x2 ; 	ldr r1, .L22 ; 	add r0, r0, r1 ; 	ldr r0, [r0] ; 	mov pc, r0`
- **`BINARY-SEARCH compare chain, not linear: cmp #mid; beq case_mid; cmp #mid; bgt Lupper; (lower half) ...; Lupper: (upper half). Probes the median value first.`** ⟸ switch with <=4 cases OR sparse case values  
  _Non-obvious: agbcc bisects the case set (duplicate `cmp #mid` then `beq`+`bgt`), it is NOT a top-to-bottom linear scan. Matching a sparse switch requires writing the cases so the median lands where JP splits. Same for dense<=4._  
  `ex: cmp r0, #0x1 ; 	beq .L5 ; 	cmp r0, #0x1 ; 	bgt .L10 ; 	cmp r0, #0 ; 	beq .L4 ; 	b .L8 ; .L10: ; 	cmp r0, #0x2 ; 	beq .L6`
- **`NO loop guard; falls straight into body; bottom test is `cmp ri,#(N-1); ble .Lbody` — the literal is N-1, and counts UP from 0`** ⟸ for (i=0; i<N; i++) with CONSTANT bound N, i used as a value  
  _The compared immediate is bound-1 (i<10 -> cmp #9; ble). Constant-bound counted loop has NO entry guard (first iteration assumed). A runtime-bound `for`/`while(n>0)` DOES get a top `cmp;ble` guard before the body._  
  `ex: mov r4, #0x0 ; .L6: ; 	add r0, r4, #0 ; 	bl use ; 	add r4, r4, #0x1 ; 	cmp r4, #0x9 ; 	ble .L6`
- **`STRENGTH-REDUCED to a count-DOWN pointer walk: ldr base; mov ri,#(N-1); LOOP: ldmia base!,{r0}; ...; sub ri,#1; cmp ri,#0; bge LOOP — induction var counts DOWN, array accessed via auto-increment ldmia`** ⟸ for (i=0; i<N; i++) where i is used ONLY to index an array (sum/copy)  
  _HUGE near-miss source: source says `for(i=0;i<10;i++) s+=arr[i]` (counts up) but asm counts DOWN with ldmia! Triggers ONLY when the index is pure address arithmetic (i not otherwise used). If i is also passed/used as a value, it counts UP instead (no reduction). To match, keep the loop array-indexed._  
  `ex: ldr r3, .L14 ; 	mov r1, #0x9 ; .L12: ; 	ldmia r3!, {r0} ; 	add r2, r2, r0 ; 	sub r1, r1, #0x1 ; 	cmp r1, #0 ; 	bge .L12`
- **`ldmia rS!,{r0}; stmia rD!,{r0}; sub rN,#1; cmp rN,#0; bne LOOP — single-register load/store-multiple with writeback`** ⟸ do { *d++ = *s++; } while (--n);  (word block-copy)  
  _Canonical FE pointer-copy. agbcc uses ldmia/stmia (not ldr/str) for `*p++` in a do-while. The dest base is copied to a scratch reg first (`add r3,r0,#0`)._  
  `ex: ldmia r1!, {r0} ; 	stmia r3!, {r0} ; 	sub r2, r2, #0x1 ; 	cmp r2, #0 ; 	bne .L17`
- **`pre-subtract then compare against -1: sub rN,#1; mov rT,#1; neg rT,rT; cmp rN,rT; bne/beq — agbcc materializes -1 via mov #1;neg and compares the decremented counter to it`** ⟸ while (n--) ...  /  while (--size != -1)  (post-decrement loop exit)  
  _Verified against fe8u agb_sram.c `while(--size != -1)`. The `mov #1; neg` to synthesize -1 plus `cmp rN, (-1)` is the recognizable shape; do NOT rewrite as `while(n>0)` (different lowering)._  
  `ex: sub r1, r1, #0x1 ; 	mov r2, #0x1 ; 	neg r2, r2 ; 	cmp r1, r2 ; 	beq .L24`
- **`b .Ltest (skip over the increment); .Linc: add iv,#1; .Ltest: cmp...; b<cc> body; (fallthrough = exit). The increment block sits ABOVE the test label`** ⟸ for/while loop with a break, or while(n-- > 0): rotated (test-at-bottom-via-pre-jump) form  
  _Distinctive 'b .Ltest' jump at loop entry, with the increment label placed before the test. Appears for loops with an early break or a `n-- > 0` condition. Different layout from the simple bottom-test counted loop._  
  `ex: mov r4, #0x0 ; 	b .L33 ; .L35: ; 	add r4, r4, #0x1 ; .L33: ; 	cmp r4, r5 ; 	bge .L34 ; 	... ; 	bne .L35`
- **`signed >,>=,<,<= -> bgt/bge/blt/ble ; unsigned (u32/u8/u16 operands) > ,>=,<,<= -> bhi/bcs/bcc/bls`** ⟸ signed vs unsigned comparison in a branch  
  _Independent of the lsr/asr signedness rule. A bhi/bls where you emit bgt/ble (or vice-versa) = the operand's declared signedness is wrong. Fix by casting the compared operand to (u32)/(int) at the comparison site._  
  `ex: @ signed:  cmp r0, r1 ; bgt .L6 ; @ unsigned: cmp r0, r1 ; bhi .L3`
- **`FOLDED into ONE unsigned compare: cmp rx,#(N-1); bls in_range / bhi out  — the `>=0` and `<N` collapse to a single `bls #(N-1)``** ⟸ 0 <= x && x < N  (two-sided signed range check)  
  _Verified against fe8u bmlib.c `(ix >= 0 && ix < 0x20)`. Source has TWO comparisons joined by &&, asm has ONE unsigned branch. To match, write the canonical `x >= 0 && x < N`; a manual single `(u32)x < N` produces the same single bls (identical), so both forms match._  
  `ex: cmp r0, #0xf ; 	bls .L9   @ for (x >= 0 && x < 16)`
- **`BRANCHLESS: eor rT,a,b; neg r0,rT; orr r0,r0,rT; lsr r0,#0x1f  — no cmp, no branch`** ⟸ return a != b;  (not-equal yielded as int/bool)  
  _Very distinctive and easy to miss. `a!=b` as a VALUE (return/assignment/arith operand) compiles to eor/neg/orr/lsr#31. Contrast: `a==b` as a value uses `mov rT,#0; cmp; bne L; mov rT,#1`. Used in a branch CONDITION instead, `!=`/`==` just become bne/beq._  
  `ex: eor r2, r0, r1 ; 	neg r0, r2 ; 	orr r0, r0, r2 ; 	lsr r0, r0, #0x1f`
- **`materialize 0, conditionally set 1 with INVERTED branch: mov rT,#0; cmp a,b; b<!cond> L; mov rT,#1; L: -> ==uses bne, <uses bge, >uses ble (the skip uses the NEGATION of the C operator)`** ⟸ return a == b; / a < b; (comparison yielded as int via branch)  
  _The branch over the `mov #1` carries the inverse condition (< -> bge skip, == -> bne skip). Branch polarity here is fixed by agbcc; don't try to invert it by reordering._  
  `ex: mov r2, #0x0 ; 	cmp r0, r1 ; 	bge .L7   @ for (a < b) ; 	mov r2, #0x1`
- **`ELSE value materialized FIRST, branch skips the THEN override: (for max) operands copied via `add rX,rY,#0`; cmp r0,r2; bge L; add r0,r2,#0; L: — the larger-operand path is the fallthrough-skipped mov`** ⟸ c ? a : b  and  a>b?a:b (max) / a<b?a:b (min)  
  _Two specifics: (1) agbcc copies a low reg with `add rD,rS,#0`, NOT `mov rD,rS` — this `add ...,#0` move pervades all control flow and is a common spurious diff. (2) max/min swap the operands into r0/r2 then branch with the polarity of the test (> -> bge skip)._  
  `ex: add r2, r0, #0 ; 	add r0, r1, #0 ; 	cmp r0, r2 ; 	bge .L6   @ a>b?a:b ; 	add r0, r2, #0`
- **`FIRST operand branches to the TRUE/success label (bne/beq to L_true), LAST operand falls through to it: cmp a; bne Ltrue; cmp b; beq Lfalse; Ltrue: ... — asymmetric vs &&`** ⟸ if (a || b) ...  and  (x==A || x==B)  short-circuit OR  
  _OR: each non-final disjunct short-circuits to the success block; the final one branches to failure. Contrast `&&`: each non-final conjunct branches to the FAILURE label, final falls through to success (two `cmp;beq Lfalse`). Polarity is determined by which side the chain exits early to._  
  `ex: cmp r0, #0x3 ; 	beq .L25 ; 	cmp r0, #0x7 ; 	bne .L24 ; .L25:   @ (x==3 || x==7)`
- **`identical asm to a single &&: cmp r0,#0; beq Lfalse; cmp r1,#0; beq Lfalse; (body)`** ⟸ nested if (a) { if (b) {...} }  ==  if (a && b)  
  _Nested ifs with no else collapse to the && form bit-for-bit, so either source form matches. Useful when JP's structure is ambiguous — pick whichever reads cleaner._  
  `ex: cmp r0, #0 ; 	beq .L17 ; 	cmp r1, #0 ; 	beq .L17 ; 	mov r0, #0x7`
- **`mov rT,#MASK; and rT,rT,rflags; cmp rT,#0; beq skip  — agbcc loads the mask into a reg and ANDs (does not use tst)`** ⟸ if (flags & MASK) ...  (bit-test branch)  
  _agbcc emits `mov #mask; and; cmp #0; beq` rather than `tst`. For masks needing a pool literal (mask > 0xFF and not a shifted-immediate) it loads via `ldr rT,=mask` instead of `mov`._  
  `ex: mov r1, #0x40 ; 	and r1, r1, r0 ; 	cmp r1, #0 ; 	beq .L15`
- **`each arm computes a value into the SAME scratch reg, then a SINGLE bl after the merge: add r2,r1,#1; cmp c,#0; bne L; lsl r2,r1,#1; L: add r0,r2,#0; bl g`** ⟸ cross-jump / tail-merge of two branches into one shared call  
  _Confirms the playbook cross-jump lever with concrete asm: if both if/else arms end in the same call f(v) with v differing, write each arm to assign a COMMON local then call f(v) once — agbcc merges them to a single bl. If you emit two `bl g` it will NOT merge unless the tail SEQUENCES are textually identical._  
  `ex: add r2, r1, #0x1 ; 	cmp r0, #0 ; 	bne .L24 ; 	lsl r2, r1, #0x1 ; .L24: ; 	add r0, r2, #0 ; 	bl g`

### calls

- **`ldr rT,=tbl; lsl rI,#2; add rI,rT; ldr rP,[rI]; ...set r0-r3...; bl _call_via_rP`** ⟸ LUT function-pointer call tbl[i](args) — the index is scaled by lsl#2 and added to the table pool-ptr, the slot loaded, then dispatched via the _call_via_rN veneer (N = whichever reg holds the fn-ptr). §7 names the veneer but NOT this index-scale+pool-add materialization.  
  _Distinguishes a real tbl[i]() call from a plain bl. The .word at .L3 is the LUT base (bind it as data). Register N in _call_via_rN is non-deterministic scratch — do NOT force it; it falls out of agbcc's allocation. void variant uses _call_via_r0 when the ptr lands in r0._  
  `ex: ldr r3, .L3 ;  lsl r0, r0, #0x2 ;  add r0, r0, r3 ;  ldr r3, [r0] ;  bl _call_via_r3`
- **`...load fn-ptr into rP...; <args set in r0-r3>; bl _call_via_rP where the fn-ptr is materialized AFTER the arg registers`** ⟸ struct-field / variable fn-pointer call p->handler(a,b). The pointer (ldr [base,#off]) is loaded LAST, after r0..r3 args are placed; arg regs are filled via scratch-then-shuffle (add rN,rX,#0).  
  _If you place the ptr load first, you get a near-miss reorder diff. Match by writing the call so the callee-ptr expression is the call target (lowered last). bmshop.c gShopState->draw_line(...) is the real fe8u instance._  
  `ex: ldr r2, [r0, #0x4] ;  ldr r1, [r0, #0x8] ;  ldr r3, [r0] ;  add r0, r2, #0 ;  bl _call_via_r3`
- **`add sp,sp,#-K; <set r1-r3>; ldr r4,[sp,#orig]; str r4,[sp]; ldr r5,[sp,#orig2]; str r5,[sp,#4]; bl f; add sp,sp,#K`** ⟸ >4 args: 5th+ args go on the stack. agbcc reserves the outgoing frame (add sp,#-K, K = 4*(nargs-4) rounded), fills r0-r3 normally, then materializes stack args at [sp], [sp,#4]... For pass-through params it RE-LOADS them from the now-shifted incoming stack (offset += K).  
  _Critical: incoming caller-stack args get offset by +K after the sub-sp, so [sp,#0xc] for the 5th param of a fn that itself spilled. Computed/const stack args reuse ONE scratch reg (r4): add r4,r0,#5; str r4,[sp]; add r4,r0,#6; str r4,[sp,#4]._  
  `ex: add sp, sp, #-0x8 ;  ldr r4, [sp, #0x14] ;  ldr r5, [sp, #0x18] ;  str r4, [sp] ;  str r5, [sp, #0x4] ;  bl f6`
- **`bl g; lsl r0,#0x18; lsr r0,#0x18  (or asr for signed; #0x10 for 16-bit)`** ⟸ Narrowing a call's int return to u8/s8/u16/s16 at the use site: (u8)g(x)=lsl;lsr#24, (s8)=lsl;asr#24, (u16)=lsl;lsr#16, (s16)=lsl;asr#16. The shift pair appears AFTER the bl, on r0.  
  _A trailing lsl/lsr-or-asr pair right after a bl = the result is being cast/stored into a narrow type. If you omit the cast you lose the shift pair (near-miss). When stored to a field, strb/strh handles the narrowing INSTEAD (no shift pair): s->hp = g(a) => bl g; strb r0,[base]._  
  `ex: bl g ;  lsl r0, r0, #0x18 ;  lsr r0, r0, #0x18`
- **`bl g; cmp r0,#0; bne L; mov rX,#0; b E; L: mov rX,#1; E:  (or the !g form with operands swapped)`** ⟸ Call result coerced to strict 0/1: `if (g(x)) return 1; return 0;` or `cond = g(x) != 0`. `!g(x)` swaps the materialized constants (mov #1 in the fall-through, mov #0 after bne).  
  _Distinct from using the raw return in a condition (which just does cmp;bne with NO 0/1 materialization). The two-mov diamond means the boolean is being VALUE-ized. !g(x) uses the compact `mov r1,#0; cmp;bne L; mov r1,#1; L: add r0,r1,#0` shape (no branch-over for the 0)._  
  `ex: bl g ;  cmp r0, #0 ;  bne .L7 ;  mov r0, #0x0 ;  b .L8 ; .L7: ;  mov r0, #0x1`
- **`interwork tail: push {lr}; bl f; pop {r1}; bx r1  (value/tail) OR pop {r0}; bx r0 (void)`** ⟸ Return-the-call `return f(x);` and void tail `f(x);` (last stmt) under -mthumb-interwork. agbcc pops lr into a SCRATCH reg and bx's it — it does NOT use `pop {pc}`. Value-returning picks r1 (r0 holds the result); void picks r0.  
  _This interwork epilogue is everywhere and is a common transcription slip. The scratch reg = lowest free: r1 when r0 is the live return value, r0 when nothing is live (void). With pushed callee-saves: pop {r4,r5}; pop {r1}; bx r1 (the lr pop is a SEPARATE pop into scratch)._  
  `ex: bl g ;  pop {r1} ;  bx r1`
- **`add r4,arg,#0 (before a bl) ... add r0,r4,#0 (after)  — register-to-register via add #0`** ⟸ A value needed AFTER a call is saved into a callee-saved reg (r4/r5/r6, pushed in prologue) before the bl, then restored. agbcc's reg-to-reg MOVE is `add rD,rS,#0`, never `mov rD,rS` for lo regs.  
  _Caller-saved scratch (r0-r3) cannot survive a bl, so any var live across a call is forced into r4+. Allocation order is by FIRST-USE: earliest-needed-across-call var → r4, next → r5. Reordering source decls shifts which value gets r4 vs r5 (a scheduling lever for near-misses)._  
  `ex: add r4, r1, #0 ;  bl g ;  add r0, r0, r4`
- **`args left-to-right but reg writes high-to-low: add r2,x,#0; add r1,r2,#0; bl h  (for h(x,x,x))`** ⟸ Passing one value to multiple arg slots, or args where later regs are computed first: agbcc writes the HIGHEST arg register first then copies DOWN. f(x,x,x): sets r2 from x, then r1 from r2, r0 already x.  
  _Counter-intuitive ordering — the duplicate-arg shuffle fills r2 then chains r1<-r2 rather than both from r0. Getting the chain source wrong (r1 from r0 vs from r2) is a near-miss. For distinct computed args it's left-to-right into r1,r2,r3._  
  `ex: add r2, r0, #0 ;  add r1, r2, #0 ;  bl h`
- **`args needing memory loads are each fully recomputed inline at the call (no CSE of the address base across args)`** ⟸ h(arr[i], arr[i+1], arr[i+2]): each subscript is re-lowered (recompute index, lsl#2, add base, ldr) per arg; agbcc keeps only the table BASE in a reg (r2) and recomputes index*4+base for each.  
  _agbcc does CSE the pool-loaded table address (r2) but NOT the scaled index — expect repeated lsl#2;add;ldr per element. The first loaded element parks in a high scratch (r3) and is shuffled to r0 last (add r0,r3,#0) because r0 is the arg-eval scratch._  
  `ex: ldr r2, .L3 ;  lsl r1, r0, #0x2 ;  add r1, r1, r2 ;  ldr r3, [r1] ;  add r1, r0, #0x1 ;  lsl r1, r1, #0x2`
- **`bl f; <result lands in r0>; bl g  with an earlier arg saved in r4 and reloaded into r1 between the two bls`** ⟸ Chained call g2(g(x), x): x saved to r4 before the inner bl g, inner result stays in r0 (= arg0 of g2), then r4→r1 (= arg1) just before bl g2 — no add r0,..,#0 needed since the inner return is already in r0.  
  _When an inner call's result is the FIRST arg of the outer call, agbcc leaves it in r0 (zero shuffle) and only materializes the other args. If the inner result were a LATER arg it'd be moved to r4 across nothing — recognizing this saves you from inserting a phantom move._  
  `ex: add r4, r0, #0 ;  bl g ;  add r1, r4, #0 ;  bl g2`
- **`ldr r0,=0xIMM32; bl f  (constant in literal pool) vs mov r0,#N; neg r0,r0; bl f (small negative)`** ⟸ A 32-bit const arg that exceeds the mov #imm8 range loads from a .word pool literal; a small negative arg (-1,-5) is `mov r0,#abs; neg r0,r0` NOT a pool load.  
  _agbcc's threshold: 0..255 → mov #imm8; -255..-1 → mov+neg; anything else → pool .word. A `ldr rN,=const; bl` arg means the source constant doesn't fit imm8 — read the pool word for the exact JP value (often a JP-specific id/coord). Don't expect mov;lsl synthesis for arg constants — it's pool or neg._  
  `ex: ldr r0, .L5 ;  bl hc ; ... ; .L5: ;  .word 0x12345678`

### agbcc-regalloc

- **`pop {r4,r5,...}; pop {rN}; bx rN  (split pop, return through a popped scratch reg, NOT pop {...,pc})`** ⟸ Any non-leaf function compiled -mthumb-interwork (the whole fe8j game). This is the standard interwork epilogue — agbcc never folds lr into the callee-saved pop; it does a separate `pop {rN}` (rN = lowest free scratch, usually r0/r1/r3) then `bx rN`. If your candidate emits `pop {...,pc}` you are matching a non-interwork (libc) TU or wrong flags; game TUs ALWAYS split. Mirror image: the high-reg block is restored BETWEEN the two pops.  
  _Matching-relevant: pop{...,pc} vs split-pop+bx is a whole-function-shape diff. Game functions = split; pick the right corpus. The scratch reg picked for bx is the first free low reg._  
  `ex: pop	{r4, r5, r6} ; pop	{r0} ; bx	r0    @ real ADJUSTFROMXI_MoveCameraOnSomeUnit.o (also _dtoa_r libc uses pop{...,pc} — that one is non-interwork)`
- **`push {r4,r5,r6,r7,lr}; mov r7,sl; mov r6,r9; mov r5,r8; push {r5,r6,r7}  (prologue saving r8/r9/r10 via low regs)`** ⟸ A function whose live-range pressure across calls exceeds the 4 low callee-saved regs (r4-r7). agbcc spills incoming/preserved values into HIGH callee-saved r8,r9,sl(=r10) — but Thumb push can't list high regs, so it copies them DOWN into r5,r6,r7 first then pushes. Restore mirrors: `pop {r3,r4,r5}; mov r8,r3; mov r9,r4; mov sl,r5`. To match: reduce/increase the number of simultaneously-live call-crossing locals so the same set of high regs is needed.  
  _Verified byte-identical against real JP ROM (_dtoa_r). The number of high regs saved {r8},{r8,r9},{r8,r9,sl} is a direct readout of call-crossing live count beyond 4._  
  `ex: push	{r4, r5, r6, r7, lr} ; mov	r7, sl ; mov	r6, r9 ; mov	r5, r8 ; push	{r5, r6, r7}    @ verbatim in real JP _dtoa_r.o and my probe`
- **`add rDst, rSrc, #0   (used as a register-to-register MOVE between two LOW regs)`** ⟸ Any plain copy `x = y;` / argument shuffle / result capture where both regs are r0-r7. agbcc 2.95 emits `add rd,rs,#0` (encoding 1c..) for low-low moves, NOT `mov rd,rs`. It only uses real `mov` (encoding 46..) when a HIGH reg (r8-r12/sl) is involved. Seeing `mov r0, sl` vs `add r0, r4, #0` tells you whether the source is a high or low reg.  
  _Confirmed in real JP bytes. A near-miss where you emit `mov` but JP has `add #0` (or vice-versa) means your value landed in a high vs low reg — a regalloc-pressure or live-range cue, not a different operation._  
  `ex: adds	r1, r2, #0   @ 1c11, real _dtoa_r.o (capturing/shuffling a low reg) ; mov	r0, sl       @ 4650, real _dtoa_r.o (high reg involved)`
- **`Incoming args preserved across a call land in r4,r5,r6 in LEFT-TO-RIGHT ARGUMENT ORDER (a->r4, b->r5, c->r6), claiming low callee-saved BEFORE any call results`** ⟸ Parameters used after a call: `use2(a,b); return a+b+c;` — a,b,c each get a fixed low callee-saved reg by parameter order, assigned in the prologue (`add r4,r0,#0; add r5,r1,#0; add r6,r2,#0`). Call RESULTS that must survive a later call get the NEXT free reg after the preserved args. This is the mechanism behind the declaration/first-use-order lever: an incoming param that is preserved outranks (gets a lower reg than) a value produced later.  
  _To shift a value from r5 to r4 (the classic 'JP uses r4, I use r5' diff): make it the earlier preserved param / introduce it earlier in the live range, or pin. Reordering the two source statements that produce them swaps r4<->r5._  
  `ex: push	{r4, r5, r6, lr} ; add	r4, r0, #0 ; add	r5, r1, #0 ; add	r6, r2, #0 ; bl	use2    @ probe_args_preserved`
- **`Register class exhaustion order, then stack spill: r0-r3 (scratch) -> r4,r5,r6,r7 (low saved) -> r8,r9,sl (high saved) -> add sp,#-N; str rX,[sp]`** ⟸ More simultaneously-live values than 4+3=7 callee-saved regs. agbcc only spills to the stack (`add sp,sp,#-N` + `str/ldr [sp,#off]`) AFTER it has used all of r4-r7 and r8/r9/sl. Outgoing args beyond the first 4 also go via `add sp,#-N; str rX,[sp,#off]`; incoming args 5+ are read with `ldr rX,[sp,#0x2c+]` (offset = 0x18 base for a 5-low-reg + 3-high push, plus 4*argN).  
  _If JP spills to stack but your C keeps everything in regs (or vice-versa), your live-set size differs — fold/split a temp to cross the 7-saved threshold. The incoming-stack-arg ldr offset encodes the exact push mask, so it pins the prologue shape._  
  `ex: push	{r5, r6, r7} ; add	sp, sp, #-0x4 ; mov	r9, r3 ; str	r4, [sp]    @ probe_spill: spills only after r4-r7 + r8/r9/sl taken`
- **`register int x asm("rN");  pins x to rN AND can alter the push mask (e.g. push {r5,lr} skipping r4)`** ⟸ Explicit hard-register pin. Use as a LAST resort for a clean register permutation. agbcc honors the pin and will push exactly the saved regs it actually uses — pinning to r5 while r4 is unused yields `push {r5,lr}` (r4 absent), which itself changes the push encoding. May also insert extra shuffle `add rd,rs,#0` if the pinned reg conflicts with the arg/return ABI reg at a call boundary.  
  _Prefer int-local-widen and statement/declaration ORDER first (they nudge regalloc for free without touching the mask). A pin that changes which low regs are saved will diff the push/pop bytes; verify the full mask, not just the body._  
  `ex: probe_pin: ; push	{r5, lr} ; bl	p ; add	r5, r0, #0   @ x pinned to r5, r4 NOT pushed`
- **`Counting loop reversed to count-down: sum in a low saved reg, bound copied to another, body ends `subs rN,#1; cmp rN,#0; bne` with a post-increment `ldmia rPtr!,{r0}` element load`** ⟸ `for(i=0;i<n;i++) sum+=f(arr[i]);` where i is NOT otherwise used. agbcc transforms it to a down-counter: `n` is copied to a saved reg and decremented, the accumulator `sum` takes the next saved reg, and the array walk becomes `ldmia rPtr!,{r0}` (pointer auto-increment) instead of indexed addressing. If your C uses the index value inside the loop, agbcc CANNOT down-count and keeps an explicit `i` + indexed load — a different shape.  
  _Matching cue: if JP has `ldmia rN!,{...}` + countdown but you emit indexed `ldr [base,idx]`, drop any in-loop use of the index (walk a pointer instead) so agbcc reverses the loop and matches the saved-reg assignment._  
  `ex: mov	r5, #0x0          @ sum in r5 ; add	r4, r0, #0        @ countdown of n in r4 ; .L7: ; ldmia	r6!, {r0}        @ post-inc element load ; bl	f ; add	r5, r5, r0`
