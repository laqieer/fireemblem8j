#include "global.h"
#include "proc.h"
#include "bm.h"

extern struct ProcCmd sProc_BMVSync[];
void BMapVSync_InitMapAnimations(ProcPtr proc);
void WfxInit(void);

void BMapVSync_Start(void) {
    BMapVSync_InitMapAnimations(
        Proc_Start(sProc_BMVSync, PROC_TREE_VSYNC));

    WfxInit();
    gBmSt.gameGfxSemaphore = 0;
}
