#include "global.h"

#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmio.h"
#include "bmunit.h"
#include "mu.h"
#include "rng.h"
#include "event.h"
#include "opinfo.h"
#include "bm.h"
#include "bmsave.h"
#include "ending_details.h"
#include "bmlib.h"
#include "eventinfo.h"
#include "worldmap.h"
#include "savemenu.h"
#include "gamecontrol.h"
#include "sio.h"
#include "constants/chapters.h"
#include "constants/event-flags.h"
#include "constants/songs.h"

extern u16 EventScr_Ruin_83[];
extern u16 EventScr_Ruin_84[];
extern u16 EventScr_EirikaModeGameEnd[];
extern u16 EventScr_EphraimModeGameEnd[];

extern struct ProcCmd CONST_DATA ProcScr_GameEarlyStartUI[]; // pre-intro cutscene
extern struct ProcCmd CONST_DATA ProcScr_OpAnim[]; // intro cutscene
extern struct ProcCmd CONST_DATA ProcScr_WorldMapWrapper[];





void GameControl_ChapterSwitch(struct GameCtrlProc* proc) {
    int i;

    for (i = 0; i <= 2; i++) {
        NextRN();
    }

    StoreRNState(gGmMonsterRnState);

    if (CheckFlag(3) != 0) {
        RegisterChapterTimeAndTurnCount(&gPlaySt);
    }

    ComputeChapterRankings();

    gPlaySt.chapterIndex = proc->nextChapter;

    ChapterChangeUnitCleanup();

    return;
}

void GameControl_CallPostChapterSaveMenu(struct GameCtrlProc* proc) {
    if (gPlaySt.chapterIndex != 0x38) {
        Make6C_SaveMenuPostChapter(proc);
    }

    return;
}

void GameCtrlStartIntroMonologue(struct GameCtrlProc * proc)
{
    if (gPlaySt.chapterStateBits & PLAY_FLAG_POSTGAME)
        return;

    if (gPlaySt.chapterIndex != 0)
        return;

    StartIntroMonologue(proc);
}
