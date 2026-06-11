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
int GetSupportScreenPartnerSupportLevel(int idx, int partner);
s8 GetSupportScreenPartnerIsAlive(int idx, int partner);
int GetSupportScreenPartnerCharId(int idx, int partner);

//! FE8U = 0x080A1F68
void InitSupportSubScreenPartners(struct SubScreenProc* proc) {
    int i;
    int j;

    if (proc->fromPrepScreen) {
        for (i = 0; i < proc->partnerCount; i++) {
            int partnerCharId = GetSupportScreenPartnerCharId(proc->unitIdx, i);

            proc->partnerState[i] = 0;

            for (j = 1; j < 0x40; j++) {
                struct Unit* unit = GetUnit(j);

                if (!UNIT_IS_VALID(unit)) {
                    continue;
                }

                if (unit->pCharacterData->number != partnerCharId) {
                    continue;
                }

                if (unit->state & US_BIT16) {
                    continue;
                }

                if (unit->state & US_DEAD) {
                    proc->partnerState[i] = 2;
                } else {
                    proc->partnerState[i] = 1;
                }
            }
        }
    } else {
        proc->unk_3b = 0;

        for (i = 0; i < proc->partnerCount; i++) {
            proc->partnerState[i] = 0;

            if (GetSupportScreenPartnerIsAlive(proc->unitIdx, i)) {
                proc->partnerState[i] = 1;
                proc->unk_3b += GetSupportScreenPartnerSupportLevel(proc->unitIdx, i);
            }
        }

    }

    return;
}
