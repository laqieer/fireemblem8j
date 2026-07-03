/* NON_MATCHING: byte source is asm/sub_800A34C.s @ JP 0x0800A34C (region-different,
 * gbadisasm descriptive asm; carved_rom places those bytes). This C DOCUMENTS the
 * reconstruction and is NOT in make-compare: compiled only by `make nonmatching`.
 * Graduate via permuter/lever -> move to src/, flip the carved_rom row, drop asm.
 *
 * Proposed name: SplineEvalCatmullRom.
 * JP-only Catmull-Rom / natural-cubic-spline 2D evaluator (no fe8u twin).
 * Reconstructed from asm + IDA. sub_800A194 = Thomas-algorithm tridiagonal coeff solve;
 * sub_80D6378 = fixed-point >>12 multiply, called as sub_80D6378(0x1000, u*coeff).
 * The uninitialized `int r;` return is intentional: the asm epilogue `pop {r0}; bx r0`
 * consumes r0 as the branch target, so the caller sees an undefined return (sub_800A594
 * ignores it and returns its own segment index).
 *
 * ---- MATCH STATUS: NONMATCHING-C-DOCUMENTED (agbcc whole-function reg-coloring wall) ----
 *
 * 2026-07 RE-DERIVATION (bravo-sub_800A34C): the earlier header's "wrong C STRUCTURE /
 * 534/584 diverges heavily" hypothesis is REFUTED. A fresh block-by-block objdump vs
 * asm/sub_800A34C.s confirms the control-flow graph and instruction sequence of THIS
 * reconstruction are EXACTLY the JP function's: the segment-search do/while, the coeff/
 * tangent build loop (sub@sp+4, coeffA@sp+0x14, coeffB@sp+0x24, interleaved tan@sp+0x34),
 * the sub_800A194 tridiagonal solve call, the i>=last clamp branch, and the twin 3-deep
 * Horner fixed-point evaluations all map 1:1. The residual is a PURE whole-function
 * register-coloring / spill-decision divergence, same class as the sibling sub_800A594 --
 * NOT a structural error.
 *
 * Residual measured against the JP ROM bytes (asm assembled to target.o):
 *   plain -O2 (the real JP build flags)  : 600B, 515/600 bytes differ
 *   -fno-gcse                            : 584B (EXACT size 0x248), 536/584 bytes differ
 *   -mjp-promote                         : identical to plain -O2 (no sub-word promotion)
 *   -O1                                  : 580B, 506/580 differ
 * (The prior "534/584" figure was the -fno-gcse measurement; this re-derivation reproduces
 * it -- ~92% of the 2-byte Thumb encodings flip because a single whole-function register
 * renumber touches nearly every instruction. It is NOT beaten because the divergence is a
 * coloring PERMUTATION, not extra/missing work.)
 *
 * EXACT blocking hunk (prologue, plain -O2), JP ROM (target) vs this .c:
 *   JP:    4682 mov sl,r0            ; pts -> sl (r10)         frame sub sp,#0x78
 *          9018 str r0,[sp,#0x60]     ; i SPILLED to stack
 *          af05 add r7,sp,#0x14       ; coeffA(P14) -> r7
 *          ac09 add r4,sp,#0x24; 46a1 mov r9,r4   ; coeffB(P24) -> r9
 *          (tx/ty base ptrs computed lazily; count arg at [sp,#0x98])
 *   here:  1c06 adds r6,r0,#0         ; pts -> r6               frame sub sp,#0x84 (+12B)
 *          9018 str r0,[sp,#0x60]     ; i SPILLED too
 *          af05 add r7,sp,#0x14; 46ba mov sl,r7   ; coeffA(P14) -> sl  (<-- swapped)
 *          aa09 add r2,sp,#0x24; 4691 mov r9,r2   ; coeffB(P24) -> r9
 *          + GCSE HOISTS tx-ptr->[sp,#0x64] and ty-ptr->[sp,#0x68] eagerly (+2 spills,
 *            +12B frame, +16B code = 600 vs 584); -fno-gcse removes exactly this hoist,
 *            restoring size 0x248, but the pts<->coeffA reg swap coloring remains.
 *
 * Two decisions the JP build made that agbcc-here won't reproduce for this source:
 *   (1) pts kept in the high callee-saved sl(r10) while coeffA takes r7  (here: reversed);
 *   (2) the tx/ty scratch base pointers computed LAZILY (here: GCSE hoists+spills them).
 * agbcc's CALLER_SAVE_PROFITABLE = (4*CALLS < REFS) (regs.h:201) plus GCSE pressure drive
 * (1)/(2); neither is a forceable per-TU flag (docs/agbcc_codegen_levers.md §7/§9: the
 * spill-decision residual is a compute-time / community-match class).
 *
 * Levers tried (all reverted; none reached 0):
 *   - plain agbcc -O2                        : 600B, 515/600 differ
 *   - -fno-gcse (right size 0x248)           : 584B, 536/584 differ
 *   - -mjp-promote / -O1                      : no improvement
 *   - decomp-permuter -j12, 21000+ iters,
 *     --stop-on-zero                          : base score 12025 -> best 9115 (never
 *                                               approached 0; mutations = char last / temp
 *                                               reorders that never hit the pts<->coeffA
 *                                               coloring swap)
 *
 * CONCLUSION: deep agbcc whole-function reg-coloring/spill residual (structurally exact,
 * same class as sub_800A594). Graduate via a lucky permuter/community (decomp.me) hit ->
 * move to src/, flip the carved_rom row, drop asm. Until then the bytes come from
 * asm/sub_800A34C.s and `make compare` stays OK.
 * Callee sub_80D6378 (fixed-pt >>12 mul) is still baseline-incbin: bind it via a
 * baseline_syms thumb entry @0x080D6378 before any future carve. */
