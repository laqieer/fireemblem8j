#include "global.h"
#include "proc.h"

extern void TrapDamageDisplay_Init(ProcPtr proc);
extern void TrapDamageDisplay_Check(ProcPtr proc);
extern void TrapDamageDisplay_Watch(ProcPtr proc);
extern void TrapDamageDisplay_Display(ProcPtr proc);
extern void FinishDamageDisplay(ProcPtr proc);
extern void TrapDamageDisplay_Next(ProcPtr proc);

struct ProcCmd gProcScr_TrapDamageDisplay[] __attribute__((section(".rodata.dat_gProcScr_TrapDamageDisplay_ref"))) = {
    PROC_CALL(TrapDamageDisplay_Init),

PROC_LABEL(0),
    PROC_SLEEP(0),

    PROC_CALL(TrapDamageDisplay_Check),

    PROC_CALL(TrapDamageDisplay_Watch),
    PROC_SLEEP(0),

    PROC_CALL(TrapDamageDisplay_Display),
    PROC_SLEEP(0),

    PROC_CALL(FinishDamageDisplay),

PROC_LABEL(1),
    PROC_CALL(TrapDamageDisplay_Next),

    PROC_GOTO(0),

    PROC_END,
};
