#include "global.h"

#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "efxbattle.h"
#include "bmlib.h"
#include "spline.h"
#include "sysutil.h"

#include "constants/songs.h"

/*
The opening monologue that introduces the Sacred Stones / associated lore.
*/

struct OpSubtitleProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ s8 index;
    /* 2A */ s16 timer_2a;
    /* 2C */ s16 timer_2c;

    /* 2E */ u8 pad[0x4c-0x2e];

    /* 4C */ s16 unk_4c;
    /* 4E */ s16 unk_4e;
};

struct OpSubtitleEnt {
    void* gfx;
    void* tsa;
    int timer;
};

extern const struct OpSubtitleEnt gOpSubtitleGfxLut[];

//! FE8U = 0x080C4CD0
void OpSubtitle_LoadSlideToBg0AndBg1(struct OpSubtitleProc* proc) {

    Decompress(gOpSubtitleGfxLut[proc->index].gfx, (void*)0x06001000);

    Decompress(gOpSubtitleGfxLut[proc->index].tsa, gGenericBuffer);

    CallARM_FillTileRect(gBG0TilemapBuffer, gGenericBuffer, 0x3080);
    CallARM_FillTileRect(gBG1TilemapBuffer, gGenericBuffer, 0xE080);

    gLCDControlBuffer.dispcnt.bg0_on = 1;

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    proc->timer_2c = 0;

    return;
}
