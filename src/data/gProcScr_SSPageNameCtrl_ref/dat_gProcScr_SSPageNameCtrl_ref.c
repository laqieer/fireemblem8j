#include "global.h"
#include "proc.h"

extern void PageNameCtrl_OnInit(ProcPtr proc);
extern void PageNameCtrl_OnIdle(ProcPtr proc);
extern void PageNameCtrl_AnimOut(ProcPtr proc);
extern void PageNameCtrl_AnimIn(ProcPtr proc);

struct ProcCmd gProcScr_SSPageNameCtrl[] __attribute__((section(".rodata.dat_gProcScr_SSPageNameCtrl_ref"))) = {
    PROC_CALL(PageNameCtrl_OnInit),

PROC_LABEL(0),
    PROC_REPEAT(PageNameCtrl_OnIdle),
    PROC_REPEAT(PageNameCtrl_AnimOut),
    PROC_SLEEP(1),
    PROC_REPEAT(PageNameCtrl_AnimIn),
    PROC_GOTO(0),

    PROC_END,
};
