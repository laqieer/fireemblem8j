/* Contract-assisted relational CBMC equivalence harness for sub_80C05C8
 * (GmapScreen2_Loop, worldmap-screen node-icon display proc _Loop).
 *
 * Discussion #149 "contract method": this is a VOID function -- the complete
 * observable is NOT a return value. It is (a) every direct mutation of the
 * proc/global state, and (b) the ORDERED external-call/effect trace with
 * exact target/order/semantic arguments for GmapScreen2_GetNodeScreenPos,
 * PutSpriteExt, and AP_Update. This harness proves the reconstruction
 * (src/nonmatching/sub_80C05C8.c, `impl_*`) and a cleaned m2c decompilation of
 * asm/sub_80C05C8.s (`ref_*`, raw dump in m2c_ref_raw.c) produce IDENTICAL
 * such traces.
 *
 * WHY A CUT-POINT, NOT A FULL 29x UNROLL: a first attempt unrolled the real
 * 29-iteration node loop directly (`--unwind 30`) with fully-symbolic
 * per-node data. That harness (preserved conceptually in this file's PART A
 * decomposition) is SOUND but did not terminate in the session's solver
 * budget -- it grew to >12GB RSS after ~9-15 minutes without a verdict on a
 * shared, memory-constrained host running sibling proof jobs concurrently,
 * so it was killed rather than risk an OOM (the exact class of incident
 * documented in docs/incident-2026-07-04-wsl2-dwarf-oom.md). This is the
 * project's own documented "BMC scalability wall" (D349 addendum 6) --
 * loop-heavy, multi-branch, multi-callsite code does not always fit in a
 * single flat unroll, and the honest response (per this task's explicit
 * instruction) is a CUT-POINT proof, not silently truncating the loop.
 *
 * CUT-POINT METHOD (manual arbitrary-fixed-witness induction -- the same
 * technique `goto-instrument --apply-loop-contracts` automates in the
 * sub_80A6F1C unbounded proof, D349 addendum 8, applied here by hand because
 * the two loop shapes (impl's `for`, ref's `do-while`) each embed THREE
 * external call sites and would need a bespoke `__CPROVER_assigns`/
 * `__CPROVER_loop_invariant` per side -- a much larger lift than the single
 * de-obfuscation loop addendum 8 treated; the hand version proves the
 * IDENTICAL mathematical obligation and is stated precisely so it is exactly
 * as auditable):
 *
 *   PART A below is the LOOP-FREE inductive STEP lemma: for an ARBITRARY
 *   symbolic loop index k in [0,29) and ARBITRARY-but-EQUAL "before" oracle
 *   state (call counters ciG0/ciP0 and trace length nlog0 -- the only
 *   loop-carried state; game data itself has no cross-iteration dependency),
 *   running ONE pass of the impl body and ONE pass of the ref body at index k
 *   leaves the counters equal and appends IDENTICAL trace entries (if any).
 *   This is machine-CHECKED by CBMC (no loop, no unwinding at all -- k is a
 *   single free symbolic value, so this one call proves the step for EVERY
 *   k in the domain simultaneously, exactly like the sub_80A6F1C
 *   `harness_unbounded.c` witness-index argument).
 *
 *   INDUCTION (mathematical, not re-run by CBMC per index -- stated here for
 *   audit): base case k=0 has both sides starting at ciG=ciP=nlog=0 (trivially
 *   equal, no proof obligation). The proven step lemma shows: equal-before at
 *   k implies equal-after at k, for ANY k. By finite induction over
 *   k = 0, 1, ..., 28 (29 applications of the SAME machine-proven step
 *   lemma), the counters and full trace remain equal after the last
 *   iteration (k=28) -- i.e. the ENTIRE 29-iteration phase-1 loop's ordered
 *   call trace is identical between impl_fn and ref_fn. This is the standard
 *   cut-point/loop-invariant argument (entry + preserved-by-arbitrary-step +
 *   trivial base case ⇒ holds for the whole bounded-but-large iteration
 *   count), NOT a truncation: every one of the 29 real iterations is covered
 *   by exactly one instantiation of the proven step lemma.
 *
 *   WHY THE STEP LEMMA'S CONCLUSION DOES NOT DEPEND ON k OR ON THE ABSOLUTE
 *   COUNTER VALUES (the reason finite induction over 29 iterations is valid
 *   from a SINGLE CBMC run): the step lemma in PART A is stated and proven
 *   for k and (ciG0, ciP0, nlog0) as INDEPENDENT free symbolic values -- the
 *   ASSUME clauses bound them to a domain, they do NOT tie ciG0/ciP0/nlog0 to
 *   any particular function of k (e.g. "the counters after k prior
 *   iterations"). The proof is therefore of the STRONGER, k-and-counter-
 *   value-agnostic universal statement "for every k and every EQUAL pair of
 *   before-states in the assumed domain, the step preserves equality" --
 *   which trivially implies the WEAKER, specific statement needed for
 *   induction ("for the particular (unknown, data-dependent) counter values
 *   that actually arise after processing iterations 0..k-1, iteration k
 *   preserves equality"), for every k, without CBMC ever needing to know or
 *   track what those actual realized values are. This is precisely why a
 *   SINGLE machine-checked instantiation (one CBMC run, k universally
 *   quantified by being left symbolic) discharges all 29 real per-iteration
 *   proof obligations: the lemma does not merely hold "at the values that
 *   happen to occur" -- it holds at EVERY value in the assumed domain, so it
 *   certainly holds at whichever ones occur. The finite induction over
 *   k = 0..28 chains 29 applications of this ALREADY-UNIVERSAL lemma; no
 *   re-verification per index is needed, and no assumption is made about
 *   what the real game data (which determines how many of the 29 iterations
 *   actually call the oracles) happens to be.
 *
 *   PART B is the loop-free MERGE-PHASE full symbolic equivalence (no
 *   induction needed -- it executes at most once).
 *
 *   PART C is the loop-free PROLOGUE gate (proc->skip check).
 *
 *   Full-function coverage by decomposition (mirrors D349 addendum 8's
 *   prologue;loop;epilogue decomposition): the JP function body is
 *   PART C (prologue) ; PART A's loop, 29x ; PART B (merge). PART C and
 *   PART B are direct bounded CBMC proofs (no loop, always tractable);
 *   PART A is the cut-point induction above. Because both impl_fn and ref_fn
 *   execute the phase-1 loop to COMPLETION before ever reaching the merge
 *   check (verified by inspection of both source shapes: the `for`/`do-while`
 *   precedes the `if (proc->merge_next_node)` block with no early exit
 *   between them), the three pieces' proven trace-prefix equalities
 *   concatenate in the same program order on both sides, establishing
 *   equivalence of the COMPLETE ordered external-effect trace for the whole
 *   function, covering BOTH merge_next_node outcomes (false: PART B's oracle
 *   call is skipped identically on both sides; true: PART B's bounds check
 *   is evaluated in two independently-transcribed surface forms -- see
 *   README "merge-phase boundary check" -- covering both its false and true
 *   outcomes too, all via full symbolic exploration, no branch forced).
 *
 * PROVENANCE.
 *   impl_* = src/nonmatching/sub_80C05C8.c GmapScreen2_Loop's per-region
 *     logic, transcribed with the exact same expressions (masks, shifts,
 *     boundary comparisons), replacing struct/global access with this
 *     harness's private shared-state model (see WHY NO PROC HEADERS below).
 *   ref_*  = `scripts/tools/m2c/m2c.sh --context tools/m2c/fe8j_ctx.c \
 *              -f GmapScreen2_Loop asm/sub_80C05C8.s`, CLEANED for CBMC (see
 *     "m2c CLEANUP LOG" below). The raw m2c dump is preserved verbatim in
 *     m2c_ref_raw.c in this directory for audit/provenance.
 *
 * WHY NO PROC HEADERS: per the project's cbmc_spike isolation convention (no
 * full16/focused harness includes global.h/worldmap.h -- each models only the
 * byte-relevant fields locally). Field provenance (from include/worldmap.h,
 * include/ap.h, include/ctc.h and the two source files) is documented in
 * README.md's "full proc/global input model" table.
 *
 * m2c CLEANUP LOG (bugs found + fixed while cleaning the raw m2c dump; full
 * audit in README.md; both fixes below are proven load-bearing by
 * `harness_mut_cleanup.c`, which reintroduces bug #1 verbatim and REFUTES):
 *  1. Raw m2c declares the merge-phase y/flag carrier as `u8 var_r6;` then
 *     immediately does `var_r6 |= 0x400;` -- 0x400 does not fit in a byte, so
 *     literal C int-promotion-then-truncation-back-to-u8 would SILENTLY DROP
 *     the flag bit. The real ASM loads it with `ldrb` (a byte-WIDTH memory
 *     load that zero-extends into a normal 32-bit register) then ORs 0x400
 *     into the FULL register -- i.e. the variable must be WIDER than a byte
 *     after the load. Fixed by widening the C type to u16 (`var_r6` in
 *     `merge_ref` below).
 *  2. Raw m2c's phase-1 y-mask omits the explicit `& 0xFF`; cross-checking
 *     the ASM (`ldrb r3,[r4]; strh r3,[r4]` -- a byte LOAD zero-extended back
 *     to a halfword STORE) confirms it IS an implicit `(u8)` truncation.
 *     Fixed by making the mask explicit (`(u16)(u8)yout`) instead of leaving
 *     a no-op-looking `(u16)` cast that would silently keep the high byte.
 *  3. Raw m2c's ambiguous reused stack slots (`sp4.unk0`/`sp4.unk2`,
 *     `subroutine_arg0.unk6`/`unkA`) are split into separately-scoped named
 *     C locals per program point (standard m2c stack-reuse cleanup, no
 *     semantic change).
 *
 * OBSERVABLE / SOUNDNESS (fail-closed shared-oracle pattern from
 * sub_80A6F1C, D349 addendum 7):
 *  - GmapScreen2_GetNodeScreenPos, PutSpriteExt, AP_Update are each modelled
 *    as SHARED CALL-INDEXED ORACLES: a value/writeback is drawn ONCE into a
 *    shared pool and applied to whichever side calls the k-th time, so both
 *    sides observe identical outputs *iff* they call in the same order.
 *  - GmapScreen2_GetNodeScreenPos ONLY writes its own PRIVATE stack outputs
 *    (xOut/yOut) via pointer args local to the caller's frame; this harness
 *    NEVER compares those pointers' addresses (there are none synthesized --
 *    real local variables are passed by address) and instead compares the
 *    call's semantic INPUT args (opaque screen-proc handle identity, xIn,
 *    yIn) BEFORE sharing the identical symbolic x/y outputs.
 *  - PutSpriteExt is the OAM/rendering boundary: every call's layer/x/y,
 *    sprite-data identity (icon index) AND content (pSpriteData value,
 *    sheetTileId-derived attribute word) are recorded and compared
 *    elementwise -- an index-based shared writeback can never MASK an
 *    argument divergence; it is only reached after that call's argument
 *    equality assertions already passed.
 *  - AP_Update: proc->ap identity + x/y arguments/order compared; there is
 *    nothing further to observe on this path (it is the function's last
 *    statement).
 *  - This is a COMPOSITIONAL EXTERNAL-EFFECT CONTRACT: it proves the two
 *    reconstructions issue IDENTICAL ordered calls to these three functions.
 *    It explicitly does NOT prove cycle timing, and does NOT re-verify
 *    PutSpriteExt/AP_Update/GmapScreen2_GetNodeScreenPos's OWN internals
 *    (abstracted callees, out of scope here).
 *
 * DIRECT WRITES (compare ALL direct proc/global writes). Disasm audit of
 * asm/sub_80C05C8.s (every `str`/`strh`/`strb` in the function, register by
 * register): every one of them targets stack scratch -- either directly via
 * a literal `[sp,#imm]` operand (e.g. `str r0,[sp,#0xc]`), or via a register
 * set earlier in the SAME block to `sp` plus a constant offset and then used
 * as the store's base register (e.g. `mov r4,sp; adds r4,#6` ... later
 * `strh r3,[r4]`; the same pattern recurs with `sl`, and with `r2`/`r3` at
 * different offsets in the merge-phase block). Concretely: ZERO stores in
 * this function ever target `sb` (the proc pointer, held in `sb` for the
 * whole function) or an address derived from a global symbol (`gGMData`,
 * `gWMNodeData`, `gWMNodeIconData`) -- every store's base register is either
 * literally `sp` or was itself derived from `sp` with no other register or
 * global folded in. The JP function itself has ZERO direct writes to proc or
 * global state; all externally-visible effects flow ONLY through the three
 * oracle calls. The
 * ONE apparent exception is the reconstruction's
 * `gm->nodes[*(u8*)phaseRole].state += 0;` (decomp.me register-pressure
 * scaffolding per the source's 2026-07-13 comments) -- a self-write-back of
 * the SAME byte it just read, with NO asm counterpart. PART B below makes
 * this claim MACHINE-CHECKED: `merge_impl` contains the exact `+= 0`
 * statement; `merge_ref` (faithful to asm/m2c) does not; the harness asserts
 * the node-state byte is equal after both run.
 *
 * SCOPE (bounds -- honest, documented, generalizing arguments):
 *  - NUMNODES = 29 is the REAL, exact trip count of the JP loop (0x1c+1,
 *    `cmp r2,#0x1c; ble _080C05F8` is a post-test loop over r8=0..0x1c
 *    inclusive) -- PART A's induction covers every one of the 29 real
 *    iterations, none dropped or approximated.
 *  - NUMICON = 3: the modelled gWMNodeIconData[] window. iconPreClear/
 *    iconPostClear (and proc->nodeId's icon index) are ASSUMEd in-range for
 *    this window. This generalizes to the real (larger) array because both
 *    impl_* and ref_* read the SAME shared Icon[] through the IDENTICAL index
 *    expression -- equivalence never depends on the array's size, only on
 *    both sides indexing it identically (same argument as PSIZE in the
 *    sub_80A6F1C proof).
 *  - proc->nodeId is ASSUMEd in [0, NUMNODES) in PART B -- a real game
 *    invariant (the merge-target node is one of the same 29 map nodes PART A
 *    ranges over).
 *  - Tier: source-level equivalence trusting m2c (spec shape for ref_*) +
 *    agbcc (codegen for impl_*) + the shared-oracle abstraction of the three
 *    callees + the manual cut-point induction above -- strictly BELOW the
 *    `make compare` byte oracle. Complements (does not replace) the
 *    ARM-vs-ARM SMT PROVEN-BOUNDED(2) and differential EQUIV(60) results
 *    already recorded in src/nonmatching/sub_80C05C8.c's header comment.
 */
