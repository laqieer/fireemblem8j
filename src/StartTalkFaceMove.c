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

extern struct ProcCmd gProcScr_TalkFaceMove[];


//! FE8U = 0x08007A58
void StartTalkFaceMove(int talkFaceFrom, int talkFaceTo, s8 isSwap) {
    struct Proc* proc;
    int sw = (s8)isSwap;

    int slot = GetFaceIdByXPos(GetTalkFaceHPos(talkFaceFrom) * 8);

    if (slot == -1) {
        return;
    }

    proc = Proc_Start(gProcScr_TalkFaceMove, gFaces[slot]);

    proc->unk64 = slot;
    proc->unk66 = talkFaceTo;
    proc->unk68 = gFaces[slot]->xPos;
    proc->unk6A = sw;

    return;
}
