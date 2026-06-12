#include "global.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "efxbattle.h"
#include "bmlib.h"
#include "spline.h"
#include "sysutil.h"
#include "constants/songs.h"
/* TU-private aggregate type defs (file-local) */
struct OpSubtitleEnt {
    void* gfx;
    void* tsa;
    int timer;
};
/* TU-private data externs bound at their JP addresses */
extern const struct OpSubtitleEnt gOpSubtitleGfxLut[];

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

//! FE8U = 0x080C4C60
void OpSubtitle_LoadSlideToBg0(struct OpSubtitleProc* proc) {

    Decompress(gOpSubtitleGfxLut[proc->index].gfx, (void*)0x06001000);

    Decompress(gOpSubtitleGfxLut[proc->index].tsa, gGenericBuffer);

    CallARM_FillTileRect(gBG0TilemapBuffer, gGenericBuffer, 0x3080);

    gLCDControlBuffer.dispcnt.bg0_on = 1;

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    proc->timer_2c = 0;

    return;
}
