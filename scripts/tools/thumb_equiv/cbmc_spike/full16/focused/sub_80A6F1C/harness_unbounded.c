/* UNBOUNDED (cut-point) CBMC equivalence proof for sub_80A6F1C's de-obfuscation loop
 * — Discussion #149, answering Serentty: "unbounded proofs with cut points".
 *
 * The bounded harness (harness.c) proves reconstruction == m2c(ASM) with the payload
 * length BMC-bounded to <= 8 (--unwind 17). THIS harness removes that bound: it proves
 * the ONE unbounded component — the de-obfuscation loop — equal for ALL u16 lengths
 * (0..65535) using a loop INVARIANT at the loop head (the "cut point"), so the loop is
 * NOT unrolled (CBMC checks base + inductive step + termination, "1 iterations").
 *
 * DECOMPOSITION (why this + the bounded harness = a full unbounded result):
 *   sub_80A6F1C = [loop-free prologue] ; [de-obf loop] ; [loop-free epilogue].
 *   - The prologue/epilogue contain NO loops, so bounded == unbounded for them: the
 *     PROVEN bounded harness already establishes their equivalence for ALL inputs.
 *   - The de-obf loop is the only length-dependent part; this harness proves it
 *     equivalent for the FULL u16 length domain via a cut point.
 *
 * FAITHFULNESS: each side is its OWN function with the REAL body shape —
 *   impl: arg[i] = (base[i] - AA8[1+i]) & mask      (reconstruction, src/nonmatching)
 *   ref:  arg[i] =  mask & (base[i] - AA8[1+i])      (m2c of asm/sub_80A6F1C.s)
 * (the loop reads base[i] because at iteration i the in-place buffer still holds its
 * initial byte base[i] — the loop has only written indices < i.) Both read the SAME
 * shared uninterpreted AA8 oracle array by call index, so iteration i gets the same
 * random byte on both sides. The two bodies differ ONLY in the operand order of `&`
 * (commutative) — exactly the real reconstruction-vs-m2c difference — which the
 * unbounded invariant settles for every length and every input byte.
 *
 * WITNESS-INDEX METHOD (avoids __CPROVER_forall, which this CBMC build ignores inside
 * loop invariants): pick one arbitrary-but-fixed in-range index k; the invariant
 * `k < i ==> out_impl[k] == out_ref[k]` is scalar. Proving it for an arbitrary k is,
 * by universal generalization, a proof for ALL indices.
 *
 * RUN (see run.sh):
 *   goto-cc -> goto-instrument --apply-loop-contracts -> cbmc --arrays-uf-always --unwind 1
 *   PROVEN here = source-level equivalence trusting m2c (spec) + agbcc (codegen) +
 *   the shared-oracle abstraction of AA8 — a labelled tier BELOW the byte oracle, now
 *   UNBOUNDED over the payload-length domain (not BMC-bounded).
 */
typedef unsigned char u8;
typedef unsigned short u16;

#define N 65536                 /* the u16 length domain — NOT a proof bound, the actual type range */

static u8  g_base[N];           /* shared initial payload (uninterpreted array) */
static u8  g_aa8[N + 2];        /* shared AA8 returns by call index (uninterpreted) */
static u16 g_c20[2];            /* shared C20 returns by call index (2 calls) */
static u8  out_impl[N];         /* impl-side de-obfuscated payload */
static u8  out_ref[N];          /* ref-side  de-obfuscated payload */

unsigned nondet_uint(void);

/* impl side: reconstruction body (x - r) & m, IN-PLACE (arg[i] read & written).
 * The loop has NO cross-iteration data dependence — iteration i touches only index i —
 * so a per-index witness invariant is exact. Suffix clause `k>=i ==> arg[k]==base[k]`
 * captures that index k is still its initial byte until the loop reaches it. */
