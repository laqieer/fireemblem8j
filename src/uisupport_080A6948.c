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
int UiSupport_GetSupportTalkSong(int idx, int partner, int rank);

//! FE8U = 0x080A2B7C
void SupportSubScreen_PrepareSupportConvo(struct SubScreenProc* proc) {

    proc->songId = UiSupport_GetSupportTalkSong(
        proc->unitIdx,
        proc->unk_39 >> 2 & 7,
        (proc->unk_39 & 3) + 1
    );

    if (proc->songId == 0) {
        ChangeBgm(SONG_DISTANT_ROADS, 0x100, 0x80, 0x10, 0);
    } else {
        ChangeBgm(proc->songId, 0x100, 0x100, 0x10, 0);
    }

    return;
}
