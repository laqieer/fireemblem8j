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
int GetSupportScreenCharIdAt(int idx);
void DrawSupportSubScreenRemainingText(struct SubScreenProc* proc);
void DrawSupportSubScreenUnitPartnerDetails(struct SubScreenProc* proc);
void SupportSubScreen_MakeDimmedObjPalette(void);

//! FE8U = 0x080A2274
void SupportSubScreen_SetupGraphics(struct SubScreenProc* proc) {
    gLCDControlBuffer.dispcnt.mode = 0;

    SetupBackgrounds(0);

    gLCDControlBuffer.bg0cnt.priority = 1;
    gLCDControlBuffer.bg1cnt.priority = 3;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 3;

    ResetText();
    ResetIconGraphics_();

    LoadUiFrameGraphics();
    LoadObjUIGfx();

    ApplyUnitSpritePalettes();
    SupportSubScreen_MakeDimmedObjPalette();
    LoadIconPalettes(0xd);

    StartGreenText((void*)proc);

    if (!proc->fromPrepScreen) {
        gPlaySt.config.textSpeed = 1; // TODO: Text speed constants

        ResetSysHandCursor(proc);
        DisplaySysHandCursorTextShadow(0x600, 1);
        ConfigSysHandCursorShadowEnabled(1);

        proc->unk_3a = -1;

        if (proc->unk_3b != 0) {
            ShowSysHandCursor(
                (proc->unk_39 & 3) * 8 + 0xc4,
                ((proc->unk_39 >> 2) & 7) * 16 + 0x18,
                1,
                0x800
            );
        }
    }

    BG_SetPosition(0, 4, 0);
    BG_SetPosition(1, 4, 0);
    BG_SetPosition(2, 0, 0);

    SetBlendConfig(1, 0xd, 3, 0);
    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    SetBlendBackdropA(0);
    SetBlendBackdropB(0);

    RestartMuralBackground();

    PutImg_PrepItemUseUnk(0x4000, 5);

    Decompress(gTsa_SupportSubScreen, gGenericBuffer);
    CallARM_FillTileRect(gBG1TilemapBuffer, gGenericBuffer, 0x1000);

    PutFace80x72(
        (struct Proc*)proc,
        TILEMAP_LOCATED(gBG0TilemapBuffer, 2, 1),
        gCharacterData[GetSupportScreenCharIdAt(proc->unitIdx) - 1].portraitId,
        0x200,
        2
    );

    DrawSupportSubScreenUnitPartnerDetails(proc);
    DrawSupportSubScreenRemainingText(proc);

    Decompress(gGfx_SupportMenu, (void*)0x06017800);
    ApplyPalette(gPal_SupportMenu, 0x1A);
    ApplyPalette(Pal_MapBattleInfoNum, 0x12);

    StartParallelWorker(DrawSupportSubScreenSprites, proc);

    return;
}