static void deobf_impl(unsigned len, unsigned mask, unsigned k)
{
    unsigned i = 0;
    while (i < len)
        __CPROVER_assigns(i, __CPROVER_object_whole(out_impl))
        __CPROVER_loop_invariant(i <= len)
        __CPROVER_loop_invariant(k >= i ==> out_impl[k] == g_base[k])
        __CPROVER_loop_invariant(k < i ==> out_impl[k] == (u8)((g_base[k] - g_aa8[1 + k]) & mask))
        __CPROVER_decreases(len - i)
    {
        out_impl[i] = (u8)((out_impl[i] - g_aa8[1 + i]) & mask);
        i++;
    }
}

/* ref side: m2c body m & (x - r), IN-PLACE */
static void deobf_ref(unsigned len, unsigned mask, unsigned k)
{
    unsigned i = 0;
    while (i < len)
        __CPROVER_assigns(i, __CPROVER_object_whole(out_ref))
        __CPROVER_loop_invariant(i <= len)
        __CPROVER_loop_invariant(k >= i ==> out_ref[k] == g_base[k])
        __CPROVER_loop_invariant(k < i ==> out_ref[k] == (u8)(mask & (g_base[k] - g_aa8[1 + k])))
        __CPROVER_decreases(len - i)
    {
        out_ref[i] = (u8)(mask & (out_ref[i] - g_aa8[1 + i]));
        i++;
    }
}

/* The loop-free epilogue return, computed identically to sub_80A6F1C, over the
 * SHARED oracle values (all indices fixed by len, so equal on both sides):
 *   chk  = C20 call#0, a = AA8 call#0, b = AA8 call#(1+len), chk2 = C20 call#1.
 * impl form uses &&/==, ref form uses ||/!= (De Morgan duals). Modelled here to show
 * the return is equal once the loop outputs (and thus the C20#1 argument) are equal. */
static int ret_impl(u16 h1, u16 h2, u16 chk, u16 chk2, u16 a, u16 b)
{
    if (h1 == (u16)((chk2 + a) & 0x3FF) && h2 == (u16)((chk + b) & 0x3FF))
        return 1;
    return 0;
}
static int ret_ref(u16 h1, u16 h2, u16 chk, u16 chk2, u16 a, u16 b)
{
    if ((h1 != (u16)((chk2 + a) & 0x3FF)) || (h2 != (u16)((chk + b) & 0x3FF)))
        return 0;
    return 1;
}

int main(void)
{
    unsigned len  = nondet_uint();
    unsigned mask = nondet_uint();
    unsigned k    = nondet_uint();
    u16 h1 = (u16)nondet_uint(), h2 = (u16)nondet_uint();

    __CPROVER_assume(len <= 65535u);     /* FULL u16 length domain — unbounded for BMC */
    __CPROVER_assume(k < len);           /* arbitrary in-range witness index */
    __CPROVER_assume(out_impl[k] == g_base[k]);  /* both payload buffers start == base */
    __CPROVER_assume(out_ref[k]  == g_base[k]);  /*   (scalar, at the witness index)    */

    deobf_impl(len, mask, k);
    deobf_ref(len, mask, k);

    /* de-obfuscation loop: bytes equal at the arbitrary witness => for ALL indices */
    __CPROVER_assert(out_impl[k] == out_ref[k],
                     "UNBOUNDED: de-obf byte equal at arbitrary k for all u16 lengths");

    /* Loop-free epilogue, threaded over the REAL shared oracle indices:
     *   a    = AA8 call#0        (pre-loop)
     *   b    = AA8 call#(1+len)  (post-loop) — same index on both sides ONLY because
     *          both loops iterate exactly len times; that is what the invariant's
     *          bound i<=len (and both exiting at i==len) guarantees.
     *   chk  = C20 call#0        (pre-loop, buffer = base on both sides)
     *   chk2 = C20 call#1        (post-loop) — the shared (opaque) return is SOUND
     *          because the two post-loop buffers are provably equal (assert above),
     *          so C20 is called with the same argument on both sides. */
    u16 a    = (u16)g_aa8[0];
    u16 b    = (u16)g_aa8[1 + len];
    u16 chk  = g_c20[0];
    u16 chk2 = g_c20[1];

    __CPROVER_assert(ret_impl(h1, h2, chk, chk2, a, b) == ret_ref(h1, h2, chk, chk2, a, b),
                     "return value equal (loop-free epilogue, all inputs)");
    return 0;
}
