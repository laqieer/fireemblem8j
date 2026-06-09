#include "global.h"

#include "hardware.h"
#include "ap.h"
#include "bmlib.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "ctc.h"
#include "mu.h"
#include "spline.h"

#include "worldmap.h"

// TODO: bmudisp.h - implicit declaration
void SMS_DisplayOne(int class, int layer, int x, int y, int oam2, int isBlend);

//! FE8U = 0x080BADD4
int GetPaletteIdForAllegience(int faction)
{
    switch (faction)
    {
        case FACTION_ID_BLUE:
        default:
            return 0xc;

        case FACTION_ID_GREEN:
            return 0xd;

        case FACTION_ID_RED:
            return 0xe;
    }
}
