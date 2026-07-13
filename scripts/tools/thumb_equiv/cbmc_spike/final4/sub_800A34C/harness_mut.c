/* MUTATION of harness.c: the candidate's (`impl_fn`) final out[1] Horner add
 * uses `sub32(0, py0)` (negated py0) instead of the real `py0`. This changes
 * a behavior-visible output computation (not merely an unreachable/dead
 * branch), so it MUST refute out[1] equality -- proving the base harness is
 * non-vacuous (it can actually detect a real divergence in this observable).
 *
 * Contract-assisted relational CBMC equivalence harness for sub_800A34C
 * (SplineEvalCatmullRom), rebuilt against the CURRENT `src/nonmatching/sub_800A34C.c`
 * at base commit 5c210a85c (see README.md for full provenance).
 *
 * `ref_fn` is re-derived directly from `asm/sub_800A34C.s` (the committed, unchanged
 * JP byte source -- verified identical since the prior 2026-07-07 proof, see README)
 * by hand-tracing every instruction to an SP-offset-named local (sp4/sp14/... follow
 * the JP frame layout: sub@sp+4, coeffA@sp+0x14, coeffB@sp+0x24, tan@sp+0x34).
 * `impl_fn` is re-derived directly from the CURRENT candidate source, flattening its
 * register-pinned locals (`asm("r3")` etc.) and its `work.{sub,coeffA,coeffB,tan}`
 * struct fields into plain flat arrays -- the register/frame annotations in the
 * candidate are ARM-codegen-matching hints with no semantic effect (already covered
 * by the project's ARM-vs-ARM `prove_nonmatching.py`, independently re-run for this
 * package -- see README), so they are erased here without loss of soundness.
 *
 * The function is `void`; the only caller-visible data effects are the two `s32`
 * writes to `out[0]`/`out[1]`. `sub_800A194` has the real five-word ABI (four
 * register pointers `r0..r3` + `n` at `[sp]`, verified against the ASM `bl` site
 * below) and is modeled as a shared call-indexed oracle: full pointed-to buffer
 * CONTENTS (not addresses) are compared between sides before either side receives
 * the (shared) havoc of the result buffer, so an index-based/masking return cannot
 * hide a call-order or call-argument divergence. `DivArm` and the 32-bit multiply
 * (`muls`) are likewise call-indexed oracles with full scalar-argument equality
 * checks -- this eliminates nonlinear bitvector multiplication from the solver
 * without weakening the equivalence claim (both sides must present IDENTICAL
 * arguments, in identical order, before either receives the shared result), and
 * `__udivsi3` (the unsigned segment divide) is modeled the same way. */
#include "../../adversarial/common.h"

typedef int s32;

#define MAXN 4                 /* bounded domain: count in [2,4], both key paths */
#define PTS_WORDS (2 * MAXN)   /* pts/tan are interleaved (x,y) pairs */
#define MAX_LOG 16
#define MAX_DIV 6               /* 3 DivArm on the x chain + 3 on the y chain */
#define MAX_MUL 6               /* matching 6 `muls` sites (u * value) */
#define MAX_UDIV 1              /* the single __udivsi3 segment-fraction divide */

enum { K_A194 = 1, K_DIVARM = 2, K_MUL_U = 3, K_UDIV = 4 };

/* ---- shared oracle state: written by the reference call, read back by the
 * candidate call at the SAME call index, after an equality check on args ---- */
static s32 g_div_ret[MAX_DIV];
static s32 g_mul_ret[MAX_MUL], g_mul_x[MAX_MUL], g_mul_y[MAX_MUL];
static u32 g_udiv_ret[MAX_UDIV], g_udiv_x[MAX_UDIV], g_udiv_y[MAX_UDIV];
static s32 g_a194_d_after[PTS_WORDS];
static s32 g_init_sub[MAXN], g_init_a[MAXN], g_init_b[MAXN], g_init_tan[PTS_WORDS];

