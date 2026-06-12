#include "global.h"

#include "chapterdata.h"
#include "bmsave.h"
#include "hardware.h"
#include "face.h"
#include "bmreliance.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "bmsave.h"
#include "ctc.h"
#include "bmlib.h"
#include "bmtrade.h"
#include "worldmap.h"
#include "savemenu.h"
#include "sysutil.h"
#include "scene.h"

#include "ending_details.h"

#include "constants/chapters.h"
#include "constants/characters.h"
#include "constants/msg.h"
#include "constants/songs.h"


extern EWRAM_OVERLAY(gameending) u16 gEndingTmScratchA[0x800 / 2];













extern u16 * CONST_DATA gSoloEndingBattleDispConf[];



// clang-format on

//! FE8U = 0x080B7648
void TurnRecord_Init(struct EndingTurnRecordProc * proc)
{
    proc->yPos = 0;
    proc->yScrollAmt = 32;
    proc->displayId = 0;
    proc->chapterId = 0;
    proc->chapterStatsIdx = GetNextChapterStatsSlot();

    SetDispEnable(0, 0, 0, 0, 0);

    SetPrimaryHBlankHandler(NULL);
    SetupBackgrounds(NULL);

    // ??
    SetDispEnable(0, 0, 0, 0, 0);

    SetDefaultColorEffects();
    ResetText();

    SetWinEnable(0, 0, 0);

    ApplyPalettes(Pal_FinScreen_1, 14, 2);
    CallARM_FillTileRect(gBG3TilemapBuffer, Tsa_EndingFin, TILEREF(0, 14));

    BG_EnableSyncByMask(BG3_SYNC_BIT);

    return;
}
