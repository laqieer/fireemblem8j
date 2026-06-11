#include "global.h"
#include "constants/items.h"
#include "constants/classes.h"
#include "constants/songs.h"
#include "ap.h"
#include "bm.h"
#include "bmio.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmtrick.h"
#include "bmbattle.h"
#include "bmarch.h"
#include "bmudisp.h"
#include "hardware.h"
#include "m4a.h"
#include "mapanim.h"
#include "mu.h"
#include "bmlib.h"
#include "proc.h"
#include "ctc.h"
#include "soundwrapper.h"
#include "spellassoc.h"
/* TU-private data externs bound at their JP addresses */
extern u16 sMuChrOffLut[];
extern u16 sMuChrOffLut_Default[];
extern struct MuConfig sMuConfig[];

struct MuConfig * GetDefaultMuConfig(int objTileId, u8 * outIndex)
{
    int i;
    for (i = 0; i < MU_MAX_COUNT; ++i)
    {
        if (sMuConfig[i].slot)
            continue;

        sMuConfig[i].slot = i + 1;
        sMuConfig[i].chr = sMuChrOffLut_Default[i] + objTileId;

        *outIndex = i;
        return sMuConfig + i;
    }
    return NULL;
}

struct MuConfig * GetNewMuConfig(int objTileId, u8 * outIndex)
{
    int i;
    for (i = 0; i < MU_MAX_COUNT; ++i)
    {
        if (sMuConfig[i].slot)
            continue;

        sMuConfig[i].slot = i + 1;
        sMuConfig[i].chr = sMuChrOffLut[i] + objTileId;

        *outIndex = i;
        return sMuConfig + i;
    }
    return NULL;
}
