#include "global.h"

#include "bmsave.h"
#include "hardware.h"
#include "worldmap.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "uiutils.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "spline.h"
#include "sysutil.h"
#include "savemenu.h"
#include "constants/songs.h"

extern struct Unknown_08A209FC gDifficultymenu_0[];

extern EWRAM_OVERLAY(0) u8 gPlayStChapterBits[4];
extern EWRAM_OVERLAY(0) u8 gPlayStChapterMode[4];
extern EWRAM_OVERLAY(0) struct PlaySt_OptionBits gPlayStOptionBits[4];

//! FE8U = 0x080AC034
void DifficultySelect_PutModeText(struct DifficultyMenuProc * proc)
{
    int i;

    TileMap_FillRect(TILEMAP_LOCATED(gBG0TilemapBuffer, 7, 7), 14, 10, 0);

    for (i = 0; i < 5; i++)
    {
        PutText(&proc->unk_38[i], TILEMAP_LOCATED(gBG0TilemapBuffer, 18, 7 + i * 2));
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    return;
}
