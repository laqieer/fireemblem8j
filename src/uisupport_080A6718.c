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
void SupportSubScreen_BackupTilemaps(void);
int GetSupportScreenPartnerCount(int charId);
void DrawSupportSubScreenRemainingText(struct SubScreenProc* proc);
void InitSupportSubScreenPartners(struct SubScreenProc* proc);
void InitSupportSubScreenPartnerLevels(struct SubScreenProc* proc);
void InitSupportSubScreenRemainingSupports(struct SubScreenProc* proc);
void DrawSupportSubScreenUnitPartnerDetails(struct SubScreenProc* proc);
void SupportSubScreen_MoveCursorToNextValidUnit(struct SubScreenProc* proc, int partnerIdx, int step);
void SupportSubScreen_DrawScrolledTilemaps(u32 xBase);

//! FE8U = 0x080A294C
void SupportSubScreen_SwapPageIn_FromLeft(struct SubScreenProc* proc) {
    int a;
    int b;
    int c;

    proc->unk_3a++;

    a = 10 - proc->unk_3a;

    b = 8 - ((a * 8) * a / 100);
    c = 16 - (a * 0x10) * a / 100;

    proc->x = (b - 8) * 8;

    SupportSubScreen_DrawScrolledTilemaps(8 - b);
    SetBlendConfig(1, 0x10 - c, c, 0);

    if (proc->unk_3a == 10) {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080A29C0
void SupportSubScreen_ReinitAfterSwapPage(struct SubScreenProc* proc) {
    ResetFaces();
    ResetText();
    ResetIconGraphics_();

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    proc->unk_39 = proc->unk_39 & 0xfc;
    proc->unk_39 = proc->unk_39 & 0xe3;

    proc->partnerCount = GetSupportScreenPartnerCount(GetSupportScreenCharIdAt(proc->unitIdx));

    InitSupportSubScreenPartners(proc);
    InitSupportSubScreenPartnerLevels(proc);
    InitSupportSubScreenRemainingSupports(proc);
    SupportSubScreen_MoveCursorToNextValidUnit(proc, 0, +1);

    Decompress(gTsa_SupportSubScreen, gGenericBuffer);
    CallARM_FillTileRect(gBG1TilemapBuffer, gGenericBuffer, 0x1000);

    PutFace80x72(
        (struct Proc*)proc,
        gBG0TilemapBuffer + 0x22,
        gCharacterData[GetSupportScreenCharIdAt(proc->unitIdx) - 1].portraitId,
        0x200,
        2
    );

    DrawSupportSubScreenUnitPartnerDetails(proc);
    DrawSupportSubScreenRemainingText(proc);
    SupportSubScreen_BackupTilemaps();

    proc->unk_3a = 0;

    return;
}

//! FE8U = 0x080A2AAC
void SupportSubScreen_EndSwapPage(struct SubScreenProc* proc) {

    gLCDControlBuffer.bg0cnt.priority = 1;
    gLCDControlBuffer.bg1cnt.priority = 3;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 3;

    SetBlendConfig(1, 0, 0xc, 0);
    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(1, 1, 1, 1, 1);

    SetBlendBackdropA(0);
    SetBlendBackdropB(0);

    if (proc->fromPrepScreen == 0) {
        if (proc->unk_3b != 0) {
            ShowSysHandCursor(
                (proc->unk_39 & 3) * 8 + 0xc4,
                (proc->unk_39 >> 2 & 7) * 16 + 0x18,
                1,
                0x800
            );

            proc->unk_3a = -1;
        }
    }

    return;
}