static int g_log_kind[MAX_LOG];
static s32 g_div_x[MAX_DIV], g_div_y[MAX_DIV];
static s32 g_a194_a[MAXN], g_a194_b[MAXN], g_a194_c[MAXN], g_a194_d[PTS_WORDS];
static int g_a194_n;

typedef struct {
    int is_ref;
    unsigned ci_div, ci_mul, ci_udiv, ci_a194, nlog;
} Side;

static s32 add32(s32 a, s32 b) { return (s32)((u32)a + (u32)b); }
static s32 sub32(s32 a, s32 b) { return (s32)((u32)a - (u32)b); }
static s32 mul32(s32 a, s32 b) { return (s32)((u32)a * (u32)b); }
static s32 neg32(s32 a) { return (s32)(0u - (u32)a); }

/* Common `-3*(a-b)` tangent-endpoint idiom: JP emits it as
 * `subs; lsls #1; adds; rsbs #0` (i.e. -( (a-b)*2 + (a-b) )) on every one of
 * the six sites it appears; both sides below use this same helper so the
 * shared operation order matches exactly (no reassociation drift). */
static s32 three_neg_diff(s32 a, s32 b)
{
    return neg32(mul32(3, sub32(a, b)));
}

static void note_kind(Side *S, int kind)
{
    ASSERT(S->nlog < MAX_LOG, "oracle log bound");
    if (S->is_ref)
        g_log_kind[S->nlog] = kind;
    else
        ASSERT(g_log_kind[S->nlog] == kind, "same call kind/order");
    S->nlog++;
}

static s32 o_DivArm(Side *S, s32 x, s32 y)
{
    unsigned k = S->ci_div++;
    ASSERT(k < MAX_DIV, "DivArm call bound");
    note_kind(S, K_DIVARM);
    if (S->is_ref) {
        g_div_x[k] = x;
        g_div_y[k] = y;
    } else {
        ASSERT(g_div_x[k] == x, "same DivArm numerator");
        ASSERT(g_div_y[k] == y, "same DivArm denominator");
    }
    return g_div_ret[k];
}

static s32 o_MulU(Side *S, s32 x, s32 y)
{
    unsigned k = S->ci_mul++;
    ASSERT(k < MAX_MUL, "u-multiply call bound");
    note_kind(S, K_MUL_U);
    if (S->is_ref) {
        g_mul_x[k] = x;
        g_mul_y[k] = y;
    } else {
        ASSERT(g_mul_x[k] == x, "same u-mul lhs");
        ASSERT(g_mul_y[k] == y, "same u-mul rhs");
    }
    return g_mul_ret[k];
}

static u32 o_UDiv(Side *S, u32 x, u32 y)
{
    unsigned k = S->ci_udiv++;
    ASSERT(k < MAX_UDIV, "__udivsi3 call bound");
    note_kind(S, K_UDIV);
    if (S->is_ref) {
        g_udiv_x[k] = x;
        g_udiv_y[k] = y;
    } else {
        ASSERT(g_udiv_x[k] == x, "same udiv numerator");
        ASSERT(g_udiv_y[k] == y, "same udiv denominator");
    }
    return g_udiv_ret[k];
}

/* sub_800A194(int *a, int *b, int *c, struct SplineVec2 *d, int n) -- shared
 * call-indexed oracle. Anti-masking: EVERY word of a[0..MAXN), b[0..MAXN),
 * c[0..MAXN) and d[0..PTS_WORDS) is compared (logical contents, never a raw
 * pointer identity) before the shared post-call havoc of d[] is applied to
 * BOTH sides identically. n (the 5th, stack-passed ABI word) is compared too. */
