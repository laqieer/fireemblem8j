#include "global.h"
#include <string.h>
#include "constants/classes.h"
#include "proc.h"
#include "hardware.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "chapterdata.h"
#include "rng.h"
#include "ctc.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmbattle.h"
#include "bmtrick.h"
#include "mu.h"
#include "uimenu.h"
#include "bmtrap.h"
#include "gamecontrol.h"
#include "bmarena.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmsave.h"
#include "bmlib.h"
#include "worldmap.h"
#include "bmio.h"
#include "bmmind.h"

void ClearBattleMapState(void);
void MapMain_ResumeFromBskPhase(struct BMapMainProc* mapMain);
void MapMain_ResumeFromPhaseChange(struct BMapMainProc* mapMain);
void MapMain_ResumeFromPhaseIdle(struct BMapMainProc* mapMain);

/**
 * This is called after loading a suspended game
 * To get the game state back to where it was left off
 */
void GameCtrl_StartResumedGame(struct GameCtrlProc* gameCtrl) {
    struct BMapMainProc* mapMain;

    if (gPlaySt.chapterIndex == 0x7F) // TODO: CHAPTER_SPECIAL enum?
        ReadExtraMapInfo();

    SetupBackgrounds(NULL);

    SetMainUpdateRoutine(OnMain);
    SetInterrupt_LCDVBlank(OnVBlank);

    ClearBattleMapState();

    SetCursorMapPosition(
        gPlaySt.xCursor,
        gPlaySt.yCursor
    );

    ReadGameSaveCoreGfx();
    ApplyUnitSpritePalettes();
    ResetUnitSprites();

    InitChapterMap(gPlaySt.chapterIndex);

    gBmSt.just_resumed = true;

    mapMain = StartBMapMain(gameCtrl);

    gBmSt.camera.x = GetCameraCenteredX(16 * gBmSt.playerCursor.x);
    gBmSt.camera.y = GetCameraCenteredY(16 * gBmSt.playerCursor.y);

    switch (gActionData.suspendPointType) {

    case SUSPEND_POINT_DURINGACTION:
        MapMain_ResumeFromAction(mapMain);
        break;

    case SUSPEND_POINT_PLAYERIDLE:
    case SUSPEND_POINT_CPPHASE:
        MapMain_ResumeFromPhaseIdle(mapMain);
        break;

    case SUSPEND_POINT_BSKPHASE:
        MapMain_ResumeFromBskPhase(mapMain);
        break;

    case SUSPEND_POINT_DURINGARENA:
        MapMain_ResumeFromArenaFight(mapMain);
        break;

    case SUSPEND_POINT_PHASECHANGE:
        MapMain_ResumeFromPhaseChange(mapMain);
        break;

    } // switch (gActionData.suspendPointType)

    SetBlendTargetA(TRUE, TRUE, TRUE, TRUE, TRUE);
    SetBlendBackdropA(TRUE);

    SetBlendConfig(3, 0, 0, 0x10);
}
