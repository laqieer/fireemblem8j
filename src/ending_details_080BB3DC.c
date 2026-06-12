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
/* TU-private data externs bound at their JP addresses */
extern u16 * gSoloEndingBattleDispConf[];

//! FE8U = 0x080B689C
void PutEndingBattleDisplayBg(int a, int b)
{
    BG_Fill(gBG1TilemapBuffer, 0);

    BlitClippedTileMapToBg(gSoloEndingBattleDispConf[2], 0, 1, BG_2, a, b + 2, 30, 16);
    BlitClippedTileMapToBg(gSoloEndingBattleDispConf[1], 0, 1, BG_1, a, b + 2, 30, 18);
    BlitClippedTileMapToBg(gSoloEndingBattleDispConf[0], 0, 0, BG_0, a, b, 30, 20);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    return;
}
