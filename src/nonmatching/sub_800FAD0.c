/* NON_MATCHING: byte source is asm/sub_800FAD0.s @ JP 0x0800FAD0 (464B,
 * region-different, gbadisasm descriptive asm; carved_rom places those bytes).
 * This C DOCUMENTS the reconstruction and is NOT in make-compare: compiled only
 * by `make nonmatching`.
 *
 * Proposed real name: GetUnitDefinitionFormEventScr
 * fe8u source ref:     src/eventscr.c:2376 (NONMATCHING body, decomp.me/scratch/IyKOH)
 * JP region delta:     arg signedness — count s16 (lsls#0x10/asrs), arg2 u8
 *                      (lsls#0x18/lsrs), arg3 & arg4 s8 (lsls#0x18/asrs); built
 *                      with -mjp-promote (declaration-order incoming-param
 *                      extension). Signature below reproduces that prologue EXACTLY.
 *
 * STATUS = improved register-permutation NEAR. Under the actual
 * `-O2 -mjp-promote` pipeline, the source below scores 85 (down from the trusted
 * 480 seed and the prior semantically-invalid 330 permuter result). Instruction
 * count and opcodes now match; the residual is:
 *
 *   TARGET (JP)                    CURRENT (agbcc)
 *   fae8: lsrs r7, r2, #0x18       same instruction after arg3/arg4 extension
 *   faee: str  r3, [sp,#0x40]       str  r3, [sp,#0x44]      arg3 slot
 *   fb54: str  r3, [sp,#0x44]       str  r3, [sp,#0x40]      selection-count slot
 *   fb64: ldr  r3, [sp,#0x44]       ldr  r3, [sp,#0x40]
 *   fc84: ldr  r5, [sp,#0x40]       ldr  r5, [sp,#0x44]
 *
 * The decisive improvement is a long-lived `int chance`, a scoped word-sized
 * memory pseudo for `i` around `NextRN_N`, an explicit r0 call argument, and a
 * tied empty-asm reload that preserves the known-u16 value without adding a
 * narrowing pair. This reproduces JP's r7 chance / r3 selection count and its
 * spill/reload sequence; only the two stack homes and one extension schedule
 * remain swapped.
 *
 * CAMPAIGN 2026-07-11:
 *   - eZzgG family harvest: NONE (base/best 11920 upstream).
 *   - four independent, bounded 15,000-iteration lanes (60,000 total), with
 *     failed compiles fail-closed and chain/removal/remote-CFG mutations disabled:
 *     no generated candidate beat the prior valid threshold of 330.
 *   - deterministic source review produced this score-85 candidate.
 *   - semantics: CBMC `0 of 374 failed` / VERIFICATION SUCCESSFUL at COUNTMAX=4;
 *     differential Unicorn test EQUIV over 200 in-domain trials.
 *
 * HISTORICAL LEVERS:
 *   - `register u16 i asm("r3")`               -> WORSE (105)
 *   - `register u8 a2 asm("r7") = arg2`        -> WORSE (113, adds a move)
 *   - declaration reorder (itSource first; i<->r) -> NO EFFECT (91, stack-homed)
 *   - int-local-widen on `i`                   -> N/A (JP re-narrows i each iter, so i must stay u16)
 *   - scripts/permuter (8 workers, ~9,930 iters, -mjp-promote-patched
 *   compile.sh, --stop-on-zero) — base score 480, best 330 but that 330 mutation
 *   is SEMANTICALLY INVALID (`r = (i = NextRN_N(...))`); NO valid score-0 found.
 *
 * Graduate via a future permuter/lever breakthrough on the coloring -> move to
 * src/, add `src/sub_800FAD0.o: CC1FLAGS += -mjp-promote`, flip
 * layout/carved_rom.d/gbadisasm_sub_800FAD0.tsv to src/sub_800FAD0.o(.text), and
 * drop the GetUnitDefinitionFormEventScr baseline alias. make compare is the only oracle. */
// FLAGS: -mjp-promote
#include "global.h"
#include "bmunit.h"
#include "event.h"
#include "rng.h"

struct UnitDefinition * GetUnitDefinitionFormEventScr(struct UnitDefinition * source, short count, u8 arg2, s8 arg3, s8 arg4)
{
    u8  array[0x40];
    u16 r;
    u16 i;
    u16 arraySize;
    const struct UnitDefinition * itSource;
    struct
    {
        unsigned loBits, hiBits;
    } mask;
    int chance = arg2;

    arraySize = 0;
    i = 0;
    if (chance)
    {
        itSource = source;
        ++i; --i;
        for (; i < count; i++)
        {
            if (itSource->sumFlag)
            {
                array[arraySize] = i;
                arraySize++;
            }

            itSource++;
        }

        i = Div((arraySize * chance) + 50, 100);
    }

#define MASK_BIT_GET(i) (((i) < 0x20) ? (mask.loBits & (1 << (i))) : (mask.hiBits & (1 << ((i)-0x20))))
#define MASK_BIT_SET(i) (((i) < 0x20) ? (mask.loBits |= (1 << (i))) : (mask.hiBits |= (1 << ((i)-0x20))))

    mask.loBits = 0;
    mask.hiBits = 0;

    while (i)
    {
        {
            register int callN asm("r0") = arraySize;
            int iSpill = i;

            asm("" : "+r"(callN));
            asm("" : "+m"(iSpill));
            r = NextRN_N(callN);
            r = array[r];
            asm("" : "=r"(i) : "0"(iSpill));
        }

        if (!MASK_BIT_GET(r))
        {
            MASK_BIT_SET(r);
            i--;
        }
    }
    itSource = source;
    source = gLoadUnitBuffer;

    for (i = 0; i < count; i++)
    {
        if (!MASK_BIT_GET(i))
        {
            *source = itSource[i];
            source->sumFlag = FALSE;
            source++;
        }
    }

    for (i = 0; i < count; i++)
    {
        if (MASK_BIT_GET(i))
        {
            *source = itSource[i];
            source->sumFlag = TRUE;
            source++;
        }
    }

    source->charIndex = 0; // marks the end of the unit block

    if (arg4 == TRUE)
    {
        source = gLoadUnitBuffer;

        for (i = 0; i < count; i++)
        {
            source->redaCount = 0;
            source->redas     = NULL;
            source++;
        }
    }

    source = gLoadUnitBuffer;

    if (arg3 == TRUE)
        BuildDeployedUnitDefinitionList(source);

#undef MASK_BIT_GET
#undef MASK_BIT_SET

    return source;
}