#include "../../adversarial/common.h"

typedef signed char s8;
typedef short s16;
typedef int s32;

static s16 nondet_s16(void) { return (s16) nondet_int(); }

#define NUMNODES 29 /* real JP loop trip count: r8/phaseRole = 0..0x1c inclusive */
#define NUMICON 3   /* modelled gWMNodeIconData[] window; see SCOPE above */
/* MAXCALL sizes the oracle pools / trace log / counter ASSUME bounds to cover
 * the FULL REACHABLE range of PART A's loop-carried counters over all 29
 * iterations, not just what one step needs: at most one GETPOS + one
 * PUTSPRITE call per iteration, so ciG0/ciP0 each reach at most NUMNODES=29
 * and nlog (their sum, interleaved) reaches at most 2*NUMNODES=58 before the
 * last step, +2 more appended by that step = 60. 2*NUMNODES+2 = 60. (A
 * smaller bound, e.g. 4, was tried first and is also sound -- the step lemma
 * doesn't need the counters to be reachable, only equal, see the
 * counter-independence note above -- but this larger bound additionally
 * demonstrates the proof is stable at the size an actual realized 29-
 * iteration chain could produce, which is the stronger, more defensible
 * check; solver cost stayed negligible, see Evidence.) */
#define MAXCALL (2 * NUMNODES + 2)

