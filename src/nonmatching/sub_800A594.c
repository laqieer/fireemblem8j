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
 * ---- MATCH STATUS: IMPROVED NONMATCHING SEED (2026-07-11; still not byte-exact) ----
 * A compiler-researched spill seed now reproduces the JP allocation anchors that the old
 * 0x1DC-byte staging body missed. It uses hard registers only for roles directly observed
 * in the ROM (`i`=r9, `dtime`=sl, `ltimesp`=r8), an empty `+r` lifetime fence, and
 * GCC-2.95-compatible `+m` barriers for `count`, `t`, `out`, and `outp`. The Makefile
 * applies `-fno-rerun-cse-after-loop` to this staging object only.
 *
 *   anchor                    JP ROM target              retained seed
 *   ------------------------  -------------------------  -------------------------
 *   .text extent / frame      0x1F4 / sub sp,#0x3C      0x1F4 / sub sp,#0x3C
 *   stack arrays              lout@24                   lout@24
 *   forced homes              count@2C,t@30,out@34      count@2C,t@30,out@34
 *   `outp == &lout` home      [sp,#0x38]                [sp,#0x38]
 *   high-register roles       i=r9,ltimesp=r8,dtime=sl  i=r9,ltimesp=r8,dtime=sl
 *   remaining root residual   pts=r7                    pts=r5
 *
 * The unresolved `pts` r5->r7 choice cascades through the low-register coloring and setup
 * schedule. In particular, JP reloads `count-2` before materialising ltimesp/outp and emits
 * a direct `beq` to the open-spline arm; this seed materialises ltimesp/outp first and needs
 * the expanded `bne; b` form. Do NOT hard-pin `pts`: that form is already known to miscompile
 * this reconstruction. Only declaration/barrier ordering was varied.
 *
 * Objective improvement over the trusted prior C (target comparison includes size delta):
 *   prior:  extent 0x1DC, frame 0x34, 441/500 positional byte mismatches,
 *           234/250 positional halfword mismatches.
 *   seed:   extent 0x1F4, frame 0x3C, 422/500 positional byte mismatches,
 *           221/250 positional halfword mismatches, plus every stack/high-reg anchor above.
 *
 * Bounded follow-up variants (maximum four, none reached score 0):
 *   1. declare `ti` before i/j/slot                         -> identical (422 bytes)
 *   2. swap j/slot declaration order                       -> identical (422 bytes)
 *   3. split/reorder parameter-vs-outp `+m` barriers       -> worse (424 bytes)
 *   4. move the ltimesp `+r` fence before outp assignment  -> identical (422 bytes)
 *
 * Semantic evidence for the retained seed:
 *   prove_nonmatching.py sub_800A594              -> PROVEN-BOUNDED(1)
 *   differential_test.py sub_800A594 --trials 60 -> EQUIV
 *      (signature kept on one line so the harness models all five args:
 *       ptr,val,val,ptr,val).
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
    unsigned int ti;

    if (loop)
    {
        t = sub_80D6384(pts[count - 1].time << 12, t);
        ti = t >> 12;
        i = 0;
        ltimesp = ltimes;
        outp = lout;
        asm("" : "+r"(ltimesp));
        asm("" : "+m"(count), "+m"(t), "+m"(out), "+m"(outp));

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
        outp = lout;
        asm("" : "+r"(ltimesp));
        asm("" : "+m"(count), "+m"(t), "+m"(out), "+m"(outp));
        dtime = count - 1;

        if (dtime > 0 && (ti < pts[0].time || ti >= pts[1].time))
        {
            do
            {
                i++;
                if (i >= dtime)
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

    sub_800A34C(lpts, outp, ltimesp, t, 3);
    out->x = outp[0];
    out->y = outp[1];
    return i;
}
