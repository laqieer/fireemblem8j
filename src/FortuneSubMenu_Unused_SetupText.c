#include "global.h"
#include "fontgrp.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "face.h"
#include "chapterdata.h"
#include "cgtext.h"
#include "prepscreen.h"
#include "sysutil.h"
#include "constants/songs.h"


struct PrepProcA1962C {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 unk_29;
    /* 2C */ int unk_2c;
    /* 30 */ s8 unk_30[4];
};

void FortuneSubMenu_Unused_SetupText(struct PrepProcA1962C* proc) {
    int i;

    struct Text* th = gPrepItemTexts;

    SetTextFontGlyphs(0);
    SetTextFont(0);

    TileMap_FillRect(TILEMAP_LOCATED(gBG0TilemapBuffer, 0, 0xA), 31, 10, 0);

    for (i = 0; i < 4; i++) {
        ClearText(th);
        PutDrawText(
            th++,
            gBG0TilemapBuffer + TILEMAP_INDEX(0x144 + (i & 1) * 14, (i >> 1) * 2),
            proc->unk_30[i] != 0 ? 0 : 1,
            0,
            0,
            GetStringFromIndex(gUnkData_60[i])
        );
    }

    th = gPrepItemTexts + 0x1d;

    ClearText(th);
    PutDrawText(
        th,
        gBG0TilemapBuffer + 0x16,
        0,
        0,
        0,
        GetStringFromIndex(gUnkData_59[3])
    );

    BG_EnableSyncByMask(1);

    return;
}
