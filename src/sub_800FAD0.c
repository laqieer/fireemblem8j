#include "global.h"
#include "bmunit.h"
#include "event.h"
#include "rng.h"

/*
 * GetUnitDefinitionFormEventScr (JP 0x0800FAD0).
 *
 * The fifth ABI argument is intentionally declared as int, then narrowed once
 * into disableReda. Callers pass the original s8 value promoted to a word; this
 * source shape schedules that narrowing after buildFlag receives its stack
 * home, matching the JP prologue exactly.
 */
struct UnitDefinition * GetUnitDefinitionFormEventScr(
    struct UnitDefinition * source,
    short count,
    u8 arg2,
    s8 arg3,
    int arg4)
{
    u8 array[0x40];
    u16 r;
    u16 i;
    u16 arraySize;
    const struct UnitDefinition * itSource;
    struct
    {
        unsigned loBits, hiBits;
    } mask;
    int buildFlag = arg3;
    int disableReda;

    asm("" : "+m"(buildFlag));
    disableReda = (s8) arg4;

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

#define MASK_BIT_GET(i) (((i) < 0x20) ? (mask.loBits & (1 << (i))) : (mask.hiBits & (1 << ((i) - 0x20))))
#define MASK_BIT_SET(i) (((i) < 0x20) ? (mask.loBits |= (1 << (i))) : (mask.hiBits |= (1 << ((i) - 0x20))))

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

    source->charIndex = 0;

    if (disableReda == TRUE)
    {
        source = gLoadUnitBuffer;

        for (i = 0; i < count; i++)
        {
            source->redaCount = 0;
            source->redas = NULL;
            source++;
        }
    }

    source = gLoadUnitBuffer;

    {
        register int buildRead asm("r5") = buildFlag;

        asm("" : "+r"(buildRead));

        if (buildRead == TRUE)
            BuildDeployedUnitDefinitionList(source);
    }

#undef MASK_BIT_GET
#undef MASK_BIT_SET

    return source;
}
