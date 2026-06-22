# agbcc internals — deterministic codegen rules (read from source)

Source-grounded rules for the agbcc *decision* passes (NOT asm→C idioms — those are in the playbook §7).
Each is read from `../fireemblem8u/.deps/agbcc/gcc` (which builds fe8j's exact compiler). These crack
the patterns agents kept mislabeling as "walls."


## arg-eval-order  _(confidence: high)_

**Rule.** agbcc (thumb target) evaluates AND loads call arguments strictly LEFT-TO-RIGHT (arg0 -> r0, arg1 -> r1, ...). This is forced because NEITHER `PUSH_ARGS_REVERSED` NOR `LOAD_ARGS_REVERSED` is defined for the thumb target (grep of gcc/thumb.h + whole gcc/ tree finds no definition), so every guarded loop in calls.c::expand_call takes its forward (#else / #ifndef) branch.

Three deciding loops, all forward:
1. arg-array fill (calls.c:1244-1253): `#else  i = 0, inc = 1;` then `for (p=actparms, argpos=0; p; p=TREE_CHAIN(p), i+=inc, argpos++)` -> args[i] is the i-th source argument, front-to-back.
2. EXPRESSION EVALUATION order -- precompute_register_parameters (calls.c:586-612, called at 1899 BEFORE any hard reg is filled): `for (i = 0; i < num_actuals; i++) if (args[i].reg != 0 ...) { ... args[i].value = expand_expr(args[i].tree_value,...); ... emit_queue(); }`. So argument SIDE-EFFECTS/sub-expressions are emitted arg0-first (left-to-right), each into its own pseudo.
3. REGISTER MOVE order into r0-r3 (calls.c:1984-1988): `#ifdef LOAD_ARGS_REVERSED ... #else  for (i = 0; i < num_actuals; i++)` -> pseudos moved to hard regs r0,r1,r2,r3 in ascending arg order.

Stack args: thumb.h has STACK_GROWS_DOWNWARD=1, ARGS_GROW_DOWNWARD NOT defined, ACCUMULATE_OUTGOING_ARGS=1, no REG_PARM_STACK_SPACE, no PUSH_ARGS_REVERSED -> non-register (stack) parms are stored first via the forward `for (i=0; i<num_actuals; i++) ... store_one_arg` loop (calls.c:1916-1919), into the preallocated outgoing-args block at ascending offsets (arg-n at higher offset). FUNCTION_ARG (thumb.h:632) assigns reg = CUM/4 with CUM advanced by rounded arg size, so the first 16 bytes of args go to r0-r3 and the rest spill to the stack block.

Decoupling note: thumb.h:484 `SMALL_REGISTER_CLASSES 1` + calls.c:631-638 forces each non-trivial register-arg value into a PSEUDO during precompute, so the visible r0-r3 `mov`/`ldr` materialization (loop 3) is separate from where the value was computed (loop 2) -- but both iterate arg0-first, so the net observable order is left-to-right.


**C implication (how to control it / or why you can't).** Mostly NOT directly C-controllable -- the order is fixed by the target macros, not by source. For a call f(a, b, c): agbcc always computes a, then b, then c, and always loads r0=a, r1=b, r2=c in that order. A decompiler CANNOT flip this to right-to-left by rewriting the call; agbcc is hard-wired left-to-right (unlike, say, an x86 PUSH_ARGS_REVERSED target). The leverage points to match JP `mov r0..r3 / ldr` ordering near-misses are therefore: (1) get the ARGUMENT EXPRESSIONS right -- if two adjacent args read/clobber the same value or have side effects, the left-to-right emit order (each into a pseudo, with emit_queue between) determines instruction interleave; reorder source args ONLY if the prototype/semantics legitimately differ. (2) Match the PROTOTYPE exactly: thumb FUNCTION_ARG packs by 4-byte-rounded size (CUM/4), so an s8/s16 still consumes a full register and PROMOTE_PROTOTYPES=1 widens it -- a wrong param type/count shifts which value lands in which rN and adds/removes a sign/zero-extend. (3) 64-bit (DFmode/DImode) args take two regs and can split across r3/stack via FUNCTION_ARG_PARTIAL_NREGS -- match the type to reproduce the partial-in-reg + stack store. (4) A struct-return adds the hidden sret pointer first (INIT_CUMULATIVE_ARGS sets CUM=4), pushing all real args up one register -- declare the return type correctly. If a near-miss is purely a different rN<->value mapping that no prototype/arg-expression change reproduces, it is a genuine region/codegen difference, not an arg-order knob.


_Source: /home/laqieer/fireemblem8u/.deps/agbcc/gcc/calls.c:expand_call (arg fill 1244-1253; precompute_register_parameters 586-612 called at 1899; stack-arg store loop 1916-1919; register-load loop 1984-1988) and /home/laqieer/fireemblem8u/.deps/agbcc/gcc/thumb.h (STACK_GROWS_DOWNWARD:567, ARGS_GROW_DOWNWARD-undef:571, ACCUMULATE_OUTGOING_ARGS:628, FUNCTION_ARG:632, FUNCTION_ARG_ADVANCE:647, SMALL_REGISTER_CLASSES:484; PUSH_ARGS_REVERSED/LOAD_ARGS_REVERSED absent in whole gcc/ tree)_


_Note: High confidence: the source states the order via explicit #ifdef/#else branches whose macros are verifiably undefined for the thumb target (grep-confirmed absent across gcc/thumb.h, gcc/arm.h, all gcc/*.h, and the whole gcc/ tree). Build.sh confirms the gcc/ tree (not gcc_arm/) produces the `agbcc` thumb compiler FE8J uses. Caveat: the FINAL emitted instruction interleave can still be reordered by later RTL passes (combine/sched/cse in expr.c/combine.c) -- this pass only fixes the ORIGINAL materialization order at the call site (arg0-first, r0..r3 ascending), which is the deterministic, source-grounded answer to 'left-to-right or right-to-left'. The thumb backend has no insn scheduler that reorders across the reg-load sequence, so observed JP code overwhelmingly reflects this L-to-R order._


## prologue-save-mask  _(confidence: high)_

**Rule.** In agbcc's Thumb backend, thumb_function_prologue (gcc/thumb.c:748) builds the prologue push mask purely from two global arrays — there is NO asm-pin exclusion. The deciding loop (thumb.c:781-783):

    for (regno = 0; regno < 8; regno++)
        if (regs_ever_live[regno] && !call_used_regs[regno])
            live_regs_mask |= 1 << regno;
    if (live_regs_mask || !leaf_function_p() || far_jump_used_p())
        live_regs_mask |= 1 << 14;   /* add LR */
    if (live_regs_mask)
        thumb_pushpop(f, live_regs_mask, 1);   /* the prologue PUSH */

call_used_regs comes from CALL_USED_REGISTERS (gcc/thumb.h:405-411): r0-r3 = 1 (call-clobbered), r4-r7 = 0, r8-r10 = 0, r11/r12/sp/lr/pc = 1. So among r0-r7 only r4-r7 satisfy !call_used_regs, and each is pushed exactly when regs_ever_live[regno] is set. LR (bit 14) is added if any low reg is saved OR the function is non-leaf OR it uses a far jump. (High regs r8-r10 are handled separately at thumb.c:791-847 via mov-into-low-then-push.)

regs_ever_live[regno] is set for ANY hard register that is referenced in the function's RTL, with no special case for explicitly-named asm register variables. In gcc/flow.c, mark_used_regs sets it on a USE (flow.c:2880: `regs_ever_live[regno + --i] = 1;` for regno < FIRST_PSEUDO_REGISTER, guarded only by `if (final)`) and mark_set_1 sets it on a SET/store (flow.c:2429: `regs_ever_live[i] = 1;`). reload1.c only ADDS forced-live regs (e.g. nonlocal-goto/setjmp at lines 624-625, 674-676) — it never clears an asm-named reg out.

Therefore: YES — forcing a value into a callee-saved reg via `register T x asm("r7")` (or r4/r5/r6) makes that reg a hard-reg reference in the RTL, sets regs_ever_live[7]=1, and the reg IS added to the prologue push mask. There is no 'asm-pin-not-saved' quirk in agbcc; a low callee-saved asm-pinned reg gets saved/restored exactly like an allocator-chosen one. (The only way r4-r7 is omitted is if it is genuinely never referenced, i.e. regs_ever_live stays 0.)


**C implication (how to control it / or why you can't).** C-controllable, and this is the direct lever for matching the JP prologue PUSH bytes. The push mask is a deterministic function of WHICH callee-saved regs (r4-r7) end up referenced and whether the function is leaf. To match:

1. To FORCE a specific reg into the saved mask: ensure the source causes that callee-saved reg to be used. Allocation order is the normal driver, but you can pin with GCC C89 local register vars: `register int v asm("r7");` — agbcc will set regs_ever_live[7] and push r7. This is the knob for cases where the JP body saves a register the natural US codegen does not, or pins a value to a fixed reg (e.g. inline-asm/ABI shims). It MATCHES; the asm-pin is honored in the mask.

2. To match the EXACT set {r4..r7} pushed: the count/identity of saved low regs == the number of simultaneously-live callee-saved values the body needs (a register-pressure property). If JP pushes {r4,r5,r6,r7,lr} but your US-ported C pushes {r4,r5,lr}, the body needs more live values — this is the reg-alloc/instruction-order class: usually NOT fixable by a clean source edit (it is the decomp-permuter / reg-pressure dead-end), unless you can legitimately raise pressure (extra named locals, asm-pinned temps) or the diff is one missing callee-saved that a `register ... asm()` pin restores. (Caveat: many such "dead-ends" are forceable via int-local-widen and signedness-cast — see `docs/agbcc_codegen_levers.md`; treat as provisional, not permanent.)

3. The LR bit (1<<14) is controlled by leaf-ness: if JP pushes lr but your C is a leaf (no calls) and pushes none, add/keep a call (or far jump); conversely a leaf with no saved low regs emits no push at all. Matching leaf vs non-leaf is governed by whether the C body actually emits a BL.

Bottom line: the PUSH mask byte is fully explained by regs_ever_live & !call_used_regs over r4-r7 plus the leaf/far-jump LR rule; asm-named callee-saved regs ARE saved, so `register ... asm("rN")` is a valid matching tool, not a trap.


_Source: /home/laqieer/fireemblem8u/.deps/agbcc/gcc/thumb.c:781-789 (thumb_function_prologue); save-mask predicate regs_ever_live[regno] && !call_used_regs[regno], LR added at :785-786. CALL_USED_REGISTERS / FIXED_REGISTERS tables: /home/laqieer/fireemblem8u/.deps/agbcc/gcc/thumb.h:396-411 (r4-r7,r8-r10 = callee-saved). regs_ever_live set for ANY referenced hard reg (no asm-pin exclusion): /home/laqieer/fireemblem8u/.deps/agbcc/gcc/flow.c:2429 (on set) and flow.c:2871-2882 (on use, esp. :2880). reload1.c:621-626, 672-676 only force-add regs (nonlocal-goto/setjmp), never excludes asm-named regs._


_Note: High confidence: rule is stated explicitly and unconditionally in source — the mask is a literal AND of regs_ever_live and !call_used_regs over r0..7, with no branch examining asm-declared register variables anywhere in thumb_function_prologue, flow.c liveness, or reload1.c. r8-r10 high callee-saved regs follow the same regs_ever_live & !call_used_regs test but are emitted via the separate mov-to-low + push sequence at thumb.c:791-847 (high_regs_pushed), so pinning to r8-r10 changes the high-reg push block, not the main low-reg PUSH instruction._


### prologue near-miss class 1: leaf-function LR push bug (`-fprologue-bugfix`)  _(confidence: high; Discord-mined, verify per-function)_

**Rule.** agbcc (arm-000512 lineage) emits `push {lr}` plus a split `pop {r0}; bx r0` epilogue **even in LEAF functions** that make no call and use no far jump — where stock gcc 2.95.x would emit a bare `bx lr`. The `-fprologue-bugfix` flag (documented in `agbcc --help`: *"Prevent unnecessary saving of the lr register to the stack"*; present in both `agbcc` and `old_agbcc` as `flag_prologue_bugfix`) suppresses the spurious save. It is NOT in FE8J's (or the US decomp's) default `CC1FLAGS`.

**Diagnostic.** A leaf with `push {lr}` and **no `bl`** ⟹ compiled by agbcc WITHOUT `-fprologue-bugfix`; a bare `bx lr` leaf ⟹ stock gcc or `-fprologue-bugfix` on. This explains a whole class of leaf prologue/epilogue near-misses (off by exactly a `push/pop {…,lr}` pair). The flag is effectively a **separate, date-gated compiler version**: whether a game needs it depends on RELEASE DATE, and when needed it applies to ALL game files EXCEPT SDK/m4a (which separately need old_agbcc, sometimes -O1). The ARM-mode variant of the fix is a known years-old UNMERGED gap — an ARM function failing around its prologue may be this.

**Apply** per-TU, mirroring the US per-TU override pattern: `src/<tu>.o: CC1FLAGS += -fprologue-bugfix`. First re-confirm a true leaf — a hidden call (incl. a compiler-emitted `__divsi3`/`__modsi3`/memcpy helper) makes the LR save correct. Because US matches FE8 without the flag, expect this to be rare. (Operational checklist: `agbcc-matching-playbook.md` §2 / row 2; pret agbcc-channel consensus.)


### prologue near-miss class 2: public-function 8-byte-alignment phantom frame  _(confidence: med-high; Discord-mined, verify per-function)_

**Rule.** agbcc enforces dword (8-byte) stack alignment on public-facing interfaces, so a **public/exported** function can emit a `push {r4}` / extra pop for NO functional reason — alignment PADDING, not a live save — and pop lr to a separate register. This is distinct from the `regs_ever_live & !call_used_regs` save-mask above: the extra reg in the mask of a *public* function may be alignment, not pressure.

**Diagnostic / implication.** When a public function's push mask has one MORE callee-saved reg than your register-pressure analysis predicts, do NOT try to eliminate it by reducing live values — it is an alignment artifact of the public ABI and will not respond to pressure changes. Match it by keeping the function non-static/public (its visibility, not its body, drives the phantom push). (pret agbcc-channel consensus; not derivable from the bare save-mask predicate above.)


### GCSE load hoisting across branches (`-fno-gcse`)  _(confidence: high; Discord-mined)_

**Rule.** agbcc's GCSE pass hoists a common load across branches: `if(c){x=a->f;}else{x=a->f;}` (or two reads of `a->f` straddling a call) may load `a->f` only ONCE. When the JP ROM loads it TWICE, force the second load by inserting `asm("" ::: "memory");` before the 2nd read site (a scoped `-fno-gcse`) or by declaring the pointer/field `volatile`; the global flag is `-fno-gcse`. This is a common near-miss fix and pairs with the playbook §1 "force a RELOAD" lever. (pret asm2c consensus; a real pokeemerald sound comment cites `-fno-gcse`.)


### `volatile` as the anti-sign-extension-fold lever  _(confidence: high; Discord-mined)_

**Rule.** GCC FOLDS an explicit narrowing sign-extend into the load and DROPS your manual `<<16>>16` (or `<<24>>24`), leaving a single sign-extending load (`ldrsh`/`ldrsb`) where the JP ROM kept a plain load THEN a shift pair. If you "can't force the shifts to survive," the load is already sign-extending — making the POINTER / field / local `volatile` makes the load non-foldable so the explicit shift pair survives and matches. (Conversely, Af6: a datum LOADED `ldrh` (u16) but then sign-extend-shifted as if s16 is a real anomaly — `volatile` can line up the load/extend when load-width and extend-signedness disagree, by suppressing a CSE that reused a differently-typed load.) This is the same family as the shifted-domain-sentinel lever but adds the volatile-as-anti-fold knob. Verify the full sha1 — `volatile` changes more than the shift. (decomp.me decomp-help consensus, multiple GCC cases; HYPOTHESIS for this exact agbcc — verify.)


## reg-allocation  _(confidence: high)_

**Rule.** agbcc uses the GCC-2.95 default allocation order: there is NO `REG_ALLOC_ORDER` and NO `ORDER_REGS_FOR_LOCAL_ALLOC` macro in the Thumb backend (confirmed absent in gcc/thumb.h; grep over thumb.h/thumb.c/regclass.c/local-alloc.c/global.c finds none). Two things determine the bytes:

(1) WHICH PHYSICAL REGISTER a given local gets — "lowest-numbered free register in the allowed class." Both allocators scan hard regs in strict ascending numeric order and return the first free one:
- local-alloc.c:1947 `find_free_reg`: `for (i = 0; i < FIRST_PSEUDO_REGISTER; i++) { regno = i; if (! TEST_HARD_REG_BIT (first_used, regno) && HARD_REGNO_MODE_OK(...) ...) { ... return regno; } }`
- global.c:991 `find_reg`: identical `for (i = 0; i < FIRST_PSEUDO_REGISTER; i++) { regno = i; if (! TEST_HARD_REG_BIT (used, regno) ...) { best_reg = regno; break; } }`
So r4 is tried before r5 before r6; r0 before r1 before r2.

(2) WHICH CLASS / WHICH registers are even candidates — driven by whether the pseudo's live range crosses a function call (`qty_n_calls_crossed` / `allocno_calls_crossed`):
- local-alloc.c:1898-1901: `else if (qty_n_calls_crossed[qty] == 0) COPY_HARD_REG_SET (used, fixed_reg_set); else COPY_HARD_REG_SET (used, call_used_reg_set);`
- global.c:950-953: same with `allocno_calls_crossed`.
Thumb classes (thumb.h:396-411): FIXED_REGISTERS marks r11,r13,r14,r15,r16 fixed; CALL_USED_REGISTERS = {1,1,1,1, 0,0,0,0, 0,0,0,1, 1,1,1,1,1} so r0-r3 (and r12) are call-clobbered, r4-r7 are call-saved. REGNO_REG_CLASS (thumb.h:465): r0-r3 = LO_REGS, r4-r7 = NONARG_LO_REGS, r8-r15 = HI_REGS.

Therefore:
- A local that does NOT live across any call: `used` = fixed_reg_set only, so r0..r7 are all candidates -> lowest free wins -> tends to land in a SCRATCH r0/r1/r2/r3 (whichever is first not-busy).
- A local that DOES live across a call: `used` = call_used_reg_set, which already excludes r0-r3,r12 -> only r4,r5,r6,r7 are candidates -> lowest free wins -> r4, then r5, then r6, then r7. (Caller-save of a clobbered reg only happens later via the fail path at local-alloc.c:1991 when flag_caller_saves && CALLER_SAVE_PROFITABLE — not the default for -O2 locals.)

(3) ORDER allocnos are processed (sets who grabs r4 first): pseudos are sorted by a priority = floor_log2(n_refs)*n_refs*size / live_length, DESCENDING, ties broken by allocno/qty number ascending.
- global.c:604 `allocno_compare`: `pri = (floor_log2(allocno_n_refs)*allocno_n_refs / allocno_live_length) * 10000 * allocno_size;` returns `pri2 - pri1` (higher priority first), tie -> `v1 - v2`.
- local-alloc.c:1435 `QTY_CMP_PRI(q)` = `floor_log2(qty_n_refs)*qty_n_refs*qty_size / (qty_death-qty_birth) *10000`; `qty_compare` returns `QTY_CMP_PRI(q2)-QTY_CMP_PRI(q1)` (comment local-alloc.c:1419-1427: "shorter-lived quantities higher priority ... more references preferred"). qty_sugg_compare (1475) runs FIRST and prefers quantities with the fewest hard-reg suggestions, honoring copy/arith suggestions before the generic pass.
Net effect: the local with more references and a shorter live range is allocated first, so it gets the lowest free register; longer-lived / fewer-ref locals get the next ones. THIS ordering is what produces r4-vs-r5-vs-r6 "register permutation" near-misses.


**C implication (how to control it / or why you can't).** Partially C-controllable. Note: `register T x asm("rN")` pins DO work in agbcc Thumb (proven in `docs/agbcc_codegen_levers.md` §3 and the prologue-save-mask section above — the pin is honored in both the body and the prologue push). However, naive pins can introduce shuffle `mov`s that worsen the match; prefer declaration/use-order and int-local-widen first. What the decompiler controls is the INPUTS to the priority formula and the call-crossing flag, which deterministically pick the register:

1. Call-crossing decides scratch (r0-r3) vs callee-saved (r4-r7). A value that must survive a function call WILL be forced into r4/r5/r6/r7; a value that never spans a `bl` will prefer r0-r3. To match JP bytes, restructure the C so a temporary's last use is before vs after the call exactly as in the target: hoisting/sinking a use across a call flips its register from scratch to callee-saved (or vice-versa). E.g. caching `gFoo->bar` into a local before a loop that calls something keeps it in r4; reading it after the call keeps it scratch.

2. Among callee-saved locals, ORDER = priority(n_refs, live_length, size) descending, tie by pseudo number (source order). To swap an r4/r5 permutation: (a) change how many times each local is referenced (CSE-ing a subexpression raises its n_refs and pulls it to a lower reg); (b) change a local's live range length (live_length) by moving its first/last use; (c) when priorities tie, the pseudo with the LOWER internal number (earlier-created, roughly earlier in source / earlier-declared) wins the lower register — so reordering declarations or the order subexpressions are first computed can flip r4<->r5. Splitting one variable into two, or merging two into one, changes the qty count and thus the permutation.

3. Copy/arith suggestions (qty_phys_sugg, set when a pseudo is copied to/from a hard reg like an argument r0-r3 or return r0) bias a local toward that specific register and are tried first (local-alloc.c:1333-1344, the qty_sugg_compare pass). Matching the JP arg/return dataflow (which local is the one assigned from a parameter or passed to the next call) reproduces these suggestions and hence the exact register.

Honest caveat: when two locals are genuinely symmetric (same n_refs, same live_length, same size, no suggestions), the only remaining tiebreak is pseudo/allocno number = creation order, which is an artifact of how agbcc walks the RTL, not anything a clean C rewrite exposes. Those cases are the residual stochastic "register permutation" near-misses; the practical levers are decomp-permuter (reorders statements/temps to enumerate the qty-number permutations) or hand-matching the exact reference count and call-crossing of each temporary. There is no `REG_ALLOC_ORDER` to fight — the order is fixed ascending r0..r15, so every permutation difference traces back to (call-crossing) + (priority formula) + (pseudo creation order). (Caveat: before declaring a register-permutation case a dead-end, apply the levers in `docs/agbcc_codegen_levers.md` — int-local-widen, signedness-cast, declaration-order, and explicit `register asm("rN")` pins have reclaimed many previously-classified dead-ends.)


_Source: gcc/local-alloc.c:1947 (find_free_reg ascending scan), :1898-1901 (calls_crossed -> fixed_reg_set vs call_used_reg_set), :1435-1444 (QTY_CMP_PRI/qty_compare), :1469-1504 (qty_sugg_compare), :1336-1406 (two-pass alloc: suggested then by-priority); gcc/global.c:991-1013 (find_reg ascending scan), :950-953 (calls_crossed used-set), :604-631 (allocno_compare priority); gcc/thumb.h:393-411 (FIRST_PSEUDO_REGISTER=17, FIXED_REGISTERS, CALL_USED_REGISTERS), :465-469 (REGNO_REG_CLASS r0-3 LO_REGS / r4-7 NONARG_LO_REGS); gcc/regclass.c:353-366 (builds fixed_reg_set/call_used_reg_set from those arrays). Absence of REG_ALLOC_ORDER/ORDER_REGS_FOR_LOCAL_ALLOC confirmed by grep over thumb.h/thumb.c/regclass.c/local-alloc.c/global.c._


_Note: The source states the rule unambiguously: both allocators scan registers in fixed ascending numeric order (no REG_ALLOC_ORDER override exists for Thumb), the call-crossing test selects scratch-vs-callee-saved, and a single documented priority formula (refs/live-length/size, ties by pseudo number) orders the allocnos. The "lowest free register" and "calls_crossed gates the class" rules are mechanical and high-confidence. The medium-uncertainty part is purely about how a C rewrite maps to internal pseudo NUMBERS for the symmetric tie case — that mapping is an RTL-walk artifact, which is exactly why those residual permutations are best resolved with decomp-permuter rather than a deterministic C edit._


## switch-lowering  _(confidence: high)_

**Rule.** agbcc lowers a switch to a COMPARE CHAIN (binary decision tree of conditional branches) rather than a JUMP TABLE when ANY clause of the OR'd test in expand_end_case is true; otherwise it emits a jump table. The deciding test (gcc/stmt.c, expand_end_case, lines 4910-4937):

  /* If range of values is much bigger than number of values,
     make a sequence of conditional branches instead of a dispatch. */
  else if (TREE_INT_CST_HIGH (range) != 0
           || count < (unsigned int) CASE_VALUES_THRESHOLD
           || ((HOST_WIDE_UINT) (TREE_INT_CST_LOW (range)) > 10 * count)
           || TREE_CODE (index_expr) == INTEGER_CST
           || ... BUILT_IN_CLASSIFY_TYPE / COMPOUND_EXPR-with-INTEGER_CST)
    { ...emit_case_nodes -> compare chain... }
  else
    { ...gen_casesi / do_tablejump -> jump table... }

where:
  range = maxval - minval  (span of the case values; line 4899)
  count = number of case VALUES, and a range label counts double ("A range counts double, since it requires two compares" -> count++ at line 4892)

Compare-chain is forced when:
  (a) range doesn't fit one HOST_WIDE_INT word (TREE_INT_CST_HIGH(range)!=0), OR
  (b) count < CASE_VALUES_THRESHOLD (too few cases), OR
  (c) range > 10*count (density: span more than 10x the case count, i.e. table would be >90% holes), OR
  (d) index is a compile-time constant.

CASE_VALUES_THRESHOLD (lines 4915-4924):
  #ifndef CASE_VALUES_THRESHOLD
  #ifdef HAVE_casesi
  #define CASE_VALUES_THRESHOLD (HAVE_casesi ? 4 : 5)
  #else
  #define CASE_VALUES_THRESHOLD 5
  #endif
  #endif

For fe8j's exact compiler (thumb agbcc built from .deps/agbcc/gcc): thumb.md defines "tablejump" but NO "casesi" (grep casesi thumb.md = 0; generated gcc/insn-flags.h: HAVE_tablejump 1, no HAVE_casesi), and thumb.h does not override CASE_VALUES_THRESHOLD. So the #else applies and CASE_VALUES_THRESHOLD == 5.

NET RULE for fe8j: a switch becomes a JUMP TABLE only if ALL of: count >= 5 AND (maxval-minval) <= 10*count AND span fits one word AND index is not a constant. Otherwise compare chain. Table dispatch is via HAVE_tablejump / do_tablejump (lines 5088-5104), not casesi.

estimate_case_costs (lines 5242-5297) does NOT gate table-vs-chain. It runs only on the compare-chain path (use_cost_table, lines 5011-5013) to decide whether case values look like ASCII text (all in [-1,127], no odd control chars) so balance_case_nodes can frequency-weight the binary tree (cost_table: alnum=16, punct/space=8, tab/nul=4, newline=2). It returns 0/1 for "suitable for cost-weighted balancing", unrelated to choosing a table.


**C implication (how to control it / or why you can't).** PARTIALLY C-controllable, and the controllable part is fully deterministic (no opt-randomness, no costs). The decompiler controls table-vs-chain purely via the SHAPE of the case set, which it can reproduce exactly:

1. COUNT of distinct case labels (ranges count double): need count >= 5 for a table. If the JP ROM shows a compare chain but you wrote >=5 cases, one of the other clauses (density/word/constant) is firing. If it shows a table, you must supply >=5 cases.

2. DENSITY: keep maxval-minval <= 10*count. If the JP function uses a jump table, the real case values must satisfy span <= 10*count (the enum/index values are usually denser than a naive guess). Writing sparse values yields a compare chain and a mismatch; you cannot force a table over a >10x-sparse set — agbcc always emits a chain there. So the C must use the original's actual dense value set.

3. Do NOT feed a constant index (clause d) — it collapses to a direct branch.

4. Table dispatch is do_tablejump (thumb "tablejump" insn + a Pmode 4-byte ASM_OUTPUT_ADDR_VEC label table); index_expr is rewritten to (index - minval) before the lookup, CASE_VECTOR_MODE = Pmode (4-byte entries). Match the index variable's declared TYPE (s8/u8/s16/int): GET_MODE of the index drives the widening emitted before the table read, so the wrong type shifts the bytes.

NOT controllable beyond shape: the threshold (5) and density factor (10*count) are hard-coded in this build; you cannot tune them from C. The practical recovery move is to read the truth out of the disassembly — a jump table's entry count == range+1 directly gives you minval..maxval, and the index widening reveals the index type — then write the switch with exactly those case values/type. estimate_case_costs is irrelevant to byte-matching the table/chain decision; it only rebalances an already-chosen ASCII-like compare chain.


_Source: /home/laqieer/fireemblem8u/.deps/agbcc/gcc/stmt.c — expand_end_case: count/range computation lines 4876-4899; OR'd compare-chain test lines 4910-4937; CASE_VALUES_THRESHOLD macro lines 4915-4924; table path do_tablejump lines 5021-5104; estimate_case_costs lines 5242-5297. Target config: /home/laqieer/fireemblem8u/.deps/agbcc/gcc/thumb.md (tablejump at line 979, no casesi), thumb.h (no CASE_VALUES_THRESHOLD; CASE_VECTOR_MODE Pmode at line 1050), gcc/insn-flags.h (HAVE_tablejump 1, no HAVE_casesi)._


_Note: Verified fe8j's actual compiler: thumb agbcc has HAVE_tablejump but no HAVE_casesi and no CASE_VALUES_THRESHOLD override, so the effective threshold is the #else default 5 and dispatch is do_tablejump (not casesi). Three numeric levers are exact and source-quoted: count>=5, span<=10*count, span fits one word; plus index!=constant. estimate_case_costs confirmed NOT part of the table/chain choice (only weights the compare-chain tree for ASCII switches)._


## shift-div-lowering  _(confidence: high)_

**Rule.** (a) LSR vs ASR is selected purely by the `unsignedp` flag of the value being shifted, in expand_shift (expmed.c:1466). For a RSHIFT_EXPR: if `unsignedp` is true it emits `lshr_optab` (line 1569-1572: `else if (unsignedp) temp = expand_binop(mode, left ? ashl_optab : lshr_optab, ...)`); otherwise it emits `ashr_optab` (line 1577-1591: `if (temp == 0 && !rotate && (!unsignedp || ...)) ... temp = expand_binop(mode, left ? ashl_optab : ashr_optab, ...)`). thumb.md maps lshr->LSR, ashr->ASR. So unsigned right-shift -> `lsr`, signed -> `asr`. `unsignedp` is the unsigned-ness of the operand's C type.

(b) Division/modulo by a (non-pow2) constant is ALWAYS a libcall on this target — no magic-number reciprocal is ever emitted. expand_divmod (expmed.c:2479) DOES contain magic-multiplier code: the unsigned path calls `choose_multiplier(...)` then `expand_mult_highpart(...)` (lines 2702-2762), and the signed path likewise (lines 2862-2910). But every one of those highpart multiplies is guarded `if (t1 == 0) goto fail1;`. expand_mult_highpart (expmed.c:2305) can only produce code if a widening (`smul_widen_optab`/`umul_widen_optab`) or highpart (`smul_highpart_optab`/`umul_highpart_optab`) multiply insn exists for the mode. thumb.md defines ONLY `mulsi3` (low-32-bit MUL, line 652) — no `mulsidi3`/`umulsidi3`, no `smulsi3_highpart`/`umulsi3_highpart`, and no `divsi3`/`udivsi3`. So expand_mult_highpart returns 0 -> `goto fail1` -> `delete_insns_since(last)` -> control falls through to the bottom of expand_divmod which calls `sign_expand_binop(... udiv_optab, sdiv_optab ... OPTAB_LIB_WIDEN)` (lines 3457-3483). With no div insn pattern, that resolves to the libfunc registered in optabs.c init_optabs: `init_integral_libfuncs(sdiv_optab,"div",'3')` / `"udiv"` / `"mod"` / `"umod"` (optabs.c:4134-4139), i.e. `__divsi3`/`__udivsi3`/`__modsi3`/`__umodsi3`. Net: a generic `a / N` or `a % N` (N not a power of two) compiles to a `bl __divsi3`-class call, never an inline reciprocal multiply.

(c) Signed division by a power of two adds the round-toward-zero bias and, at -O2, uses an explicit cmp/branch/add sequence (`cmp r,#0; bge .L; add r,#(N-1); .L: asr r,#log2(N)`). In expand_divmod's "TRUNC_DIV, signed" branch, the EXACT_POWER_OF_2 case (expmed.c:2807-2839): when `abs_d != 2 && BRANCH_COST < 3` (line 2810) it emits `do_cmp_and_jump(t1, const0_rtx, GE, ..., label)` then `expand_inc(t1, GEN_INT(abs_d - 1))` then `emit_label(label)` then `expand_shift(RSHIFT_EXPR, ..., lgup, ..., 0)` — that is exactly `cmp;bge;add #N-1;asr #log2(N)`. The else (line 2824-2839) is the branchless `asr#31 / lsr#(32-lgup) / add / asr#lgup` form, taken when BRANCH_COST>=3 or abs_d==2. The selector: thumb.h:960 `#define BRANCH_COST (optimize > 1 ? 1 : 0)`, so at -O2 (optimize==2) BRANCH_COST==1, which is `< 3` -> the cmp;bge;add bias path is chosen for abs_d>2. Note `sdiv_pow2_cheap` (expmed.c:147) is false here (no divsi3 insn -> rtx_cost(DIV) is high, not <= 2*add_cost), so line 2804's shortcut is skipped and we always reach the explicit-bias code.


**C implication (how to control it / or why you can't).** (a) To control lsr vs asr from C: it is fully determined by the C type's signedness of the shifted operand at the point of the shift. To get `lsr`, the operand promoted type must be unsigned (e.g. `(u32)x >> n`, or `x` declared `unsigned`/`u8`/`u16`/`u32`); to get `asr`, it must be signed (`s32`/`int`/`s16` after promotion). For a struct field or local that the JP ROM shifts logically, declare it unsigned (or cast `(u32)`/`(unsigned)` immediately before `>>`); for arithmetic, leave it signed. Beware integer promotion: `u8`/`u16` promote to signed `int` before shifting, so `someU8 >> n` is an ASR on the promoted int unless re-cast to unsigned. This is the single most reliable lever for matching shift mnemonics.

(b) Generic constant division cannot be turned into an inline reciprocal-multiply by any C you write — the compiler/target physically lacks the widening-multiply insns, so `a / N` and `a % N` always become `bl __divsi3`/`__udivsi3`/`__modsi3`/`__umodsi3` (or the DImode variants). When the JP disasm shows such a bl, write the plain C `a / N` / `a % N` (matching signedness) and it will match; do NOT hand-roll a magic-number multiply in C (it would emit `mul` and diverge). Conversely, if the JP code shows an inline `mul`+shift reciprocal, that was NOT produced by agbcc division — it is either hand-written asm or source that literally multiplies, so model it as an explicit multiply in C, not a `/`.

(c) Signed power-of-two division: write it as the natural `s32 q = x / N;` (N a literal power of two, signed dividend) and agbcc at -O2 emits exactly the `cmp #0; bge; add #N-1; asr #log2(N)` bias sequence (for N>2). For N==2 it instead emits the branchless `asr#31; lsr#31; add; asr#1` form (the line 2824 else, hit because abs_d==2) — so divide-by-2 looks different from divide-by-4/8/... and you must use `/2` to get it. To get a plain single `asr` with no bias, the dividend must be unsigned (then it is a logical `lsr`, case (a)) or the source must literally use `>>` on a value known non-negative; a signed `/N` will always carry the bias. You cannot independently dial BRANCH_COST from C — it is fixed at 1 for this -O2 build — so the cmp/bge/add shape is mandatory for signed `/N` (N>2) and is the correct thing to emit.


_Source: /home/laqieer/fireemblem8u/.deps/agbcc/gcc/expmed.c: expand_shift line 1466 (optab pick 1569-1591); expand_divmod line 2479 (optab1/optab2 select 2570-2572; unsigned magic path 2702-2762; signed magic path 2860-2910 with goto fail1 guards; signed pow2 bias 2804-2839); init_expmed sdiv_pow2_cheap line 147; libcall fallthrough 3457-3483. /home/laqieer/fireemblem8u/.deps/agbcc/gcc/optabs.c: init_optabs div/mod libfuncs lines 4073-4078, 4134-4139, 4177-4210. /home/laqieer/fireemblem8u/.deps/agbcc/gcc/thumb.md: only mulsi3 line 652, no div/widen/highpart patterns. /home/laqieer/fireemblem8u/.deps/agbcc/gcc/thumb.h: BRANCH_COST line 960._


_Note: All three sub-claims are directly quotable from agbcc source and the thumb target machine description; nothing inferred. The decisive facts: (a) the `unsignedp` branch in expand_shift selecting lshr vs ashr optab; (b) thumb.md has only mulsi3 (no widening/highpart multiply, no divsi3) so the magic-number paths in expand_divmod always hit `goto fail1` and fall back to the __divsi3-class libfuncs registered in optabs.c init_optabs; (c) thumb.h BRANCH_COST=(optimize>1?1:0)=1 at -O2, and 1<3 triggers the cmp;bge;add #N-1 bias branch in the signed-pow2 case (with the abs_d==2 carve-out to the branchless form, and sdiv_pow2_cheap=false because there is no divsi3 insn to make rtx_cost(DIV) cheap). Caveat for the decompiler: u8/u16 promote to signed int, so logical-looking shifts on small unsigned types still emit ASR unless re-cast to unsigned._


## jump-opts  _(confidence: high)_

**Rule.** Beyond cross-jump (find_cross_jump/do_cross_jump, which requires rtx-identical tails stopping at CODE_LABEL), agbcc's jump.c runs FOUR additional live jump optimizations that change byte output. fe8j compiles -O2 (Makefile:82 CC1FLAGS has -O2) and HAVE_cc0 IS defined for the Thumb backend (thumb.md lines 785-948 define `(set (cc0) (compare ...))` and `(if_then_else (eq (cc0) ...))` branch patterns; insn-config.h emits #define HAVE_cc0), so the #ifdef HAVE_cc0 transforms are ACTIVE and the #ifndef HAVE_cc0 ones are DEAD.

(1) JUMP THREADING — thread_jumps (jump.c:4517). Gated by flag_thread_jumps, which toplev.c:3595-3598 sets to 1 whenever optimize>=1; it is invoked at toplev.c:2807-2809 (after reg_scan, before cse_main) and again at 2952-2957. RULE (jump.c:4550-4695): find a condjump b1 (condjump_p && !simplejump_p && JUMP_LABEL!=0); walk from its target label to the next branch b2 recording modified regs/mem, following simplejumps whose target has LABEL_NUSES==1 (4579-4585), stopping at any CODE_LABEL (4572-4573). If b2 is a condjump, the two tests use rtx_equal_for_thread_p-identical operands (4634-4635), AND `comparison_dominates_p(code1,code2)` OR (`comparison_dominates_p(code1,reverse_condition(code2))` && can_reverse_comparison_p) (4636-4640), THEN walk back from both branches over recog_memoized-equal + rtx_equal_for_thread_p-equal INSNs (4687-4691) until reaching b1's target `label`; if reached with num_same_regs==0 (4656-4657), redirect b1 to JUMP_LABEL(b2) when codes dominate else get_label_after(b2) (4659-4662) via redirect_jump (4678). Knowing b1's outcome forces b2's, so b1 is retargeted to skip the now-known b2.

(2) CONDITIONAL-JUMP-OVER-UNCONDITIONAL-JUMP (branch-around-branch) — jump.c:1730-1780. RULE (1732-1738): fires when insn is a condjump (this_is_condjump||this_is_condjump_in_parallel) && !simplejump, reallabelprev = prev_active_insn(JUMP_LABEL(insn)) is a JUMP_INSN, prev_active_insn(reallabelprev)==insn, no_labels_between_p(insn,reallabelprev), AND simplejump_p(reallabelprev). Action: invert_jump(insn, JUMP_LABEL(reallabelprev)) (1750) — inverts the condition so the condjump targets the unconditional jump's label — then delete_insn(reallabelprev) (1770). I.e. `if(c) goto over; goto L; over:` becomes `if(!c) goto L;`.

(3) JUMP-TO-JUMP via follow_jumps — jump.c:1783-1791 (else branch) using follow_jumps (jump.c:3372). RULE: nlabel = follow_jumps(JUMP_LABEL(insn)); if it differs, redirect_jump(insn, nlabel). follow_jumps (3380-3411) chases the target chain while depth<10 AND next_active_insn is a JUMP_INSN that is simplejump_p (or PATTERN==RETURN) AND its NEXT_INSN is a BARRIER (3382-3387); stops at depth 10, at a self-cycle (3402), or before an ADDR_VEC/ADDR_DIFF_VEC (3406-3408). A jump whose target is itself an unconditional jump is retargeted to the final destination.

(4) JUMP-TO-FOLLOWING-INSN DELETION and JUMP-TO-RETURN — jump.c:373-386. (a) If JUMP_LABEL(insn) is end-of-function or its next_active_insn is a RETURN pattern, redirect_jump(insn, NULL_RTX) (373-377) turns it into a (possibly conditional) RETURN. (b) If reallabelprev==insn && condjump_p(insn) (jump jumps to the very next insn), delete_jump(insn) (380-386). Also active: the cc0-gated `if(...)x=a;else x=b;`/`if(...){x=a;goto l;}` motion (471-676) and the cc0 conditional-jump-redirect-by-known-constant at 1369-1425 (when a preceding insn sets a reg to a CONSTANT then the jump tests that reg, simplify_relational_operation folds the branch and redirect_jump to the proven target). The final pass (toplev.c:3143) also enables full cross_jump for both condjumps (gated by jump_back_p, jump.c:2934, an opposing reversed branch must return here) and simplejumps.


**C implication (how to control it / or why you can't).** These are RTL-level transforms keyed on control-flow SHAPE, not on any C token, so they are not directly source-controllable — a decompiler cannot toggle them with a keyword. The lever is producing the SAME control-flow graph as the JP source so agbcc emits the same post-optimization branches: (a) Branch-around-branch (opt 2) is why a C-level `if (cond) { ... } else { return/goto }` where one arm is a single goto/return collapses to ONE inverted conditional branch in the bytes — to match, keep the if/else arm structure (which arm is the fallthrough vs the goto) identical to US/JP; swapping the then/else bodies flips the emitted condition (BNE<->BEQ) and changes bytes. (b) Jump-threading and jump-to-jump (opts 1,3) collapse `goto A; A: goto B;` chains and dominated double-tests — at C level this means redundant/forwarding labels and a second test of the same variable get folded; you cannot force agbcc to keep the intermediate jump, so match by NOT introducing extra hops the JP source lacked and by replicating any short-circuit `&&`/`||` and nested-if ordering exactly (the dominance check `comparison_dominates_p` fires on same-operand re-tests like `if(x>=0)...if(x>0)`). (c) Jump-to-RETURN (opt 4a) means a `goto` to a trailing `return;` and tail `if(c) return;` shapes become conditional RETURN instructions — keep the function's tail-return structure the same. (d) Jump-to-next-insn deletion (opt 4b) removes degenerate branches; harmless and automatic. PRACTICAL RULE for byte-matching: when a carved C function is byte-CLOSE but a conditional branch has inverted polarity or a missing/extra B, the cause is almost always that the C if/else arm assignment or the then/else nesting differs from JP — flip the `if (cond)` to `if (!cond)` and swap the arm bodies (semantically identical) so the branch-around-branch/threading produces the JP branch direction. This is the same class as the shifted-domain sentinel and branch-polarity fixes already in the playbook; it is controllable only through CFG shape, never through a compiler flag.


_Source: /home/laqieer/fireemblem8u/.deps/agbcc/gcc/jump.c — thread_jumps (4517-4699, esp. dominance test 4634-4640, walk-back 4687-4691, redirect 4659-4678); cond-over-uncond branch-around-branch (1730-1780, invert_jump 1750); jump-to-jump else-branch (1783-1791) + follow_jumps (3372-3415, depth<10/BARRIER 3380-3387); jump->RETURN (373-377) and jump-to-next deletion (380-386); cc0 const-fold redirect (1369-1425). Gating: toplev.c:3595-3598 (flag_thread_jumps at optimize>=1), 2800-2809 (thread_jumps call), 3142-3144 (final cross_jump pass). HAVE_cc0 active: thumb.md:785-948 cc0 patterns; build -O2 from /home/laqieer/fireemblem8j/Makefile:82._


_Note: Critical correction to any assumption that the cc0 branches are dead: agbcc's Thumb backend DOES use cc0 (thumb.md compare/branch patterns), so the #ifdef HAVE_cc0 jump-opt blocks (lines 1368-1426 const-fold redirect, 642-647 cc-set guards, 511-541, 1490-1522) ARE compiled in, while the #ifndef HAVE_cc0 block at 678-... is DEAD. The large #if 0 blocks (1428-1523, 1548-1700ish) are unconditionally disabled and never run. flag_thread_jumps is on at -O1+ so thread_jumps runs in every fe8j compile. The branch-around-branch (opt 2) is the single most byte-relevant one for hand-decomp: it deterministically inverts condition polarity based on which if/else arm holds the goto, explaining inverted-branch near-misses._


## Discord-mined gotchas (NOT source-reproduced here — HYPOTHESES; verify against the compiler/byte-match)

These come from the pret agbcc/asm2c channel consensus, not from reading this repo's gcc tree. Per the field's own rule (every codegen claim is a hypothesis until the compiler proves it), treat each as a triage signal to CHECK, not a settled fact. Where one duplicates an operational checklist it cross-references `agbcc-matching-playbook.md`.

- **No Thumb instruction scheduler.** The Thumb backend has NO scheduler, so apparent out-of-order instruction patterns are register-allocator or CSE artefacts, NOT a scheduler reorder — there is no scheduler to fight. (Residual exception: pooled FLOAT constant ordering can still differ vs stock gcc, a known non-match class for float-heavy functions.) Consistent with the reg-allocation section above.
- **Data-section placement.** `static T foo;` → `.bss`; `T foo;` → `COMMON`; either WITH an initializer (incl. `= 0`) → `.data`; `const` → `.rodata`; a function-local `static` → `.bss`. Use this to predict which section a global lands in when wiring a carve.
- **inline / standalone-copy survival law.** `inline` is ALWAYS selected at -O1+ if physically possible (no modern cost threshold); it is disabled at -O0; at -O3 non-inline statics are auto-inlined. A `static inline` emits NO standalone copy. SURVIVAL LAW: GCC keeps an out-of-line copy UNLESS the function is `static` AND every call was inlined; non-static helpers always keep a copy. (This is the mechanism behind the playbook §5 "inline-made-standalone" carve class.)
- **Default-enabled options (arm-000512 dump).** Includes `-freg-struct-return` (small structs returned in r0/r1), `-msoft-float`, `-flive-range-gdb`, `-fargument-alias`. Triage signal: `-O0`/`-O1` emit debug variable/function-pointer tables that `-O2` does NOT — extra debug tables in a mystery region hint it was built at a lower -O.
- **Alignment fill is `0x46c0` (Thumb `mov r8,r8`), not `0x0000`.** Padding is controlled by the ASSEMBLER, not C: pret patched agbcc's `as` invocation to emit `.align 2, 0` (zero-fill), set via ASFLAGS / the `printf '\t.text\n\t.align 2, 0\n'` appended to each `.s` (see `agbcc-matching-playbook.md` §0 pipeline). If a carved function ends in `0x46c0` instead of `0x0000`, the assembler invocation lacks the zero-fill. (`lsl r0,#0` / `0x0000` is NOT a real nop; `mov r8,r8` = `0x46c0` is.)
- **agbcc segfaults on large/complex TUs → a PARTIAL `.s` is silently piped to `as`.** The `agbcc | as` pipeline has no pipefail, so a compiler segfault (large union accesses, certain address computations, arm64-host stack corruption) yields truncated asm and a MISLEADING assembler error (undefined label / "invalid offset, value too big"). Triage: capture the `.s` (`-o /tmp/x.s`), look for abrupt truncation, then split/simplify the TU. (See also the project's `make compare` stale-OK trap.)
- **old_agbcc vs agbcc version provenance.** SDK v1/v2 = old_agbcc (gcc-thumb-2.95.0, arm-000511); SDK v3 = agbcc (2.95.1, arm-000512); v4 did NOT update the compiler. They differ in instruction ORDERING (e.g. pool-load vs mask-mov interleave) beyond the leaf-LR bug. Per-game consensus: FE6=old_agbcc, FE7=old_agbcc, FE8(US/JP)=agbcc; libraries (libagbflash, isagbprn)=old_agbcc; m4a=agbcc. (Matches the project's m4a old_agbcc memory; new_agbcc=SDK4.0 is identification-only, no widely-used decomp build.)
- **Conflicting array-extern dimensions ICE the compiler.** Declaring the same symbol `extern u8 arr[4]` in one header and `extern u8 arr[]` in another, both visible in one TU, ICEs agbcc with `stor-layout.c:203: Internal compiler error`. Keep all array externs dimension-consistent. (HIGH-RISK build break, not a near-miss.)
- **`-f2003-patch` / Oct-2003 sign-comparison lowering.** jiangzhengwenjz/agbcc's `-f2003-patch` changes lowering of s8/s16 COMPARISONS only — a last-resort lever for a sign-comparison near-miss nothing else fixes (fork-only, not vendored here). The Oct-2003 agbcc patch boundary (pre: char/short forced unsigned; post: handled as declared) explains anomalous unsigned behavior in older builds.
- **volatile-read elimination bug.** In at least one case (a vblank VCOUNT wait loop) agbcc wrongly eliminated a VOLATILE read it believed redundant. If a volatile read seems dropped, restructure so each read is not provably redundant to dataflow.
- **Compound-literal anonymous-string length bug.** agbcc bounds an anonymous string/array literal's length by its PARENT struct/array slot size → "excess values in initializer." Avoid compound-literal arrays of strings; use a named array per string.
- **Build gotchas (NOT codegen).** agbcc's own build is NOT parallel-safe (`make -jN` races on `targmatch.h`). `-Werror` does NOT cover `-Wimplicit` on this 2.95 lineage — pass `-Wimplicit` so a missing prototype (which can shift arg widths via default-int) is a hard error, not a silent diff. `Foo()` vs `Foo(void)` produce identical BODY codegen — only prototype strictness differs.

### Follow-up Discord deltas (decomp.me decomp-help consensus — HYPOTHESES, verify per-function)

- **`tst` is a QUANTIFIED dead-end, not under-explored (Df2).** The `tst` vs `mov #mask;and;cmp #0;b…` mismatch is an EMPIRICALLY-CONFIRMED agbcc ceiling: a sibling GBA/agbcc decomp produced 22 distinct C variants and ran ~870k permuter iterations and still could not cross a residual that was exactly the `tst`. CONFIRMS the §0 / `agbcc-matching-playbook` "agbcc cannot emit `tst`" as a true case-(a) hand-asm signal — when the only diff is `tst`, STOP grinding and classify hand-asm / wrong-compiler (don't permute it).
- **ARM-mode == handwritten (Df1).** With very few exceptions all compiled GBA code is Thumb-1; ARM-mode code (crt0/rt0, audio/m4a, a few speed-critical routines) is hand-written asm you do NOT decompile. Thumb is the matchable surface; an ARM-mode function in the JP ROM is a strong DEADEND-for-C signal (case (b) in the playbook §0). The explicit GBA-wide statement of this repo's m4a-as-asm posture.
- **"patched-compiler-needed + many `register asm()` pins == wrong-C SMELL" (Df3).** Most GBA functions match with PLAIN agbcc; `-fprologue-bugfix` is needed mainly for OLDER titles, and you generally do NOT need a modified/patched compiler. If a function only matches by PATCHING the compiler AND pinning many `register asm()`s, that is a SMELL the C SHAPE/STRUCT is wrong (audit the struct per Cf2 / the playbook §2), not that you need a custom agbcc. (Transmuter can brute-force the pins back out into clean C — see `discord_findings.md` Ff1.)
- **Isolated-object phantom push/pop (Df4).** A GBA function compiled ALONE (a decomp.me scratch, or a standalone `.o`) can emit an extra `push/pop` that VANISHES when the same C compiles IN CONTEXT with its neighbors (inter-procedural register pressure; consistent with the public-function 8-byte-align frame above and the playbook §5 "carve the caller" lever). Operational rule: do NOT trust a scratch/isolated push/pop diff as a real mismatch — verify in the full-TU build before declaring UNSOLVED.
- **Reference-doc lever: use the DS-era Thumb-1 manual, not the GBA-era one (Df5).** When decoding an FE8J Thumb instruction's exact behavior (flag effects, shift semantics), trust the LATER DS-era Thumb-1 reference — the GBA-era manual has ERRORS, and the Thumb-2 manual is actively MISLEADING for Thumb-1.
- **Linkage affects the CONSUMER's codegen (Df6).** `extern`-declared (public) vs TU-`static`/file-local linkage of a GLOBAL can change whole-function codegen of the function that READS it (instruction swaps, narrow-load vs word-load+mask). When a function reading a global near-misses with unexplained reg-swaps or a load-width diff, test whether that global was originally a TU-local `static` (no header `extern`) — linkage is a matching lever, not just scoping.
- **`&`-of-element forces an ADDRESS-load — typed signal for a missing/extra `&` (Df7).** `&x` lowers to a pool-load+add (address) where `x` value-loads. If the ROM computes an address but your C value-loads ⇒ the source passed `&x` not `x`; a stray value-load ⇒ you wrote `&x` where it wanted `x`. Extends the load-mnemonic oracle to address formation.
- **Per-TU `-O` changes MORE than inlining (Df8).** On this old-GCC lineage, `-Os`/`-O1`/`-O3` genuinely change instruction selection and stack usage on SMALL functions (a div one-liner may match only under a specific `-O`). When a tiny function refuses every C shape, sweep the per-TU `-O` (this repo already does it for `src/agb_sram.o -O1`). Extends A22.
- **Union accesses can pin a register longer than expected (Df9).** GCC 2.x is conservative about keeping registers tied to UNION member reads alive, surprising matchers. When a union-heavy function near-misses on regalloc, the union access pattern itself may force the allocation — restructure the union read rather than blindly pinning. (GCC-2.7.2 finding; agbcc is 2.95 — HYPOTHESIS.)
- **`-fno-builtin` / exact-prototype for a renamed libc primitive (Bf11).** When a libc's `memcpy` is internally named `bcopy` (or similar), the compiler's builtin recognition mismatches the call; `-fno-builtin` per-TU (or the exact prototype) lowers it to the NAMED symbol. FE8J analogue if agbcc inlines/renames a libc primitive differently than the JP ROM.
- **`const`-qualifying a function-local scalar can change codegen (Af15).** A `const` local may go to an immediate/`.rodata` instead of a stack slot. When a small local constant near-misses on stack layout or immediate-vs-pool, try toggling `const` on the local. (Corroborates the data-section placement rule; HYPOTHESIS for agbcc — verify.)
- **Magic-number division is NOT agbcc output — it's a SIGNAL (Af3 / Cf3).** agbcc cannot strength-reduce non-pow2 `/`/`%` (the Thumb backend lacks the widening/highpart multiply — see shift-div-lowering above; every `/C`/`%C` is a `__divsi3`-class libcall). So a loaded magic const (0x66666667→/5, 0xAAAAAAAB→/3 or /sizeof, …) + multiply-high + shift in the JP asm was NOT produced by an agbcc `/` — it is hand-asm or a literal `*`. As an RE anchor you can reconstruct the divisor `C ≈ 2^(32+s)/magic` without a debugger; IDA/Ghidra/m2c usually auto-recover these to `/C`. (Strength-reduced CONSTANT *multiplication* DOES happen — see playbook §7b.)
