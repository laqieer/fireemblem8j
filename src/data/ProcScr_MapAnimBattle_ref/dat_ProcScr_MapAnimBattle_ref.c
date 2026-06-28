#include "global.h"
#include "proc.h"
#include "bm.h"

extern void MapAnim_PrepareBattleTalk(ProcPtr proc);
extern void MapAnim_MoveCameraOntoSubject(ProcPtr proc);
extern void MapAnim_CallBattleQuoteEvents(ProcPtr proc);
extern int BattleEventEngineExists(ProcPtr proc);
extern void SetBattleMuPalette(ProcPtr proc);
extern void SetupBattleMOVEUNITs(ProcPtr proc);
extern void MapAnim_InitInfoBox(ProcPtr proc);
extern void MapAnim_PrepareNextBattleRound(ProcPtr proc);
extern void MapAnim_DisplayRoundAnim(ProcPtr proc);
extern void MapAnim_ShowPoisonEffectIfAny(ProcPtr proc);

struct ProcCmd ProcScr_MapAnimBattle[] __attribute__((section(".rodata.dat_ProcScr_MapAnimBattle_ref"))) = {
    PROC_CALL(LockGame),
    PROC_CALL(MapAnim_PrepareBattleTalk),
    PROC_SLEEP(1),
    PROC_CALL(MapAnim_MoveCameraOntoSubject),
    PROC_SLEEP(2),
    PROC_CALL(MapAnim_CallBattleQuoteEvents),
    PROC_WHILE(BattleEventEngineExists),
    PROC_SLEEP(5),
    PROC_CALL(SetBattleMuPalette),
    PROC_CALL(SetupBattleMOVEUNITs),
    PROC_SLEEP(1),
    PROC_CALL(MapAnim_InitInfoBox),
    PROC_SLEEP(0xF),

PROC_LABEL(0),
    PROC_REPEAT(MapAnim_PrepareNextBattleRound),
    PROC_CALL(MapAnim_DisplayRoundAnim),
    PROC_SLEEP(1),
    PROC_CALL(MapAnim_ShowPoisonEffectIfAny),
    PROC_SLEEP(1),
    PROC_SLEEP(5),
    PROC_GOTO(0),
};