static void o_sub_800A194(Side *S, s32 *a, s32 *b, s32 *c, s32 *d, int n)
{
    int i;
    unsigned k = S->ci_a194++;
    ASSERT(k < 1, "sub_800A194 call bound");
    note_kind(S, K_A194);
    if (S->is_ref) {
        g_a194_n = n;
        for (i = 0; i < MAXN; i++) {
            g_a194_a[i] = a[i];
            g_a194_b[i] = b[i];
            g_a194_c[i] = c[i];
        }
        for (i = 0; i < PTS_WORDS; i++)
            g_a194_d[i] = d[i];
    } else {
        ASSERT(g_a194_n == n, "same sub_800A194 n (stack ABI word)");
        for (i = 0; i < MAXN; i++) {
            ASSERT(g_a194_a[i] == a[i], "same coeffA arg content");
            ASSERT(g_a194_b[i] == b[i], "same coeffB arg content");
            ASSERT(g_a194_c[i] == c[i], "same sub/work arg content");
        }
        for (i = 0; i < PTS_WORDS; i++)
            ASSERT(g_a194_d[i] == d[i], "same tan/SplineVec2 arg content");
    }
    for (i = 0; i < PTS_WORDS; i++)
        d[i] = g_a194_d_after[i];
}

static void init_locals(s32 sub[MAXN], s32 a[MAXN], s32 b[MAXN], s32 tan[PTS_WORDS])
{
    int i;
    for (i = 0; i < MAXN; i++) {
        sub[i] = g_init_sub[i];
        a[i] = g_init_a[i];
        b[i] = g_init_b[i];
    }
    for (i = 0; i < PTS_WORDS; i++)
        tan[i] = g_init_tan[i];
}

/* ================================================================
 * CANDIDATE side -- flattened transcription of the CURRENT
 * src/nonmatching/sub_800A34C.c (register-pinned locals and the `work`
 * struct erased to plain flat arrays/pointers; MATCH_BARRIER erased, it
 * expands to no instructions). Every statement below corresponds 1:1 to a
 * statement in the candidate .c, in the same order, including the
 * ex-post-facto pointer rebases (txInit/tyInit/dpInit/subDst all resolve to
 * work-array elements, never to a fabricated/opaque address). See README
 * "Line-by-line audit" for the mapping table.
 * ================================================================ */
