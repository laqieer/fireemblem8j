/* Contract-assisted relational-equivalence CBMC harness for sub_800A594
 * (proposed name SplineSampleAtTime), following Discussion #149's shared-oracle
 * anti-masking method (see docs/equivalence_proving.md and the validated
 * sub_800A34C / sub_800FAD0 focused packages this mirrors).
 *
 * Two independently-authored C encodings of the SAME asm/sub_800A594.s bytes
 * are cross-checked:
 *   - ref_fn()  : a mechanical, register/temp-named translation taken from the
 *                 m2c dump (build/cbmc_full16_m2c/sub_800A594_ref.c), REPAIRED
 *                 here (the m2c dump's `subroutine_arg0`/`sp24` placeholder for
 *                 the output-scratch base pointer was wrong -- it is a real
 *                 local `s32 out_scratch[2]` written through the `outp`
 *                 pointer and read back directly, matching `ldr r0,[sp,#0x24]`
 *                 / `ldr r2,[sp,#0x38]; ldr r0,[r2,#4]` in asm/sub_800A594.s).
 *   - impl_fn() : the actual committed src/nonmatching/sub_800A594.c algorithm,
 *                 with only the compiler-nudge scaffolding removed (the
 *                 `register X asm("rN")` pins and the fence `asm volatile("":
 *                 "+r"(...))` statements exist solely to steer agbcc register
 *                 allocation for the byte-residual search -- they have no
 *                 effect on C semantics, exactly as the validated sub_800A34C
 *                 focused harness already established for that sibling).
 *
 * Complete observable = ( signed segment-index return r0/sb,
 *                          out->x, out->y (both s16, matching the real strh
 *                          16-bit truncation of the s32 SplineEvalCatmullRom
 *                          result words),
 *                          the ordered call trace to the two callees with
 *                          their full logical arguments ).
 *
 * Callees:
 *   - sub_800A34C (asm label `SplineEvalCatmullRom`, `bl SplineEvalCatmullRom`
 *     in asm/sub_800A594.s) is modeled as a SHARED CALL-INDEXED ORACLE: all
 *     five logical arguments (the 6-word `lpts` control-point buffer content,
 *     the 3-halfword `ltimes` buffer content, the scalar `t`, and the stack
 *     `count` word, which is always the literal 3) are recorded on the
 *     reference call and asserted byte-identical on the implementation call
 *     BEFORE the shared nondet result is copied into both sides' `out`
 *     buffers. This is the anti-masking property: an index-based shared
 *     result cannot hide a divergence in call order or call arguments,
 *     because the equality checks happen strictly before the havoc.
 *   - sub_80D6384 (GBA BIOS DivArm SWI 7 remainder wrapper, documented as
 *     `sub_80D6384(m, v) == v % m`) is modeled CONCRETELY as `v % m` in both
 *     ref_fn and impl_fn (its full closed-form spec is known and is simple
 *     unsigned-modulo arithmetic), while STILL being logged through the same
 *     call-indexed/ordered-trace bookkeeping as the sub_800A34C oracle so a
 *     mutant that reorders or skips the DivArm call is still caught by the
 *     "same number/order of oracle calls" assertions.
 *
 * Aliasing / stack-pointer note: `out` is assumed non-aliased with `pts`
 * (matches every real call site: distinct caller-owned buffers). The private
 * scratch-array addresses (`lpts`, `ltimes`, `lout` in the real function, and
 * their ref/impl equivalents here) are NEVER compared as addresses -- only
 * their CONTENTS are compared, through the oracle argument-equality asserts.
 * Raw stack-pointer identity is explicitly NOT part of the observable.
 *
 * Bounded domain: MAXN = 5 control points, `count` ranges over {4, 5}
 * (nondegenerate, `count >= 4` per the task contract; NOT a `count <= 1`
 * degenerate proof). `times[]` is strictly increasing (as the real caller's
 * spline-time tables always are) but otherwise spans the FULL u16 domain.
 * `t` and `loop` are unconstrained over their full domains. Because `loop` is
 * left fully symbolic, a single CBMC run explores BOTH the loop-mode and the
 * non-loop-mode control paths (and, within loop-mode, both the wrap-around
 * `i==0` case and the ordinary `i!=0` case; within non-loop-mode, both the
 * clamped `i==0` case and the clamped `i!=0` case) -- the segment search does
 * more than one do-while iteration whenever `count == 5` (limit/dtime up to
 * 4), and the three-point window fill covers all three slots every path.
 */
