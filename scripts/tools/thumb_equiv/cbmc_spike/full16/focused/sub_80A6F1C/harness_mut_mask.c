/* Shared-oracle CBMC equivalence harness for sub_80A6F1C (DecodeAndVerifyArenaRecord).
 *
 * GOAL (Discussion #149, path B): sub_80A6F1C is the ONE non-matching function not
 * machine-proven by any method -- our ARM-vs-ARM SMT reports DIVERGENCE and the
 * differential tester reports INCONCLUSIVE-CB, both defeated by the OPAQUE CALLBACK
 * consume(&cbarg, arg) (dispatched via the _call_via_r9 veneer) plus the three
 * same-TU codec leaves sub_80A6D34 / sub_80A6C20 / sub_80A6AA8. This harness proves
 * source-level equivalence by modelling all four callees as SHARED CALL-INDEXED
 * ORACLES (same return + same memory havoc on both sides), exactly the technique the
 * adversarial trust gate validated (external-call-same-args -> PROVEN).
 *
 * TWO SIDES, INDEPENDENT SURFACE FORM, SAME SEMANTICS:
 *   impl_fn = the reconstruction src/nonmatching/sub_80A6F1C.c   (for-loop, `if(..)return 1`)
 *   ref_fn  = the m2c decompilation of asm/sub_80A6F1C.s          (do-while, negated `..return 0`)
 * Both are decompilations of the SAME JP bytes; proving them equal under the shared
 * oracle confirms the reconstruction is faithful to the ASM (trusting m2c for the
 * spec shape + agbcc for codegen -- a labelled tier BELOW the byte oracle).
 *
 * SOUNDNESS (fail-closed):
 *  - Oracle returns are drawn once into shared pools and returned BY CALL INDEX, so
 *    both sides get identical returns *only if they call in the same order*.
 *  - To stop the index-based return from MASKING an argument divergence (which would
 *    be a false PROVE), every call's FULL arguments (buffer CONTENTS byte-for-byte,
 *    length, and *cbarg) are recorded and compared elementwise post-hoc. If any call's
 *    args differ between sides, that assertion REFUTES -- an index-return can never
 *    hide an input mismatch.
 *  - consume() havoc over the whole modelled payload window is shared (same bytes both
 *    sides); sub_80A6D34 writes the shared post-decode header; the LCG state word
 *    0x02014F24 is advanced to a shared per-call value.
 *  - Loop bounded by the modelled payload size; `--unwind 9 --unwinding-assertions`.
 *  - PROVEN here = "reconstruction == m2c(ASM) on return + all visible memory writes,
 *    for all bounded inputs and all (shared) callback behaviours."  A behavioural
 *    mutation of impl_fn MUST REFUTE (see harness_mut.c) or the harness is vacuous.
 */
#include "../../../adversarial/common.h"

#define PSIZE 8       /* modelled payload buffer bytes (bounds header[3] = length) */
#define MAXC 16       /* max oracle calls: D34(1)+C20(2)+AA8(2+len<=8)+consume(1)=14 */

enum { K_D34 = 1, K_C20 = 2, K_AA8 = 3, K_CONSUME = 4 };

/* ---- shared oracle draw pools (identical for both sides) ---- */
static u16 g_d34_header[4];        /* header words written by sub_80A6D34            */
static u16 g_aa8_ret[MAXC];        /* k-th sub_80A6AA8() return                       */
static int g_f24_after[MAXC];      /* LCG state word after k-th AA8 (shared)          */
static u16 g_c20_ret[MAXC];        /* k-th sub_80A6C20() return                       */
static int g_consume_cbarg;        /* value consume writes through &cbarg             */
static u8  g_consume_payload[PSIZE];/* payload bytes consume writes (shared havoc)    */

/* ---- per-call record for post-hoc argument-equality checking ---- */
typedef struct
{
    int kind;
    int len;
    int cbval;            /* *cbarg observed by a consume call (else 0) */
    u8  bytes[PSIZE];     /* buffer contents observed by C20/consume (else 0) */
} CallRec;

/* ---- per-side machine state ---- */
typedef struct
{
    u16 header[4];       /* 0x02014FC8 */
    u8  payload[PSIZE];  /* 0x02014F28 + off window */
    int f24;             /* 0x02014F24 LCG state */
    int mask;            /* 0x02014EF0 field mask */
    int off;             /* 0x02014EF4 payload offset */
    unsigned ci_aa8, ci_c20, nlog;
    CallRec log[MAXC];
} Side;

static void snap(CallRec *r, int kind, u8 *buf, int len, int cbval)
{
    int i;
    r->kind = kind;
    r->len = len;
    r->cbval = cbval;
    for (i = 0; i < PSIZE; i++)
        r->bytes[i] = (buf && i < len) ? buf[i] : (u8)0;
}

/* ---- shared oracles (side = S) ---- */
static void o_D34(Side *S)
{
    int i;
    for (i = 0; i < 4; i++)
        S->header[i] = g_d34_header[i];
    snap(&S->log[S->nlog++], K_D34, 0, 0, 0);
}

static u16 o_AA8(Side *S)
{
    unsigned k = S->ci_aa8++;
    ASSERT(k < MAXC, "aa8 call bound");
    S->f24 = g_f24_after[k];
    snap(&S->log[S->nlog++], K_AA8, 0, 0, 0);
    return g_aa8_ret[k];
}

static u16 o_C20(Side *S, u8 *buf, int len)
{
    unsigned k = S->ci_c20++;
    ASSERT(k < MAXC, "c20 call bound");
    snap(&S->log[S->nlog++], K_C20, buf, len, 0);
    return g_c20_ret[k];
}

