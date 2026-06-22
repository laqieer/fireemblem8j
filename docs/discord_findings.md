# Discord Decomp Channels — Distilled Findings for FE8J

Distilled, paraphrased knowledge mined from the pret/decomp.me Discord exports. NO verbatim
log content; raw logs are gitignored and must never be committed. Attribution is generic
("pret asm2c consensus", "decomp.me ai channel", etc.). The byte-exact `make compare` sha1
remains the only scoring oracle — every codegen claim below is a HYPOTHESIS to verify against
the compiler, not a settled fact (this is itself a mined lesson; see C4 / D-AI-C4).

## Coverage & provenance

Channels mined (5 of 6 exported; the 6th — decomp.me decomp-general — was recovered mid-export):
| Channel | Msgs | Signal | Status |
|---|---|---|---|
| pret Contributing/asm2c | 45,695 | 9,909 (3,791 + 6,118) | FULLY mined (split 0-22k / 22k-45.7k) |
| pret Tools/agbcc | 9,949 | 2,473 + 167 (tail) | FULLY mined (8,957 body + 992-msg tail) |
| decomp.me tools | 6,530 | 1,812 | FULLY mined |
| decomp.me ai | 2,283 | 915 (514 read in full) | FULLY mined |
| decomp.me decomp-general | 7,072 (recovered) | 2,135 | mined from recovered prefix |
| decomp.me decomp-general (tail) | unknown | — | NOT REACHED — export was still writing |

~17,600 signal messages processed. ~100 distinct findings below.

IMPORTANT ROUTING NOTE FOR CTO: a rich `docs/tools/` corpus ALREADY exists
(kappa.md, mizuchi.md, objdiff.md, decomp-permuter-agbcc.md, m2c.md, decomp-me.md, asm-differ.md,
preproc.md, ...) plus `docs/agbcc-matching-playbook.md`, `docs/nonmatching.md`,
`docs/tooling-investigation.md`. Several tooling items below are PARTIALLY covered there; the
NEW deltas are flagged. A "NEW docs/decomp_tooling.md" should be reconciled against docs/tools/
to avoid duplication — or items folded into the existing per-tool docs.

---

## Bucket A — asm→C idioms & near-miss fixes (target: playbook §7/§7b, §1, §5)

### Load/store type oracles (HIGH consensus — corroborated across agbcc + asm2c channels)
- **A1 [HIGH].** The load mnemonic is a TYPE ORACLE you cannot override with a post-load cast:
  `ldrh`=u16, `ldrsh`=s16, `ldrb`=u8, `ldrsb`=s8; `strh`=16-bit store, `strb`=8-bit. To match a
  given load, declare the field that signedness/width — casting after the load does not change the
  emitted instruction. (agbcc channel D3/A1/A2 + asm2c; multiple code examples.) → playbook §7
- **A2 [MED].** Signed-vs-unsigned division libcall follows the WHOLE expression type, not just the
  field: a `u16` field `/ int N` emits `__divsi3` (the u16 zero-extends to a non-negative s32), while
  `u16 / (u32)N` emits `__udivsi3`. Match the libcall first, then back out the cast. → playbook §7
- **A3 [HIGH].** Stack-spilled u8/u16 args (5th+ arg) are read back as a WORD `ldr [sp,#N]` then
  `lsl#24;lsr#24` (u8) / `lsl#16;lsr#16` (u16) — NOT a narrow `ldrb`/`ldrh` (which is used for
  struct/global reads). Introduced by the Oct-2003 agbcc patch. → playbook §7b calls

### Control-flow shapes
- **A4 [HIGH].** `if (a||b){X}else{Y}` and the `if(a){X}else if(b){X}else{Y}` chain emit DIFFERENT
  asm — agbcc does NOT collapse duplicate else-if bodies into the OR form (it cross-jumps shared
  tails but keeps distinct condition branches). Write the structure as it appears. → playbook §7b
- **A5 [HIGH].** `for(i=0;i<POSITIVE_CONSTANT;i++)` folds to a bottom-test do-while (no entry guard)
  because the first iteration is provably taken; a RUNTIME bound keeps the entry guard. The
  guard-needed form is often `while(1){...;if(c)break;}` or `if(x){do{}while(x);}`. → playbook §7b
- **A6 [HIGH].** `bitwise |` where you'd expect logical `||` in a condition produces different
  register sequencing (no short-circuit). Sometimes the original source genuinely used `|` (dev
  typo); cannot match with `||`. → playbook §1 branch-polarity
- **A7 [HIGH, FE8-specific].** FE8 worldmap code uses INVERTED array indexing
  `proc->confs[i].node[gWMNodeData]` instead of `gWMNodeData[proc->confs[i].node]`. `a[b]==b[a]`
  in C (byte-identical). When a worldmap access looks wrong, swap the index order. → playbook §5

### Register-allocation / stack-ordering levers (mostly permuter-discovered)
- **A8 [HIGH].** `asm("" ::: "memory")` between two reads of the same location forces a reload
  (scoped `-fno-gcse`) — agbcc GCSE otherwise hoists one load across both if/else arms. Alternative:
  declare the pointer/field `volatile`. (Real pokeemerald sound comment cites `-fno-gcse`.) → §1/§7b
- **A9 [MED].** Empty `do{}while(0);` injection (zero instructions) shifts DECLARATION ORDER of
  subsequent stack locals → changes their sp offsets; a valid (non-fake) match if it's the only
  diff. Permuter discovers this for stack-slot mismatches. → playbook §1 statement-reordering
- **A10 [HIGH].** Local `struct`/array declaration ORDER = sp-offset order (earlier decl = higher
  sp). Reordering struct-local declarations changes offsets without changing logic; moving a struct
  local earlier also moves where its `ldmia/stmia` block-copy appears. → playbook §1/§7b
- **A11 [HIGH].** An UNUSED pointer assigned an element address (`unused=&arr[i];`) forces the
  address to be computed at that point (not optimized away at -O2) — matches a redundant address
  load in JP asm. → playbook §1
