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

















//! FE8U = 0x080B6810
void SetupCharacterEndingBg(void)
{
    int offset;
    int i;
    u16 * tm;

    ApplyPalettes(Pal_CharacterEndingMenu, 12, 2);
    ApplyPalettes(Pal_CommGameBgScreenInShop, 14, 2);

    tm = gBG3TilemapBuffer;
    offset = (((0x8000 - (u32)GetBackgroundTileDataOffset(BG_3)) * 0x8000) >> 0x14) + 0xe000;

    for (i = 0; i < 0x280; i++) {
        *tm++ = i + offset;
    }

    CallARM_FillTileRect(gBG2TilemapBuffer, Tsa_CharacterEnding_TopBorder, TILEREF(0x260, 12));
    CallARM_FillTileRect(gBG2TilemapBuffer + TILEMAP_INDEX(0, 18), Tsa_CharacterEnding_BottomBorder, TILEREF(0x260, 12));

    BG_EnableSyncByMask(BG2_SYNC_BIT | BG3_SYNC_BIT);

    return;
}
