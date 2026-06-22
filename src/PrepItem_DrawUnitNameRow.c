#include "global.h"
#include "bmunit.h"
#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"
#include "fontgrp.h"
#include "bm.h"
#include "uiutils.h"
#include "bmshop.h"
#include "bmitem.h"
#include "worldmap.h"
#include "prepscreen.h"
#include "constants/characters.h"
#include "constants/items.h"

//! FE8U = 0x0809C3E8
void PrepItem_DrawUnitNameRow(struct PrepItemScreenProc * proc, u8 row, s8 flag)
{
    int i;
    int idx;
    struct Text * text;
    bool isWmSecretShop;
    int iflag = flag;

    idx = row * 3;
    text = &gPrepItemTexts[idx % 15];

    if (gGMData.state.bits.state_0 && GetGMapBaseMenuKind() == SHOP_TYPE_SECRET_SHOP)
    {
        isWmSecretShop = true;
    }
    else
    {
        isWmSecretShop = false;
    }

    for (i = 0; i < 3; text++, i++)
    {
        int x;
        int y;

        if (iflag == 0)
        {
            ClearText(text);
        }

        if (idx + i >= PrepGetUnitAmount())
        {
            continue;
        }

        x = (i % 3) * 8;
        y = (row * 2) & 31;

        if (iflag == 0)
        {
            struct Unit * unit = GetUnitFromPrepList(idx + i);

            Text_SetCursor(text, 0);

            if (isWmSecretShop)
            {
                if (UnitHasItem(unit, ITEM_MEMBERCARD))
                {
                    Text_SetColor(text, TEXT_COLOR_SYSTEM_WHITE);
                }
                else
                {
                    Text_SetColor(text, TEXT_COLOR_SYSTEM_GRAY);
                }
            }
            else
            {
                Text_SetColor(text, TEXT_COLOR_SYSTEM_WHITE);
            }

            Text_DrawString(text, GetStringFromIndex(unit->pCharacterData->nameTextId));
        }

        PutText(text, TILEMAP_LOCATED(gBG2TilemapBuffer, x, y));
    }

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    return;
}
