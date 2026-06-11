#include "global.h"
#include "bmunit.h"
#include "prepscreen.h"
#include "ctc.h"
#include "hardware.h"
#include "icon.h"
#include "bmitem.h"
#include "statscreen.h"
#include "mu.h"
#include "uiutils.h"
#include "bmudisp.h"
#include "bmlib.h"
#include "bmreliance.h"
#include "hardware.h"
#include "bm.h"
#include "helpbox.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmio.h"
#include "sio.h"
#include "unitlistscreen.h"
#include "constants/songs.h"

//! FE8U = 0x08090358
void UnitList_ClearUnusedEquipIcons(u16 arg_0)
{
    int displayIcons[10];
    int i;
    int j;

    int offset = arg_0 / 16;

    for (i = 0; i < 8; i++)
    {
        displayIcons[i] = UINT8_MAX;
    }

    if (offset > 0)
        offset = offset - 1;

    for (i = 0; i < 8 && i + offset < gUnitlistscreen_8; i++)
    {
        if (GetUnitEquippedWeapon(gSortedUnits[offset + i]->unit) != 0)
        {
            displayIcons[i] = GetItemIconId(GetUnitEquippedWeapon(gSortedUnits[offset + i]->unit));
        }
    }

    for (i = 0; i < 8; i++)
    {
        if (gUnitlistscreen_9[i] != UINT8_MAX)
        {
            s8 iconInUse = 0;

            for (j = 0; j < 8; j++)
            {
                if (displayIcons[j] == gUnitlistscreen_9[i])
                    iconInUse = 1;
            }

            if (!iconInUse)
            {
                ClearIconGfx(gUnitlistscreen_9[i]);
                gUnitlistscreen_9[i] = UINT8_MAX;
            }
        }
    }

    return;
}
