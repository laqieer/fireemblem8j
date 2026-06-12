#include "global.h"
#include "proc.h"
#include "worldmap.h"
#include "rng.h"
#include "ap.h"
#include "bmmind.h"
#include "eventinfo.h"
#include "soundwrapper.h"
#include "constants/worldmap.h"
#include "constants/chapters.h"
#include "constants/songs.h"

/**
 * Generate random monsters on the worldmap
 */

extern const u8 gWMMonsterSpawnLocations[WM_MON_LOC_MAX];



int GenerateRandomonsterMergeNode(const u8 * lut, int idx)
{
    int i;
    int ret, rn;

    ret = 0;
    for (i = 0; i < idx; i++)
        ret = ret + lut[i];

    if (ret == 0)
        return -1;

    rn = NextRN_N(ret);

    ret = 0;
    for (i = 0; i < idx; i++)
    {
        ret += lut[i];
        if (rn < ret)
            break;
    }
    return i;
}
