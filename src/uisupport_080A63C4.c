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
int GetSupportScreenPartnerCharId(int idx, int partner);
int GetSupportScreenCharIdAt(int idx);

//! FE8U = 0x080A25F8
void SupportSubScreen_StartSupportConvo(struct SubScreenProc* proc) {

    SetupBackgrounds(0);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    SetBlendConfig(3, 0, 0, 0x10);
    SetBlendTargetA(1, 1, 1, 1, 1);
    SetBlendTargetB(0, 1, 0, 0, 0);

    ResetFaces();

    ResetText();
    ResetIconGraphics_();
    LoadLegacyUiFrameGraphics();
    LoadObjUIGfx();

    StartSupportViewerTalk(
        GetSupportScreenCharIdAt(proc->unitIdx),
        GetSupportScreenPartnerCharId(proc->unitIdx, proc->unk_39 >> 2 & 7),
        (proc->unk_39 & 3) + 1
    );

    return;
}
