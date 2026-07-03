/* NON_MATCHING: byte source is asm/sub_800A594.s @ JP 0x0800A594 (region-different,
 * gbadisasm descriptive asm; carved_rom places those bytes). This C DOCUMENTS the
 * reconstruction and is NOT in make-compare: compiled only by `make nonmatching`.
 *
 * Proposed name: SplineSampleAtTime.
 * JP-only spline driver (no fe8u twin), reconstructed from asm + IDA.
 *
 * Sits directly above its sibling evaluator sub_800A34C (JP-only Catmull-Rom /
 * natural-cubic-spline 2D evaluator) and DRIVES it: given an (x,y,time) control-point
 * array it optionally wraps the query time modulo the spline period (loop mode via the
 * BIOS DivArm remainder helper sub_80D6384 == v % m), binary-walks the control points to
 * find the segment containing (t >> 12), materialises a 3-point window (wrap-around for
 * the closed/loop case, clamped for the open case) into scratch buffers, calls
 * sub_800A34C(lpts, lout, ltimes, t, 3) to interpolate, stores the resulting (x,y) into
 * *out, and returns the segment index it settled on.
 *
 * Callees:
 *   sub_800A34C = JP-only spline evaluator (asm-carved neighbour; a real global).
 *   sub_80D6384 = GBA BIOS DivArm (SWI 7) *remainder* wrapper: `svc 7; adds r0,r1,#0; bx lr`
 *                 => sub_80D6384(m, v) == v % m  (wraps the query time into [0, lastTime<<12)).
 *                 (Its neighbour sub_80D6378 `svc 7; bx lr` is the DivArm *quotient* == v/m
 *                 == the >>12 the sibling documents. Both are baseline-incbin BIOS stubs.)
 *
 * ---- MATCH STATUS: NONMATCHING-C-DOCUMENTED (agbcc spill-decision / reg-coloring wall) ----
 * The reconstruction is STRUCTURALLY exact: same control-flow graph, same instruction
 * sequence/opcodes as the JP ROM. The residual is a pure register-allocation / stack-spill
 * coloring divergence (docs/agbcc_codegen_levers.md §7/§9: "the spill-decision residual is
 * NOT a forceable per-TU flag" -- a compute-time / community-match class). agbcc-here colors
 * differently than the JP build:
 *
 *   what          JP ROM build (target)                 this reconstruction (agbcc-here)
 *   ------------  ------------------------------------  ---------------------------------
 *   frame         sub sp,#0x3c (60)                     sub sp,#0x34 (52)  [8B smaller]
 *   `pts`         r7  (adds r7,r0,#0)                   r6  (adds r6,r0,#0)
 *   `count`       SPILLED to [sp,#0x2c], reloaded       kept in callee-saved sl (no reload)
 *                 each use (ldr; subs #1 / subs #2)
 *   `i`           r9  (mov r9,r0)                       r8  (mov r8,r0)
 *   `&lout`       SPILLED to [sp,#0x38]                 kept in r9
 *   `t`/`out`     [sp,#0x30]/[sp,#0x34]                 [sp,#0x2c]/[sp,#0x30]
 *
 * Exact blocking hunk (prologue), JP ROM (baserom.gba @0x0800A594) vs this .c:
 *   JP:   b08f sub sp,#0x3c | 1c07 adds r7,r0,#0 | 910b str r1,[sp,#0x2c] (count->stack)
 *         920c str r2,[sp,#0x30] | 930d str r3,[sp,#0x34] | ... | 4681 mov r9,r0 (i)
 *         9a0b ldr r2,[sp,#0x2c]; 3a02 subs r2,#2  (reload count-2)
 *   here: b08d sub sp,#0x34 | 1c06 adds r6,r0,#0 | 468a mov sl,r1 (count->reg)
 *         920b str r2,[sp,#0x2c] | 930c str r3,[sp,#0x30] | ... | 4680 mov r8,r0 (i)
 *         4650 mov r0,sl;        3802 subs r0,#2  (count-2 from reg, no reload)
 *
 * agbcc-wall hypothesis: agbcc's CALLER_SAVE_PROFITABLE = (4*CALLS < REFS) (regs.h:201) keeps
 * `count` in a callee-saved reg here (2 calls, ~6 refs), whereas the JP build spilled it and
 * kept `pts` in r7 -- a whole-function coloring shift that renumbers nearly every register
 * (=> 421/500 bytes differ, all encoding-level, none semantic).
 *
 * Levers tried (all reverted; none reached 0):
 *   - plain agbcc -O2                : 476B, 421/500 differ
 *   - -mjp-promote                   : identical (476B, 421) -- no sub-word promotion here
 *   - volatile `count` (§9e reload)  : WORSE (520B, 460 differ)
 *   - register pin `pts asm("r7")`   : shadows-param warning, no improvement
 *   - decomp-permuter -j4, 3471 iter : base score 7215 -> best 5795 (never approached 0)
 *
 * CONCLUSION: deep agbcc spill/reg-coloring residual, same class as the sibling sub_800A34C.
 * Graduate via a lucky permuter/community (decomp.me) hit -> move to src/, flip the carved_rom
 * row, drop asm. Until then the bytes come from asm/sub_800A594.s and `make compare` stays OK. */
