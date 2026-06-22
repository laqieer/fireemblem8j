#include "global.h"

#include "bmunit.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "worldmap.h"
#include "prepscreen.h"

#include "constants/msg.h"

int CheckInLinkArena(void);

void PrepItem_DrawCommandMenuText(struct PrepItemScreenProc * proc, u16 * tilemap, struct Unit * unit)
{
    TileMap_FillRect(tilemap, 10, 6, 0);

    ClearText(&gPrepItemTexts[25]);
    Text_InsertDrawString(
        &gPrepItemTexts[25], 0, PrepGetUnitAmount() < 2 ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE,
        GetStringFromIndex(0x51F)); /* JP: 0x51F (US MSG_594) "Trade" */
    Text_InsertDrawString(
        &gPrepItemTexts[25], 36, PrepGetUnitAmount() < 2 ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE,
        GetStringFromIndex(0x520)); /* JP: 0x520 (US MSG_595) "List" */
    PutText(&gPrepItemTexts[25], TILEMAP_LOCATED(tilemap, 0, 1));

    ClearText(&gPrepItemTexts[26]);
    Text_InsertDrawString(
        &gPrepItemTexts[26], 0, !CanUnitPrepScreenUse(unit) ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE,
        GetStringFromIndex(0x521)); /* JP: 0x521 (US MSG_596) "Use" */
    Text_InsertDrawString(
        &gPrepItemTexts[26], 36, !proc->hasConvoyAccess ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE,
        GetStringFromIndex(0x525)); /* JP: 0x525 (US MSG_59A) "Give all" */
    PutText(&gPrepItemTexts[26], TILEMAP_LOCATED(tilemap, 0, 3));

    ClearText(&gPrepItemTexts[27]);
    Text_InsertDrawString(
        &gPrepItemTexts[27], 0, !proc->hasConvoyAccess ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE,
        GetStringFromIndex(0x523)); /* JP: 0x523 (US MSG_598) "Supply" */

    if (gGMData.state.bits.state_0)
    {
        struct Text * th = &gPrepItemTexts[27];
        int color = TEXT_COLOR_SYSTEM_WHITE;
        if ((!proc->hasConvoyAccess) || (GetUnitItemCount(unit) < 1) || CheckInLinkArena())
        {
            color = TEXT_COLOR_SYSTEM_GRAY;
        }
        Text_InsertDrawString(th, 36, color, GetStringFromIndex(0x522)); /* JP: 0x522 (US MSG_597) "Sell" */
    }
    else
    {
        if (CheckInLinkArena())
        {
            Text_InsertDrawString(
                &gPrepItemTexts[27], 36, TEXT_COLOR_SYSTEM_GRAY, GetStringFromIndex(0x524)); /* JP: 0x524 (US MSG_599) "Armory" */
        }
        else
        {
            Text_InsertDrawString(
                &gPrepItemTexts[27], 36, TEXT_COLOR_SYSTEM_WHITE, GetStringFromIndex(0x524)); /* JP: 0x524 (US MSG_599) "Armory" */
        }
    }

    PutText(&gPrepItemTexts[27], TILEMAP_LOCATED(tilemap, 0, 5));

    return;
}
