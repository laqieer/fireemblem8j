#include "global.h"

#include "hardware.h"
#include "ctc.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "gamecontrol.h"
#include "bmlib.h"
#include "bm.h"
#include "opanim.h"
#include "sysutil.h"
#include "constants/songs.h"









/* file-scope type definitions used by this run */


struct Unknown08AA6858 {
    /* 00 */ s16 a;
    /* 02 */ s16 b;
    /* 04 */ u8 c;
    /* 05 */ u8 d;
};

//! FE8U = 0x080C55CC
void Title_Init(struct TitleScreenProc* proc) {
    gLCDControlBuffer.dispcnt.mode = 0;

    gLCDControlBuffer.dispcnt.bg0_on = 0;
    gLCDControlBuffer.dispcnt.bg1_on = 0;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 0;

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    SetBackgroundTileDataOffset(0, 0);
    SetBackgroundTileDataOffset(1, 0);
    SetBackgroundTileDataOffset(2, 0x8000);
    SetBackgroundTileDataOffset(3, 0xc000);

    SetBackgroundMapDataOffset(0, 0x6800);
    SetBackgroundMapDataOffset(1, 0x7000);
    SetBackgroundMapDataOffset(2, 0xb000);
    SetBackgroundMapDataOffset(3, 0x7800);

    SetBackgroundScreenSize(0, 0);
    SetBackgroundScreenSize(1, 0);
    SetBackgroundScreenSize(2, 0);
    SetBackgroundScreenSize(3, 0);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    BG_SetPosition(0, 0, 0);
    BG_SetPosition(1, 0, 0);
    BG_SetPosition(2, 0, 0);
    BG_SetPosition(3, 0, 0);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_Fill(gBG3TilemapBuffer, 0);

    SetBlendBackdropA(0);
    SetBlendBackdropB(0);

    SetDefaultColorEffects();

    BG_EnableSyncByMask(0xf);

    proc->timer = 0;
    proc->timer_idle = 0;

    return;
}
