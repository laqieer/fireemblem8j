#include "global.h"
#include "fontgrp.h"
#include "ctc.h"
#include "hardware.h"
#include "uiutils.h"
#include "bmguide.h"

extern struct GuideSt * gGuideSt;
extern int gTextIds_GuideCategoriesChapter[];
extern u16 gTextIds_GuideCategoriesTopic[];

void PutGuideCategoryName(int strIndex, int textIndex, int y)
{
    const char * str;

    ClearText(&gGuideSt->unk_7c[textIndex]);

    str = (gGuideSt->sortMode != GUIDE_SORT_MODE_TOPIC)
        ? GetStringFromIndex(gTextIds_GuideCategoriesChapter[gGuideSt->unk_40[strIndex]])
        : GetStringFromIndex(gTextIds_GuideCategoriesTopic[gGuideSt->unk_54[strIndex]]);

    PutDrawText(
        &gGuideSt->unk_7c[textIndex], TILEMAP_LOCATED(gBG1TilemapBuffer, 2, y), TEXT_COLOR_SYSTEM_WHITE, 0, 9, str);
    return;
}
