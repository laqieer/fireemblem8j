/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd gProcScr_TalkWaitForInput[];
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

//! FE8U = 0x08007CD4
void Talk_Nop(void) {
    return;
}

//! FE8U = 0x08007CD8
void StartTalkWaitForInput(ProcPtr parent, int x, int y) {
    struct Proc* proc = Proc_StartBlocking(gProcScr_TalkWaitForInput, parent);

    proc->unk64 = x;
    proc->unk66 = y;
    proc->unk68 = 0;

    return;
}

//! FE8U = 0x08007D04
void StartTalkWaitForInputUnk(ProcPtr parent, int x, int y, int unk) {
    struct Proc* proc = Proc_StartBlocking(gProcScr_TalkWaitForInput, parent);

    proc->unk64 = x;
    proc->unk66 = y;
    proc->unk68 = unk;

    return;
}

//! FE8U = 0x08007D38
void TalkShiftClearAll_OnInit(struct Proc* proc) {

    TileMap_FillRect(
        gBG0TilemapBuffer + TILEMAP_INDEX(sTalkState->xText, sTalkState->yText + 4),
        sTalkState->activeWidth - 2,
        sTalkState->lines * 2,
        0
    );

    TalkBgSync(1);

    proc->unk64 = 0;

    if (sTalkState->lineActive == 0) {
        proc->unk66 = 16;
    } else if (sTalkState->lineActive + 1 >= sTalkState->lines) {
        proc->unk66 = sTalkState->lines * 16;
    } else {
        proc->unk66 = (sTalkState->lineActive + 1) * 16;
    }

    return;
}
