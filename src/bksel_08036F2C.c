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

void PutBattleForecastTilemaps(struct BattleForecastProc * proc)
{
    int height = proc->frameKind == 1 ? 16 : 20;

    if (proc->side < 0) {
        TileMap_CopyRect(gUiTmScratchA, gBG0TilemapBuffer, 10, height);
        TileMap_CopyRect(gUiTmScratchB, gBG1TilemapBuffer, 10, height);
    } else {
        TileMap_CopyRect(gUiTmScratchA, gBG0TilemapBuffer + 20, 10, height);
        TileMap_CopyRect(gUiTmScratchB, gBG1TilemapBuffer + 20, 10, height);
    }

    BG_EnableSyncByMask(3);
}
