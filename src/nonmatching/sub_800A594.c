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
 * ---- MATCH STATUS: IMPROVED NONMATCHING SEED (2026-07-13; still not byte-exact) ----
 * The retained follow-up keeps the 2026-07-11 scoped search alias and changes only its
 * first materialisation:
 *
 *   register struct SplineCtrlPoint *pts_r7 asm("r7");
 *   asm volatile("" : "=r"(pts_r7) : "0"(pts));
 *
 * This is an empty, tied output/input allocator constraint: it emits no instruction of
 * its own and does not hard-pin the formal `pts` parameter. Compared with the previous
 * `= pts; asm("" : "+r"(pts_r7));` form, the volatile allocation point changes later
 * block coloring enough to improve the positional byte residual by 11. Existing r9/sl/r8
 * roles, the ordered `limit`, stack-home barriers, and the per-object
 * `-fno-rerun-cse-after-loop` flag remain unchanged.
 *
 *   anchor                    JP ROM target              retained candidate
 *   ------------------------  -------------------------  -------------------------
 *   .text extent / frame      0x1F4 / sub sp,#0x3C      0x1F4 / sub sp,#0x3C
 *   forced homes              count@2C,t@30,out@34      count@2C,t@30,out@34
 *   `outp == &lout` home      [sp,#0x38]                [sp,#0x38]
 *   high-register roles       i=r9,ltimesp=r8,dtime=sl  i=r9,ltimesp=r8,dtime=sl
 *   entry / search pts        r7 at +0x0C               formal r6 at +0x0C;
 *                                                          search alias r7 at +0x1A
 *   loop flag test            lsl; cmp                   lsl; lsr; alias-copy; cmp
 *   loop setup                ti=r3,limit=r2,ip live     ti=r1,limit=r3,no ip
 *   loop/open selector        direct beq                 direct beq
 *
 * Remaining blocker: the target has one continuous pts-in-r7 lifetime from entry through
 * each search and only then reuses r7 as the signed-load scratch. Here the formal survives
 * in r6, agbcc zero-normalises the u8 loop flag, and the scoped alias is copied into r7 only
 * after the parameter homes. All-pts tied variants did produce the desired `adds r7,r0,#0`,
 * but only after those homes and with 415+ byte residuals. The formal parameter itself is
 * therefore still never hard-pinned.
 *
 * Objective target comparison (size delta included):
 *   prior retained V12: 0x1F4, 405/500 byte mismatches, 223/250 halfword mismatches
 *   retained tied form: 0x1F4, 394/500 byte mismatches, 224/250 halfword mismatches
 *   decomp.me Sp10a:    hosted 10140 -> candidate compile 10100
 *
 * Bounded 2026-07-13 campaign:
 *   PATH L source archaeology       2 candidates; best 432/496
 *   PATH M forced-inline extraction 12 variants; every helper inlined, best 454/488
 *   PATH N tied ABI-copy synthesis  24 probes; N2/N16 best 394/500
 *   PATH O declaration/frame search 12 variants; best tied 394/500
 * Live harvest found one Sp10a family member, no forks. GitHub/FE8U/FE7J/FE6J searches
 * found no genuine counterpart; the FE7J 0805BF2C BinDiff suggestion is unrelated banim.
 *
 * RTL evidence for the retained form: formal pts pseudo r22 has 8 refs/live-length 143
 * and crosses the wrap call; it conflicts with ti r38 (14/77), limit r39 (5/43),
 * j r33 (15/108), and slot r34 (38/174). The fixed r7 tied pseudo remains distinct,
 * explaining the surviving r6->r7 copy and setup rotation.
 *
 * Semantic evidence for the retained tied form:
 *   $HOME/z3-venv/bin/python scripts/tools/thumb_equiv/prove_nonmatching.py
 *       sub_800A594                                -> PROVEN-BOUNDED(1)
 *   $HOME/z3-venv/bin/python scripts/tools/thumb_equiv/differential_test.py
 *       sub_800A594 --trials 60                   -> EQUIV 60/60
 *       ret4B args=['ptr','val','val','ptr','val'] (all five arguments modeled).
 * The project and Sp10a function bodies are byte-identical source text
 * (SHA-256 071c7ed094e5a0d836904a7f9915ca11941fe8b0ecd0e73b790aabed44a38055).
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
        register struct SplineCtrlPoint *pts_r7 asm("r7");

        asm volatile("" : "=r"(pts_r7) : "0"(pts));

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
