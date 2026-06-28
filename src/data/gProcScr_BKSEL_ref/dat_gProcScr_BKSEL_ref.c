#include "global.h"
#include "proc.h"

extern u8 data_080DCCB2[];
extern void BattleForecast_OnEnd(ProcPtr proc);
extern void ClearBg0Bg1(ProcPtr proc);
extern void BattleForecast_Init(ProcPtr proc);
extern int MapEventEngineExists_(ProcPtr proc);
extern void BattleForecast_OnNewBattle(ProcPtr proc);
extern void BattleForecast_LoopSlideIn(ProcPtr proc);
extern void StartBattleForecastTutorialEvent(ProcPtr proc);
extern void BattleForecast_LoopDisplay(ProcPtr proc);
extern void BattleForecast_LoopSlideOut(ProcPtr proc);

struct ProcCmd gProcScr_BKSEL[] __attribute__((section(".rodata.dat_gProcScr_BKSEL_ref"))) = {
    PROC_NAME((const char*)(data_080DCCB2 + 0x4A)),

    PROC_SET_END_CB(BattleForecast_OnEnd),

    PROC_CALL(ClearBg0Bg1),
    PROC_SLEEP(0),

    PROC_CALL(BattleForecast_Init),

PROC_LABEL(0),
    PROC_WHILE(MapEventEngineExists_),
    PROC_CALL(BattleForecast_OnNewBattle),

    PROC_REPEAT(BattleForecast_LoopSlideIn),

    PROC_CALL(StartBattleForecastTutorialEvent),

    PROC_REPEAT(BattleForecast_LoopDisplay),
    PROC_REPEAT(BattleForecast_LoopSlideOut),

    PROC_GOTO(0),

PROC_LABEL(1),
    PROC_REPEAT(BattleForecast_LoopSlideOut),
    PROC_END,
};
