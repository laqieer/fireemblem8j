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
 * The retained follow-up applies the matched DecodeAndVerifyArenaRecord lifetime lever
 * without pinning the formal `pts` parameter. A pre-call lexical scope gives only the
 * wrap/search phase the exact local alias
 * `register struct SplineCtrlPoint *pts_r7 asm("r7") = pts;`; empty `+r` fences keep
 * that alias valid at the two search backedges, and the copy arms deliberately return to
 * ordinary `pts` before r7 is reused. The loop arm also materialises
 * `i = 0; limit = count - 2;` before ltimesp/outp, which restores the target's direct
 * conditional branch. Existing hard-register roles and the per-object
 * `-fno-rerun-cse-after-loop` flag remain unchanged.
 *
 *   anchor                    JP ROM target              retained candidate
 *   ------------------------  -------------------------  -------------------------
 *   .text extent / frame      0x1F4 / sub sp,#0x3C      0x1F4 / sub sp,#0x3C
 *   forced homes              count@2C,t@30,out@34      count@2C,t@30,out@34
 *   `outp == &lout` home      [sp,#0x38]                [sp,#0x38]
 *   high-register roles       i=r9,ltimesp=r8,dtime=sl  i=r9,ltimesp=r8,dtime=sl
 *   entry / search pts        r7 at +0x0C               formal r6 at +0x0C;
 *                                                          search alias r7 at +0x18
 *   loop setup                ti=r3,limit=r2,ip live     ti=r1,limit=r3,no ip
 *   loop/open selector        direct beq                 direct beq
 *
 * Remaining blocker: the target has one continuous pts-in-r7 lifetime from entry through
 * each search and only then reuses r7 as the signed-load scratch. Here the formal survives
 * in r6, the scoped alias is copied into r7 after the parameter homes, and the copy arms use
 * r6 before r7 becomes `outp`. Broadening the local-register scope is not valid GCC 2.95 C:
 * it can self-clobber r7 while still using it as the pts base, or omit r7 from the save mask.
 * The formal parameter itself is therefore still never hard-pinned.
 *
 * Objective target comparison (size delta included):
 *   trusted seed:       0x1F4, 422/500 byte mismatches, 221/250 halfword mismatches
 *   retained follow-up: 0x1F4, 405/500 byte mismatches, 223/250 halfword mismatches
 * The byte residual improves by 17 while preserving every frame/home/high-register anchor.
 *
 * Deterministic scoped-alias campaign (12-variant cap; no ordering permuter lanes):
 *   V1  outer alias, all accesses                 0x200 481/512 INVALID self-clobber
 *   V2  V1 + start fence                          0x200 481/512 INVALID self-clobber
 *   V3  V2 + ordered limit                        0x1F4 415/500 INVALID self-clobber
 *   V4  search fences + branch-local bases        0x1F0 453/500 INVALID handoff
 *   V5  V4 + last-use fences                      0x1E8 466/500 INVALID save mask
 *   V6  per-arm aliases + ordered limit           0x1F8 404/504 INVALID self-clobber
 *   V7  tiny alias copied back to formal          0x1F0 431/500 INVALID address
 *   V8  fully fenced per-arm aliases              0x1F0 436/500 INVALID save mask
 *   V9  search-only per-arm aliases               0x1F8 440/504 VALID, worse
 *   V10 alias copied to ordinary pointer          0x1E8 447/500 INVALID address
 *   V11 ordered limit only                        0x1E4 435/500 VALID, worse
 *   V12 outer alias, search-only accesses         0x1F4 405/500 VALID, RETAINED
 *
 * Semantic evidence for V12:
 *   $HOME/z3-venv/bin/python scripts/tools/thumb_equiv/prove_nonmatching.py
 *       sub_800A594                                -> PROVEN-BOUNDED(1)
 *   $HOME/z3-venv/bin/python scripts/tools/thumb_equiv/differential_test.py
 *       sub_800A594 --trials 60                   -> EQUIV 60/60
 *       ret4B args=['ptr','val','val','ptr','val'] (all five arguments modeled).
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
    int limit;

    {
        register struct SplineCtrlPoint *pts_r7 asm("r7") = pts;

        asm("" : "+r"(pts_r7));

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

    sub_800A34C(lpts, outp, ltimesp, t, 3);
    out->x = outp[0];
    out->y = outp[1];
    return i;
}
