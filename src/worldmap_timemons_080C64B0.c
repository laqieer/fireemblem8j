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

int GetWmMonsterGenAmount(int idx)
{
    static const int chance_lut[] = {
        100,   0,   0,
        100,   0,   0,
        100,   0,   0,
        100, 100,   0,
        100, 100,   0,
        100, 100,   0,
        100, 100,   0,
        100, 100, 100,
        100, 100, 100,
        100, 100, 100,
        100, 100, 100,
    };

    int i, ret = 0;

#if !NONMATCHING
    const int * __chance_lut = chance_lut;
    const int * _chance_lut  = &__chance_lut[idx * 3];
#else
    const int * _chance_lut = &chance_lut[idx * 3];
#endif

    for (i = 0; i < 3; i++)
    {
        if (NextRN_100() < _chance_lut[i])
            ret++;
    }
    return ret;
}
