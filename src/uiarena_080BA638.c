#include "global.h"

#include "m4a.h"
#include "soundwrapper.h"
#include "bmarena.h"
#include "mu.h"
#include "bmshop.h"
#include "hardware.h"
#include "face.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "fontgrp.h"
#include "bmitem.h"
#include "uiutils.h"
#include "event.h"
#include "bm.h"
#include "bmio.h"
#include "bmmind.h"
#include "bmsave.h"
#include "bmlib.h"
#include "scene.h"
#include "mapanim.h"
#include "constants/songs.h"

extern struct ProcCmd gProcScr_ArenaUiMain[];
extern struct ProcCmd gProcScr_ArenaUiResults[];
extern struct ProcCmd gProcScr_ArenaUiResultBgm[];

void StartArenaDialogue(int, ProcPtr);
void DrawArenaOpponentDetailsText(ProcPtr);

//! FE8U = 0x080B5AB4
void ArenaUi_StartArenaBattle(ProcPtr proc) {

    Proc_SetMark(proc, PROC_MARK_EVENT_ANIM);

    ResetDialogueScreen();

    Proc_EndEach(gProcScr_GoldBox);

    gActionData.unitActionType = UNIT_ACTION_ARENA;
    gActiveUnit->state |= US_HAS_MOVED;

    PidStatsAddBattleAmt(gActiveUnit);
    EndAllMus();

    gActionData.trapType = 0;

    BattleGenerateArena(gActiveUnit);

    BeginBattleAnimations();

    return;
}
