#include "global.h"

#include "bmunit.h"
#include "mu.h"
#include "bmmap.h"
#include "bmudisp.h"
#include "hardware.h"
#include "cp_utility.h"
#include "bmidoten.h"
#include "rng.h"
#include "bmtrick.h"

#include "muctrl.h"

//! FE8U = 0x0807C44C
void GenUnitDefinitionFinalPosition(const struct UnitDefinition * def, s8 * xOut, s8 * yOut, s8 findNearest)
{
    struct Unit * unit;
    const struct REDA * reda;
    struct Vec2 pos;

    int findNearest_ = findNearest;

    if (def->redaCount != 0)
    {
        u32 tmp = (-findNearest_ | findNearest_);
        u16 flags = tmp >> 0x1f;

        if (def->sumFlag != 0)
        {
            flags |= 2;
        }

        unit = GetUnit(def->charIndex);

        reda = (struct REDA *)(def->redas) - 1 + def->redaCount;

        pos.x = reda->x;
        pos.y = reda->y;

        AdjustNewUnitPosition(unit, &pos, flags);
        *xOut = pos.x;
        *yOut = pos.y;
    }
    else
    {
        *xOut = def->xPosition;
        *yOut = def->yPosition;
    }

    return;
}
