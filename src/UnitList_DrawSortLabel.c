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

//! FE8U = 0x08090238
void UnitList_DrawSortLabel(u8 key)
{
    int i;
    int j;

    TileMap_FillRect(TILEMAP_LOCATED(gBG2TilemapBuffer, 21, 1), 4, 1, 0);

    ClearText(&gUnitlistscreen_6);

    for (i = 0; i < 10; i++)
    {
        for (j = 0; j < 9; j++)
        {
            if (gUnitListScreenFields[i][j].sortKey == key)
            {
                Text_SetCursor(&gUnitlistscreen_6, 0);
                Text_SetColor(&gUnitlistscreen_6, 0);

                Text_DrawString(&gUnitlistscreen_6, GetStringFromIndex(0x48C));

                if ((i == 5) && (j != 0))
                {
                    PutText(&gUnitlistscreen_6, TILEMAP_LOCATED(gBG2TilemapBuffer, 21, 1));
                    DrawIcon(TILEMAP_LOCATED(gBG2TilemapBuffer, 25, 1), j + 111, OAM2_PAL(5));
                }
                else
                {
                    Text_Skip(&gUnitlistscreen_6, 4);
                    Text_DrawString(&gUnitlistscreen_6, GetStringFromIndex(gUnitListScreenFields[i][j].labelString));
                    PutText(&gUnitlistscreen_6, TILEMAP_LOCATED(gBG2TilemapBuffer, 21, 1));
                }

                break;
            }
        }
    }

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    return;
}
