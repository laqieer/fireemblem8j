#include "global.h"
#include "proc.h"
#include "ctc.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmio.h"
#include "bm.h"
#include "event.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "face.h"
#include "bmunit.h"
#include "uiutils.h"
#include "ekrbattle.h"
#include "bmlib.h"
#include "bmshop.h"
#include "scene.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern const u16* gPressKeyArrowSpriteLut[];
extern struct ProcCmd gProcScr_TalkShiftClearAll[];
extern struct ProcCmd gProcScr_TalkSkipListener[];

//! FE8U = 0x08007AB0
void TalkFaceMove_OnInit(struct Proc* proc) {

    proc->unk58 = 0;

    if (((proc->unk68 - GetTalkFaceHPos(proc->unk66) * 8) < 0)
        ? (GetTalkFaceHPos(proc->unk66) * 8 - proc->unk68) > 24
        : (proc->unk68 - GetTalkFaceHPos(proc->unk66) * 8)  > 24) {
        proc->unk5C = 32;
    } else {
        proc->unk5C = 16;
    }

    return;
}

//! FE8U = 0x08007B0C
void TalkFaceMove_OnIdle(struct Proc* proc) {
    if (proc->unk5C > 16) {
        if (proc->unk58 == proc->unk5C / 8) {
            gFaces[proc->unk64]->yPos++;
        }

        if (proc->unk58 == proc->unk5C / 2) {
            gFaces[proc->unk64]->yPos--;
        }

        if (proc->unk58 == proc->unk5C * 5 / 8) {
            gFaces[proc->unk64]->yPos++;
        }

    } else {
        if (proc->unk58 == proc->unk5C / 2) {
            gFaces[proc->unk64]->yPos++;
        }
    }

    if (proc->unk58 >= proc->unk5C) {
        gFaces[proc->unk64]->yPos--;
        Proc_Break(proc);
    } else {
        gFaces[proc->unk64]->xPos = Interpolate(
            INTERPOLATE_RSQUARE,
            proc->unk68,
            GetTalkFaceHPos(proc->unk66) * 8,
            proc->unk58++,
            proc->unk5C
        );
    }

    return;
}

//! FE8U = 0x08007C0C
void Talk_OnEnd(void) {
    Proc_EndEach(gProcScr_TalkSkipListener);
    Proc_EndEach(gProcScr_TalkShiftClearAll);
    return;
}

//! FE8U = 0x08007C28
void TalkPause_OnIdle(struct Proc* proc) {

    if (proc->unk64 == 0) {
        Proc_Break(proc);
        return;
    }

    proc->unk64--;

    return;
}

//! FE8U = 0x08007C4C
void TalkWaitForInput_OnIdle(struct Proc* proc) {
    int frame = (GetGameClock() / 2) & 0xf;

    if (!CheckTalkFlag(TALK_FLAG_7)) {
        PutSprite(2, proc->unk64, proc->unk66, gPressKeyArrowSpriteLut[frame], 4);
    } else {
        PutSprite(0, proc->unk64, proc->unk66, gPressKeyArrowSpriteLut[frame], 0x0000B2BF);
    }

    if (gKeyStatusPtr->newKeys & (DPAD_ANY | A_BUTTON | B_BUTTON)) {
        Proc_Break(proc);
    }

    return;
}