static void o_consume(Side *S, int *cbarg, u8 *arg, int len)
{
    int i;
    snap(&S->log[S->nlog++], K_CONSUME, arg, len, *cbarg);
    *cbarg = g_consume_cbarg;                 /* shared write through &cbarg  */
    for (i = 0; i < PSIZE; i++)               /* shared payload havoc         */
        S->payload[i] = g_consume_payload[i];
}

/* ================= impl: the reconstruction (src/nonmatching/sub_80A6F1C.c) ======= */
static int impl_fn(Side *S)
{
    int i;
    u16 a, b, chk;
    int cbarg = 0;
    u8 *arg;

    o_D34(S);
    S->f24 = S->header[0];                     /* *0x02014F24 = base[0] */
    arg = S->payload + S->off;                 /* gUnk_02014EF4 + 0x02014F28 */
    chk = o_C20(S, arg, S->header[3]);
    a = o_AA8(S);
    for (i = 0; i < (int)S->header[3]; i++)
        arg[i] = (u8)((arg[i] - o_AA8(S)) & S->mask);
    b = o_AA8(S);
    o_consume(S, &cbarg, arg, (int)S->header[3]);
    if (S->header[1] == (u16)((o_C20(S, arg, S->header[3]) + a) & 0x1FF) &&   /* MUTATION: 0x3FF -> 0x1FF (return tag width) */
        S->header[2] == (u16)((chk + b) & 0x3FF))
        return 1;
    return 0;
}

/* ================= ref: the m2c decompilation of asm/sub_80A6F1C.s =============== */
static int ref_fn(Side *S)
{
    int r5;
    u16 fa, fb, r6;
    int cbarg = 0;
    u8 *pl;

    o_D34(S);
    S->f24 = S->header[0];
    pl = S->payload + S->off;
    r6 = o_C20(S, pl, S->header[3]);
    fa = o_AA8(S);
    r5 = 0;
    if ((int)S->header[3] > 0)
    {
        do
        {
            pl[r5] = (u8)(S->mask & (pl[r5] - o_AA8(S)));
            r5 += 1;
        } while (r5 < (int)S->header[3]);
    }
    fb = o_AA8(S);
    o_consume(S, &cbarg, pl, (int)S->header[3]);
    if ((S->header[1] != (u16)((o_C20(S, pl, S->header[3]) + fa) & 0x3FF)) ||
        (S->header[2] != (u16)((r6 + fb) & 0x3FF)))
        return 0;
    return 1;
}

static void setup(Side *S, u8 *init_payload, int f24, int mask, int off)
{
    int i;
    for (i = 0; i < 4; i++)
        S->header[i] = (u16)nondet_uint();     /* overwritten by D34; value irrelevant */
    for (i = 0; i < PSIZE; i++)
        S->payload[i] = init_payload[i];
    S->f24 = f24;
    S->mask = mask;
    S->off = off;
    S->ci_aa8 = S->ci_c20 = S->nlog = 0;
}

int main(void)
{
    int i, base3, rr, ri;
    Side R, I;
    u8 init_payload[PSIZE];
    int init_f24, init_mask, init_off;

    /* shared oracle pools */
    for (i = 0; i < 4; i++)
        g_d34_header[i] = (u16)nondet_uint();
    for (i = 0; i < MAXC; i++)
    {
        g_aa8_ret[i] = (u16)nondet_uint();
        g_f24_after[i] = nondet_int();
        g_c20_ret[i] = (u16)nondet_uint();
    }
    g_consume_cbarg = nondet_int();
    for (i = 0; i < PSIZE; i++)
        g_consume_payload[i] = nondet_uchar();

    /* shared initial memory */
    for (i = 0; i < PSIZE; i++)
        init_payload[i] = nondet_uchar();
    init_f24 = nondet_int();
    init_mask = nondet_int();
    /* gUnk_02014EF4 is a runtime payload-window offset applied IDENTICALLY on both
     * sides; the logic equivalence does not depend on its value, so we pin it to the
     * window base (0) for the primary proof. header[3] (the length) stays fully
     * symbolic and is bounded to the modelled window. */
    init_off = 0;

    base3 = (int)(u16)g_d34_header[3];
    ASSUME(base3 >= 0);
    ASSUME(base3 <= PSIZE);

    setup(&R, init_payload, init_f24, init_mask, init_off);
    setup(&I, init_payload, init_f24, init_mask, init_off);

    rr = ref_fn(&R);
    ri = impl_fn(&I);

    /* ---- observable equivalence ---- */
    ASSERT(rr == ri, "return value equal");
    for (i = 0; i < PSIZE; i++)
        ASSERT(R.payload[i] == I.payload[i], "final payload equal");
    ASSERT(R.f24 == I.f24, "final LCG/seed word equal");
    for (i = 0; i < 4; i++)
        ASSERT(R.header[i] == I.header[i], "final header equal");

    /* ---- identical oracle-call sequences with identical arguments ----
     * (this is what makes the index-based shared returns SOUND: a divergence in
     * call order or argument contents REFUTES here instead of being masked.) */
    ASSERT(R.nlog == I.nlog, "same number of oracle calls");
    for (i = 0; i < MAXC; i++)
    {
        if (i < (int)R.nlog)
        {
            int j;
            ASSERT(R.log[i].kind == I.log[i].kind, "same call kind/order");
            ASSERT(R.log[i].len == I.log[i].len, "same call arg length");
            ASSERT(R.log[i].cbval == I.log[i].cbval, "same *cbarg at callback");
            for (j = 0; j < PSIZE; j++)
                ASSERT(R.log[i].bytes[j] == I.log[i].bytes[j], "same buffer arg bytes");
        }
    }
    return 0;
}