enum
{
    K_GETPOS = 1,
    K_PUTSPRITE = 2,
    K_APUPDATE = 3
};

/* One recorded call: kind + every semantic argument (never a raw pointer
 * address -- opaque handles are modelled as plain symbolic ints/identity
 * tokens shared between both sides, exactly as the ABI would present them).
 * PUTSPRITE uses a0=layer, a1=x, a2=y, a3=iconIdx, a4=spriteData, a5=attr --
 * every one of "every call's layer/x/y, sprite-data identity or
 * content/index, and attributes" (task requirement) is present. */
typedef struct
{
    int kind;
    int a0, a1, a2, a3, a4, a5;
} CallRec;

typedef struct
{
    unsigned ci_getpos, ci_putsprite, ci_apupdate, nlog;
    CallRec log[MAXCALL];
} Trace;

/* ---- shared oracle draw pools (identical values offered to both sides) ---- */
static int g_getpos_ret[MAXCALL];
static s16 g_getpos_xout[MAXCALL];
static s16 g_getpos_yout[MAXCALL];

/* ---- shared (read-only, never mutated) icon-data model ---- */
typedef struct
{
    s8 xCenter, yCenter, xFlagOrigin, yFlagOrigin; /* gWMNodeIconData[].xCenter/yCenter/xFlagOrigin/yFlagOrigin */
    u16 sheetTileId;                               /* gWMNodeIconData[].sheetTileId */
    u32 pSpriteData;                               /* gWMNodeIconData[].pSpriteData (opaque token, compared by value) */
} Icon;

