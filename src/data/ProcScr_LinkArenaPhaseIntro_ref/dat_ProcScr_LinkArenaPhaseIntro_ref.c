#include "global.h"
#include "proc.h"

extern void LAPhaseIntro_Init(ProcPtr proc);
extern struct ProcCmd gProcScr_PhaseIntroText[];
extern struct ProcCmd gProcScr_PhaseIntroSquares[];
extern struct ProcCmd gProcScr_PhaseIntroBlendBox[];
extern void PhaseIntro_InitDisp(ProcPtr proc);
extern void PhaseIntro_WaitForEnd(ProcPtr proc);
extern void LAPhaseIntro_StartBgm(ProcPtr proc);
extern void LAPhaseIntro_End(ProcPtr proc);

struct ProcCmd ProcScr_LinkArenaPhaseIntro[] __attribute__((section(".rodata.dat_ProcScr_LinkArenaPhaseIntro_ref"))) = {
    PROC_CALL(LAPhaseIntro_Init),
    PROC_SLEEP(0),
    PROC_START_CHILD(gProcScr_PhaseIntroText),
    PROC_START_CHILD(gProcScr_PhaseIntroSquares),
    PROC_START_CHILD(gProcScr_PhaseIntroBlendBox),
    PROC_CALL(PhaseIntro_InitDisp),
    PROC_REPEAT(PhaseIntro_WaitForEnd),
    PROC_CALL(LAPhaseIntro_StartBgm),
    PROC_CALL(LAPhaseIntro_End),
    PROC_END,
};
