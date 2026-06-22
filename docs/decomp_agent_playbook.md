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