#include "global.h"

extern int sub_800A194(int *a, int *b, int *c, int *d, int n);
extern int sub_80D6378(int a, int b);

int sub_800A34C(int *pts, int *out, u16 *times, unsigned int t, int count)
{
    unsigned int ti;
    int i;
    int last;
    int k;
    unsigned int u;
    u16 *tp;
    int sub[4];
    int coeffA[4];
    int coeffB[4];
    int tan[8];
    int *tx;
    int *ty;
    int *txw;
    int *dp;
    int *p;
    int *ep0, *ep1;
    int px0, px1, py0, py1;
    int m0x, m1x, m0y, m1y;
    int ax, bx, ay, by, r;

    ti = t >> 12;
    i = 0;
    tx = &tan[0];
    ty = &tan[1];

    if (count - 1 > 0 && (ti < times[0] || ti >= times[1]))
    {
        do
        {
            i = i + 1;
            if (i >= count - 1)
                break;
            tp = &times[i];
        }
        while (ti < tp[0] || ti >= tp[1]);
    }

    coeffA[0] = 0x2000;
    coeffB[0] = 0x1000;
    tx[0] = -3 * (pts[0] - pts[2]);
    ty[0] = -3 * (pts[1] - pts[3]);
    last = count - 1;
    p = pts;
    if (count - 1 > 1)
    {
        dp = &sub[1];
        txw = tx + 2;
        for (k = 1; k < count - 1; k++)
        {
            *dp++ = 0x1000;
            coeffA[k] = 0x4000;
            coeffB[k] = 0x1000;
            *txw = -3 * (p[0] - p[4]);
            ty[2 * k] = -3 * (p[1] - p[5]);
            p += 2;
            txw += 2;
        }
    }

    sub[last] = 0x1000;
    coeffA[last] = 0x2000;
    ep0 = &pts[8 * count / 4 - 4];
    ep1 = &pts[8 * count / 4 - 2];
    tx[2 * last] = -3 * (ep0[0] - ep1[0]);
    ty[2 * last] = -3 * (ep0[1] - ep1[1]);

    sub_800A194(coeffA, coeffB, sub, tx, count);

    if (i >= last)
    {
        out[0] = ep1[0];
        out[1] = ep1[1];
        return r;
    }

    u = (t - (times[i] << 12)) / (times[i + 1] - times[i]);
    px0 = pts[2 * i];
    px1 = pts[2 * i + 2];
    m0x = tx[2 * i];
    m1x = tx[2 * (i + 1)];
    ax = 2 * (px0 - px1) + m0x + m1x;
    bx = 3 * (px1 - px0) - 2 * m0x - m1x;
    py0 = pts[2 * i + 1];
    py1 = pts[2 * i + 3];
    m0y = ty[2 * i];
    m1y = ty[2 * (i + 1)];
    ay = 2 * (py0 - py1) + m0y + m1y;
    by = 3 * (py1 - py0) - 2 * m0y - m1y;

    out[0] = sub_80D6378(0x1000, u * (sub_80D6378(0x1000, u * (sub_80D6378(0x1000, u * ax) + bx)) + m0x)) + px0;
    out[1] = sub_80D6378(0x1000, u * (sub_80D6378(0x1000, u * (sub_80D6378(0x1000, u * ay) + by)) + m0y)) + py0;

    return r;
}