#include "global.h"

struct SplineCtrlPoint
{
    /* 0x0 */ s16 x;
    /* 0x2 */ s16 y;
    /* 0x4 */ u16 time;
    /* 0x6 */ u16 unk6;
};

struct Vec2s16
{
    /* 0x0 */ s16 x;
    /* 0x2 */ s16 y;
};

extern int sub_800A34C(int *pts, int *out, u16 *times, unsigned int t, int count);
extern int sub_80D6384(int m, int v); /* BIOS DivArm remainder: v % m */

int SplineSampleAtTime(struct SplineCtrlPoint *pts, int count, unsigned int t,
                       struct Vec2s16 *out, u8 loop)
{
    int lpts[6];
    u16 ltimes[3];
    int lout[2];
    int i;
    int j;
    int slot;
    int dtime;
    unsigned int ti;

    if (loop)
    {
        t = sub_80D6384(pts[count - 1].time << 12, t);
        ti = t >> 12;
        i = 0;
        if (count - 2 > 0 && (ti < pts[0].time || ti >= pts[1].time))
        {
            do
            {
                i++;
                if (i >= count - 2)
                    break;
            }
            while (ti < pts[i].time || ti >= pts[i + 1].time);
        }

        if (i == 0)
        {
            dtime = pts[count - 1].time - pts[count - 2].time;
            lpts[0] = pts[count - 2].x;
            lpts[1] = pts[count - 2].y;
            ltimes[0] = i;
            j = 0;
            for (slot = 1; slot <= 2; slot++)
            {
                lpts[2 * slot] = pts[j].x;
                lpts[2 * slot + 1] = pts[j].y;
                ltimes[slot] = pts[j].time + dtime;
                if (j < count - 1)
                    j++;
            }
            t += dtime << 12;
        }
        else
        {
            j = i - 1;
            for (slot = 0; slot <= 2; slot++)
            {
                lpts[2 * slot] = pts[j].x;
                lpts[2 * slot + 1] = pts[j].y;
                ltimes[slot] = pts[j].time;
                j++;
            }
        }
    }
    else
    {
        ti = t >> 12;
        i = 0;
        if (count - 1 > 0 && (ti < pts[0].time || ti >= pts[1].time))
        {
            do
            {
                i++;
                if (i >= count - 1)
                    break;
            }
            while (ti < pts[i].time || ti >= pts[i + 1].time);
        }

        if (i == 0)
        {
            j = 0;
            for (slot = 0; slot <= 2; slot++)
            {
                lpts[2 * slot] = pts[j].x;
                lpts[2 * slot + 1] = pts[j].y;
                ltimes[slot] = pts[j].time;
                if (slot < count - 1)
                    j++;
            }
        }
        else
        {
            j = i - 1;
            for (slot = 0; slot <= 2; slot++)
            {
                lpts[2 * slot] = pts[j].x;
                lpts[2 * slot + 1] = pts[j].y;
                ltimes[slot] = pts[j].time;
                if (j < count - 1)
                    j++;
            }
        }
    }

    sub_800A34C(lpts, lout, ltimes, t, 3);
    out->x = lout[0];
    out->y = lout[1];
    return i;
}
