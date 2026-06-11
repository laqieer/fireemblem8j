#include "global.h"
#include "bmunit.h"
#include "bmreliance.h"

static const struct SupportBonuses* GetAffinityBonuses(int affinity)
{
    const struct SupportBonuses* it;

    for (it = gAffinityBonuses; it->affinity; ++it)
    {
        if (it->affinity == affinity)
            return it;
    }

    // return NULL; // BUG?
}
