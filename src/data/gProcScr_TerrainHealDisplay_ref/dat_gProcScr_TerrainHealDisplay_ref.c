#include "global.h"
#include "proc.h"

extern void TerrainHealDisplay_Init(ProcPtr proc);
extern void MassEffectDisplay_Check(ProcPtr proc);
extern void MassEffectDisplay_Watch(ProcPtr proc);
extern void TerrainHealDisplay_Display(ProcPtr proc);
extern void FinishDamageDisplay(ProcPtr proc);
extern void TerrainHealDisplay_Next(ProcPtr proc);

struct ProcCmd gProcScr_TerrainHealDisplay[] __attribute__((section(".rodata.dat_gProcScr_TerrainHealDisplay_ref"))) = {
    PROC_CALL(TerrainHealDisplay_Init),

PROC_LABEL(0),
    PROC_CALL(MassEffectDisplay_Check),
    PROC_CALL(MassEffectDisplay_Watch),
    PROC_SLEEP(0),

    PROC_CALL(TerrainHealDisplay_Display),
    PROC_SLEEP(0),

    PROC_CALL(FinishDamageDisplay),

PROC_LABEL(1),
    PROC_CALL(TerrainHealDisplay_Next),
    PROC_GOTO(0),

    PROC_END,
};
