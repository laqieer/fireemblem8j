#include "global.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "efxbattle.h"
#include "bmlib.h"
#include "spline.h"
#include "sysutil.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern u16 gBgConfig_OpSubtitle[];

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

//! FE8U = 0x080C4944
void OpSubtitle_Init(struct OpSubtitleProc* proc) {

    SetupBackgrounds(gBgConfig_OpSubtitle);

    gLCDControlBuffer.dispcnt.mode = 1;

    gLCDControlBuffer.bg0cnt.priority = 3;
    gLCDControlBuffer.bg1cnt.priority = 3;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 3;

    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 0;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    gLCDControlBuffer.bg2cnt.screenSize = 1;
    gLCDControlBuffer.bg2cnt.areaOverflowMode = 0;

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    SetBlendConfig(1, 0, 0x10, 0);

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(1, 1, 0, 0, 1);

    Decompress(Img_ChapterIntro_LensFlare, (void*)(GetBackgroundTileDataOffset(2) + VRAM));
    ApplyPalettes(Pal_ChapterIntro_LensFlare, 0, 3);

    BG_Fill(gBG2TilemapBuffer, 0);

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    StartBgm(SONG_PROLOGUE, 0);

    proc->index = 0;
    proc->timer_2a = 60;

    return;
}
