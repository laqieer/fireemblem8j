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

/* prototypes for same-file helpers called by this run */
void OpSubtitle_InitBgFromCommGfx(int bg);
void OpSubtitle_FillBgIncrementalTiles(int bg);
void OpSubtitle_LoadTitleSlide(int index);
void OpSubtitle_SetupBackgrounds(void);

//! FE8U = 0x080C5218
void OpSubtitle_SetupTitleBgs(struct OpSubtitleProc* proc) {
    OpSubtitle_SetupBackgrounds();

    gLCDControlBuffer.dispcnt.mode = 0;

    gLCDControlBuffer.bg0cnt.priority = 1;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 3;
    gLCDControlBuffer.bg3cnt.priority = 0;

    SetBlendConfig(1, 0, 0x10, 0);

    SetBlendTargetA(0, 0, 0, 1, 0);
    SetBlendTargetB(1, 1, 0, 0, 0);

    SetBlendBackdropA(0);
    SetBlendBackdropB(0);

    BG_SetPosition(0, 0, 0);
    BG_SetPosition(1, -3, -3);
    BG_SetPosition(2, 0, 0);
    BG_SetPosition(3, 0, 0);

    OpSubtitle_InitBgFromCommGfx(3);
    OpSubtitle_FillBgIncrementalTiles(3);

    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    BG_EnableSyncByMask(BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    OpSubtitle_LoadTitleSlide(2);

    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 0;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 1;
    gLCDControlBuffer.dispcnt.obj_on = 0;

    proc->index = 2;
    proc->timer_2a = 120;

    return;
}
