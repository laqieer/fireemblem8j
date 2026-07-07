/* Shared-oracle CBMC C-vs-C equivalence harness for sub_800A34C
 * (SplineEvalCatmullRom).  The function is void; the observable is exactly
 * the two s32 words written to out[0] and out[1]. */
#include "../../../adversarial/common.h"

typedef int s32;

#define MAXN 4
#define PTS_WORDS (2 * MAXN)
#define MAX_LOG 16
#define MAX_DIV 6
#define MAX_MUL 6
#define MAX_UDIV 1

enum { K_A194 = 1, K_DIVARM = 2, K_MUL_U = 3, K_UDIV = 4 };

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
    ASSERT(k < MAX_MUL, "u multiply call bound");
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
    ASSERT(k < MAX_UDIV, "unsigned divide call bound");
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
        ASSERT(g_a194_n == n, "same sub_800A194 n");
        for (i = 0; i < MAXN; i++) {
            ASSERT(g_a194_a[i] == a[i], "same coeffA arg");
            ASSERT(g_a194_b[i] == b[i], "same coeffB arg");
            ASSERT(g_a194_c[i] == c[i], "same sub arg");
        }
        for (i = 0; i < PTS_WORDS; i++)
            ASSERT(g_a194_d[i] == d[i], "same vector arg/result-buffer bytes");
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

static void impl_fn(Side *S, s32 *pts, s32 *out, u16 *times, u32 t, s32 count)
{
    u32 ti;
    int i, last, k;
    u32 u;
    u16 *tp;
    s32 sub[MAXN], coeffA[MAXN], coeffB[MAXN], tan[PTS_WORDS];
    s32 *tx, *ty, *txw, *dp, *p, *ep0, *ep1;
    s32 px0, px1, py0, py1, m0x, m1x, m0y, m1y, ax, bx, ay, by;

    init_locals(sub, coeffA, coeffB, tan);
    ti = t >> 12;
    i = 0;
    tx = &tan[0];
    ty = &tan[1];

    if (count - 1 > 0 && (ti < times[0] || ti >= times[1])) {
        do {
            i = i + 1;
            if (i >= count - 1)
                break;
            tp = &times[i];
        } while (ti < tp[0] || ti >= tp[1]);
    }

    coeffA[0] = 0x2000;
    coeffB[0] = 0x1000;
    tx[0] = three_neg_diff(pts[0], pts[2]);
    ty[0] = three_neg_diff(pts[1], pts[3]);
    last = count - 1;
    p = pts;
    if (count - 1 > 1) {
        dp = &sub[1];
        txw = tx + 2;
        for (k = 1; k < count - 1; k++) {
            *dp++ = 0x1000;
            coeffA[k] = 0x4000;
            coeffB[k] = 0x1000;
            *txw = three_neg_diff(p[0], p[4]);
            ty[2 * k] = three_neg_diff(p[1], p[5]);
            p += 2;
            txw += 2;
        }
    }

    sub[last] = 0x1000;
    coeffA[last] = 0x2000;
    ep0 = &pts[2 * count - 4];
    ep1 = &pts[2 * count - 2];
    tx[2 * last] = three_neg_diff(ep0[0], ep1[0]);
    ty[2 * last] = three_neg_diff(ep0[1], ep1[1]);

    o_sub_800A194(S, coeffA, coeffB, sub, tx, count);

    if (i >= last) {
        out[0] = ep1[0];
        out[1] = ep1[1];
        return;
    }

    u = o_UDiv(S, (u32)(t - ((u32)times[i] << 12)), (u32)(times[i + 1] - times[i]));
    px0 = pts[2 * i];
    px1 = pts[2 * i + 2];
    m0x = tx[2 * i];
    m1x = tx[2 * (i + 1)];
    ax = add32(mul32(2, sub32(px0, px1)), add32(m0x, m1x));
    bx = sub32(sub32(mul32(3, sub32(px1, px0)), mul32(2, m0x)), m1x);
    py0 = pts[2 * i + 1];
    py1 = pts[2 * i + 3];
    m0y = ty[2 * i];
    m1y = ty[2 * (i + 1)];
    ay = add32(mul32(2, sub32(py0, py1)), add32(m0y, m1y));
    by = sub32(sub32(mul32(3, sub32(py1, py0)), mul32(2, m0y)), m1y);

    out[0] = add32(o_DivArm(S, 0x1000, o_MulU(S, (s32)u, add32(o_DivArm(S, 0x1000, o_MulU(S, (s32)u, add32(o_DivArm(S, 0x1000, o_MulU(S, (s32)u, ax)), bx))), m0x))), px0);
#ifndef MUTATE_IMPL
    out[1] = add32(o_DivArm(S, 0x1000, o_MulU(S, (s32)u, add32(o_DivArm(S, 0x1000, o_MulU(S, (s32)u, add32(o_DivArm(S, 0x1000, o_MulU(S, (s32)u, ay)), by))), m0y))), py0);
#else
    out[1] = add32(o_DivArm(S, 0x1000, o_MulU(S, (s32)u, add32(o_DivArm(S, 0x1000, o_MulU(S, (s32)u, add32(o_DivArm(S, 0x1000, o_MulU(S, (s32)u, ay)), by))), m0y))), sub32(0, py0));
#endif
}

