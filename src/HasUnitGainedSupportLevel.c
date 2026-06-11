#include "global.h"
#include "bmunit.h"
#include "bmreliance.h"

static s8 HasUnitGainedSupportLevel(struct Unit* unit, int num)
{
    s8 result = unit->supportBits & (1 << num);
    return result ? TRUE : FALSE;
}
