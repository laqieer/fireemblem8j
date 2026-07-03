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
 * STATUS = clean register-permutation NEAR (agbcc-2.95 spill/coloring wall, §7 of
 * docs/agbcc-matching-playbook.md). With `-mjp-promote` the body is byte-identical
 * to the JP ROM in EVERY opcode and immediate; the ONLY residual is a whole-function
 * register renaming driven by ONE coloring decision:
 *
 *   TARGET (JP)                    CURRENT (agbcc)          root cause
 *   fae8: lsrs r7, r2, #0x18       lsrs r2, r2, #0x18       arg2 -> r7 (callee-saved) vs stays r2
 *   fafa: movs r3, #0              movs r7, #0              i    -> r3 (caller-saved) vs r7
 *   fb0a: ldr  r2, [sp,#0x48]      ldr  r3, [sp,#0x48]      itSource reload temp -> r2 vs r3
 *   fb38: muls r0, r7             muls r0, r2               (cascades from arg2's home)
 *   ...  (i in r3, "1" const in r7, zero via r5) — same instructions, permuted regs
 *
 * JP holds the loop induction `i` in CALLER-saved r3 and SPILLS it to [sp,#0x44]
 * around the NextRN_N call, keeping arg2 alive in CALLEE-saved r7. agbcc instead
 * colors `i` in callee-saved r7 (no spill needed) and leaves arg2 in caller-saved
 * r2 (the counting loop's pointer temp lands in r3, so r2 stays free). Both are
 * valid; agbcc's is actually fewer spills. This is the spill-decision NEAR class
 * the playbook records as NOT crackable by the flag matrix.
 *
 * LEVERS TRIED (single-TU objdiff vs baserom 0xFAD0..0xFCA0; 91 diff-lines = base):
 *   - `register u16 i asm("r3")`               -> WORSE (105)
 *   - `register u8 a2 asm("r7") = arg2`        -> WORSE (113, adds a move)
 *   - declaration reorder (itSource first; i<->r) -> NO EFFECT (91, stack-homed)
 *   - int-local-widen on `i`                   -> N/A (JP re-narrows i each iter, so i must stay u16)
 * PERMUTER: scripts/permuter (8 workers, ~9,930 iters, -mjp-promote-patched
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

    arraySize = 0;
    i = 0;
    if (arg2)
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

        i = Div((arraySize * arg2) + 50, 100);
    }

#define MASK_BIT_GET(i) (((i) < 0x20) ? (mask.loBits & (1 << (i))) : (mask.hiBits & (1 << ((i)-0x20))))
#define MASK_BIT_SET(i) (((i) < 0x20) ? (mask.loBits |= (1 << (i))) : (mask.hiBits |= (1 << ((i)-0x20))))

    mask.loBits = 0;
    mask.hiBits = 0;

    while (i)
    {
        r = NextRN_N(arraySize);
        r = array[r];

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
