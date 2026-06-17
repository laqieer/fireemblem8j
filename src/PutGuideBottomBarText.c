#include "global.h"
#include "eventinfo.h"
#include "bmshop.h"
#include "fontgrp.h"
#include "ctc.h"
#include "hardware.h"
#include "uiutils.h"
#include "bmlib.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmio.h"
#include "bm.h"
#include "bmguide.h"
#include "constants/songs.h"

extern struct GuideSt * gGuideSt;
extern u16 gTextIds_GuideCategoriesTopic[];

void PutGuideBottomBarText(void)
{
    if (gGuideSt->sortMode != GUIDE_SORT_MODE_TOPIC)
    {
        return;
    }

    ClearText(&gGuideSt->unk_ec);
    PutDrawText(
        &gGuideSt->unk_ec, TILEMAP_LOCATED(gBG0TilemapBuffer, 4, 18), TEXT_COLOR_SYSTEM_WHITE, 0, 22,
        GetStringFromIndex(gTextIds_GuideCategoriesTopic[gGuideSt->unk_54[gGuideSt->categoryIdx]]));

    Text_DrawString(&gGuideSt->unk_ec, GetStringFromIndex(0x566));

    return;
}
