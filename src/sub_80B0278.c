#include "global.h"

#include "hardware.h"
#include "fontgrp.h"
#include "ctc.h"
#include "bmlib.h"
#include "savemenu.h"

void SaveMenuDrawSubSelBoxExt(int msgId, bool draw_en)
{
    const char * str;
    if (draw_en != 0)
    {
        str = GetStringFromIndex(msgId);
        SetTextFont(&gSaveMenuSubBoxFont);
        ClearText(&gSaveMenuSubBoxText);
        Text_SetCursor(&gSaveMenuSubBoxText, 0);
        Text_SetColor(&gSaveMenuSubBoxText, 0);
        Text_DrawString(&gSaveMenuSubBoxText, str);
        Text_SetCursor(&gSaveMenuSubBoxText, 0x2c);
        Text_DrawString(&gSaveMenuSubBoxText, GetStringFromIndex(0x7C3));
        PutText(&gSaveMenuSubBoxText, TILEMAP_LOCATED(gBG1TilemapBuffer, 7, 17));
    }
    else
    {
        TileMap_FillRect(TILEMAP_LOCATED(gBG1TilemapBuffer, 7, 17), 0xb, 1, 0);
    }
    BG_EnableSyncByMask(2);
}
