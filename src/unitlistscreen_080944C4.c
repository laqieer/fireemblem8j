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

//! FE8U = 0x080921CC
void UnitList_DrawColumnNames(u16 * tm, u8 page)
{
    int i;

    TileMap_FillRect(tm + 9, 19, 1, 0);
    ClearText(&gUnitlistscreen_5);

    if (page == UNITLIST_PAGE_WEXP)
    {
        for (i = 0; i < 8; i++)
        {
            DrawIcon(tm + 9 + 2 * i, i + 112, OAM2_PAL(5));
        }
    }
    else
    {
        for (i = 1; i < 9 && gUnitListScreenFields[page][i].xColumn != 0; i++)
        {
            Text_SetCursor(&gUnitlistscreen_5, gUnitListScreenFields[page][i].xColumn - 64);
            Text_SetColor(&gUnitlistscreen_5, TEXT_COLOR_SYSTEM_WHITE);
            Text_DrawString(&gUnitlistscreen_5, GetStringFromIndex(gUnitListScreenFields[page][i].labelString));
        }

        PutText(&gUnitlistscreen_5, tm + 8);
    }

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    return;
}
