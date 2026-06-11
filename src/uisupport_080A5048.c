#include "global.h"

#include "bmunit.h"
#include "bmreliance.h"
#include "bmsave.h"
#include "fontgrp.h"
#include "hardware.h"
#include "bmudisp.h"
#include "ctc.h"
#include "face.h"
#include "icon.h"
#include "uiutils.h"
#include "bm.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "event.h"
#include "bmsave.h"
#include "bmlib.h"
#include "helpbox.h"
#include "prepscreen.h"
#include "eventinfo.h"
#include "cgtext.h"
#include "sysutil.h"
#include "prepscreen.h"
#include "uisupport.h"
#include "constants/songs.h"

extern struct SupportScreenUnit * CONST_DATA sSupportScreenUnits;

extern EWRAM_OVERLAY(0) int sSupportScreenUnitCount;
extern EWRAM_OVERLAY(0) u16 gUisupport_0[0xC00];
extern EWRAM_OVERLAY(0) u16 gUisupport_1[0x2706];

extern u16 CONST_DATA gSprite_SupportScreenSuccessBox[];

extern u16 CONST_DATA gSprite_SupportScreenBanner[];

int GetSupportScreenCharIdAt(int);
void SupportScreen_DrawUnitNameRow(struct SupportScreenProc*, int);
int GetSupportScreenPartnerCount(int);
void StartSupportUnitSubScreen(s8, int, ProcPtr);

/* prototypes for same-file helpers called by this run */
int GetSupportScreenUnitCount(void);
void SupportScreen_LoadUnitSprites(struct SupportScreenProc* proc);
void DrawSupportScreenText(void);
void StartDrawSupportBannerSprites(int x, int y, int palIdx, ProcPtr parent);
void EndDrawSupportBannerSprites(void);
void SupportScreen_ScrollToPendingIndex(struct SupportScreenProc* proc);
void SupportScreen_DrawUnitNameRow(struct SupportScreenProc* proc, int param_2);

//! FE8U = 0x080A1270
void SupportScreen_SetupGraphics(struct SupportScreenProc* proc) {
    int i;

    gLCDControlBuffer.dispcnt.mode = 0;

    SetupBackgrounds(0);

    BG_Fill(BG_GetMapBuffer(0), 0);
    BG_Fill(BG_GetMapBuffer(1), 0);
    BG_Fill(BG_GetMapBuffer(2), 0);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 3;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 3;

    ResetFaces();

    ResetText();
    ResetIconGraphics_();
    LoadUiFrameGraphicsTo(0x4000, -1);
    LoadObjUIGfx();
    LoadIconPalettes(0xe);

    SupportScreen_ScrollToPendingIndex(proc);

    BG_SetPosition(0, 0, 0);
    BG_SetPosition(1, 0, 2);
    BG_SetPosition(2, 0x0000FFD8, proc->unk_34 - 36);

    StartMuralBackgroundExt(proc, 0, 18, 2, 0);

    ApplyUnitSpritePalettes();
    ResetUnitSprites();

    SupportScreen_LoadUnitSprites((void*)proc);
    PutImg_PrepItemUseUnk(0x5000, 5);

    Decompress(gUnkData_80, gGenericBuffer);
    CallARM_FillTileRect(TILEMAP_LOCATED(gBG1TilemapBuffer, 1, 4), gGenericBuffer, 0x1200);

    Decompress(gGfx_SupportScreenBanner, (void*)0x06013800);
    ApplyPalette(gPal_SupportScreenBanner, 0x12);

    BG_EnableSyncByMask(7);

    gLCDControlBuffer.dispcnt.win0_on = 1;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    gLCDControlBuffer.win0_left = 0;
    gLCDControlBuffer.win0_top = 38;
    gLCDControlBuffer.win0_right = 240;
    gLCDControlBuffer.win0_bottom = 134;

    gLCDControlBuffer.wincnt.win0_enableBg0 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg1 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg2 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg3 = 1;
    gLCDControlBuffer.wincnt.win0_enableObj = 1;

    gLCDControlBuffer.wincnt.wout_enableBg0 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg1 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg2 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg3 = 1;
    gLCDControlBuffer.wincnt.wout_enableObj = 1;

    gLCDControlBuffer.wincnt.win0_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 1;

    SetBlendConfig(3, 0, 0, 0x10);
    SetBlendTargetA(1, 1, 1, 1, 1);

    for (i = 0; i <= 20; i++) {
        InitText(gPrepItemTexts + i, 5);
    }

    DrawSupportScreenText();

    if (GetSupportScreenUnitCount() != 0) {
        ResetSysHandCursor(proc);
        DisplaySysHandCursorTextShadow(0x600, 1);
        ShowSysHandCursor(
            (proc->curIndex % 3) * 64 + 20,
            ((proc->curIndex / 3) - (proc->unk_34 / 16)) * 16 + 36,
            7,
            0x800
        );
        StartHelpPromptSprite(0xc0, 1, 9, (void*)proc);
    }

    StartDrawSupportBannerSprites(136, 9, 11, proc);

    StartParallelWorker(DrawSupportScreenUnitSprites, proc);

    StartMenuScrollBarExt(proc, 0xd8, 0x2d, 0x200, 4);

    UpdateMenuScrollBarConfig(10, proc->unk_34, ((GetSupportScreenUnitCount() - 1) / 3) + 1, 6);

    UnlockMenuScrollBar();

    for (i = proc->unk_34 / 16; i < (proc->unk_34 / 16) + 6; i++) {
        SupportScreen_DrawUnitNameRow(proc, i);
    }

    StartGreenText((void*)proc);

    proc->helpTextActive = 0;

    LoadHelpBoxGfx((void*)0x06014800, 10);

    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 1;
    gLCDControlBuffer.dispcnt.bg3_on = 1;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    return;
}

//! FE8U = 0x080A1554
void SupportScreen_OnEnd(ProcPtr proc) {
    EndCgText();
    EndAllProcChildren(proc);
    EndMuralBackground_();
    EndFaceById(0);
    SetPrimaryHBlankHandler(0);
    EndDrawSupportBannerSprites();

    return;
}

//! FE8U = 0x080A157C
void SupportScreen_UpdateBlend(void) {
    SetBlendConfig(1, 0xe, 3, 0);
    SetBlendTargetA(0, 1, 0, 0, 1);
    SetBlendTargetB(0, 0, 0, 1, 0);
    return;
}
