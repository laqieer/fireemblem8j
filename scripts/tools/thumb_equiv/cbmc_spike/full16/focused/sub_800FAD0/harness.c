/* Shared-oracle CBMC C-vs-C equivalence harness for sub_800FAD0
 * (GetUnitDefinitionFormEventScr).  UnitDefinition is modelled as the five
 * 32-bit words copied by the ASM, so all 20 visible bytes are represented while
 * avoiding byte-array SAT blow-up.
 */
#include "../../../adversarial/common.h"

#define COUNTMAX 4
#define OUTMAX (COUNTMAX + 1)
#define RETRYMAX (2 * COUNTMAX)
#define MAXC (RETRYMAX + 2)

#define TRUE 1
#define FALSE 0

typedef signed char s8;
typedef signed short s16;
typedef int s32;

enum { K_DIV = 1, K_NEXT = 2, K_BUILD = 3 };

typedef struct {
    u8 payload;   /* opaque bytes copied but not otherwise inspected */
    u8 charIndex; /* byte 0 */
    u8 sumFlag;   /* byte 5 */
    u8 redaCount; /* byte 7 */
    u8 redas;     /* word at byte 8, abstracted as a visible token */
} Unit;

typedef struct {
    int kind;
    int a0;
    int a1;
    Unit out[OUTMAX];
} CallRec;

typedef struct {
    Unit src[COUNTMAX];
    Unit out[OUTMAX];
    unsigned ci_div, ci_next, nlog;
    CallRec log[MAXC];
} Side;

Unit nondet_unit(void);
static int g_div_ret[MAXC];
static u16 g_next_ret[MAXC];
static Unit g_build_out[OUTMAX];

static u8 get_b0(Unit u) { return u.charIndex; }
static u8 get_b5(Unit u) { return u.sumFlag; }

static void set_b0(Unit *u, u8 v) { u->charIndex = v; }
static void set_b5(Unit *u, u8 v) { u->sumFlag = v; }
static void set_b7(Unit *u, u8 v) { u->redaCount = v; }

static int unit_eq(Unit a, Unit b)
{
    return a.payload == b.payload && a.charIndex == b.charIndex &&
           a.sumFlag == b.sumFlag && a.redaCount == b.redaCount && a.redas == b.redas;
}

static int mask_get(u32 lo, u32 hi, u32 i)
{
    return (i < 0x20U) ? (int)(lo & (1U << i)) : (int)(hi & (1U << (i - 0x20U)));
}

static void mask_set(u32 *lo, u32 *hi, u32 i)
{
    if (i < 0x20U)
        *lo |= 1U << i;
    else
        *hi |= 1U << (i - 0x20U);
}

static void snap(CallRec *r, int kind, int a0, int a1, const Side *S)
{
    int i;
    r->kind = kind;
    r->a0 = a0;
    r->a1 = a1;
    if (S)
        for (i = 0; i < OUTMAX; i++)
            r->out[i] = S->out[i];
}

static int o_Div(Side *S, int a0, int a1)
{
    unsigned k = S->ci_div++;
    ASSERT(k < MAXC, "Div call bound");
    snap(&S->log[S->nlog++], K_DIV, a0, a1, 0);
    return g_div_ret[k];
}

static u16 o_NextRN_N(Side *S, u16 n)
{
    unsigned k = S->ci_next++;
    ASSERT(k < MAXC, "NextRN_N call bound");
    snap(&S->log[S->nlog++], K_NEXT, n, 0, 0);
    return g_next_ret[k];
}

static void o_BuildDeployedUnitDefinitionList(Side *S)
{
    int i;
    snap(&S->log[S->nlog++], K_BUILD, 0x0203EFB4, 0, S);
    for (i = 0; i < OUTMAX; i++)
        S->out[i] = g_build_out[i];
}

static void setup(Side *S, Unit *src, Unit *out)
{
    int i;
    for (i = 0; i < COUNTMAX; i++)
        S->src[i] = src[i];
    for (i = 0; i < OUTMAX; i++)
        S->out[i] = out[i];
    S->ci_div = S->ci_next = S->nlog = 0;
}

