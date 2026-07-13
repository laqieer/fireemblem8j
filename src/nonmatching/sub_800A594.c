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
 * ---- MATCH STATUS: IMPROVED NONMATCHING SEED (2026-07-13; score 369) ----
 * A deterministic allocator-state superoptimizer retained this semantics-real form:
 *
 *   pts_r7 = pts;
 *   asm volatile("" : "+r"(pts_r7));
 *   ...
 *   setup_out = lout;
 *   outp = setup_out;
 *   ...
 *   asm volatile("" : "+r"(pts_r7) : : "r5", "r6");
 *
 * The entry assignment/fence emits the same r4->r7 reload as the score-371 seed; it does
 * not pin the formal. The point-scoped r5/r6 clobbers move from the entry tie to each
 * phase's consumed pts fence, after the real setup_out/outp definitions and stack-home
 * barrier. `i < bound` plus the equivalent negated in-range test completes the allocator
 * nudge without changing behavior.
 *
 *   anchor                    JP ROM target              retained candidate
 *   ------------------------  -------------------------  -------------------------
 *   .text extent / frame      0x1F4 / sub sp,#0x3C      0x1F4 / sub sp,#0x3C
 *   forced homes              count@2C,t@30,out@34      count@2C,t@30,out@34
 *   `outp == &lout` home      [sp,#0x38]                [sp,#0x38]
 *   high-register roles       i=r9,ltimesp=r8,dtime=sl  i=r9,ltimesp=r8,dtime=sl
 *   entry / search pts        r7 at +0x0C               r4 at +0x0C; r7 at +0x1A
 *   evaluator BL              +0x1D0                     +0x1D0
 *   residual / hosted score   0                          369/500 (208/250); Sp10a 9281
 *
 * Search accounting (corrected deterministic run):
 *   generated / normalized unique / source duplicates   36,864 / 36,864 / 0
 *   compile failures                                    0
 *   pruned: frame / homes / prologue                     384 / 0 / 0
 *   pruned: extent / evaluator anchors                   31,968 / 1,008
 *   normalized-assembly duplicates / compiled+scored     3,478 / 26
 *
 * Two unique assemblies scored 369. Both were inspected and passed the semantic/full
 * gates below. The retained one is the lower-risk tie-break: versus score 371 it changes
 * only six object bytes, makes target offsets +0x47 and +0x49 exact, and changes no
 * previously-correct byte to wrong. The alternative changed fourteen bytes for the same
 * score. Neither form produces the target's direct r0->r7 at +0x0C; the objective was the
 * numeric residual, and 369 is the safe strict improvement.
 *
 * Live family harvest before the search: Sp10a NONE, one family member, hosted
 * base/best 9946. The retained source was synchronized to the owned scratch and recompiles
 * there at 9281; the active registry row remains owned by this target.
 *
 * Semantic and build evidence for the retained form:
 *   $HOME/z3-venv/bin/python scripts/tools/thumb_equiv/prove_nonmatching.py
 *       sub_800A594                                -> PROVEN-BOUNDED(1)
 *   $HOME/z3-venv/bin/python scripts/tools/thumb_equiv/differential_test.py
 *       sub_800A594 --trials 60                   -> EQUIV 60/60
 *       ret4B args=['ptr','val','val','ptr','val'] (all five arguments modeled).
 *   make check-nonmatching; make nonmatching; make check; make compare; make shiftcheck
 *       -> all pass, fireemblem8.gba: OK, no stale compile errors, 0 HIGH.
 * Project and Sp10a bodies are byte-identical (SHA-256
 * a8a9ca26cb27eef44cdfec1674fdc7d8aa1cefb5556ab3eb28cf7ea4832c621b);
 * the Sp10a registry row remains active.
 *
 * Historical attempts retained for provenance: plain -O2 was 0x1DC; -mjp-promote was
 * identical; volatile count was worse (0x208); the old 3471-iteration permuter run
 * plateaued at 5795. Until a score-0 source is found, bytes still come from
 * asm/sub_800A594.s and `make compare` remains unchanged. */
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

int SplineSampleAtTime(struct SplineCtrlPoint *pts, int count, unsigned int t, struct Vec2s16 *out, u8 loop)
{
    int lpts[6];
    u16 ltimes[3];
    int lout[2];
    register int i asm("r9");
    int j;
    int slot;
    register int dtime asm("sl");
    register u16 *ltimesp asm("r8");
    int *outp;
    int *setup_out;
    int *call_out;
    unsigned int ti;
    int limit;

    {
        register struct SplineCtrlPoint *pts_r7 asm("r7");

        pts_r7 = pts;
        asm volatile("" : "+r"(pts_r7));

        if (loop)
        {
            t = sub_80D6384(pts_r7[count - 1].time << 12, t);
            ti = t >> 12;
            i = 0;
            limit = count - 2;
            ltimesp = ltimes;
            setup_out = lout;
            outp = setup_out;
            asm("" : "+r"(ltimesp));
            asm("" : "+m"(count), "+m"(t), "+m"(out), "+m"(outp));
            asm volatile("" : "+r"(pts_r7) : : "r5", "r6");

            if (i < limit && !(ti >= pts_r7[0].time && ti < pts_r7[1].time))
            {
                do
                {
                    i++;
                    if (i >= limit)
                        break;
                    asm("" : "+r"(pts_r7));
                }
                while (!(ti >= pts_r7[i].time && ti < pts_r7[i + 1].time));
            }

            if (i == 0)
            {
                dtime = pts[count - 1].time - pts[limit].time;
                lpts[0] = pts[limit].x;
                lpts[1] = pts[limit].y;
                ltimesp[0] = i;
                j = 0;
                for (slot = 1; slot <= 2; slot++)
                {
                    lpts[2 * slot] = pts[j].x;
                    lpts[2 * slot + 1] = pts[j].y;
                    ltimesp[slot] = pts[j].time + dtime;
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
                    ltimesp[slot] = pts[j].time;
                    j++;
                }
            }
        }
        else
        {
            ti = t >> 12;
            i = 0;
            ltimesp = ltimes;
            setup_out = lout;
            outp = setup_out;
            dtime = count - 1;
            asm("" : "+r"(ltimesp));
            asm("" : "+m"(count), "+m"(t), "+m"(out), "+m"(outp));
            asm volatile("" : "+r"(pts_r7) : : "r5", "r6");

            if (i < dtime && !(ti >= pts_r7[0].time && ti < pts_r7[1].time))
            {
                do
                {
                    i++;
                    if (i >= dtime)
                        break;
                    asm("" : "+r"(pts_r7));
                }
                while (!(ti >= pts_r7[i].time && ti < pts_r7[i + 1].time));
            }

            if (i == 0)
            {
                j = 0;
                for (slot = 0; slot <= 2; slot++)
                {
                    lpts[2 * slot] = pts[j].x;
                    lpts[2 * slot + 1] = pts[j].y;
                    ltimesp[slot] = pts[j].time;
                    if (slot < dtime)
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
                    ltimesp[slot] = pts[j].time;
                    if (j < dtime)
                        j++;
                }
            }
        }
    }

    call_out = outp;
    sub_800A34C(lpts, call_out, ltimesp, t, 3);
    out->x = call_out[0];
    out->y = call_out[1];
    return i;
}
