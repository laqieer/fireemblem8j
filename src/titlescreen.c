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









//! FE8U = 0x080C5A44
void Title_PrepareRotatingBlueLights(struct TitleScreenProc* proc) {

    gLCDControlBuffer.dispcnt.mode = 1;

    SetBackgroundScreenSize(2, 2);

    BgAffineSetOpAnim(8, 0);

    gLCDControlBuffer.bg2cnt.areaOverflowMode = 0;

    gLCDControlBuffer.dispcnt.bg0_on = 0;
    gLCDControlBuffer.dispcnt.bg1_on = 0;
    gLCDControlBuffer.dispcnt.bg2_on = 1;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    gLCDControlBuffer.bg0cnt.priority = 1;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 3;

    SetBlendConfig(2, 8, 8, 0x10);

    SetBlendTargetA(1, 1, 1, 1, 1);

    gPaletteBuffer[PAL_BACKDROP_OFFSET] = 0;
    EnablePaletteSync();

    proc->timer = 0;

    return;
}

//! FE8U = 0x080C5AF0
void Title_Loop_DrawRotatingBlueLights(struct TitleScreenProc* proc) {
    int res;
    int time;

    if (proc->timer < 45) {
        res = Interpolate(0, 64, 256, proc->timer, 45);
    } else {
        res = Interpolate(0, 256, 448, proc->timer - 45, 45);
    }

    BgAffineSetOpAnim(
        res,
        Interpolate(0, 0, 64, proc->timer, 90)
    );

    if (res > 0xFF) {
        PutSpriteExt(0, 104, 64, gObject_32x32, 0x4220);
    }

    if (proc->timer < 23) {
        gLCDControlBuffer.blendY = Interpolate(0, 16, 0, proc->timer, 22);
    }

    time = proc->timer - 68;

    if (time > -1) {
        if (time == 0) {
            gLCDControlBuffer.bldcnt.effect = 3;
            SetBlendTargetA(1, 1, 1, 1, 0);
        }

        gLCDControlBuffer.blendY = Interpolate(0, 0, 16, time, 22);
    }

    if (proc->timer == 90) {
        proc->timer = 0;
        Proc_Break(proc);
    } else {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C5BD4
void Title_PrepareRedBlueOrbs(void) {
    BG_Fill(gBG2TilemapBuffer, 0);

    BG_EnableSyncByMask(6);

    gLCDControlBuffer.dispcnt.mode = 0;

    SetBlendConfig(1, 0x10, 0x10, 0x10);

    SetBlendTargetA(0, 0, 0, 0, 1);
    SetBlendTargetB(0, 1, 0, 0, 0);

    gLCDControlBuffer.dispcnt.bg0_on = 0;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    CpuFastFill(0, PAL_BG(0xE), 0x20);

    EnablePaletteSync();

    return;
}

//! FE8U = 0x080C5C64
void Title_Loop_DrawRedBlueOrbs(struct TitleScreenProc* proc) {

    ApplyPalette(gPal_TitleMainBackground, 0xE);

    BlendPaletteToColor(
        PAL_BG(0xE),
        0,
        Interpolate(0, 16, 0, proc->timer, 48)
    );

    if (proc->timer == 20) {
        StartBgmExt(SONG_MAIN_THEME_EXT, 0, 0);
    }

    if (proc->timer < 20) {
        PutSpriteExt(0, 104, 64, gObject_32x32, 0x4220);
    } else if (proc->timer < 24) {
        if ((proc->timer & 1) != 0) {
            PutSpriteExt(0, 104, 64, gObject_32x32, 0x6228);
            PutSpriteExt(1, 104, 64, gObject_32x32, 0x5224);
        } else {
            PutSpriteExt(0, 104, 64, gObject_32x32, 0x5224);
            PutSpriteExt(1, 104, 64, gObject_32x32, 0x6228);
        }
    } else {
        int tmpA = proc->timer - 24;

        if (tmpA < 9) {
            int tmpB = Interpolate(1, 0, 128, tmpA, 8);

            if ((proc->timer & 1) != 0) {
                PutSpriteExt(0, (104 - tmpB) & 0x01FF, 64, gObject_32x32, 0x6228);
                PutSpriteExt(1, (tmpB + 104) & 0x01FF, 64, gObject_32x32, 0x5224);
            } else {
                PutSpriteExt(0, (tmpB + 104) & 0x01FF, 64, gObject_32x32, 0x5224);
                PutSpriteExt(1, (104 - tmpB) & 0x01FF, 64, gObject_32x32, 0x6228);
            }
        }
    }

    if (proc->timer == 48) {
        proc->timer = 0;
        Proc_Break(proc);
    } else {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C5DF0
void Title_PrepareMainScreenWithExtendedBgm(void) {

    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    SetBlendConfig(1, 0, 0x10, 0);

    SetBlendTargetA(1, 0, 0, 0, 0);
    SetBlendTargetB(0, 1, 0, 0, 0);

    PlaySoundEffect(SONG_317);

    return;
}

//! FE8U = 0x080C5E60
void Title_Loop_RevealGreenDragonFlashFx(struct TitleScreenProc* proc) {

    gLCDControlBuffer.blendCoeffA = Interpolate(0, 0, 13, proc->timer, 12);

    if (proc->timer == 12) {
        proc->timer = 0;
        Proc_Break(proc);
    } else {
        proc->timer++;
    }
    return;
}

//! FE8U = 0x080C5EA0
void Title_Loop_FlashFxExpand(struct TitleScreenProc* proc) {
    int res = Interpolate(0, 0, 16, proc->timer, 12);

    if (proc->timer == 0) {
        BG_EnableSyncByMask(1);
    }

    ApplyPalette(gPal_Titlescreen_2, 2);
    BlendPaletteToColor(PAL_BG(2), 0x7FFF, res);

    ApplyPalette(gPal_TitleMainBackground, 0xE);
    BlendPaletteToColor(PAL_BG(0xE), 0x7FFF, res);

    if (proc->timer == 12) {
        proc->timer = 0;
        Proc_Break(proc);
    } else {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C5F2C
void Title_LoadDemonKingOnBg2(void) {
    int i;

    Decompress(gGfx_TitleDemonKing, (void*)0x06008000);
    Decompress(gTsa_TitleDemonKing, gBG2TilemapBuffer);

    ApplyPalette(gPal_TitleDemonKing, 3);

    for (i = 0; i < 0x280; i++) {
        gBG2TilemapBuffer[i] += 0x3000;
    }

    BG_EnableSyncByMask(4);

    return;
}

//! FE8U = 0x080C5F84
void Title_ShowBg2(void) {

    gLCDControlBuffer.dispcnt.bg0_on = 0;
    gLCDControlBuffer.dispcnt.bg1_on = 0;
    gLCDControlBuffer.dispcnt.bg2_on = 1;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 0;

    gLCDControlBuffer.bldcnt.effect = 0;

    return;
}

//! FE8U = 0x080C5FB4
void Title_ShowBg1AfterDemonKing(void) {

    gLCDControlBuffer.dispcnt.bg0_on = 0;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    gLCDControlBuffer.bldcnt.effect = 1;

    return;
}

//! FE8U = 0x080C5FE8
void Title_PrepareMainLogoZoom(void) {

    gLCDControlBuffer.dispcnt.mode = 1;

    SetBackgroundScreenSize(2, 1);

    Title_SetBg2AffineScale(0x40);

    Decompress(gGfx_Titlescreen_3, (void*)0x06008000);
    Decompress(gTsa_Titlescreen_3, gBG2TilemapBuffer);

    ApplyPalette(gPal_Titlescreen_4, 0);

    BG_EnableSyncByMask(4);

    CpuFastFill(0x7FFF7FFF, PAL_BG(0xe), 0x40);

    SetBackgroundTileDataOffset(0, 0);
    SetBackgroundMapDataOffset(0, 0x6800);

    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 1;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    return;
}