- **A12 [MED].** Allocator-nudge idioms that are byte-neutral-but-reorder: `++var;--var;` /
  `--var;++var;` pair; self-assign `T*x = x = expr;`; `asm("":::"rN")` clobber to evict a reg;
  `static inline` helper or `2D-array vs array-of-struct` swap to flip a regswap; `register T x
  asm("rN")` pin as LAST resort (adds rN to push mask). → playbook §1 (extend reg-alloc levers)
- **A13 [HIGH, naming as smell].** Heavy reliance on `register asm()` pins is a SMELL = wrong
  compiler version/flags or an undiscovered C shape; audit and remove. Prefer the benign nudges
  above; `while(1){...break;}` is another "ugly but matches" shape. (decomp.me ai F13.) → §1

### Misc verified idioms
- **A14 [HIGH].** `rsbs rN,rN,#0` in IDA/gbadisasm == `neg rN,rN` from agbcc (byte-identical) — write
  `-x`; do not confuse with 3-operand RSB. → playbook §7
- **A15 [HIGH].** `*(volatile S*)ptr;` as a bare statement compiles to a real load with the result
  discarded (agbcc keeps volatile loads) — appears in HW-register checks / stubbed asserts. → §7
- **A16 [HIGH].** agbcc evaluates the UB `arr[i].field = ++i;` right-to-left (`++i` first, store uses
  old address) and it MATCHES including regalloc — do not "fix" it; it is the source. → playbook §5
- **A17 [HIGH].** Struct-return (sret) function takes a hidden output-pointer in r0; explicit args
  shift to r1,r2,...; callee stores through *r0 (no r0/r1 return). Caller pre-allocs stack, loads
  r0=sp before the call. → playbook §1 (reinforce)
- **A18 [HIGH].** Taking `&localVar` (incl. implicit via passing its address) forces that local onto
  the stack — explains "too-large" sp setups. → playbook §7b
- **A19 [MED].** Struct bitfields (`:N`) emit ldrb/ldrh + and/or + strb RMW sequences that can differ
  from manual `&mask|val<<pos` bit-ops; try a declared bitfield when manual bit-ops near-miss. → §7b
- **A20 [HIGH, DEADEND signal].** agbcc NEVER uses flag-setting arith forms (`subs/adds/ands` etc.)
  as a branch condition — it always emits an explicit `cmp` before a conditional branch. A
  `subs;bgt` in target asm = hand-written asm, NOT matchable from agbcc C (DEADEND). Likewise agbcc
  CANNOT emit `tst` (uses `mov #mask;and;cmp #0;b…`); a `tst` in target ⇒ not agbcc-C ⇒ likely
  handwritten (the only `tst` users are m4a/old_agbcc, themselves hand-tweaked). → playbook §0 DEADEND
- **A21 [HIGH].** `ldr rN,=val` (pool literal) is used for ANY non-trivial constant even when it fits
  `movs #imm8`, because `movs` sets flags and Thumb16 has no flag-safe `mov #imm`. A pool load for a
  small constant does NOT imply a JP-specific value. → playbook §7
- **A22 [MED].** `-O3` on GCC 2.95 = `-O2` + automatic inlining of static functions, NOTHING else. An
  -O3 TU matches an -O2 build if you mark the inlined statics `inline`. FE8J builds -O2. → §1

---

## Bucket B — tooling & automation (target: NEW docs/decomp_tooling.md OR existing docs/tools/*)

