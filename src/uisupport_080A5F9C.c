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
int GetSupportScreenPartnerCount(int charId);
void InitSupportSubScreenPartners(struct SubScreenProc* proc);
void InitSupportSubScreenPartnerLevels(struct SubScreenProc* proc);
void InitSupportSubScreenRemainingSupports(struct SubScreenProc* proc);
void SupportSubScreen_MoveCursorToNextValidUnit(struct SubScreenProc* proc, int partnerIdx, int step);

//! FE8U = 0x080A21D0
void SupportSubScreen_Init(struct SubScreenProc* proc) {
    proc->x = 0;
    proc->y = 0;
    proc->unk_39 &= 0xfc;
    proc->unk_39 &= 0xe3;
    proc->partnerCount = GetSupportScreenPartnerCount(GetSupportScreenCharIdAt(proc->unitIdx));

    InitSupportSubScreenPartners(proc);
    InitSupportSubScreenPartnerLevels(proc);
    InitSupportSubScreenRemainingSupports(proc);
    SupportSubScreen_MoveCursorToNextValidUnit(proc, 0, +1);

    return;
}
