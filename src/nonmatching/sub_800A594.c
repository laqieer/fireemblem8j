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
 * ---- MATCH STATUS: IMPROVED NONMATCHING SEED (2026-07-13; score 371) ----
 * The retained bounded entry-allocator follow-up adds two semantics-neutral source levers:
 *
 *   register struct SplineCtrlPoint *pts_r7 asm("r7");
 *   asm volatile("" : "=r"(pts_r7) : "0"(pts) : "r5", "r6");
 *   ...
 *   call_out = outp;
 *
 * The empty tied asm emits zero bytes and does not pin the formal `pts` parameter. Its
 * point-scoped r5/r6 clobbers only change allocation: formal pts moves from r6 to r4, then
 * reload copies r4->r7 at +0x1A. The real tail alias is used for the evaluator call and
 * both result loads; it aligns that BL with the target at +0x1D0.
 *
 *   anchor                    JP ROM target              retained candidate
 *   ------------------------  -------------------------  -------------------------
 *   .text extent / frame      0x1F4 / sub sp,#0x3C      0x1F4 / sub sp,#0x3C
 *   forced homes              count@2C,t@30,out@34      count@2C,t@30,out@34
 *   `outp == &lout` home      [sp,#0x38]                [sp,#0x38]
 *   high-register roles       i=r9,ltimesp=r8,dtime=sl  i=r9,ltimesp=r8,dtime=sl
 *   entry / search pts        r7 at +0x0C               r4 at +0x0C; r7 at +0x1A
 *   evaluator BL              +0x1D0                     +0x1D0
 *   residual / hosted score   0                          371/500 (208/250); Sp10a 9946
 *
 * Exact allocator trace: assign_parms emits pts r22=r0 at UID4, count/t/out homes at
 * UIDs6/8/10, and u8 loop normalisation at UIDs12/15/16 before tied asm UID26. Baseline
 * global allocation orders the long allocnos ...r34,r38,r33,r39,r22,r248: r22 has
 * 8 refs/live-length 143, crosses one call, prefers LO_REGS, takes r6, while outp reload
 * r248 (5/87) takes r7; reload UID927 inserts r7=r6. The retained clobbers add hard
 * conflicts r5/r6 to r22, yielding r22->r4, r34->r5, r33->r6 and reload UID924 r7=r4.
 * A {r4,r5,r6} mask did force direct r0->r7 at +0x0C but worsened to 428/496.
 *
 * Bounded probes: 8 zero-byte entry-clobber candidates (best 371), 6 temporary-r6
 * entry-pressure forms (best 394), and 6 pseudo-order variants (best 376; none changed
 * the entry home). Live Sp10a harvest found one family member and no forks.
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
 * 86f9c30aec45e792d9435eb3e18160dc73fb747d8b0e1c6d0acd02c1266862e5);
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
    int *call_out;
    unsigned int ti;
    int limit;

    {
        register struct SplineCtrlPoint *pts_r7 asm("r7");

        asm volatile("" : "=r"(pts_r7) : "0"(pts) : "r5", "r6");

        if (loop)
        {
            t = sub_80D6384(pts_r7[count - 1].time << 12, t);
            ti = t >> 12;
            i = 0;
            limit = count - 2;
            ltimesp = ltimes;
            outp = lout;
            asm("" : "+r"(ltimesp));
            asm("" : "+m"(count), "+m"(t), "+m"(out), "+m"(outp));
            asm("" : "+r"(pts_r7));

            if (limit > 0 && (ti < pts_r7[0].time || ti >= pts_r7[1].time))
            {
                do
                {
                    i++;
                    if (i >= limit)
                        break;
                    asm("" : "+r"(pts_r7));
                }
                while (ti < pts_r7[i].time || ti >= pts_r7[i + 1].time);
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
            outp = lout;
            asm("" : "+r"(ltimesp));
            asm("" : "+m"(count), "+m"(t), "+m"(out), "+m"(outp));
            dtime = count - 1;
            asm("" : "+r"(pts_r7));

            if (dtime > 0 && (ti < pts_r7[0].time || ti >= pts_r7[1].time))
            {
                do
                {
                    i++;
                    if (i >= dtime)
                        break;
                    asm("" : "+r"(pts_r7));
                }
                while (ti < pts_r7[i].time || ti >= pts_r7[i + 1].time);
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
