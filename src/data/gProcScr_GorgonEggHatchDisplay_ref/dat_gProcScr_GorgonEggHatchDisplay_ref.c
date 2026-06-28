#include "global.h"
#include "proc.h"

extern void GorgonEggHatchDisplay_Init(ProcPtr proc);
extern void MassEffectDisplay_Check(ProcPtr proc);
extern void MassEffectDisplay_Watch(ProcPtr proc);
extern void GorgonEggHatchDisplay_Display(ProcPtr proc);
extern void FinishDamageDisplay(ProcPtr proc);
extern void GorgonEggHatchDisplay_Next(ProcPtr proc);

struct ProcCmd gProcScr_GorgonEggHatchDisplay[] __attribute__((section(".rodata.dat_gProcScr_GorgonEggHatchDisplay_ref"))) = {
    PROC_CALL(GorgonEggHatchDisplay_Init),

PROC_LABEL(0),
    PROC_CALL(MassEffectDisplay_Check),
    PROC_CALL(MassEffectDisplay_Watch),
    PROC_SLEEP(0),

    PROC_CALL(GorgonEggHatchDisplay_Display),
    PROC_SLEEP(0),

    PROC_CALL(FinishDamageDisplay),

PROC_LABEL(1),
    PROC_CALL(GorgonEggHatchDisplay_Next),
    PROC_SLEEP(0),

    PROC_GOTO(0),

    PROC_END,
};
