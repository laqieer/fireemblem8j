#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "bmlib.h"
#include "statscreen.h"

extern struct ProcCmd gProcScr_SSGlowyBlendCtrl[];

void StartGlowBlendCtrl(void)
{
    Proc_Start(gProcScr_SSGlowyBlendCtrl, PROC_TREE_3);
}
