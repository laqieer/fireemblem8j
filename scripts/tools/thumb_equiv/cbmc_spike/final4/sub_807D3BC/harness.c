/* Relational CBMC contract harness for sub_807D3BC (SelectSummonPos), one of
 * the FE8J "final four" still-asm functions (Discussion #149 contract method,
 * see docs/equivalence_proving.md and docs/decisions.md D349/D... entries).
 *
 * PROVENANCE (see README.md for full detail + hashes):
 *   candidate (impl_fn)  <- byte-identical transcription of the function body
 *                            in src/nonmatching/sub_807D3BC.c (candidate_snapshot.c
 *                            in this directory), the CURRENT best staging
 *                            reconstruction (score 550, PROVEN-BOUNDED(1) on
 *                            the ARM-vs-ARM oracle, EQUIV on the Unicorn
 *                            differential tester -- see run.sh).
 *   reference (ref_fn)   <- an INDEPENDENT reconstruction directly re-derived
 *                            from asm/sub_807D3BC.s (the real JP bytes) by
 *                            hand-cleaning the m2c --valid-syntax output at
 *                            scripts/tools/thumb_equiv/cbmc_spike/full16/generated/
 *                            reference_c/sub_807D3BC_ref.c into typed field
 *                            accesses (replacing the generic M2C_FIELD/M2C_UNK
 *                            macros with the real struct SumThing layout from
 *                            include/mapanim.h:55), using a goto/skip control
 *                            shape (not impl_fn's for/if-else shape) so this is
 *                            a genuinely separate re-derivation, not a renamed
 *                            copy of the candidate. Its control flow also
 *                            matches the independently-authored decomp.me
 *                            upload at scripts/tools/decompme/pending/
 *                            SelectSummonPos.c, which was cross-checked by hand
 *                            against the same asm during authoring of this
 *                            harness (three independent readings of the same
 *                            bytes -- candidate .c, decompme .c, m2c-from-asm .c
 *                            -- agree on the algorithm implemented below).
 *
 * OBSERVABLE (everything the caller can see):
 *   - the signed s8 return value (-1 "no candidate", 1 "wrote *result")
 *   - every byte of *result when the return is 1 (all 12 bytes: x, y,
 *     boolAvailable, and the pass-through unk04/unk08 words -- see the
 *     "shared stack garbage" note below), and *result must be UNTOUCHED when
 *     the return is -1 (mirrors `if (!count) return -1;` executing before the
 *     struct copy in every one of the three independent readings above)
 *   - the ordered, argument-checked trace of every external call the
 *     function makes: CanUnitCrossTerrain (0..9 times, one per grid cell that
 *     reaches it), AdvanceGetLCGRNValue (0 or 1 time), DivRem (0 or 1 time).
 *     All three share one interleaved call-order log (note_kind) in addition
 *     to their own per-kind argument tables, so a mutation that calls the
 *     right functions the right number of times but in the wrong RELATIVE
 *     order still refutes.
 *
 * GLOBALS MODELED (the full input domain the body actually reads):
 *   gBmMapSize.{x,y}, gBmMapUnit[iy][ix], gBmMapFog[iy][ix],
 *   gBmMapTerrain[iy][ix] for the 9 (iy,ix) cells the fixed 3x3 loop can ever
 *   reach, and gPlaySt.chapterVisionRange -- all free nondet, shared (read
 *   only, never written by this function, so both fn's read the identical
 *   variable, no per-side copy needed). gBattleActor.unit's ADDRESS is a
 *   fixed process-wide global in the real ROM; modeled here as one shared
 *   opaque marker object so pointer-identity mutations (e.g. swapping in
 *   gBattleTarget.unit) are still caught by the terrain-call argument check.
 *
 * TRUST BOUNDARY / DOMAIN CAVEATS (disclosed, not hidden -- see README.md):
 *   1. unk04/unk08 of struct SumThing are NEVER initialized by this function;
 *      their value is whatever was already on the caller's stack frame at
 *      the array[9] locals. Real target vs. candidate machine code can and
 *      does have different local-frame shapes (that's WHY this function is
 *      still non-matching), so those two bytes-words are not soundly
 *      comparable byte-for-byte against a *real* stack. This harness instead
 *      shares one symbolic per-logical-slot garbage value between impl_fn's
 *      and ref_fn's own local arrays (see g_garbage_hi/g_garbage_lo below),
 *      which lets us machine-check the SELECTION/COPY logic (the part that
 *      is actually still unsolved) while being explicit that the literal
 *      garbage byte identity claim is a modeling convenience, not a
 *      byte-exact hardware claim (that claim is instead the job of
 *      prove_nonmatching.py's ARM-vs-ARM proof, which operates on the real
 *      shared ROM/candidate memory model -- see run.sh step 2).
 *   2. AdvanceGetLCGRNValue() returns a full-range `unsigned` (src/rng.c:103
 *      `gLCGRNValue = rn >> 2; return gLCGRNValue;` -- genuinely uses the top
 *      bit), which DivRem (src/libagbsyscall.s:46, BIOS SWI 6 remainder) then
 *      receives as a signed `int`. If that value is negative the BIOS
 *      truncating remainder can itself be negative, so `pick = DivRem(...) -
 *      1` can fall outside `[0, count-1]` and `array[indices[pick]]` reads
 *      before the indices[] array -- undefined behavior that is a genuine,
 *      shared property of the real ROM (not introduced by either
 *      reconstruction), but whose CONCRETE byte content depends on
 *      target-vs-candidate stack shape, exactly like caveat 1. This harness
 *      ASSUMEs the in-domain case `0 <= pick < count` (documented, disclosed,
 *      not silently narrowed away -- see README.md "domain bounds").
 */
