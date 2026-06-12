#include "global.h"

#include "constants/items.h"

#include "bmunit.h"
#include "bmbattle.h"
#include "icon.h"
#include "fontgrp.h"
#include "bmitem.h"
#include "hardware.h"
#include "uiutils.h"
#include "ctc.h"
#include "event.h"
#include "bmmap.h"
#include "statscreen.h"
#include "bm.h"
#include "bmlib.h"
#include "eventinfo.h"
#include "bksel.h"
#include "helpbox.h"

extern EWRAM_OVERLAY(0) struct Text gaBattleForecastTextStructs[6];
extern EWRAM_OVERLAY(0) u16 gBkselPals[8][16];

void BattleForecast_LoopSlideIn(struct BattleForecastProc * proc)
{
    static s8 offsetLut[] = { 6, 8, 9, 10 };
    int offset;

    int height = proc->frameKind == 1 ? 16 : 20;

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);

    BG_EnableSyncByMask(3);

    offset = offsetLut[proc->slide_offset];

    if (proc->side < 0) {
        TileMap_CopyRect(gUiTmScratchA + (10 - offset), gBG0TilemapBuffer, offset, height);
        TileMap_CopyRect(gUiTmScratchB + (10 - offset), gBG1TilemapBuffer, offset, height);
    } else {
        TileMap_CopyRect(gUiTmScratchA, gBG0TilemapBuffer + (30 - offset), offset, height);
        TileMap_CopyRect(gUiTmScratchB, gBG1TilemapBuffer + (30 - offset), offset, height);
    }

    proc->slide_offset++;

    if ((u8)proc->slide_offset == 4) {
        proc->slide_offset = 0;
        Proc_Break(proc);
    }
}
