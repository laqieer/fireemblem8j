#include "global.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "hardware.h"
#include "fontgrp.h"
#include "ap.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "mapanim.h"
#include "bmlib.h"

void PutManimLevelUpFrame(int actor_id, int x, int y)
{
    int i;

    BG_Fill(gBG1TilemapBuffer, 0);

    Decompress(Img_LevelUpBoxFrame, (void *)VRAM + GetBackgroundTileDataOffset(1) + 0x200 * CHR_SIZE);
    Decompress(Tsa_LevelUpBoxFrame, gGenericBuffer);
    PutTmLinear((void *)gGenericBuffer, (void *)gBG1TilemapBuffer, 0x20 * 0x1C, TILEREF(0x200, BGPAL_MANIM_INFO));
    ApplyPalette(Pal_LevelUpBoxFrame, BGPAL_MANIM_INFO);

    PutString(
        TILEMAP_LOCATED(gBG0TilemapBuffer, x + 2, y),
        TEXT_COLOR_SYSTEM_WHITE,
        GetStringFromIndex(gManimSt.actor[actor_id].unit->pClassData->nameTextId));

    for (i = 0; gManimLevelUpLabelInfoList[i].x != 0xFF; i++) {
        PutStringCentered(
            TILEMAP_LOCATED(gBG0TilemapBuffer, x + gManimLevelUpLabelInfoList[i].x, y + gManimLevelUpLabelInfoList[i].y),
            TEXT_COLOR_SYSTEM_GOLD, 3,
            GetStringFromIndex(*gManimLevelUpLabelInfoList[i].msg[UnitHasMagicRank(gManimSt.actor[actor_id].unit) == true]));
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT + BG1_SYNC_BIT);
}
