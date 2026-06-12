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
void SupportSubScreen_MoveCursorToNextValidUnit(struct SubScreenProc* proc, int partnerIdx, int step);

//! FE8U = 0x080A2448
void SupportSubScreen_Loop_KeyHandler(struct SubScreenProc* proc) {

    if (gKeyStatusPtr->newKeys & B_BUTTON) {
        PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
        Proc_Goto(proc, 3);
        return;
    }

    if (gKeyStatusPtr->repeatedKeys & R_BUTTON) {
        Proc_Goto(proc, 4);
        return;
    }

    if (gKeyStatusPtr->repeatedKeys & L_BUTTON) {
        Proc_Goto(proc, 5);
        return;
    }

    if (proc->fromPrepScreen) {
        return;
    }

    if (proc->unk_3b != 0) {
        u32 previous = proc->unk_39;

        if (gKeyStatusPtr->newKeys & A_BUTTON) {
            PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
            Proc_Goto(proc, 2);
            return;
        }

        if (gKeyStatusPtr->repeatedKeys & DPAD_LEFT) {
            if ((proc->unk_39 & 3) != 0) {
                int unk = (proc->unk_39 & 0xfc) + 0xFF;
                proc->unk_39 = unk + (proc->unk_39 & 3);
            }
        }

        if (gKeyStatusPtr->repeatedKeys & DPAD_RIGHT) {
            if ((proc->unk_39 & 3) < GetSupportScreenPartnerSupportLevel(proc->unitIdx, (proc->unk_39 >> 2) & 7) - 1) {
                int unk = (proc->unk_39 & 0xfc) + 1;
                proc->unk_39 = unk + (proc->unk_39 & 3);
            }
        }

        if (gKeyStatusPtr->repeatedKeys & DPAD_UP) {
            SupportSubScreen_MoveCursorToNextValidUnit(proc, ((proc->unk_39 >> 2) & 7) - 1, -1);
        }

        if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN) {
            SupportSubScreen_MoveCursorToNextValidUnit(proc, ((proc->unk_39 >> 2) & 7) + 1, +1);
        }

        if (previous != proc->unk_39) {
            ShowSysHandCursor(
                (proc->unk_39 & 3) * 8 + 0xc4,
                ((proc->unk_39 >> 2) & 7) * 16  + 0x18,
                1,
                0x800
            );
            PlaySoundEffect(SONG_65);
        }

    } else {
        if (gKeyStatusPtr->newKeys & A_BUTTON) {
            PlaySoundEffect(SONG_6C);
        }

        return;
    }

    return;
}
