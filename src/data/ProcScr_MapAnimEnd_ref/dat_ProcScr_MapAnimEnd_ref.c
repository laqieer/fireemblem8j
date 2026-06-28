#include "global.h"
#include "proc.h"
#include "bm.h"

extern void MapAnim_DisplayDeathQuote(ProcPtr proc);
extern int BattleEventEngineExists(ProcPtr proc);
extern void MapAnim_DisplayDeathFade(ProcPtr proc);
extern struct ProcCmd ProcScr_MuDeathFade[];
extern void EndMapAnimInfoWindow(ProcPtr proc);
extern void MapAnim_StoleItemPopup(ProcPtr proc);
extern void MapAnim_DisplayExpBar(ProcPtr proc);
extern void DisplayWpnBrokePopup(ProcPtr proc);
extern void DisplayWRankUpPopup(ProcPtr proc);
extern void MapAnim_MoveCameraOntoSubject(ProcPtr proc);
extern void MapAnim_Cleanup(ProcPtr proc);

struct ProcCmd ProcScr_MapAnimEnd[] __attribute__((section(".rodata.dat_ProcScr_MapAnimEnd_ref"))) = {
    PROC_CALL(MapAnim_DisplayDeathQuote),
    PROC_WHILE(BattleEventEngineExists),
    PROC_CALL(MapAnim_DisplayDeathFade),
    PROC_WHILE_EXISTS(ProcScr_MuDeathFade),
    PROC_CALL(EndMapAnimInfoWindow),
    PROC_SLEEP(1),
    PROC_CALL(MapAnim_StoleItemPopup),
    PROC_SLEEP(0),
    PROC_CALL(MapAnim_DisplayExpBar),
    PROC_SLEEP(0),
    PROC_CALL(DisplayWpnBrokePopup),
    PROC_SLEEP(8),
    PROC_CALL(DisplayWRankUpPopup),
    PROC_SLEEP(0),
    PROC_CALL(MapAnim_MoveCameraOntoSubject),
    PROC_SLEEP(2),
    PROC_CALL(UnlockGame),
    PROC_CALL(MapAnim_Cleanup),
    PROC_END,
};