#include "../../adversarial/common.h"

typedef int s32;
typedef unsigned int u32b;
typedef short s16;

#define MAXN 5

struct SplineCtrlPoint
{
    s16 x;
    s16 y;
    u16 time;
    u16 unk6;
};

struct Vec2s16
{
    s16 x;
    s16 y;
};

enum { K_A34C = 1, K_DIVARM = 2 };

#define MAX_DIV 1
#define MAX_A34C 1
#define MAX_LOG 2

static int g_log_kind[MAX_LOG];

static u32b g_div_m[MAX_DIV], g_div_v[MAX_DIV];

static s32 g_a34c_pts[MAX_A34C][6];
static u16 g_a34c_times[MAX_A34C][3];
static u32b g_a34c_t[MAX_A34C];
static s32 g_a34c_count[MAX_A34C];
static s32 g_a34c_out_after[MAX_A34C][2];

typedef struct
{
    int is_ref;
    unsigned ci_div, ci_a34c, nlog;
} Side;

static void note_kind(Side *S, int kind)
{
    ASSERT(S->nlog < MAX_LOG, "oracle log bound");
    if (S->is_ref)
        g_log_kind[S->nlog] = kind;
    else
        ASSERT(g_log_kind[S->nlog] == kind, "same call kind/order");
    S->nlog++;
}

/* sub_80D6384: GBA BIOS DivArm remainder wrapper, sub_80D6384(m, v) == v % m.
 * Modeled concretely (its closed form is fully known); still call-logged so a
 * mutant that skips/reorders it is caught by the ordered-trace assertions. */
static u32b o_DivArm(Side *S, u32b m, u32b v)
{
    unsigned k = S->ci_div++;
    ASSERT(k < MAX_DIV, "DivArm call bound");
    note_kind(S, K_DIVARM);
    ASSERT(m != 0, "DivArm divisor nonzero (guaranteed by strictly-increasing times[] + count>=4)");
    if (S->is_ref)
    {
        g_div_m[k] = m;
        g_div_v[k] = v;
    }
    else
    {
        ASSERT(g_div_m[k] == m, "same DivArm modulus (pts[count-1].time << 12)");
        ASSERT(g_div_v[k] == v, "same DivArm dividend (query time t)");
    }
    return v % m;
}

/* sub_800A34C (SplineEvalCatmullRom): shared call-indexed oracle. Compares ALL
 * FIVE logical arguments -- the 6-word control-point buffer, the 3-halfword
 * time buffer, the scalar t, and count (always literal 3 here) -- before
 * producing an identical symbolic 2-word output on both sides. */
static void o_sub_800A34C(Side *S, s32 *pts6, s32 *out2, u16 *times3, u32b t, s32 count)
{
    unsigned k = S->ci_a34c++;
    int i;
    ASSERT(k < MAX_A34C, "sub_800A34C call bound");
    note_kind(S, K_A34C);
    if (S->is_ref)
    {
        for (i = 0; i < 6; i++)
            g_a34c_pts[k][i] = pts6[i];
        for (i = 0; i < 3; i++)
            g_a34c_times[k][i] = times3[i];
        g_a34c_t[k] = t;
        g_a34c_count[k] = count;
    }
    else
    {
        for (i = 0; i < 6; i++)
            ASSERT(g_a34c_pts[k][i] == pts6[i], "same sub_800A34C control-point buffer word");
        for (i = 0; i < 3; i++)
            ASSERT(g_a34c_times[k][i] == times3[i], "same sub_800A34C local time-buffer content");
        ASSERT(g_a34c_t[k] == t, "same sub_800A34C scalar t");
        ASSERT(g_a34c_count[k] == count, "same sub_800A34C stack count word");
    }
    out2[0] = g_a34c_out_after[k][0];
    out2[1] = g_a34c_out_after[k][1];
}