static void impl_fn(Side *S, s32 *pts, s32 *out, u16 *times, u32 t, s32 count)
{
    u32 ti;
    int i, last, lastCopy, k;
    u32 u;
    s32 sub[MAXN], coeffA[MAXN], coeffB[MAXN], tan[PTS_WORDS];
    s32 *tx, *ty, *txw, *dp, *p, *ep0, *ep1;
    s32 px0, px1, py0, py1, m0x, m1x, m0y, m1y, ax, bx, ay, by;
    s32 count8;

    init_locals(sub, coeffA, coeffB, tan);
    ti = t >> 12;
    i = 0;
    tx = &tan[0];
    ty = &tan[1];

    {
        int searchLast = count - 1;
        if (0 < searchLast) {
            lastCopy = searchLast;
            if (ti < times[0]) {
                /* falls straight into the do-while body below */
            } else if (ti < times[1]) {
                goto search_done;
            }
            do {
                i = i + 1;
                if (i >= lastCopy)
                    break;
            } while (ti < times[i] || ti >= times[i + 1]);
        }
    }
search_done:

    coeffA[0] = 0x2000;
    coeffB[0] = 0x1000;
    tx[0] = three_neg_diff(pts[0], pts[2]);
    tx[1] = three_neg_diff(pts[1], pts[3]);        /* == ty[0] (shared tan storage) */

    k = 1;
    last = count - 1;
    lastCopy = last;
    count8 = count << 3;

    if (k < lastCopy) {
        s32 constant = 0x1000;
        txw = tx + 2;
        dp = &sub[1];
        p = pts;
        do {
            *dp++ = constant;
            coeffA[k] = 0x4000;
            coeffB[k] = constant;
            *txw = three_neg_diff(p[0], p[4]);
            ty[2 * k] = three_neg_diff(p[1], p[5]);
            p += 2;
            txw += 2;
            k++;
        } while (k < last);
    }

    sub[lastCopy] = 0x1000;
    coeffA[lastCopy] = 0x2000;
    {
        s32 *endBase = (s32 *)((char *)pts + count8);
        ep0 = endBase - 4;
        ep1 = endBase - 2;
        tx[2 * lastCopy] = three_neg_diff(ep0[0], ep1[0]);
        ty[2 * lastCopy] = three_neg_diff(ep0[1], ep1[1]);
    }

    o_sub_800A194(S, coeffA, coeffB, sub, tx, count);

    if (i >= lastCopy) {
        out[0] = ep1[0];
        out[1] = ep1[1];
        return;
    }

    u = o_UDiv(S, (u32)(t - ((u32)times[i] << 12)), (u32)(times[i + 1] - times[i]));

    px0 = pts[2 * i];
    px1 = pts[2 * i + 2];
    m0x = tx[2 * i];
    ax = mul32(2, sub32(px0, px1));
    ax = add32(ax, m0x);
    m1x = tx[2 * (i + 1)];
    ax = add32(ax, m1x);
    bx = mul32(3, sub32(px1, px0));
    bx = sub32(bx, mul32(2, m0x));
    bx = sub32(bx, m1x);

    py0 = pts[2 * i + 1];
    py1 = pts[2 * i + 3];
    ay = sub32(py0, py1);
    ay = mul32(2, ay);
    m0y = ty[2 * i];
    ay = add32(ay, m0y);
    m1y = ty[2 * (i + 1)];
    ay = add32(ay, m1y);
    by = mul32(3, sub32(py1, py0));
    by = sub32(by, mul32(2, m0y));
    by = sub32(by, m1y);

    out[0] = add32(o_DivArm(S, 0x1000, o_MulU(S, (s32)u,
             add32(o_DivArm(S, 0x1000, o_MulU(S, (s32)u,
             add32(o_DivArm(S, 0x1000, o_MulU(S, (s32)u, ax)), bx))), m0x))), px0);
    /* MUTATION: negate py0 in the final y-chain add (changes a real output
     * computation, not merely dead/unreachable code). */
    out[1] = add32(o_DivArm(S, 0x1000, o_MulU(S, (s32)u,
             add32(o_DivArm(S, 0x1000, o_MulU(S, (s32)u,
             add32(o_DivArm(S, 0x1000, o_MulU(S, (s32)u, ay)), by))), m0y))), sub32(0, py0));
}

/* ================================================================
 * REFERENCE side -- hand-traced directly from `asm/sub_800A34C.s`
 * (JP bytes, unchanged since the 2026-07-07 proof; re-verified byte-for-byte
 * identical for this package, see README). Variable names follow the SP
 * frame offsets the JP build actually uses (sp4=sub, sp14=coeffA,
 * sp24=coeffB, sp34=tan; sp5C=t, sp58=times, sp54=out, sp60=i, sp68=count8,
 * sp6C=tx pointer, sp70=ty pointer). This is an INDEPENDENT re-derivation
 * from the raw instruction sequence, not a copy of the candidate. See
 * README "Line-by-line audit" for the instruction-by-instruction mapping.
 * ================================================================ */
