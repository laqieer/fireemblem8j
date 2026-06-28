#include "global.h"
#include "proc.h"

extern void StatusDecayDisplay_Init(ProcPtr proc);
extern void MassEffectDisplay_Check(ProcPtr proc);
extern void MassEffectDisplay_Watch(ProcPtr proc);
extern void StatusDecayDisplay_Display(ProcPtr proc);
extern void StatusDecayDisplay_Next(ProcPtr proc);

struct ProcCmd gProcScr_StatusDecayDisplay[] __attribute__((section(".rodata.dat_gProcScr_StatusDecayDisplay_ref"))) = {
    PROC_CALL(StatusDecayDisplay_Init),

PROC_LABEL(0),
    PROC_CALL(MassEffectDisplay_Check),
    PROC_CALL(MassEffectDisplay_Watch),
    PROC_SLEEP(0),

    PROC_CALL(StatusDecayDisplay_Display),
    PROC_SLEEP(0),

PROC_LABEL(1),
    PROC_CALL(StatusDecayDisplay_Next),
    PROC_GOTO(0),

    PROC_END,
};