static s32 impl_fn(Side *S, s16 count, u8 arg2, s8 arg3, s8 arg4)
{
    u8 array[0x40];
    u16 r, i, arraySize, outp;
    const Unit *itSource;
    u32 loBits, hiBits;

    arraySize = 0;
    i = 0;
    if (arg2) {
        itSource = S->src;
        ++i; --i;
        for (; i < (u16)count; i++) {
            if (get_b5(*itSource) & 0x40) {
                array[arraySize] = (u8)i;
                arraySize++;
            }
            itSource++;
        }
        i = (u16)o_Div(S, (arraySize * arg2) + 50, 100);
    }

    loBits = 0;
    hiBits = 0;
    while (i) {
        r = o_NextRN_N(S, arraySize);
        r = array[r];
        if (!mask_get(loBits, hiBits, r)) {
            mask_set(&loBits, &hiBits, r);
            i--;
        }
    }

    outp = 0;
    for (i = 0; i < (u16)count; i++) {
        if (!mask_get(loBits, hiBits, i)) {
            S->out[outp] = S->src[i];
            set_b5(&S->out[outp], (u8)(get_b5(S->out[outp]) & (u8)~0x40));
            outp++;
        }
    }
    for (i = 0; i < (u16)count; i++) {
        if (mask_get(loBits, hiBits, i)) {
            S->out[outp] = S->src[i];
            set_b5(&S->out[outp], (u8)(get_b5(S->out[outp]) | 0x40));
            outp++;
        }
    }

    set_b0(&S->out[outp], 0);
    if (arg4 == TRUE) {
        for (i = 0; i < (u16)count; i++) {
            set_b7(&S->out[i], 0);
            S->out[i].redas = 0;
        }
    }
    if (arg3 == TRUE)
        o_BuildDeployedUnitDefinitionList(S);
    return 0x0203EFB4;
}

static s32 ref_fn(Side *S, s16 arg1, u8 arg2, s8 arg3, s32 arg4)
{
    s16 temp_r1 = arg1;
    u8 temp_r7 = arg2;
    s32 sp40 = (s32)arg3;
    u16 var_sb = 0;
    s8 var_r3 = 0;
    u32 sp4C, sp50;
    u16 outp, var_r3_4;
    u32 var_r3_2, var_r3_3;
    u8 subroutine_arg0[0x40];

    if (temp_r7 != 0) {
        if ((s32)temp_r1 > 0) {
            do {
                if (0x40 & get_b5(S->src[(u8)var_r3])) {
                    subroutine_arg0[(u16)var_sb] = (u8)var_r3;
                    var_sb += 1;
                }
                var_r3 = (s8)(u16)(var_r3 + 1);
            } while ((s32)var_r3 < (s32)temp_r1);
        }
        var_r3 = (s8)(u16)o_Div(S, (temp_r7 * var_sb) + 0x32, 0x64);
    }

    sp4C = 0;
    sp50 = 0;
    if (var_r3 != 0) {
        do {
            u8 temp_r2 = subroutine_arg0[o_NextRN_N(S, var_sb)];
            s32 var_r0;
            if ((u32)temp_r2 <= 0x1FU)
                var_r0 = (s32)((1U << temp_r2) & sp4C);
            else
                var_r0 = (s32)((1U << (temp_r2 - 0x20)) & sp50);
            if (var_r0 == 0) {
                if ((u32)temp_r2 <= 0x1FU)
                    sp4C |= 1U << temp_r2;
                else
                    sp50 |= 1U << (temp_r2 - 0x20);
                var_r3 = (s8)(u16)(var_r3 - 1);
            }
        } while (var_r3 != 0);
    }

    outp = 0;
    var_r3_2 = 0;
    if ((s32)temp_r1 > 0) {
        do {
            s32 var_r0_2;
            if (var_r3_2 <= 0x1FU)
                var_r0_2 = (s32)((1U << var_r3_2) & sp4C);
            else
                var_r0_2 = (s32)((1U << (var_r3_2 - 0x20)) & sp50);
            if (var_r0_2 == 0) {
                S->out[outp] = S->src[var_r3_2];
                set_b5(&S->out[outp], (u8)(get_b5(S->out[outp]) & (u8)-0x41));
                outp++;
            }
            var_r3_2 = (u32)(u16)(var_r3_2 + 1);
        } while ((s32)var_r3_2 < (s32)temp_r1);
    }

    var_r3_3 = 0;
    if ((s32)temp_r1 > 0) {
        do {
            int take = 0;
            if (var_r3_3 <= 0x1FU) {
                if ((1U << var_r3_3) & sp4C)
                    take = 1;
            } else if ((1U << (var_r3_3 - 0x20)) & sp50) {
                take = 1;
            }
            if (take) {
                S->out[outp] = S->src[var_r3_3];
                set_b5(&S->out[outp], (u8)(get_b5(S->out[outp]) | 0x40));
                outp++;
            }
            var_r3_3 = (u32)(u16)(var_r3_3 + 1);
        } while ((s32)var_r3_3 < (s32)temp_r1);
    }

    set_b0(&S->out[outp], 0);
    if ((s8)arg4 == 1) {
        var_r3_4 = 0;
        if ((s32)temp_r1 > 0) {
            do {
                set_b7(&S->out[var_r3_4], 0);
                S->out[var_r3_4].redas = 0;
                var_r3_4 += 1;
            } while ((s32)var_r3_4 < (s32)temp_r1);
        }
    }
    if (sp40 == 1)
        o_BuildDeployedUnitDefinitionList(S);
    return 0x0203EFB4;
}