static void ref_fn(Side *S, s32 *arg0, s32 *arg1, u16 *arg2, u32 arg3, s32 arg4)
{
    s32 sp4[MAXN], sp14[MAXN], sp24[MAXN], sp34[PTS_WORDS];
    s32 *sp54, *sp6C, *sp70;
    u32 sp5C, sp60;
    s32 sp68;
    s32 *ep0_r5, *ep1_r4;
    s32 px0_r7, px1_r1, m0x_r10, m1x_r6, ax_r2, bx_r4;
    s32 py1_r0, py0_sp64, m0y_r8, m1y_r1, ay_r6, by_r5;
    u32 u_r9;

    init_locals(sp4, sp14, sp24, sp34);
    sp54 = arg1;
    sp5C = arg3;
    sp60 = 0;
    sp6C = &sp34[0];
    sp70 = &sp34[1];

    {
        u32 ti = arg3 >> 12;
        s32 searchLast = arg4 - 1;
        if ((s32)0 < searchLast) {
            s32 lastCopy = searchLast;
            if (ti < (u32)arg2[0]) {
                /* blo _0800A392: fall straight into the do-while body */
            } else if (ti < (u32)arg2[1]) {
                goto search_done;   /* blo _0800A3AE */
            }
            do {
                sp60 = sp60 + 1;
                if ((s32)sp60 >= lastCopy)
                    break;
            } while (ti < (u32)arg2[sp60] || ti >= (u32)arg2[sp60 + 1]);
        }
    }
search_done:

    sp14[0] = 0x2000;
    sp24[0] = 0x1000;
    sp34[0] = three_neg_diff(arg0[0], arg0[2]);
    sp6C[1] = three_neg_diff(arg0[1], arg0[3]);        /* str r0,[r4,#4] */

    {
        s32 var_r4 = 1;
        s32 last = arg4 - 1;
        s32 lastCopy = last;
        sp68 = arg4 * 8;
        if (var_r4 < lastCopy) {
            s32 constant = 0x1000;
            s32 *dp = &sp4[1];
            s32 *txw = sp6C + 2;
            s32 *p = arg0;
            do {
                *dp = constant;
                dp += 1;
                sp14[var_r4] = 0x4000;
                sp24[var_r4] = constant;
                *txw = three_neg_diff(p[0], p[4]);
                sp70[var_r4 * 2] = three_neg_diff(p[1], p[5]);
                p += 2;
                txw += 2;
                var_r4 += 1;
            } while (var_r4 < last);
        }

        sp4[lastCopy] = 0x1000;
        sp14[lastCopy] = 0x2000;
        ep0_r5 = arg0 + (sp68 / 4) - 4;
        ep1_r4 = arg0 + (sp68 / 4) - 2;
        sp6C[lastCopy * 2] = three_neg_diff(ep0_r5[0], ep1_r4[0]);
        sp70[lastCopy * 2] = three_neg_diff(ep0_r5[1], ep1_r4[1]);

        o_sub_800A194(S, sp14, sp24, sp4, sp6C, arg4);

        if ((s32)sp60 >= lastCopy) {
            sp54[0] = ep1_r4[0];
            sp54[1] = ep1_r4[1];
            return;
        }

        u_r9 = o_UDiv(S, sp5C - ((u32)arg2[sp60] << 12),
                      (u32)arg2[sp60 + 1] - (u32)arg2[sp60]);

        {
            s32 pointOffset = sp60 * 2;
            s32 *pointBase = arg0 + pointOffset;
            s32 nextOffset = (sp60 + 1) * 2;

            px0_r7 = pointBase[0];
            px1_r1 = pointBase[2];
            ax_r2 = sub32(px0_r7, px1_r1);
            ax_r2 = mul32(ax_r2, 2);
            m0x_r10 = sp6C[pointOffset];
            ax_r2 = add32(ax_r2, m0x_r10);
            m1x_r6 = sp6C[nextOffset];
            ax_r2 = add32(ax_r2, m1x_r6);
            bx_r4 = sub32(px1_r1, px0_r7);
            bx_r4 = add32(mul32(bx_r4, 2), bx_r4);         /* *3 via 2x+x, matches lsls/adds */
            bx_r4 = sub32(bx_r4, mul32(m0x_r10, 2));
            bx_r4 = sub32(bx_r4, m1x_r6);

            py0_sp64 = pointBase[1];
            py1_r0 = pointBase[3];
            ay_r6 = sub32(py0_sp64, py1_r0);
            ay_r6 = mul32(ay_r6, 2);
            m0y_r8 = sp70[pointOffset];
            ay_r6 = add32(ay_r6, m0y_r8);
            m1y_r1 = sp70[nextOffset];
            ay_r6 = add32(ay_r6, m1y_r1);
            by_r5 = sub32(py1_r0, py0_sp64);
            by_r5 = add32(mul32(by_r5, 2), by_r5);
            by_r5 = sub32(by_r5, mul32(m0y_r8, 2));
            by_r5 = sub32(by_r5, m1y_r1);
        }

        sp54[0] = add32(o_DivArm(S, 0x1000, o_MulU(S, (s32)u_r9,
                  add32(o_DivArm(S, 0x1000, o_MulU(S, (s32)u_r9,
                  add32(o_DivArm(S, 0x1000, o_MulU(S, (s32)u_r9, ax_r2)), bx_r4))), m0x_r10))), px0_r7);
        sp54[1] = add32(o_DivArm(S, 0x1000, o_MulU(S, (s32)u_r9,
                  add32(o_DivArm(S, 0x1000, o_MulU(S, (s32)u_r9,
                  add32(o_DivArm(S, 0x1000, o_MulU(S, (s32)u_r9, ay_r6)), by_r5))), m0y_r8))), py0_sp64);
    }
}