static void log_call(Trace *T, int kind, int a0, int a1, int a2, int a3, int a4, int a5)
{
    CallRec *r;
    ASSERT(T->nlog < MAXCALL, "log bound");
    r = &T->log[T->nlog++];
    r->kind = kind;
    r->a0 = a0; r->a1 = a1; r->a2 = a2; r->a3 = a3; r->a4 = a4; r->a5 = a5;
}

/* shared call-indexed oracle: GmapScreen2_GetNodeScreenPos(pScreenProc,xIn,yIn,&xOut,&yOut) */
static int o_getpos(Trace *T, int screenProcId, int xIn, int yIn, s16 *xOut, s16 *yOut)
{
    unsigned k = T->ci_getpos++;
    ASSERT(k < MAXCALL, "getpos call bound");
    log_call(T, K_GETPOS, screenProcId, xIn, yIn, 0, 0, 0);
    *xOut = g_getpos_xout[k];
    *yOut = g_getpos_yout[k];
    return g_getpos_ret[k];
}

/* shared call-indexed oracle: PutSpriteExt(layer,x,y,object,oam2) -- void,
 * no return to share; both sides must simply CALL it with identical args. */
static void o_putsprite(Trace *T, int layer, int x, int y, int iconIdx, u32 spriteData, int attr)
{
    unsigned k = T->ci_putsprite++;
    ASSERT(k < MAXCALL, "putsprite call bound");
    log_call(T, K_PUTSPRITE, layer, x, y, iconIdx, (int) spriteData, attr);
}