static void ref_fn(Side *S, s32 *arg0, s32 *arg1, u16 *arg2, u32 arg3, s32 arg4)
{
    s32 sp4[MAXN], sp14[MAXN], sp24[MAXN], sp34[PTS_WORDS];
    s32 *sp54, *sp6C, *sp70, *sp74, *var_r5;
    u32 sp5C, temp_r3, temp_r0_3;
    s32 sp60, sp64, temp_r1, temp_r2, temp_r5, sp68;
    s32 temp_r0_4, temp_r0_5, temp_r1_3, temp_r1_4, temp_r1_5;
    s32 temp_r3_2, temp_r5_3, temp_r6, temp_r6_2, temp_r7, temp_r8, temp_r5_5;
    s32 ax, bx, ay, by;
    s32 var_r4;
    u16 temp_r2_3;
    s32 *temp_r1_2, *temp_r5_4, *temp_r4, *temp_r5_2, *var_r3;

    init_locals(sp4, sp14, sp24, sp34);
    sp54 = arg1;
    sp5C = arg3;
    temp_r3 = arg3 >> 12;
    sp60 = 0;
    temp_r1 = arg4 - 1;
    sp6C = &sp34[0];
    sp70 = &sp34[1];
    if ((temp_r1 > 0) && ((temp_r3 < (u32)arg2[0]) || (temp_r3 >= (u32)arg2[1]))) {
        do {
            temp_r2 = sp60 + 1;
            sp60 = temp_r2;
            if (temp_r2 < temp_r1) {
                if (!((temp_r3 < (u32)arg2[temp_r2]) || (temp_r3 >= (u32)arg2[temp_r2 + 1])))
                    break;
            }
        } while (sp60 < temp_r1);
    }

    sp14[0] = 0x2000;
    sp24[0] = 0x1000;
    sp34[0] = three_neg_diff(arg0[0], arg0[2]);
    var_r3 = arg0;
    sp34[1] = three_neg_diff(var_r3[1], var_r3[3]);
    var_r4 = 1;
    temp_r5 = arg4 - 1;
    sp68 = arg4 * 8;
    if (temp_r5 > 1) {
        var_r5 = sp6C + 2;
        sp74 = &sp4[1];
        do {
            *sp74 = 0x1000;
            sp74 += 1;
            sp14[var_r4] = 0x4000;
            sp24[var_r4] = 0x1000;
            *var_r5 = three_neg_diff(var_r3[0], var_r3[4]);
            sp70[var_r4 * 2] = three_neg_diff(var_r3[1], var_r3[5]);
            var_r3 += 2;
            var_r5 += 2;
            var_r4 += 1;
        } while (var_r4 < temp_r5);
    }

    sp4[temp_r5] = 0x1000;
    sp14[temp_r5] = 0x2000;
    temp_r5_2 = arg0 + (sp68 / 4) - 4;
    temp_r4 = arg0 + (sp68 / 4) - 2;
    sp6C[temp_r5 * 2] = three_neg_diff(temp_r5_2[0], temp_r4[0]);
    sp70[temp_r5 * 2] = three_neg_diff(temp_r5_2[1], temp_r4[1]);
    o_sub_800A194(S, sp14, sp24, sp4, sp6C, arg4);

    if (sp60 < temp_r5) {
        temp_r1_2 = (s32 *)&arg2[sp60];
        temp_r2_3 = arg2[sp60];
        temp_r0_3 = o_UDiv(S, (u32)(sp5C - ((u32)temp_r2_3 << 12)), (u32)(arg2[sp60 + 1] - temp_r2_3));
        temp_r5_3 = sp60 * 2;
        temp_r5_4 = arg0 + temp_r5_3;
        temp_r7 = temp_r5_4[0];
        temp_r1_3 = temp_r5_4[2];
        temp_r0_4 = sp6C[temp_r5_3];
        temp_r3_2 = (sp60 + 1) * 2;
        temp_r6 = sp6C[temp_r3_2];
        sp64 = temp_r5_4[1];
        temp_r0_5 = temp_r5_4[3];
        temp_r1_4 = sp70[temp_r5_3];
        temp_r8 = temp_r1_4;
        temp_r1_5 = sp70[temp_r3_2];
        ax = add32(mul32(2, sub32(temp_r7, temp_r1_3)), add32(temp_r0_4, temp_r6));
        bx = sub32(sub32(mul32(3, sub32(temp_r1_3, temp_r7)), mul32(2, temp_r0_4)), temp_r6);
        temp_r6_2 = add32(mul32(sub32(sp64, temp_r0_5), 2), add32(temp_r8, temp_r1_5));
        temp_r5_5 = sub32(sub32(mul32(sub32(temp_r0_5, sp64), 3), mul32(temp_r8, 2)), temp_r1_5);
        ay = temp_r6_2;
        by = temp_r5_5;
        sp54[0] = add32(o_DivArm(S, 0x1000, o_MulU(S, (s32)temp_r0_3, add32(o_DivArm(S, 0x1000, o_MulU(S, (s32)temp_r0_3, add32(o_DivArm(S, 0x1000, o_MulU(S, (s32)temp_r0_3, ax)), bx))), temp_r0_4))), temp_r7);
        sp54[1] = add32(o_DivArm(S, 0x1000, o_MulU(S, (s32)temp_r0_3, add32(o_DivArm(S, 0x1000, o_MulU(S, (s32)temp_r0_3, add32(o_DivArm(S, 0x1000, o_MulU(S, (s32)temp_r0_3, ay)), by))), temp_r8))), sp64);
        (void)temp_r1_2;
        return;
    }
    sp54[0] = temp_r4[0];
    sp54[1] = temp_r4[1];
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

    ASSERT(out_r[0] == out_i[0], "out[0] equal");
    ASSERT(out_r[1] == out_i[1], "out[1] equal");

    ASSERT(R.nlog == I.nlog, "same number of oracle calls");
    ASSERT(R.ci_div == I.ci_div, "same number of DivArm calls");
    ASSERT(R.ci_mul == I.ci_mul, "same number of u-mul calls");
    ASSERT(R.ci_udiv == I.ci_udiv, "same number of udiv calls");
    ASSERT(R.ci_a194 == I.ci_a194, "same number of sub_800A194 calls");
    return 0;
}
