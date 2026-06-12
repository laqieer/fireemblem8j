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



struct ProcCmd CONST_DATA gProcScr_GameControl[] =
{
    PROC_NAME("GAMECTRL"),
    PROC_MARK(PROC_MARK_GAMECTRL),

    PROC_15,
    PROC_CALL(GameControl_CallEraseSaveEventWithKeyCombo),
    PROC_CALL(GameControl_0),
    PROC_REPEAT(GameControl_Null_0),

    // fallthrough

PROC_LABEL(LGAMECTRL_GAME_INTRO_UI),
    PROC_START_CHILD_BLOCKING(ProcScr_GameEarlyStartUI),

    // fallthrough

PROC_LABEL(LGAMECTRL_OP_ANIM),
    PROC_CALL(GameControl_EnableSoundEffects),
    PROC_START_CHILD_BLOCKING(ProcScr_OpAnim),
    PROC_CALL(GameControl_PostIntro),
    PROC_YIELD,
    PROC_GOTO(4),

PROC_LABEL(LGAMECTRL_CLASS_REEL),
    PROC_CALL_2(GamceControl_StartClassReel),
    PROC_CALL(GameControl_PostClassReel),
    PROC_YIELD,
    PROC_GOTO(LGAMECTRL_OP_ANIM),

PROC_LABEL(3),
    PROC_YIELD,
    PROC_CALL(GameControl_ClearPaletteAndReset),
    PROC_CALL(GameControl_PostClassReel),
    PROC_YIELD,
    PROC_GOTO(LGAMECTRL_OP_ANIM),

PROC_LABEL(LGAMECTRL_TITLE_DIRECT),
    PROC_CALL(GameControl_EnableSoundEffects),
    PROC_CALL(StartTitleScreen_WithMusic),
    PROC_GOTO(LGAMECTRL_POST_TITLE_IDLE),

PROC_LABEL(24),
    PROC_CALL(GameControl_EnableSoundEffects),
    PROC_CALL(StartTitleScreen_FlagTrue),
    PROC_GOTO(LGAMECTRL_POST_TITLE_IDLE),

PROC_LABEL(25),
    PROC_CALL(GameControl_EnableSoundEffects),
    PROC_CALL(StartTitleScreen_FlagFalse),
    PROC_GOTO(LGAMECTRL_POST_TITLE_IDLE),

PROC_LABEL(LGAMECTRL_POST_TITLE_IDLE),
    PROC_YIELD,
    PROC_CALL(GameControl_PostIntro),
    PROC_YIELD,
    PROC_GOTO(LGAMECTRL_OP_ANIM),

PROC_LABEL(LGAMECTRL_EXEC_SAVEMENU),
    PROC_CALL(GameControl_EnableSoundEffects),
    PROC_CALL(StartSaveMenu),
    PROC_YIELD,
    PROC_CALL(GameControl_SwitchPostSaveMenu),
    PROC_YIELD,
    PROC_GOTO(LGAMECTRL_EXEC_BM),

PROC_LABEL(LGAMECTRL_EXEC_BM_EXT),
    PROC_CALL(GameControl_RememberChapterId),
    PROC_YIELD,
    PROC_CALL(StartBattleMap),
    PROC_YIELD,
    PROC_GOTO(9),

PROC_LABEL(LGAMECTRL_EXEC_BM),
    PROC_CALL(GameCtrl_CheckNewGameAndBranch),
    PROC_CALL(GameCtrl_CheckGameCompleteAndBranch),
    PROC_CALL(GameControl_RememberChapterId),
    PROC_CALL(GameCtrlStartIntroMonologue),
    PROC_YIELD,
    PROC_START_CHILD_BLOCKING(ProcScr_WorldMapWrapper),
    PROC_CALL(EndWM),
    PROC_CALL(GameControl_SetupBackdropBlend),
    PROC_YIELD,
    PROC_CALL(StartBattleMap),
    PROC_YIELD,

    // fallthrough

PROC_LABEL(LGAMECTRL_POST_NORMAL_CHAPTER),
    PROC_YIELD,

    PROC_CALL(GameControl_PostChapterSwitch),
    PROC_YIELD,
    PROC_CALL(GameControl_RestoreChapterId),

    // fallthrough

PROC_LABEL(19),
    PROC_CALL(GameControl_ChapterSwitch),
    PROC_CALL(GameControl_CallPostChapterSaveMenu),
    PROC_YIELD,
    PROC_GOTO(LGAMECTRL_EXEC_BM),

PROC_LABEL(8),
    PROC_CALL(GameControl_SetupBackdropBlend),
    PROC_CALL(GameCtrl_StartResumedGame),
    PROC_YIELD,
    PROC_CALL(GameControl_RememberChapterId),
    PROC_CALL(GameControlHandlePostNormalOrExtraChapter),

    PROC_GOTO(9),

PROC_LABEL(14),
    PROC_YIELD,
    // fallthrough

PROC_LABEL(LGAMECTRL_POST_EXTRA_MAP),
    PROC_YIELD,
    PROC_GOTO(LGAMECTRL_TITLE_DIRECT),

PROC_LABEL(LGAMECTRL_EXEC_BM_),
    PROC_GOTO(LGAMECTRL_EXEC_BM),

PROC_LABEL(12),
    PROC_CALL(StartLinkArenaMainMenu),
    PROC_YIELD,
    PROC_CALL(GameControl_StartMainTheme),
    PROC_GOTO(LGAMECTRL_EXEC_SAVEMENU),

PROC_LABEL(16),
    PROC_CALL(ClearTemporaryUnits),
    PROC_CALL(GameCtrl_DeclareCompletedChapter),
    PROC_CALL(Make6C_SaveMenuPostChapter),
    PROC_YIELD,

    // fallthrough

PROC_LABEL(LGAMECTRL_EXEC_ENDING_SCENE),
    PROC_CALL(GameCtrl_SavePlayThroughData),

    PROC_CALL(CallGameEndingEvent),
    PROC_YIELD,

    PROC_WHILE(EventEngineExists),

    PROC_CALL(StartFinScreen),
    PROC_CALL(_SetGameEndFlag),

    PROC_SLEEP(30),

    PROC_GOTO(4),

PROC_LABEL(LGAMECTRL_ERASE_SAVE),
    PROC_CALL(GameControl_CallEraseMural),
    PROC_CALL(StartMidFadeFromBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(CallEraseSaveEvent),
    PROC_WHILE(EventEngineExists),
    PROC_YIELD,
    PROC_CALL(StartMidFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(EndMuralBackground),
    PROC_GOTO(LGAMECTRL_GAME_INTRO_UI),

    PROC_END,
};

void StartGame(void)
{
    struct GameCtrlProc* proc;

    SetMainUpdateRoutine(OnMain);
    SetInterrupt_LCDVBlank(OnVBlank);

    proc = Proc_Start(gProcScr_GameControl, PROC_TREE_3);
    proc->nextAction = GAME_ACTION_EVENT_RETURN;
    proc->nextChapter = 0;
    proc->idle_status = 0;
}