#include "common.h"

/* struct SumThing, include/mapanim.h:55 -- x,y,boolAvailable are s8, then two
 * u32 pass-through words never touched by this function's own logic. */
struct SumThing
{
    s8 x, y, boolAvailable;
    u32 unk04, unk08;
};

#define MAXCELLS 9        /* fixed 3x3 grid: 9 candidate slots, never fewer/more */
#define MAX_TERRAIN 9     /* <=1 CanUnitCrossTerrain call per grid cell         */
#define MAX_RNG 2         /* exactly 0 or 1 real call; +1 headroom for mutants  */
#define MAX_DIVREM 2       /* exactly 0 or 1 real call; +1 headroom for mutants  */
#define MAX_LOG (MAX_TERRAIN + MAX_RNG + MAX_DIVREM)

enum { K_TERRAIN = 1, K_RNG = 2, K_DIVREM = 3 };

/* ---- shared (read-only) grid inputs: both fn's read the SAME instance,
 * because this function only ever READS these globals -- see README.md
 * "input/global model". Indexed relative to the 3x3 window, [iy-(y-1)][ix-(x-1)]. */
static s16 g_mapSize_x, g_mapSize_y;
static u8 g_mapUnit[3][3];
static u8 g_mapFog[3][3];
static u8 g_mapTerrain[3][3];
static u8 g_chapterVisionRange;
static int g_battleActorUnit_marker; /* stand-in for &gBattleActor.unit's fixed address */

/* ---- shared per-logical-slot "stack garbage" for the two pass-through
 * words -- see caveat 1 above. */
static u32 g_garbage_hi[MAXCELLS], g_garbage_lo[MAXCELLS];

/* ---- unified interleaved call-order log (anti cross-callee reordering) plus
 * per-kind call-indexed argument/return tables (anti call-count/argument
 * masking), following the sub_800A34C / sub_80A6F1C shared-oracle pattern. */
static int g_log_kind[MAX_LOG];
static int g_nlog_ref;

static void *g_terrain_unit[MAX_TERRAIN];
static int g_terrain_terrain[MAX_TERRAIN];
static int g_terrain_ret[MAX_TERRAIN];

static int g_rng_ret[MAX_RNG];

static int g_divrem_a[MAX_DIVREM], g_divrem_b[MAX_DIVREM];

typedef struct
{
    int is_ref;
    int nlog;
    int ci_terrain, ci_rng, ci_divrem;
} Side;

static void note_kind(Side *S, int kind)
{
    ASSERT(S->nlog < MAX_LOG, "call-order log bound");
    if (S->is_ref) {
        g_log_kind[S->nlog] = kind;
        g_nlog_ref = S->nlog + 1;
    } else {
        ASSERT(S->nlog < g_nlog_ref, "impl call within ref call-order trace");
        ASSERT(g_log_kind[S->nlog] == kind, "same external-call kind/order");
    }
    S->nlog++;
}

/* CanUnitCrossTerrain(struct Unit *unit, int terrain): compare target+terrain
 * for every reachable call (requirement 5). */