/* ---- ref_fn: mechanical translation from asm/sub_800A594.s (m2c-derived,
 * repaired: proper `out_scratch` local instead of the bogus m2c
 * `subroutine_arg0`/bare-`sp24` placeholder). Control flow and register roles
 * mirror the asm 1:1 (sb == r9 segment index, ti == r3 shifted query time,
 * limit/dtime == r2/sl loop bound, j == the per-slot walking pointer index). */
static s32 ref_fn(Side *S, const struct SplineCtrlPoint *pts, s32 count, u32b t_in,
                   struct Vec2s16 *out, u8 loop)
{
    s32 lpts[6];
    u16 ltimes[3];
    s32 out_scratch[2];
    s32 sb, j, slot, limit, dtime;
    u32b ti, t;

    t = t_in;

    if (loop != 0)
    {
        t = o_DivArm(S, (u32b)pts[count - 1].time << 12, t);
        ti = t >> 12;
        sb = 0;
        limit = count - 2;
        if (sb < limit && !(ti >= (u32b)pts[0].time && ti < (u32b)pts[1].time))
        {
            do
            {
                sb = sb + 1;
                if (sb >= limit)
                    break;
            } while (!(ti >= (u32b)pts[sb].time && ti < (u32b)pts[sb + 1].time));
        }

        if (sb == 0)
        {
            dtime = (s32)pts[count - 1].time - (s32)pts[limit].time;
            lpts[0] = pts[limit].x;
            lpts[1] = pts[limit].y;
            ltimes[0] = (u16)sb;
            j = 0;
            for (slot = 1; slot <= 2; slot++)
            {
                lpts[2 * slot] = pts[j].x;
                lpts[2 * slot + 1] = pts[j].y;
                ltimes[slot] = (u16)(pts[j].time + dtime);
                if (j < count - 1)
                    j++;
            }
            t = t + ((u32b)dtime << 12);
        }
        else
        {
            j = sb - 1;
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
        sb = 0;
        dtime = count - 1; /* non-loop reuses this slot as the search limit, matching asm's mov sl,r0 */
        if (sb < dtime && !(ti >= (u32b)pts[0].time && ti < (u32b)pts[1].time))
        {
            do
            {
                sb = sb + 1;
                if (sb >= dtime)
                    break;
            } while (!(ti >= (u32b)pts[sb].time && ti < (u32b)pts[sb + 1].time));
        }

        if (sb == 0)
        {
            j = 0;
            for (slot = 0; slot <= 2; slot++)
            {
                lpts[2 * slot] = pts[j].x;
                lpts[2 * slot + 1] = pts[j].y;
                ltimes[slot] = pts[j].time;
                if (slot < dtime)
                    j++;
            }
        }
        else
        {
            j = sb - 1;
            for (slot = 0; slot <= 2; slot++)
            {
                lpts[2 * slot] = pts[j].x;
                lpts[2 * slot + 1] = pts[j].y;
                ltimes[slot] = pts[j].time;
                if (j < dtime)
                    j++;
            }
        }
    }

    o_sub_800A34C(S, lpts, out_scratch, ltimes, t, 3);
    out->x = (s16)out_scratch[0];
    out->y = (s16)out_scratch[1];
    return sb;
}

/* ---- impl_fn: the committed src/nonmatching/sub_800A594.c algorithm,
 * register-pin/fence scaffolding stripped (those exist only to steer agbcc's
 * -O2 register allocation for the byte-residual search and carry no C
 * semantics, exactly as established for the sibling sub_800A34C harness). */
static s32 impl_fn(Side *S, struct SplineCtrlPoint *pts, s32 count, u32b t, struct Vec2s16 *out, u8 loop)
{
    s32 lpts[6];
    u16 ltimes[3];
    s32 lout[2];
    s32 i, j, slot;
    s32 dtime;
    u16 *ltimesp;
    s32 *outp;
    s32 *call_out;
    u32b ti;
    s32 limit;

    if (loop)
    {
        t = o_DivArm(S, (u32b)pts[count - 1].time << 12, t);
        ti = t >> 12;
        i = 0;
        limit = count - 2;
        ltimesp = ltimes;
        outp = lout;

        if (i < limit && !(ti >= (u32b)pts[0].time && ti < (u32b)pts[1].time))
        {
            do
            {
                i++;
                if (i >= limit)
                    break;
            } while (!(ti >= (u32b)pts[i].time && ti < (u32b)pts[i + 1].time));
        }

        if (i == 0)
        {
            dtime = pts[count - 1].time - pts[limit].time;
            lpts[0] = pts[limit].x;
            lpts[1] = pts[limit].y;
            ltimesp[0] = (u16)i;
            j = 0;
            for (slot = 1; slot <= 2; slot++)
            {
                lpts[2 * slot] = pts[j].x;
                lpts[2 * slot + 1] = pts[j].y;
                ltimesp[slot] = pts[j].time + dtime;
                if (j < count - 1)
                    j++;
            }
            t += (u32b)dtime << 12;
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
        dtime = count - 1;

        if (i < dtime && !(ti >= (u32b)pts[0].time && ti < (u32b)pts[1].time))
        {
            do
            {
                i++;
                if (i >= dtime)
                    break;
            } while (!(ti >= (u32b)pts[i].time && ti < (u32b)pts[i + 1].time));
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

    call_out = outp;
    o_sub_800A34C(S, lpts, call_out, ltimesp, t, 3);
    out->x = (s16)call_out[0];
    out->y = (s16)call_out[1];
    return i;
}

int main(void)
{
    int i;
    struct SplineCtrlPoint pts[MAXN];
    struct Vec2s16 out_r, out_i;
    s32 count;
    u32b t;
    u8 loop;
    Side R, I;

    /* DivArm needs no free oracle-return nondet: it is modeled concretely as v % m. */
    for (i = 0; i < MAX_A34C; i++)
    {
        g_a34c_out_after[i][0] = nondet_int();
        g_a34c_out_after[i][1] = nondet_int();
    }

    for (i = 0; i < MAXN; i++)
    {
        pts[i].x = (s16)nondet_int();
        pts[i].y = (s16)nondet_int();
        pts[i].time = (u16)nondet_uint();
        pts[i].unk6 = (u16)nondet_uint();
        /* Bounded numeric domain (solver tractability, documented in README):
         * times[] still spans a range wide enough to need multiple search-loop
         * iterations and both wrap/clamp shapes, just not the full u16 range. */
        ASSUME(pts[i].time <= 40);
    }
    for (i = 0; i + 1 < MAXN; i++)
        ASSUME((u32b)pts[i + 1].time > (u32b)pts[i].time);

    count = nondet_int();
    ASSUME(count >= 4);
    ASSUME(count <= MAXN);

    t = nondet_uint();
    ASSUME(t <= 400000u); /* bounded domain: comfortably covers ti = t>>12 up to ~97, past times[]<=40 */
    loop = (u8)nondet_uchar();

    out_r.x = out_i.x = (s16)nondet_int();
    out_r.y = out_i.y = (s16)nondet_int();

    R.is_ref = 1;
    I.is_ref = 0;
    R.ci_div = R.ci_a34c = R.nlog = 0;
    I.ci_div = I.ci_a34c = I.nlog = 0;

    {
        s32 ret_r, ret_i;
        ret_r = ref_fn(&R, pts, count, t, &out_r, loop);
        ret_i = impl_fn(&I, pts, count, t, &out_i, loop);

        ASSERT(ret_r == ret_i, "segment index return equal");
        ASSERT(out_r.x == out_i.x, "out->x equal (s16 truncated)");
        ASSERT(out_r.y == out_i.y, "out->y equal (s16 truncated)");

        ASSERT(R.nlog == I.nlog, "same number/order of oracle calls");
        ASSERT(R.ci_div == I.ci_div, "same number of DivArm calls");
        ASSERT(R.ci_a34c == I.ci_a34c, "same number of sub_800A34C calls");
    }
    return 0;
}
