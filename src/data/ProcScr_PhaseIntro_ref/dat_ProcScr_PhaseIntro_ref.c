#include "global.h"
#include "proc.h"
#include "phasechangefx.h"
#include "bm.h"

struct ProcCmd ProcScr_PhaseIntro[] __attribute__((section(".rodata.dat_ProcScr_PhaseIntro_ref"))) = {
    PROC_CALL(PhaseIntro_EndIfNoUnits),
    PROC_CALL(PhaseIntro_InitGraphics),
    PROC_START_CHILD(gProcScr_PhaseIntroText),
    PROC_START_CHILD(gProcScr_PhaseIntroSquares),
    PROC_START_CHILD(gProcScr_PhaseIntroBlendBox),
    PROC_CALL(PhaseIntro_InitDisp),
    PROC_REPEAT(PhaseIntro_WaitForEnd),
    PROC_CALL(StartMapSongBgm),
    PROC_END,
};