static int o_CanUnitCrossTerrain(Side *S, void *unit, int terrain)
{
    int k = S->ci_terrain++;
    ASSERT(k < MAX_TERRAIN, "CanUnitCrossTerrain call bound (<=9, one per grid cell)");
    note_kind(S, K_TERRAIN);
    if (S->is_ref) {
        g_terrain_unit[k] = unit;
        g_terrain_terrain[k] = terrain;
    } else {
        ASSERT(g_terrain_unit[k] == unit, "same CanUnitCrossTerrain target (unit ptr)");
        ASSERT(g_terrain_terrain[k] == terrain, "same CanUnitCrossTerrain terrain arg");
    }
    return g_terrain_ret[k];
}

/* AdvanceGetLCGRNValue(): no args; genuine RNG side effect. Share its
 * nondeterministic return AND its call order/count (requirement 5) -- never
 * silently ignored. */
static int o_AdvanceGetLCGRNValue(Side *S)
{
    int k = S->ci_rng++;
    ASSERT(k < MAX_RNG, "AdvanceGetLCGRNValue call bound");
    note_kind(S, K_RNG);
    return g_rng_ret[k];
}

/* DivRem(a, b): real project utility (src/libagbsyscall.s:46, BIOS SWI 6
 * remainder-of-division). Concrete + deterministic: both sides get the exact
 * same computed value because it's a pure function of its (checked-equal)
 * arguments -- requirement 6 ("concrete ... contract with equal args"). */
static int o_DivRem(Side *S, int a, int b)
{
    int k = S->ci_divrem++;
    ASSERT(k < MAX_DIVREM, "DivRem call bound");
    note_kind(S, K_DIVREM);
    if (S->is_ref) {
        g_divrem_a[k] = a;
        g_divrem_b[k] = b;
    } else {
        ASSERT(g_divrem_a[k] == a, "same DivRem numerator (AdvanceGetLCGRNValue() result)");
        ASSERT(g_divrem_b[k] == b, "same DivRem denominator (count + 1)");
    }
    ASSUME(b != 0);
    return a % b; /* BIOS Div/DivRem truncates toward zero, same as C's % here */
}

/* Shared grid accessors -- (iy, ix) are only ever read inside the bounds-
 * checked branch of the 3x3 loop, so they are always in [y-1,y+1]x[x-1,x+1]
 * by construction; no separate bounds handling is needed here. */
static u8 map_unit(s32 iy, s32 ix, s32 x, s32 y) { return g_mapUnit[iy - (y - 1)][ix - (x - 1)]; }
static u8 map_fog(s32 iy, s32 ix, s32 x, s32 y) { return g_mapFog[iy - (y - 1)][ix - (x - 1)]; }
static u8 map_terrain(s32 iy, s32 ix, s32 x, s32 y) { return g_mapTerrain[iy - (y - 1)][ix - (x - 1)]; }

static void init_garbage(struct SumThing array[MAXCELLS])
{
    int k;
    for (k = 0; k < MAXCELLS; k++) {
        array[k].unk04 = g_garbage_hi[k];
        array[k].unk08 = g_garbage_lo[k];
    }
}

/* ============================================================================
 * impl_fn -- byte-identical transcription of src/nonmatching/sub_807D3BC.c's
 * function body (candidate_snapshot.c in this directory). The two empty GNU
 * inline-asm statements in the real source (`asm("" : "=r"(reject) : "0"
 * (reject));` and `asm("" ::: "r2","r3","r4");`) are pure agbcc scheduling
 * barriers with no C-level semantic effect (they don't change any value) and
 * are elided here -- documented, not silently invented behavior.
 * ==========================================================================*/