/* shared call-indexed oracle: AP_Update(handle,x,y) -- return ignored by the
 * caller (statement-only call), so only the argument trace is observable. */
static void o_apupdate(Trace *T, int apId, int x, int y)
{
    unsigned k = T->ci_apupdate++;
    ASSERT(k < MAXCALL, "apupdate call bound");
    log_call(T, K_APUPDATE, apId, x, y, 0, 0, 0);
}

/* ============== PART A: phase-1 single-iteration cut-point step ==============
 * impl_step mirrors ONE pass of src/nonmatching/sub_80C05C8.c's `for` loop
 * body at index `k`; ref_step mirrors ONE pass of the cleaned m2c `do-while`
 * loop body at index `k`. Neither reads/writes any array -- all per-node data
 * is passed as plain scalars (nodeState/iconPre/iconPost/nodeX/nodeY), making
 * this a genuinely loop-free, single-witness CBMC obligation for arbitrary k. */
static void impl_step(Trace *T, const Icon icon[NUMICON], int screenProcId, u32 chr, u8 pal, u32 unk34,
                       int k, u8 nodeState, u8 iconPre, u8 iconPost, s16 nodeX, s16 nodeY)
{
    int chrDiv = (int) (chr / 0x20);
    int iconIdx;
    s16 x1, y1, xOut, yOut;

    if (!(nodeState & 1))
        return;

    iconIdx = (nodeState & 2) ? iconPre : iconPost;
    ASSUME(iconIdx >= 0 && iconIdx < NUMICON);

    x1 = (s16) (nodeX - icon[iconIdx].xCenter);
    y1 = (s16) (nodeY - icon[iconIdx].yCenter);

    if (o_getpos(T, screenProcId, x1, y1, &xOut, &yOut))
    {
        u16 ox = (u16) (xOut & 0x01FF);
        u16 oy = (u16) (yOut & 0x00FF);
        int attr;

        if (unk34 & (1u << (k & 0x1F)))
            oy |= 0x0400;

        attr = (chrDiv + icon[iconIdx].sheetTileId) + ((pal & 0xF) << 12) + 0x800;
        o_putsprite(T, 0xC, (s16) ox, (s16) oy, iconIdx, icon[iconIdx].pSpriteData, attr);
    }
}

