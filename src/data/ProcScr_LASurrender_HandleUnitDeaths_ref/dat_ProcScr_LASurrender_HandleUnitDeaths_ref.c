#include "global.h"
#include "proc.h"

extern void LAUnitDeaths_Init(ProcPtr proc);
extern void LAUnitDeaths_FindNextAndStart(ProcPtr proc);
extern void LAUnitDeaths_EndMu(ProcPtr proc);
extern void LAUnitDeaths_OnEnd(ProcPtr proc);

struct ProcCmd ProcScr_LASurrender_HandleUnitDeaths[] __attribute__((section(".rodata.dat_ProcScr_LASurrender_HandleUnitDeaths_ref"))) = {
    PROC_CALL(LAUnitDeaths_Init),

PROC_LABEL(0),
    PROC_CALL(LAUnitDeaths_FindNextAndStart),
    PROC_SLEEP(0x20),
    PROC_CALL(LAUnitDeaths_EndMu),
    PROC_GOTO(0),

PROC_LABEL(1),
    PROC_CALL(LAUnitDeaths_OnEnd),
    PROC_END,
};
