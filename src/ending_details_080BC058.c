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

//! FE8U = 0x080B75AC
void EndingDetails_InitFog(struct EndingTurnRecordProc * proc)
{
    SetDispEnable(1, 1, 0, 1, 1);

    ApplyPalette(Pal_PlayerRankFog, 5);

    Decompress(Img_ChapterIntroFog, BG_CHR_ADDR(0x200));
    CallARM_FillTileRect(gBG2TilemapBuffer, Tsa_PlayerRankFog, TILEREF(0x200, 5));

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    proc->unk_4c = 0;

    return;
}