static void ref_step(Trace *T, const Icon icon[NUMICON], int screenProcId, u32 chr, u8 pal, u32 unk34,
                      int k, u8 nodeState, u8 iconPre, u8 iconPost, s16 nodeX, s16 nodeY)
{
    u32 spC = (u32) chr >> 5; /* m2c: arg0->unk2C >> 5 (chr is u32/non-negative, identical to /0x20) */

    if (1 & nodeState)
    {
        int iconIdx = (2 & nodeState) ? iconPre : iconPost;
        s16 xin, yin, xout, yout;

        ASSUME(iconIdx >= 0 && iconIdx < NUMICON);
        xin = (s16) (nodeX - icon[iconIdx].xCenter);
        yin = (s16) (nodeY - icon[iconIdx].yCenter);

        if ((o_getpos(T, screenProcId, xin, yin, &xout, &yout) << 0x18) != 0)
        {
            u16 sp4 = (u16) (xout & 0x1FF);
            /* cleanup fix #2: raw m2c omitted the explicit &0xFF; the ASM's
             * `ldrb r3,[r4]; strh r3,[r4]` is a byte-load zero-extended back
             * to a halfword -- i.e. an implicit (u8) truncation. */
            u16 tmp3 = (u16) (u8) yout;
            int r0_2 = k;

            if (r0_2 < 0) /* dead in [0,NUMNODES) -- kept verbatim from raw m2c for provenance */
                r0_2 += 0x1F;
            (void) r0_2;

            if (unk34 & (1u << (0x1F & k)))
                tmp3 = (u16) (tmp3 | 0x400);

            o_putsprite(T, 0xC, (s16) sp4, (s16) tmp3, iconIdx, icon[iconIdx].pSpriteData,
                        (int) (spC + icon[iconIdx].sheetTileId + ((0xF & pal) << 0xC) + 0x800));
        }
    }
}

/* ============== PART B: merge-phase, loop-free, full symbolic ============== */
static void merge_impl(Trace *T, u8 *nodeState, const Icon icon[NUMICON], u32 unk34, int apId,
                        int nodeId, u8 iconPre, u8 iconPost, s16 nodeX, s16 nodeY, s16 screenX, s16 screenY)
{
    int iconIdx2 = (*nodeState & 2) ? iconPre : iconPost;
    s16 lc, la;

    ASSUME(iconIdx2 >= 0 && iconIdx2 < NUMICON);

    lc = (s16) (((nodeX - icon[iconIdx2].xCenter) + icon[iconIdx2].xFlagOrigin) - screenX);
    la = (s16) (((nodeY - icon[iconIdx2].yCenter) + icon[iconIdx2].yFlagOrigin) - screenY);

    /* Self-write-back canary from the reconstruction source (matches
     * "gm->nodes[*(u8*)phaseRole].state += 0;" in
     * src/nonmatching/sub_80C05C8.c) -- see DIRECT WRITES above. */
    *nodeState = (u8) (*nodeState + 0);

    if (la >= -0x20 && la < 0xC0 && lc > (-0x20 - 1) && lc <= (0x110 - 1))
    {
        s16 xOam1 = (s16) (lc & 0x01FF);
        u16 yOam0 = (u16) (la & 0x00FF);

        if (unk34 & (1u << (nodeId & 0x1F)))
            yOam0 |= 0x0400;

        o_apupdate(T, apId, xOam1, yOam0);
    }
}

