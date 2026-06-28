#include "global.h"
#include "proc.h"

extern void PageNumCtrl_OnInit(ProcPtr proc);
extern void PageNumCtrl_CheckSlide(ProcPtr proc);
extern void PageNumCtrl_UpdateArrows(ProcPtr proc);
extern void PageNumCtrl_UpdatePageNum(ProcPtr proc);
extern void PageNumCtrl_DisplayMuPlatform(ProcPtr proc);
extern void PageNumCtrl_DisplayBlinkIcons(ProcPtr proc);

struct ProcCmd gProcScr_SSPageNumCtrl[] __attribute__((section(".rodata.dat_gProcScr_SSPageNumCtrl_ref"))) = {
    PROC_CALL(PageNumCtrl_OnInit),

PROC_LABEL(0),
    PROC_SLEEP(0),
    PROC_CALL(PageNumCtrl_CheckSlide),
    PROC_CALL(PageNumCtrl_UpdateArrows),
    PROC_CALL(PageNumCtrl_UpdatePageNum),
    PROC_CALL(PageNumCtrl_DisplayMuPlatform),
    PROC_CALL(PageNumCtrl_DisplayBlinkIcons),
    PROC_GOTO(0),

    PROC_END,
};