static s8 impl_fn(Side *S, s32 x, s32 y, struct SumThing *result)
{
    struct SumThing array[MAXCELLS];
    s8 indices[MAXCELLS];
    s8 count = 0;
    s8 i, j;
    s8 ix, iy;
    s8 pick;
    int idx;
    int rn;

    init_garbage(array);

    for (iy = y - 1; iy < y + 2; iy++) {
        int reject;

        for (ix = x - 1, reject = 0xff; ix < x + 2; ix++) {
            array[count].x = (s8) ix;
            array[count].y = (s8) iy;

            if (iy >= g_mapSize_y || ix >= g_mapSize_x || iy < 0 || ix < 0 ||
                map_unit(iy, ix, x, y) != 0 ||
                (g_chapterVisionRange && map_fog(iy, ix, x, y) == 0) ||
                !o_CanUnitCrossTerrain(S, &g_battleActorUnit_marker, map_terrain(iy, ix, x, y))) {
                u8 available = array[count].boolAvailable;

                available |= (u8) reject;
                array[count].boolAvailable = available;
            } else {
                array[count].boolAvailable = 1;
                count++;
            }
        }
    }

    if (!count)
        return -1;

    for (idx = 8; idx >= 0; idx--)
        indices[idx] = 0;

    i = 0;
    j = 0;
    for (; i < count; i++) {
        if (array[i].boolAvailable == 1) {
            indices[j] = i;
            j++;
        }
    }

    rn = o_AdvanceGetLCGRNValue(S);
    pick = (s8) (o_DivRem(S, rn, count + 1) - 1);
    ASSUME(pick >= 0 && pick < count); /* domain caveat 2, see file header */
    *result = array[indices[pick]];
    return 1;
}

/* ============================================================================
 * ref_fn -- independent re-derivation from asm/sub_807D3BC.s (see the
 * provenance note at the top of this file). Deliberately uses a goto/skip
 * control shape and j/k naming (matching the fall-through structure of the
 * m2c --valid-syntax output and the independently authored decomp.me upload)
 * instead of impl_fn's for/if-else shape, so a bug in impl_fn's specific
 * control-flow re-statement is not silently mirrored here.
 * ==========================================================================*/
static s8 ref_fn(Side *S, s32 x, s32 y, struct SumThing *result)
{
    struct SumThing array[MAXCELLS];
    u8 sel[MAXCELLS];
    s32 count = 0;
    s8 iy, ix;
    s8 j, k;
    int rn, pick;

    init_garbage(array);

    for (iy = y - 1; iy < y + 2; ++iy) {
        for (ix = x - 1; ix < x + 2; ++ix) {
            array[count].x = ix;
            array[count].y = iy;

            if (iy >= g_mapSize_y)
                goto skip;
            if (ix >= g_mapSize_x)
                goto skip;
            if (iy < 0)
                goto skip;
            if (ix < 0)
                goto skip;
            if (map_unit(iy, ix, x, y) != 0)
                goto skip;
            if (g_chapterVisionRange && map_fog(iy, ix, x, y) == 0)
                goto skip;
            if (o_CanUnitCrossTerrain(S, &g_battleActorUnit_marker, map_terrain(iy, ix, x, y)) != 0) {
                array[count].boolAvailable = 1;
                count++;
                continue;
            }
        skip:
            array[count].boolAvailable |= 0xff;
        }
    }

    if (count == 0)
        return -1;

    for (k = 8; k >= 0; --k)
        sel[k] = 0;

    k = 0;
    for (j = 0; j < count; ++j) {
        if (array[j].boolAvailable == 1) {
            sel[k] = j;
            k++;
        }
    }

    rn = o_AdvanceGetLCGRNValue(S);
    pick = o_DivRem(S, rn, count + 1) - 1;
    ASSUME(pick >= 0 && pick < count); /* domain caveat 2, see file header */
    *result = array[sel[pick]];
    return 1;
}