int main(void)
{
    int i;
    s32 pts[PTS_WORDS], out_r[2], out_i[2];
    u16 times[MAXN];
    u32 t;
    s32 count;
    Side R, I;

    for (i = 0; i < MAX_DIV; i++)
        g_div_ret[i] = nondet_int();
    for (i = 0; i < MAX_MUL; i++)
        g_mul_ret[i] = nondet_int();
    for (i = 0; i < MAX_UDIV; i++)
        g_udiv_ret[i] = nondet_uint();
    for (i = 0; i < PTS_WORDS; i++) {
        pts[i] = nondet_int();
        g_a194_d_after[i] = nondet_int();
        g_init_tan[i] = nondet_int();
    }
    for (i = 0; i < MAXN; i++) {
        times[i] = (u16)nondet_uint();
        g_init_sub[i] = nondet_int();
        g_init_a[i] = nondet_int();
        g_init_b[i] = nondet_int();
    }
    out_r[0] = out_i[0] = nondet_int();
    out_r[1] = out_i[1] = nondet_int();
    t = nondet_uint();
    count = nondet_int();

    /* Bounded, nondegenerate domain: count in [2,4] exercises BOTH key paths --
     * the i>=last "fallback = last endpoint" branch and the interpolation
     * branch -- and, for count in [3,4], the middle spline-coefficient loop
     * runs 1 or 2 times respectively. Monotonic knot precondition matches the
     * game's actual segment-time table invariant. */
    ASSUME(count >= 2);
    ASSUME(count <= MAXN);
    for (i = 0; i < MAXN - 1; i++)
        ASSUME((u32)times[i + 1] > (u32)times[i]);

    R.is_ref = 1;
    I.is_ref = 0;
    R.ci_div = R.ci_mul = R.ci_udiv = R.ci_a194 = R.nlog = 0;
    I.ci_div = I.ci_mul = I.ci_udiv = I.ci_a194 = I.nlog = 0;

    ref_fn(&R, pts, out_r, times, t, count);
    impl_fn(&I, pts, out_i, times, t, count);

    /* Complete caller-visible observable: the function is void, so out[0]/
     * out[1] are the ONLY data effects. */
    ASSERT(out_r[0] == out_i[0], "out[0] equal");
    ASSERT(out_r[1] == out_i[1], "out[1] equal");

    /* Ordered external-call trace equality (anti-masking): same kinds, same
     * count of each callee, in the same order. */
    ASSERT(R.nlog == I.nlog, "same number of oracle calls");
    ASSERT(R.ci_div == I.ci_div, "same number of DivArm calls");
    ASSERT(R.ci_mul == I.ci_mul, "same number of u-mul calls");
    ASSERT(R.ci_udiv == I.ci_udiv, "same number of udiv calls");
    ASSERT(R.ci_a194 == I.ci_a194, "same number of sub_800A194 calls");
    return 0;
}
