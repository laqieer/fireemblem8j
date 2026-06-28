#include "global.h"
#include "proc.h"

extern void PopupProc_GfxClear(ProcPtr proc);
extern void PopupProc_Init(ProcPtr proc);
extern void PopupProc_PrepareGfx(ProcPtr proc);
extern void PopupProc_MaybeSetVolume(ProcPtr proc);
extern void PopupProc_PlaySound(ProcPtr proc);
extern void PopupProc_GfxDraw(ProcPtr proc);
extern void PopupProc_WaitForPress(ProcPtr proc);
extern void PopupProc_MaybeResetVolume(ProcPtr proc);

struct ProcCmd ProcScr_Popup[] __attribute__((section(".rodata.dat_ProcScr_Popup_ref"))) = {
    PROC_SET_END_CB(PopupProc_GfxClear),
    PROC_CALL(PopupProc_Init),
    PROC_SLEEP(0xA),
    PROC_CALL(PopupProc_PrepareGfx),
    PROC_CALL(PopupProc_MaybeSetVolume),
    PROC_SLEEP(0),
    PROC_CALL(PopupProc_PlaySound),
    PROC_CALL(PopupProc_GfxDraw),
    PROC_REPEAT(PopupProc_WaitForPress),
    PROC_CALL(PopupProc_MaybeResetVolume),
    PROC_SLEEP(0),
    PROC_END,
};
