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

extern u32 gUnitlistscreen_9[8];

//! FE8U
void UnitList_RegisterEquippedIcon(int itemIconId)
{
    int i;

    for (i = 0; i < 8; i++)
    {
        if (gUnitlistscreen_9[i] == itemIconId)
        {
            return;
        }
    }

    for (i = 0; i < 8; i++)
    {
        if (gUnitlistscreen_9[i] == UINT8_MAX)
        {
            gUnitlistscreen_9[i] = itemIconId;
            return;
        }
    }

    return;
}