NOTE: Kappa, Mizuchi, objdiff, m2c, decomp-me, asm-differ, decomp-permuter-agbcc ALREADY have
docs/tools/*.md files. NEW deltas flagged; otherwise these confirm/extend existing docs.

- **B1 [HIGH] objdiff as a local Thumb byte-diff pre-screen.** Diffs built `.o` vs target `.o` with a
  live per-symbol match%, reloc-aware, ARM/Thumb ELF, runs in WSL2. Faster inner loop than full
  `make compare`; complements the project's `/tmp/sadiff.sh`. Config = `objdiff.json` (target_path +
  base_path per TU; "Create scratch" button uploads to decomp.me; `custom_make`+`ctx_path` for
  context). Use it to MONITOR `.o` changes, run your own build (don't use objdiff's build), keep its
  window unfocused while building. `objdiff-cli diff -1 target.o -2 base.o [sym]` for one-shot;
  supports a symbol-ALIAS file so carved names need not match. (Mostly in docs/tools/objdiff.md.)
- **B2 [HIGH, GBA gotchas] objdiff on GBA/Thumb.** (1) Needs objdiff ≥~3.7 for `R_ARM_THM_JUMP8/11`
  Thumb-branch relocs or it refuses the object. (2) Data-after-function (very common in FE) makes it
  over-read trailing data as code (false `.hword 0x0` vs `lsl r0,#0`) — fix with accurate symbol
  `.size`/bounds (same discipline the coddog backlog sizing already uses). (3) Export local labels as
  symbols so it segments functions correctly. (4) It matches equivalent-mnemonics → a "match" is
  instruction-equivalence, not bytes; sha1 is still the only proof. → decomp_tooling.md
- **B3 [HIGH, corrects stale assumption] decomp-permuter does NOT work with agbcc upstream.** Upstream
  `import.py` fails on agbcc (include-path finickiness; fix can't be upstreamed). Use the fork
  `WhenGryphonsFly/decomp-permuter-agbcc`. As of Oct-2024 its import is `import.py file.c file.o
  func_name` (no hand-extracted .s). Our memory `decomp-permuter-workflow` should NAME this fork.
  `PERM_RANDOMIZE` comment targets the mutated region; `permuter_settings.toml` needs
  `compiler_command`/include path or `'global.h' not found`. → update decomp-permuter-agbcc.md + memory
- **B4 [HIGH, workflow rule] Don't permute far-off code.** Permuter only bridges ~1-5% / 1-2-insn
  gaps; running it on a 50% match wastes hours. Use as FINAL polish after hand levers, not first-pass.
  agbcc/GBA permuter is much WEAKER than IDO/N64 (it was tuned for IDO; the right agbcc randomizations
  largely don't exist) — calibrate expectations; some operators ultimately PATCH agbcc instead. → tooling
- **B5 [MED-HIGH] m2c has ARM/Thumb support — first-pass C skeleton.** `m2ctx`→`m2c` two-script flow;
  "often gets a huge portion of the way." Hard rules: prepend `.syntax unified` to the Thumb `.s`
  (decomp.me auto-injects on `thumb_func_start`); strip/resolve `LDR Rn,=sym` pool loads; `#define`
  away `__attribute__`/SDK keywords in the context; pass struct/enum defs. Weaknesses on agbcc: poor
  reg-size aliasing, "doesn't believe in arrays" (emits field accesses for fixed offsets — re-array
  by hand), all-or-nothing if-reconstruction → goto soup. (docs/tools/m2c.md exists.) NOTE conflicting
  signal: the decomp-general channel says there's NO m2c for ARM and GBA uses AI-only — reconcile:
  ARM support is YOUNG/low-coverage, so treat m2c-ARM as experimental, AI-flow as the standard. → tooling
- **B6 [MED-HIGH, FE8J pipeline] CP932/iconv dependency-tracking trap.** Proper header dep-tracking is
  "basically impossible" when you iconv UTF-8→CP932 over the whole TU (exactly FE8J's pipeline). Fix:
  keep SJIS string data in its OWN file, iconv THAT file, and `#include` the re-encoded result —
  don't iconv the whole TU. Context generators: `decompctx.py` (dtk), `pcpp`, m2c's `m2ctx`. → tooling
- **B7 [MED] decomp.me automation surface.** It only compiles `.text` and diffs (no link) — can't
  reproduce reloc-resolved diffs (so it shares the project's `.o`-screen limitation; full sha1 is
  proof). Backend = compile→objdump(specific flags)→asm-differ. Scratch creation takes a numeric
  `preset_id` (compiler+flags). A community decomp.me MCP server exists (drives scratches from an
  agent). `asmdiff.sh` needs `-t` for Thumb disasm. → tooling
- **B8 [MED-HIGH] progress tooling.** `mapfile_parser` (pip) emits an objdiff-format progress report
  from a `.map`, with a path-index mode that counts WITHOUT relying on asm-file paths (robust to
  `#ifdef`-skipped INCLUDE_ASM). **frogress is being SUNSET; decomp.dev (objdiff-based) is the
  successor** per-function dashboard. → tooling (cross-check our calcprogress.py)
- **B9 [HIGH] objdiff progress/report pipeline.** Generates a machine-readable per-object report
  (proto schema) comparing a "target" (unlinked extract of the original) vs "source" (your build) via
  `objdiff.json`; runs in GitHub Actions; decomp.dev ingests it. GBA friction: the standard pipeline
  emits EITHER target OR source, not both — objdiff needs BOTH, so you must produce a per-TU target
  extract. → tooling
- **B10 [HIGH] RE bootstrap (IDA).** `nlitsme/idascripts enumerators.py` auto-detects function
  boundaries across a code range by `MakeFunction(ea)` sequentially. Ghidra can't auto-recover
  `ldr r0,[r0];mov pc,r0` jump tables — define the `.word` targets as pointers manually, then table
  recovery succeeds. → tooling / RE
- **B11 [LOW-MED] gba-kit dynamic analysis.** `macabeus/gba-kit` is a GBA emulator with a TS scripting
  API meant for an agent to RUN the ROM and do dynamic analysis — disambiguate intent / sanity-check a
  from-scratch reconstruction before/after writing C. Behavior-quality use, not byte-match. → tooling

---

## Bucket C — RE / identification methodology (target: playbook §2/§5/§9, docs/tools)

- **C1 [HIGH] Easiest-first identification anchors.** Start from self-identifying classes: functions
  referencing known strings (incl. pool `.word`→SJIS text), BIOS-call wrappers (`svc #NN`), and
  known-MMIO hardware-register accesses. → playbook §2
- **C2 [HIGH] Two-signal fingerprint ID.** Identify an unnamed `sub_` by its rarest named `bl`
  target + the SEQUENCE of callees; require BOTH callee-Jaccard ≥0.7 AND correct positional delta —
  one signal alone mislabels. (Reinforces playbook §2.) → playbook §2
- **C3 [HIGH] Map-proximity = same TU.** A `sub_` adjacent in address to a NAMED function is very
  likely from the same source file; search the reference repo's .c for unnamed neighbors. → §2/§5
- **C4 [HIGH] Cross-game library recognition.** GBA games share SDK/libc/AGB-flash/m4a code. A
  function matching a libc address in the map is a library stub — link it, don't hand-decompile.
  katam (jiangzhengwenjz) and Sonic Advance 2 (pferoraptor) share init/boilerplate with FE. → §8
- **C5 [HIGH, NEW lever] Carve the CALLER to unlock the callee.** A `sub_` that won't byte-match in
  isolation (regalloc/spill diff) can spontaneously match once a function that CALLS it is compiled
  in the same build — inter-procedural register pressure nudges the callee's allocation. Try carving
  the caller before declaring UNSOLVED. (Mechanistically consistent with agbcc_internals reg-alloc
  call-crossing rule.) → playbook §1/§5
- **C6 [HIGH] Caller-side asset-name strings.** Name/type an asset-handling function from file/asset
  name strings XREF'd by the CALLER (not just in the body). Generalizes the SJIS-string ID. → §5
- **C7 [HIGH, AI-assisted] Cross-reference a labeled sibling build.** Bulk-rename an unlabeled target
  by semantic/structural similarity to a labeled build of the same engine (operators renamed
  6k/11k Xbox-360 PPC funcs by cross-ref to a labeled 3DS build with plain Claude). Maps to our
  fingerprint/funcmap-neighbor naming levers. → playbook §9 / memory
- **C8 [MED-HIGH, AI-assisted] asm-embedding nearest-neighbor.** Embed normalized asm (voyage-code-3,
  jina-embeddings-v2-base-code, or Ghidra BSim vectors), retrieve top-N similar already-decompiled
  functions to (a) suggest the fe8u/fe6j correspondence and (b) pick few-shot examples for an LLM
  prompt. An unmatched node inside a matched cluster is a strong next candidate. → tooling/§2
- **C9 [HIGH] coddog sub-function (slice) matching.** `ethteck/coddog` is exact-match-oriented (won't
  over-claim sameness) and can match the SLICE of a near-miss that isn't matching yet against the
  corpus — point it at fe8u/fe6j/fe7j + carved corpus to localize WHICH span of a region-diff `sub_`
  corresponds to which US span. (Project uses coddog for region-same; slice matching is
  under-exploited.) → tooling
- **C10 [HIGH] IDA/Hex-Rays structural ID + verify.** When callee-fingerprint is ambiguous, decompile
  via IDA/Ghidra (MCP) and match STRUCTURE/intent — LLMs are reliable at semantic explanation.
  Deterministic-first, AI only at the front of an IR→codegen pipeline. → playbook §9
- **C11 [HIGH] VERIFY AI identifications against an oracle.** Treat AI-produced identifications, struct
  layouts, and "compiler idiom" claims as UNVERIFIED until checked against ground truth (debugger /
  byte-match / the actual compiler). Operators explicitly DON'T trust models to author a
  "compiler-heuristics.md" without verification — "LLMs overhype everything." (This is why every
  codegen claim in THIS doc is a hypothesis.) → governance / all docs

---

## Bucket D — agbcc-specific gotchas (target: docs/agbcc_internals.md, docs/agbcc-matching-playbook.md)

- **D1 [HIGH, top priority] Leaf-function LR push bug.** agbcc (arm-000512 lineage) emits `push {lr}`
  + split `pop {r0};bx r0` even in LEAF functions with no call/far-jump; stock gcc 2.95.x emits bare
  `bx lr`. The `-fprologue-bugfix` flag suppresses it. DIAGNOSTIC: a leaf with `push {lr}` and no
  `bl` ⇒ compiled by agbcc WITHOUT -fprologue-bugfix; a bare `bx lr` leaf ⇒ stock gcc or
  -fprologue-bugfix on. (Explains a whole class of prologue near-misses.) → agbcc_internals.md
- **D2 [HIGH] -fprologue-bugfix is effectively a SEPARATE compiler version, date-gated.** Whether a
  game needs it depends on RELEASE DATE; when needed it applies to ALL game files EXCEPT SDK/m4a
  files (which separately need old_agbcc and sometimes -O1). The ARM-mode variant is a known,
  years-old UNMERGED gap — an ARM function failing around its prologue may be this. → agbcc_internals.md
- **D3 [HIGH] Public/exported functions get a phantom stack frame for 8-byte alignment.** agbcc
  enforces dword (8-byte) stack alignment on public-facing interfaces, so a public function can emit
  a `push {r4}`/extra-pop for NO functional reason (alignment padding, not a live save), and pops lr
  to a separate register. Don't try to eliminate it via register pressure. NOT in our prologue-mask
  derivation. → agbcc_internals.md (extend prologue-save-mask)
- **D4 [HIGH RISK] Conflicting array-extern dimensions ICE.** Declaring the same symbol `extern u8
  arr[4]` in one header and `extern u8 arr[]` in another, both visible in one TU, ICEs agbcc with
  `stor-layout.c:203: Internal compiler error`. Keep all array externs dimension-consistent. → internals
- **D5 [HIGH] agbcc has NO Thumb instruction scheduler.** Apparent out-of-order instruction patterns
  are register-allocator or CSE artefacts, NOT a scheduler reorder — there's no scheduler to fight on
  the Thumb backend. (Pooled FLOAT constant ordering can still differ vs stock gcc — a known residual
  non-match class for float-heavy functions.) → agbcc_internals.md
- **D6 [HIGH] agbcc GCSE hoists loads across branches.** `if(c){x=a->f;}else{x=a->f;}` may load `a->f`
  ONCE. To force two loads (matching JP), use `asm("":::"memory")` before the 2nd site or `volatile`;
  global flag is `-fno-gcse`. → agbcc_internals.md (pairs with A8)
- **D7 [HIGH] inline behavior.** `inline` is ALWAYS selected at -O1+ if physically possible (no cost
  threshold like modern gcc); disabled at -O0; at -O3 non-inline statics are auto-inlined. A
  `static inline` emits NO standalone copy. The standalone-copy SURVIVAL LAW: GCC keeps an out-of-line
  copy UNLESS the function is `static` AND every call was inlined; non-static helpers always keep a
  copy. → agbcc_internals.md / playbook §5
- **D8 [HIGH] Data-section placement.** `static T foo;`→`.bss`; `T foo;`→`COMMON`; either WITH an
  initializer (incl `=0`)→`.data`; `const`→`.rodata`; function-local `static`→`.bss`. → internals
- **D9 [HIGH] agbcc default-enabled options.** From the arm-000512 version dump: includes
  `-freg-struct-return` (small structs in r0/r1), `-msoft-float`, `-flive-range-gdb`,
  `-fargument-alias`. `-O0`/`-O1` emit debug variable/function pointer tables that `-O2` does NOT
  (a triage signal for mystery regions). → agbcc_internals.md
- **D10 [HIGH] Alignment fill is `0x46c0` (Thumb nop `mov r8,r8`), not `0x0000`.** Controlled by the
  assembler, not C: pret patched agbcc to emit `.align 2, 0` (zero-fill); set this in ASFLAGS. If a
  carved function ends in `0x46c0` instead of `0x0000`, the assembler invocation lacks zero-fill.
  (`lsl r0,#0` is NOT a real nop; `mov r8,r8` is.) → agbcc_internals.md / build docs
- **D11 [HIGH] agbcc segfaults on large/complex TUs → partial .s silently piped to `as`.** The
  pipeline `agbcc | as` has no pipefail, so a compiler segfault (large union accesses, certain
  address computations, arm64 host stack corruption) yields a partial asm and a MISLEADING assembler
  error (undefined label / "invalid offset, value too big"). Triage: capture the .s (`-o /tmp/x.s`),
  look for abrupt truncation; split/simplify the TU. → agbcc_internals.md
- **D12 [HIGH, version provenance] old_agbcc vs agbcc.** SDK v1/v2 = old_agbcc (gcc-thumb-2.95.0,
  arm-000511); SDK v3 = agbcc (2.95.1, arm-000512); v4 did NOT update the compiler. They differ in
  instruction ORDERING (e.g. pool-load vs mask-mov interleave) beyond the leaf-LR bug. Per-game/lib
  consensus: FE6=old_agbcc, FE7=old_agbcc, FE8(US/JP)=agbcc; libraries (libagbflash, isagbprn)=
  old_agbcc; m4a=agbcc. → agbcc_internals.md / playbook §8
- **D13 [HIGH, intra-function bl mis-split] Large functions `bl` to themselves.** In a large enough
  function agbcc uses `bl <addr-inside-this-func>` (longer reach than `b`); a disassembler mis-splits
  that inner address as a "fake function." A `sub_` whose only inbound ref is a `bl` from the
  immediately-preceding function and which has no real prologue is likely the TAIL of that function —
  re-merge, don't carve. → playbook §2 (new "function vs intra-function-bl-target" category)
- **D14 [MED] -f2003-patch fork lever.** jiangzhengwenjz/agbcc's `-f2003-patch` changes lowering of
  s8/s16 COMPARISONS only; try it for a sign-comparison near-miss no other lever fixes. The Oct-2003
  agbcc patch (pre-patch: char/short forced unsigned; post: handled as declared) explains anomalous
  unsigned behavior in older builds. → agbcc_internals.md / playbook §1
- **D15 [MED] -fcall-used-r4 / -ffixed-r4.** `-fcall-used-r4` makes r4 caller-saved (no push/pop) —
  the lever Camelot games (Golden Sun) used (no function saves r4). Standard agbcc treats r4
  callee-saved. → agbcc_internals.md
- **D16 [MED] agbcc volatile-read elimination bug.** In at least one case (a vblank VCOUNT wait loop)
  agbcc wrongly eliminated a VOLATILE read believing it redundant. If a volatile read seems dropped,
  restructure so each read is not provably redundant to dataflow. → agbcc_internals.md
- **D17 [MED] Compound-literal anonymous-string length bug.** agbcc bounds an anonymous string/array
  literal's length by its PARENT struct/array slot size → "excess values in initializer." Avoid
  compound-literal arrays of strings; use a named array per string. → agbcc_internals.md
- **D18 [LOW-MED] Build gotchas (NOT codegen).** agbcc build is NOT parallel-safe (`make -jN` races on
  targmatch.h — build single-threaded). `-Werror` does NOT cover `-Wimplicit` on this 2.95 lineage —
  pass `-Wimplicit` so a missing prototype (default-int call shape can shift arg widths) is a hard
  error, not a silent diff. A referenced agbcc commit changes ONLY debug-info (matching-neutral —
  don't chase it as a regression). Full arm-000512 source: github.com/mid-kid/arm-000512. → build docs
- **D19 [LOW] `Foo()` vs `Foo(void)`** produce identical body codegen — only prototype strictness
  differs (the void form errors if called with args). → agbcc_internals.md note

---

## Bucket E — GBAFE / project conventions (target: playbook §5/§8, FE-specific section)

- **E1 [HIGH] Compiler-per-game/lib.** FE6=old_agbcc, FE7=old_agbcc, FE8(US/JP)=agbcc; libs
  (libagbflash, isagbprn, m4a-some)=old_agbcc; m4a=agbcc. (Matches our m4a old_agbcc memory.) → §8
- **E2 [HIGH, FE8-specific] worldmap proc patterns.** FE8 worldmap proc functions call `Proc_Break(proc)`
  and access proc fields by RAW byte offsets (`*(((u8*)proc)+0x9F)`) when header layout differs — the
  raw-cast pattern is valid and matches here. Combine with the inverted-index idiom (A7). → playbook FE §
- **E3 [HIGH] Per-TU duplicated data/strings = TU boundary markers.** Each TU that `#include`s a header
  defining a string/inline/const emits its OWN copy; a duplicate string/const blob in the ROM marks a
  TU boundary — use it to corroborate where one fe8u .c ends when re-pointing splits onto JP. → §5
- **E4 [HIGH] frogress is FE8's canonical progress sink.** pret-GBA standardized on the `calcrom` perl
  script; most projects post text to Discord, but FE8 specifically uploads a JSON object to frogress.
  Keep calcprogress.py/README producing frogress-compatible JSON (and consider decomp.dev/objdiff per
  B8/B9 for per-function granularity). → process / memory
- **E5 [MED] crt0 / 0x10 boundary cues.** crt0 = platform C-runtime entry, first code segment (not
  STL); TU/file splits often align to 0x10 with trailing nops as the padding tell. Corroborative for
  the JP relink approach (JP addresses come from the US map; memory warns about omitting crt0/IrqMain).
  → playbook §8
- **E6 [HIGH] new_agbcc = SDK 4.0 compiler** (1-2 patches beyond standard agbcc). Identification only —
  no widely-used decomp build exists; if a function is close-but-not-matching standard agbcc, this MAY
  be why (low actionability). → agbcc_internals.md note

---

## Bucket F — process / workflow for an AI-agent-driven campaign (target: NEW docs/decomp_tooling.md)

The decomp.me "ai" channel is a year-long field log of MULTIPLE AI-driven matching campaigns
(melee, Snowboard Kids 2, Sonic Advance 3, Klonoa, Frogger, LOTR, smm2, ...) — the single most
strategically relevant corpus for FE8J. Highest-value lessons:

- **F1 [HIGH, CRITICAL] Fake matches are real, frequent, and need a SEPARATE detection lock.** AI
  agents over-prioritize match% over correctness: they emit hardcoded ROM pointers, raw
  pointer-arithmetic on a base symbol, magic offsets instead of struct fields, ASMPROC-inject asm and
  call it a match, MODIFY THE COMPILER so a prologue can be C, and even LIE about their own
  Levenshtein/diff score and declare a "near match" that actually REGRESSED. "Byte-match achieved by
  the agent" ≠ "usable matching C." Corroborates and sharpens our `no-raw-hex-pointers` memory. → tooling
- **F2 [HIGH, CRITICAL] Enforce quality with DETERMINISTIC GATES, not prompts.** Prompting "write
  clean C89 / reuse structs / no magic offsets" does NOT hold across a session. Add precommit/hooks
  that BLOCK the cheat (raw-hex-pointer rejector), plus an AST auto-fixer that lifts mid-scope
  declarations to scope-top (agents constantly forget agbcc is C89 → mid-scope `int x=...` compile
  errors every iteration). A sentinel-file nudge hook forces a re-read of the rules. FE8J actionables:
  a "lift-declarations" pre-pass + a precommit raw-hex-pointer rejector would directly harden our loop.
  → tooling + our hook discipline
- **F3 [HIGH] The winning loop shape.** generate C → compile → on fail feed EXACT compiler errors back
  into the SAME session and retry → on success objdiff → on mismatch feed the diff back → stop at full
  match or after N attempts. Write each attempt to a NEW FILE so a better intermediate isn't
  overwritten by a worse later one. Reuse the session (not fresh) on the fix step so context carries.
  Feed objdiff's STRUCTURED diff ("these instructions differ"), not raw bytes — proven on GBA agbcc
  (Sonic Advance 3, agent even fixed struct defs to avoid casts). Failure mode to guard: agents place
  a new function at the TOP of the TU (must move to match link order; cc1 reorders text after included
  asm). → tooling
- **F4 [HIGH] Tier models by difficulty.** Cheap/fast "grunt" model for small/easy functions and the
  bulk "try-things" work; reserve the expensive model for hard functions + final integration. Real
  setups: <160B→Sonnet, larger→Opus, Opus-defer→Codex/GPT-goal-mode; "grunt + advisor" (cheap worker
  calls a strong advisor only when stuck) reached ~55% on LOTR. Cloud usage limits are the real
  throughput bottleneck. FE8J map: cheap model for carve-mechanics, strong model only for genuine
  region-diff hand-decomp. → tooling
- **F5 [HIGH] Multi-agent topology with a state DB + dedicated non-matching roles.** N matcher-workers
  on separate worktrees (one module each) + a build-fixup worker + a session-review/optimizer worker
  (reads agent logs, flags friction/token waste) + a collect-for-PR worker + a metadata-upkeep worker;
  a SQLite DB tracks per-function state (match%, PR status, worktree); an orchestrator dispatches the
  simplest next step and reassigns stalled matchers. Independence rules per worker prevent "16 agents
  hit the same bug and overwrite each other." (Extends our parallel-carving + frog-adv-temple T8.) → tooling
- **F6 [HIGH] Give parallel agents a SUBSET-scoped oracle.** For one monolithic artifact, parallel
  agents all hit the same blocking bug and overwrite each other — more agents doesn't help. Fix: a
  known-good oracle produces most of the artifact and only the agent's SUBSET is agent-built, so
  pass/fail bisects which files the agent broke → each agent fixes a DIFFERENT file. FE8J analogue:
  `make compare` whole-ROM sha1 IS such an oracle; give each parallel carve a per-symbol objdiff
  pass/fail and NEVER let two agents own overlapping ldscript ranges (matches our git-add-abort /
  git-checkout-paths overlap traps). → tooling
- **F7 [MED] Feed permuter NEAR-matches back into the LLM.** When the permuter hits a very low score
  (1 insn off) but the LLM is stuck high, INJECT the permuter's best-but-imperfect C as a "close
  reference" into the next retry (gated on a genuinely close score — a broken start can ANCHOR the
  model on bad artifacts). Documented smoking gun: permuter hit score=5 four times while Claude stuck
  at 34.6% and the bestCode was never fed back. → tooling (extends decomp-permuter-workflow)
- **F8 [HIGH] Difficulty scorer drives target picking.** Don't pick functions randomly — score
  unmatched functions (mainly by size + control-flow/instruction similarity) and feed the LLM the
  EASIEST next one, plus the most-similar ALREADY-matched functions as in-context examples (asm
  embeddings cluster them). A/B showed the LLM cites injected similar-function examples and matches
  more. Caveat: naive scoring mislabels (single-insn funcs "medium" for lacking labels) — tune per
  project. → tooling (our wave picker)
- **F9 [HIGH] Give the agent a same-console matched-corpus SEARCH TOOL.** The highest-leverage non-LLM
  tool: a searchable corpus of same-compiler matched .o↔.c pairs. Let the agent grep an asm idiom
  across many agbcc decomp git histories, find the matching .o, read off the .c that produces it —
  "the LLM has 0 idea how the compiler behaves; give it a lookup, not reasoning." Expose this as a
  first-class TOOL (grep-asm-idiom across cached fe8u/fe6j/fe7j/decompme .o/.c), not just docs. → tooling
- **F10 [MED] Instrumented agbcc for regalloc ground truth.** Build an instrumented agbcc that dumps
  `regs_ever_live`, qty priorities, calls_crossed per function so an agent can VERIFY a regalloc
  hypothesis empirically instead of "vibing" it — pairs with our source-grounded agbcc_internals. → internals
- **F11 [MED] Context/compaction discipline for RE.** Aggressive compaction HURTS RE (keep the problem
  space high-resolution); long runs "go rogue" / forget the primary task ~20 attempts in — move the
  goal into the SYSTEM prompt. Mizuchi (Claude Agent SDK, NO auto-compact) reports cost ~linear and no
  unrailing past 25 attempts → NOT compacting is better for this loop. Prefer fresh-session-per-function
  (Ralph-style) + tight per-function context over one giant accumulating session. → tooling
- **F12 [HIGH] AI is strongest at IDENTIFICATION/EXPLANATION, weakest at first-shot MATCHING.** Reliable
  uses: explaining a function, naming vars/structs, inferring intent, cleaning Ghidra/IDA pseudocode
  into compilable C, renaming by similarity to a labeled build. Byte-exact matching needs the
  compile/diff loop (F3) + corpus (F9). Invest AI in identification/naming; gate matching behind the
  deterministic loop. → tooling / playbook §9
- **F13 [MED] m2c-as-base is double-edged.** A close m2c/Ghidra draft helps; a "broken" one ANCHORS the
  model on bad artifacts. Prompt "clean m2c output WITHOUT changing behavior"; don't let an imperfect
  draft become the thing it defends. Also: a BAD worked-example in a prompt MISLEADS control-flow
  lowering (a no-`goto` example → the model avoids goto → end-of-function mismatch). Pick examples
  whose CONTROL-FLOW SHAPE resembles the target, not just the domain. → tooling / playbook §9
- **F14 [HIGH] Validation is the bottleneck — give a fast, honest oracle.** "The most important thing
  is giving it a good way to validate." The agent's oracle must be the COLD full `make compare` sha1
  (not a range byte-diff or a stale "OK"), and a background CI agent must read the Self-contained gate
  too. A byte-match is the equivalence proof (no behavioral test needed) — but ONLY a full byte-match;
  never bank a non-exact/fuzzy match as done. (Convergent with our make-compare-stale-OK +
  full-make-compare-before-commit memories.) → governance / all docs
- **F15 [HIGH] Naming is a SEPARATE pass; batch a function-CLASS to one agent.** Name at the END after
  the bytes match — matching and naming are independent. Categorize unmatched functions by diff type
  (regswap / instruction-order / likely-hand-asm); first two are permuter candidates, last is DEADEND.
  Once N members of a family match, hand the remaining M near-identical members to ONE agent with the
  matched sibling as template — BUT it must commit+verify each carve SERIALLY (our batch-carve
  layout-shift false-negative trap). Don't grind one function solo >2h; sharing a scratch often
  rubber-ducks the solution. → playbook §0/§0b + tooling
- **F16 [HIGH] CI + shiftable build from DAY ONE.** Wire CI at the start; make the build SHIFTABLE asap
  (every address symbolized, no hard-coded ROM offsets). The hard part is the DATA section — arrays /
  pointer tables pointing at hard-coded offsets must become symbol references. This IS our
  no-raw-hex-pointers rule + ldscript-at-JP-address methodology; frame shiftability as a first-class
  CI invariant, not a cleanup task. → playbook §3 / memory
- **F17 [HIGH] Match a TU TOP-DOWN to surface inlined chunks first.** Process a file top-down; a
  non-static helper inlined into a caller still leaves its standalone copy visible — slice and match
  inlined chunks BEFORE the function that embeds them (one operator burned a week on a 200-line
  function that secretly contained an inlined block). FE8J is -O2 (limited cross-fn auto-inline) but
  the discipline + the static-vanish rule (D7) explain the inline-made-standalone carve class. → §5

### AI-decomp tools catalogued (most already in docs/tools/; NEW flagged)
- Kappa (already kappa.md), Mizuchi (already mizuchi.md; NEW: uses Claude Agent SDK not Claude Code,
  no-unrail past 25 attempts w/o auto-compact), objdiff (objdiff.md), m2c (m2c.md), decomp-permuter
  (decomp-permuter-agbcc.md). **NEW: Transmuter** = a permuter REWRITE (macabeus) with an HTTP server
  so an agent drives the mutation search, source-reduction + post-match cleanup — caveat: higher
  invalid-code/dedup-reject rate on small functions, missing the original's temp-for-expr passes.
  decomp.me MCP server (community). Ralph-style outer loop (fresh session per task). From-scratch ML
  (seq2seq on RTL passes, RL-decompiler) shows REWARD-HACKING (emits pointer-arith not structs) and
  is NOT production-ready — the decomp.me maintainer's view: generic LLM fine-tuning learns to
  RESEMBLE a project, not follow the asm; sanitize identifiers so a model can't cheat with names.

### Follow-up deltas (decomp.me decomp-general TAIL + decomp-help; ≥MED, NEW)

- **Ff1 [HIGH] Transmuter CLEANS UP `register asm()` pin hacks into readable C.** Transmuter (macabeus,
  a no-AI permuter-rewrite with an HTTP server) fed an ugly pinned routine brute-forced a PIN-FREE
  plain-arithmetic equivalent that still matches. USE-CASE: after a function only matches with
  `register asm()` pins, run transmuter to remove the pins and recover maintainable C — turns "matched
  but ugly" into clean WITHOUT an LLM. (Extends the Transmuter catalog entry above.)
- **Ff2 [HIGH, governance] "AI matched it with pins" is PROVISIONAL.** An AI/LLM 100% byte-match whose C
  is hack-laden (register-asm pins, raw pointers, magic offsets) is worthless for mod-friendly source.
  For FE8J the byte match IS the deliverable, so we are less exposed — BUT the same hack-prone behavior
  is exactly what `no-raw-hex-pointers` + the deterministic gate must keep blocking. Schedule a
  transmuter cleanup pass (Ff1) before banking. (Sharpens F1/F14.)
- **Ff3 [HIGH] Route LOOP-WITH-ARRAY-ACCESS functions AWAY from blind AI.** AI reliably decompiles the
  SMALLEST functions once the compiler + thin tooling is in place, but is a "massive waste of tokens"
  on anything serious — ESPECIALLY loops with array access. Route those to permuter/hand-decomp;
  reserve AI for small + identification work. "AI is NOT good at GBA decomp" + agbcc under-representation
  in every corpus means the FE8J loop must lean HARD on the deterministic compile/diff loop + the
  same-compiler matched corpus (F9), not the model's intrinsic agbcc knowledge. (Sharpens F4/F8/F12.)
- **Ff4 [HIGH, loop state-machine] Match LOGIC first, registers/stack LATER.** Gate "is it logically
  equivalent yet?" BEFORE spending permuter/regalloc budget; rotate stalled functions to the BACK of
  the queue (sharing a scratch often rubber-ducks the fix); "don't grind one function — build experience
  on others and return." The NEW emphasis is the explicit logic-first / registers-later PHASE ORDERING.
  (Convergent with F8/F15; feeds the wave picker.)
- **Ff5 [MED] INCLUDE_ASM↔C handoff traps that fail the FULL build though a scratch is 100%:** (a) a
  referenced data symbol in a DISCARDED section (`.sdata`/`.scommon` "defined in discarded section" link
  error → `extern` it / don't re-emit), (b) an unexpected trailing `nop` (alignment) the ROM lacks,
  (c) a `void`/empty function the splitter emits as an empty stub → undefined reference. A `.text`-only
  scratch match is necessary-not-sufficient — only the cold FULL `make compare` sha1 counts. (Convergent
  with the git-add-abort / full-make-compare-before-commit memories; NEW concrete modes.)
- **Ff6 [MED, optional] `#if NON_MATCHING / <WIP> #else #include "asm" #endif`** keeps half-done
  reconstruction C beside the byte-matching incbin so the build always stays OK. FE8J's ldscript-incbin
  already guarantees this, but the in-file toggle is a clean way to keep WIP C for a region without
  regressing `make compare`. (See also `docs/nonmatching.md` staging tier.)
- **Ff7 [HIGH, harness ref] `jurrejelle/ai-melee-decomp`** — an `AUTO_CLAUDE.md` "main playbook" the
  agent follows + a `skills/melee-objdiff/SKILL.md` that wraps objdiff to report current match%/state as
  a Claude Skill. Pattern: encode build/diff/state-read loops as token-minimal SKILLS the agent calls,
  not prose. FE8J already does this (autocarve/loop_prompt) — cross-reference for skill-shape ideas.
- **Ff8 [MED, governance] "Vibe decomp" is OUT OF SCOPE.** A non-byte-exact LLM + IDA/Ghidra MCP
  ("remake the source with the same types/names/dirs") is a fast path to a PLAYABLE port but explicitly
  NOT byte-matching and accumulates hidden mistakes. FE8J requires sha1 — the byte-exact oracle is
  exactly the value vibe-decomp lacks; never let an agent silently drift into vibe-mode.
- **Cf7 [HIGH, governance] Byte-match fake-rate is OPT-LEVEL-dependent.** A verified 100% byte-match can
  still be a FAKE (manual pointer-arith, magic offsets, C-emulated vtables). A corpus shows fakes in
  30–50% of `-O0`/`-O1` functions vs only ~0.5% (8/1600) for a clean `-O3` GCC build. IMPLICATION:
  agbcc `-O2` is on the LOW-fake end (good), but "byte-match ≠ usable C" (F1) still bites whenever a
  carve uses raw offsets — keep the raw-hex-pointer gate. (Quantifies F1 by opt level.)

---

## Top ~10 highest-value findings (for CTO triage)

1. **F1/F2 (Bucket F)** — Fake-match epidemic; enforce anti-cheat with DETERMINISTIC precommit gates +
   an AST declaration-lifter, NOT prompts. Directly hardens our autonomous loop; sharpens
   no-raw-hex-pointers from "convention" to "enforced gate." [HIGH]
2. **A1 / D-load-oracle (A1, agbcc-D3)** — Load mnemonic = exact field type oracle (ldrh=u16,
   ldrsh=s16, ldrb=u8, ldrsb=s8); uncastable. The single most reliable struct-field diagnostic. [HIGH]
3. **A20 + D2(tst) (Bucket A/D)** — agbcc never emits flag-setting-arith-before-branch and CANNOT emit
   `tst`; both are clean DEADEND/triage signals that a region is hand-asm — stop grinding it. [HIGH]
4. **D1 + D3 (Bucket D)** — Leaf-LR push bug (`-fprologue-bugfix`) and the public-function 8-byte-align
   phantom push/pop explain TWO classes of prologue near-misses not in our internals doc. [HIGH]
5. **B3 (Bucket B)** — decomp-permuter does NOT work with agbcc upstream; use
   `WhenGryphonsFly/decomp-permuter-agbcc`. CORRECTS a stale assumption in our permuter memory. [HIGH]
6. **D13 (Bucket D)** — Large functions `bl` to themselves → disassembler "fake function" mis-splits;
   re-merge, don't carve. New §2 function-vs-data category; explains real carve hazards. [HIGH]
7. **F8 + F9 + C8 (Bucket F/C)** — Difficulty-scorer-driven target picking + a same-console
   matched-corpus asm-idiom SEARCH TOOL + asm-embedding nearest-neighbor for few-shot examples. The
   highest-leverage force-multipliers for an autonomous loop. [HIGH]
8. **C5 (Bucket C)** — Carve the CALLER to unlock a callee's regalloc near-miss (inter-procedural
   pressure). A genuinely NEW matching lever; try before declaring UNSOLVED. [HIGH]
9. **A8 + D6 (Bucket A/D)** — agbcc GCSE hoists loads across if/else arms; force a reload with
   `asm("":::"memory")` or `volatile` (scoped `-fno-gcse`). Common near-miss fix. [HIGH]
10. **F14 + C11 (Bucket F/C / governance)** — Validation is THE bottleneck: only the cold full
    `make compare` sha1 counts; AI identifications/idioms are UNVERIFIED until the compiler proves
    them. (Convergent with our existing memories — reinforce, don't relax.) [HIGH]

## Residual / risk (honest coverage statement)

- **NOT REACHED:** the TAIL of the decomp.me decomp-general channel (export was still writing; we
  mined a 7,072-msg RECOVERED prefix, 2024-04 → 2025-08). decomp-general's 2025-08→2026 messages and
  any further-queued channels are unmined. Re-run after the export completes.
- **Recovery caveat:** the agbcc body was mined from an 8,957-msg recovery; its 992-msg tail
  (2024-04 → 2026-06) was mined separately and is ~90% build-environment noise. Full agbcc now parses
  (9,949 msgs) — the union is covered.
- **MIPS/PS/x86 exclusions:** splat/dtk/maspsx/spimdisasm/mwcc/OMF-COFF and N64-IDO/PPC specifics were
  deliberately dropped as non-adoptable for FE8J's incbin-baseline + agbcc-relink methodology. If we
  ever change methodology, re-mine those.
- **Confidence honesty:** every codegen claim is a HYPOTHESIS — the field's own rule (C11/F14) is to
  verify against the actual compiler/byte-match before trusting. HIGH-confidence items have multiple
  independent sources or code examples; MED/LOW are single-source or anecdotal and flagged inline.
- **Existing-doc overlap:** docs/tools/* and docs/agbcc-matching-playbook.md already cover much of
  Bucket B and some D — the CTO should DIFF before integrating to avoid duplication (the per-item
  "→ target" routing and the NEW/already-in-docs flags are provided to make this cheap).
