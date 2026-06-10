/* TU-private data externs bound at their JP addresses */
extern struct TalkState* sTalkState;
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

//! FE8U = 0x080088A8
void StartTalkOpen(int talkFace, ProcPtr parent) {

    struct Proc* proc = Proc_StartBlocking(gProcScr_TalkOpen, parent);

    proc->unk64 = GetTalkFaceHPos(talkFace);
    proc->unk66 = 8;

    proc->unk68 = sTalkState->activeWidth;
    proc->unk6A = 6;

    if (proc->unk64 < 0) {
        proc->unk64 = 0;
    }
    if (proc->unk64 >= 30) {
        proc->unk64 = 30;
    }

    sTalkState->speakingFaceSlot = talkFace;
    sTalkState->speakingWidth = sTalkState->activeWidth;

    return;
}