int main(void)
{
    int i, j;
    Unit init_src[COUNTMAX], init_out[OUTMAX];
    Side R, I;
    s16 count;
    u8 arg2;
    s8 arg3, arg4;
    int rr, ri;
    int selected_count;

    for (i = 0; i < COUNTMAX; i++)
        init_src[i] = nondet_unit();
    for (i = 0; i < OUTMAX; i++) {
        init_out[i] = nondet_unit();
        g_build_out[i] = nondet_unit();
    }
    for (i = 0; i < MAXC; i++) {
        g_div_ret[i] = nondet_int();
        g_next_ret[i] = (u16)nondet_uint();
    }

    count = (s16)nondet_int();
    arg2 = nondet_uchar();
    arg3 = (s8)nondet_uchar();
    arg4 = (s8)nondet_uchar();
    ASSUME(count >= 0);
    ASSUME(count <= COUNTMAX);
    /* arg2 is a percentage in the game formula (selected_count * arg2 + 50) / 100. */
    ASSUME(arg2 <= 100);

    selected_count = 0;
    for (i = 0; i < COUNTMAX; i++)
        if (i < count && (get_b5(init_src[i]) & 0x40))
            selected_count++;
    if (arg2 != 0) {
        ASSUME(g_div_ret[0] >= 0);
        ASSUME(g_div_ret[0] <= selected_count);
        for (i = 0; i < RETRYMAX; i++)
            ASSUME(g_next_ret[i] < selected_count);
        /* Bounded retry oracle: collisions are allowed and verified.  Even draws
         * guarantee progress (slot 0,1,2,...) while odd draws remain symbolic and
         * may collide with already-selected slots, exercising the retry path. */
        for (i = 0; i < COUNTMAX; i++)
            if (i < g_div_ret[0])
                ASSUME(g_next_ret[2 * i] == i);
    } else {
        ASSUME(g_div_ret[0] == 0);
    }

    setup(&R, init_src, init_out);
    setup(&I, init_src, init_out);
    rr = ref_fn(&R, count, arg2, arg3, (s32)arg4);
    ri = impl_fn(&I, count, arg2, arg3, arg4);

    ASSERT(rr == ri, "return value equal");
    for (i = 0; i < OUTMAX; i++)
        ASSERT(unit_eq(R.out[i], I.out[i]), "final output buffer equal");

    ASSERT(R.nlog == I.nlog, "same number of oracle calls");
    for (i = 0; i < MAXC; i++) {
        if (i < (int)R.nlog) {
            ASSERT(R.log[i].kind == I.log[i].kind, "same call kind/order");
            ASSERT(R.log[i].a0 == I.log[i].a0, "same scalar arg0");
            ASSERT(R.log[i].a1 == I.log[i].a1, "same scalar arg1");
            if (R.log[i].kind == K_BUILD)
                for (j = 0; j < OUTMAX; j++)
                    ASSERT(unit_eq(R.log[i].out[j], I.log[i].out[j]), "same BuildUnitDefinitionList input bytes");
        }
    }
    return 0;
}