int main(void)
{
    s32 x, y;
    int iy, ix;
    struct SumThing result_ref, result_impl;
    u32 sentinel_hi, sentinel_lo;
    s8 sentinel_x, sentinel_y, sentinel_avail;
    Side R, I;
    s8 ret_ref, ret_impl;
    int k;

    /* ---- fixed-size input domain: small enough to be tractable, wide enough
     * to hit every relationship between the 3x3 window and the map bounds
     * (fully inside, fully outside on every side, and straddling a bound) --
     * requirement 6, "do not reduce to one cell". */
    x = nondet_int();
    y = nondet_int();
    ASSUME(x >= -1 && x <= 1);
    ASSUME(y >= -1 && y <= 1);

    g_mapSize_x = (s16) nondet_int();
    g_mapSize_y = (s16) nondet_int();
    ASSUME(g_mapSize_x >= 0 && g_mapSize_x <= 2);
    ASSUME(g_mapSize_y >= 0 && g_mapSize_y <= 2);

    g_chapterVisionRange = nondet_uchar();
    ASSUME(g_chapterVisionRange <= 1);

    /* occupancy/fog are only ever compared against 0, and terrain is only
     * ever forwarded opaquely to the CanUnitCrossTerrain contract (its
     * numeric value never drives control flow itself) -- restricting all
     * three to {0,1} keeps the full 2-way branch coverage of every use site
     * while cutting the SAT search space; see README.md "loop/domain bounds". */
    for (iy = 0; iy < 3; iy++) {
        for (ix = 0; ix < 3; ix++) {
            g_mapUnit[iy][ix] = nondet_uchar();
            g_mapFog[iy][ix] = nondet_uchar();
            g_mapTerrain[iy][ix] = nondet_uchar();
            ASSUME(g_mapUnit[iy][ix] <= 1);
            ASSUME(g_mapFog[iy][ix] <= 1);
            ASSUME(g_mapTerrain[iy][ix] <= 1);
        }
    }

    for (k = 0; k < MAX_TERRAIN; k++) {
        g_terrain_ret[k] = nondet_int();
        ASSUME(g_terrain_ret[k] == 0 || g_terrain_ret[k] == 1);
    }
    for (k = 0; k < MAX_RNG; k++) {
        g_rng_ret[k] = nondet_int();
        ASSUME(g_rng_ret[k] >= -20 && g_rng_ret[k] <= 20);
    }

    for (k = 0; k < MAXCELLS; k++) {
        g_garbage_hi[k] = nondet_uint();
        g_garbage_lo[k] = nondet_uint();
    }

    /* shared sentinel *result content so an untouched-on-return -1 buffer is
     * observable/comparable (requirement 4: "every byte/field written
     * through result"). */
    sentinel_x = (s8) nondet_int();
    sentinel_y = (s8) nondet_int();
    sentinel_avail = (s8) nondet_int();
    sentinel_hi = nondet_uint();
    sentinel_lo = nondet_uint();
    result_ref.x = result_impl.x = sentinel_x;
    result_ref.y = result_impl.y = sentinel_y;
    result_ref.boolAvailable = result_impl.boolAvailable = sentinel_avail;
    result_ref.unk04 = result_impl.unk04 = sentinel_hi;
    result_ref.unk08 = result_impl.unk08 = sentinel_lo;

    R.is_ref = 1;
    R.nlog = R.ci_terrain = R.ci_rng = R.ci_divrem = 0;
    I.is_ref = 0;
    I.nlog = I.ci_terrain = I.ci_rng = I.ci_divrem = 0;
    g_nlog_ref = 0;

    ret_ref = ref_fn(&R, x, y, &result_ref);
    ret_impl = impl_fn(&I, x, y, &result_impl);

    ASSERT(ret_ref == ret_impl, "same s8 return value");

    if (ret_ref == -1) {
        /* count == 0 on both sides (guaranteed by the return-value equality
         * assert above): *result must be left untouched. */
        ASSERT(result_ref.x == sentinel_x && result_impl.x == sentinel_x, "result.x untouched on -1");
        ASSERT(result_ref.y == sentinel_y && result_impl.y == sentinel_y, "result.y untouched on -1");
        ASSERT(result_ref.boolAvailable == sentinel_avail && result_impl.boolAvailable == sentinel_avail,
               "result.boolAvailable untouched on -1");
        ASSERT(result_ref.unk04 == sentinel_hi && result_impl.unk04 == sentinel_hi, "result.unk04 untouched on -1");
        ASSERT(result_ref.unk08 == sentinel_lo && result_impl.unk08 == sentinel_lo, "result.unk08 untouched on -1");
    } else {
        ASSERT(result_ref.x == result_impl.x, "result.x equal");
        ASSERT(result_ref.y == result_impl.y, "result.y equal");
        ASSERT(result_ref.boolAvailable == result_impl.boolAvailable, "result.boolAvailable equal");
        ASSERT(result_ref.unk04 == result_impl.unk04, "result.unk04 equal (shared per-slot garbage, see caveat 1)");
        ASSERT(result_ref.unk08 == result_impl.unk08, "result.unk08 equal (shared per-slot garbage, see caveat 1)");
    }

    ASSERT(R.nlog == I.nlog, "same total external-call count/order");
    ASSERT(R.ci_terrain == I.ci_terrain, "same number of CanUnitCrossTerrain calls");
    ASSERT(R.ci_rng == I.ci_rng, "same number of AdvanceGetLCGRNValue calls");
    ASSERT(R.ci_divrem == I.ci_divrem, "same number of DivRem calls");

    return 0;
}