static void merge_ref(Trace *T, const Icon icon[NUMICON], u32 unk34, int apId,
                       int nodeId, u8 nodeState, u8 iconPre, u8 iconPost, s16 nodeX, s16 nodeY, s16 screenX, s16 screenY)
{
    int iconIdx2 = (2 & nodeState) ? iconPre : iconPost;
    s16 sp8, tmp3b, sp4b, tmp0_2;

    ASSUME(iconIdx2 >= 0 && iconIdx2 < NUMICON);

    sp8 = screenX;
    tmp3b = screenY;
    sp4b = (s16) ((icon[iconIdx2].xFlagOrigin + (nodeX - icon[iconIdx2].xCenter)) - sp8);
    tmp0_2 = (s16) ((icon[iconIdx2].yFlagOrigin + (nodeY - icon[iconIdx2].yCenter)) - tmp3b);

    /* boundary checks kept in the raw m2c unsigned-wraparound form (NOT
     * simplified to the reconstruction's plain range comparison) -- this is
     * the genuinely independent surface form CBMC must reconcile. The shift
     * is done in the u32 domain (matching the ASM `lsls`, which is a plain
     * bit shift with no signed-overflow notion) rather than signed int, so
     * CBMC's --signed-overflow-check does not flag a real hardware-faithful
     * shift-into-the-sign-bit as a spurious "bug". */
    if (((u32) (u16) (tmp0_2 + 0x20) <= 0xDFU) &&
        (((u32) (u16) (sp4b + 0x20) << 0x10) <= 0x012F0000U))
    {
        /* cleanup fix #1: raw m2c declared this `u8 var_r6;` then OR'd 0x400
         * into it (would silently drop the flag bit in real C semantics).
         * Widened to u16 -- see cleanup log at file top. */
        u16 var_r6 = (u16) (u8) tmp0_2;

        if (unk34 & (1u << (nodeId & 0x1F)))
            var_r6 = (u16) (var_r6 | 0x400);

        o_apupdate(T, apId, 0x1FF & sp4b, var_r6);
    }
}

int main(void)
{
    int i;
    Icon icon[NUMICON];
    u32 chr, unk34;
    u8 pal;
    int screenProcId, apId;

    for (i = 0; i < MAXCALL; i++)
    {
        g_getpos_ret[i] = nondet_int() & 1;
        g_getpos_xout[i] = nondet_s16();
        g_getpos_yout[i] = nondet_s16();
    }
    for (i = 0; i < NUMICON; i++)
    {
        icon[i].xCenter = (s8) nondet_int();
        icon[i].yCenter = (s8) nondet_int();
        icon[i].xFlagOrigin = (s8) nondet_int();
        icon[i].yFlagOrigin = (s8) nondet_int();
        icon[i].sheetTileId = (u16) nondet_uint();
        icon[i].pSpriteData = nondet_uint();
    }
    chr = nondet_uint();
    ASSUME(chr <= 0xFFFFFu); /* keep chrDiv's addition well inside int range on both sides */
    pal = nondet_uchar();
    unk34 = nondet_uint();
    screenProcId = nondet_int();
    apId = nondet_int();

    /* ---- PART C: prologue gate (trivial, loop-free) ----
     * proc->skip is a REAL 1-bit bitfield (`u8 skip : 1;`,
     * include/worldmap.h GmNodeIconDisplayProc) -- the reconstruction's
     * `if (!proc->skip)` already only ever sees a 0/1 value there, so the
     * fair comparison is against the SAME single bit on the ref side, not
     * against an arbitrary full byte. */
    {
        u8 skipByte = nondet_uchar();
        int implEarlyReturn = !(skipByte & 1);
        int refEarlyReturn = !(1 & skipByte);
        ASSERT(implEarlyReturn == refEarlyReturn, "prologue: skip-gate early-return decision identical");
    }

    /* ---- PART A: phase-1 cut-point single-step lemma, arbitrary k ----
     * "before" state is ARBITRARY but EQUAL on both sides (the induction
     * hypothesis); the assertions below are the induction STEP. */
    {
        int k = nondet_int();
        u8 nodeState = nondet_uchar();
        u8 iconPre = nondet_uchar(), iconPost = nondet_uchar();
        s16 nodeX = nondet_s16(), nodeY = nondet_s16();
        unsigned ciG0 = nondet_uint(), ciP0 = nondet_uint(), nlog0 = nondet_uint();
        Trace TR, TI;

        ASSUME(k >= 0 && k < NUMNODES);
        ASSUME(ciG0 < MAXCALL);
        ASSUME(ciP0 < MAXCALL);
        ASSUME(nlog0 <= MAXCALL - 2); /* room for up to 2 new entries this step */

        TR.ci_getpos = ciG0; TI.ci_getpos = ciG0;
        TR.ci_putsprite = ciP0; TI.ci_putsprite = ciP0;
        TR.ci_apupdate = 0; TI.ci_apupdate = 0;
        TR.nlog = nlog0; TI.nlog = nlog0;

        ref_step(&TR, icon, screenProcId, chr, pal, unk34, k, nodeState, iconPre, iconPost, nodeX, nodeY);
        impl_step(&TI, icon, screenProcId, chr, pal, unk34, k, nodeState, iconPre, iconPost, nodeX, nodeY);

        ASSERT(TR.ci_getpos == TI.ci_getpos, "cutpoint step: ci_getpos preserved");
        ASSERT(TR.ci_putsprite == TI.ci_putsprite, "cutpoint step: ci_putsprite preserved");
        ASSERT(TR.nlog == TI.nlog, "cutpoint step: nlog preserved");
        /* Only the NEWLY appended entries (indices [nlog0, TR.nlog)) are
         * compared here -- entries below nlog0 are the "before" state, which
         * this single step does not (re)initialize; their equality is the
         * INDUCTION HYPOTHESIS carried in from the previous step, not this
         * step's proof obligation (see the cut-point method note at the top
         * of this file). */
        for (i = 0; i < MAXCALL; i++)
        {
            if ((unsigned) i >= nlog0 && (unsigned) i < TR.nlog)
            {
                ASSERT(TR.log[i].kind == TI.log[i].kind, "cutpoint step: same call kind/order");
                ASSERT(TR.log[i].a0 == TI.log[i].a0, "cutpoint step: same call arg a0");
                ASSERT(TR.log[i].a1 == TI.log[i].a1, "cutpoint step: same call arg a1");
                ASSERT(TR.log[i].a2 == TI.log[i].a2, "cutpoint step: same call arg a2");
                ASSERT(TR.log[i].a3 == TI.log[i].a3, "cutpoint step: same call arg a3 (iconIdx)");
                ASSERT(TR.log[i].a4 == TI.log[i].a4, "cutpoint step: same call arg a4 (spriteData)");
                ASSERT(TR.log[i].a5 == TI.log[i].a5, "cutpoint step: same call arg a5 (attr)");
            }
        }
    }

    /* ---- PART B: merge-phase, loop-free, full symbolic (both bounds-check
     * outcomes explored: merge_next_node false is simply never entered by
     * the caller in that case, identically on both sides; true explores both
     * the pass and fail cases of the boundary check via free lc/la). ---- */
    {
        int nodeId = nondet_int();
        u8 nodeState0 = nondet_uchar();
        u8 iconPre = nondet_uchar(), iconPost = nondet_uchar();
        s16 nodeX = nondet_s16(), nodeY = nondet_s16();
        s16 screenX = nondet_s16(), screenY = nondet_s16();
        u8 nsR, nsI;
        Trace TR2, TI2;

        ASSUME(nodeId >= 0 && nodeId < NUMNODES);
        nsR = nodeState0;
        nsI = nodeState0;
        TR2.ci_getpos = TR2.ci_putsprite = TR2.ci_apupdate = TR2.nlog = 0;
        TI2.ci_getpos = TI2.ci_putsprite = TI2.ci_apupdate = TI2.nlog = 0;

        merge_ref(&TR2, icon, unk34, apId, nodeId, nsR, iconPre, iconPost, nodeX, nodeY, screenX, screenY);
        merge_impl(&TI2, &nsI, icon, unk34, apId, nodeId, iconPre, iconPost, nodeX, nodeY, screenX, screenY);

        ASSERT(nsR == nsI, "merge-phase: nodeState final value equal (self-write-back is a no-op)");
        ASSERT(TR2.nlog == TI2.nlog, "merge-phase: same number of AP_Update calls");
        for (i = 0; i < MAXCALL; i++)
        {
            if ((unsigned) i < TR2.nlog)
            {
                ASSERT(TR2.log[i].kind == TI2.log[i].kind, "merge-phase: same call kind");
                ASSERT(TR2.log[i].a0 == TI2.log[i].a0, "merge-phase: same apId");
                ASSERT(TR2.log[i].a1 == TI2.log[i].a1, "merge-phase: same x");
                ASSERT(TR2.log[i].a2 == TI2.log[i].a2, "merge-phase: same y");
            }
        }
    }

    return 0;
}
