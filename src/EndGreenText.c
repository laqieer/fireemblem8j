#include "global.h"
#include "proc.h"

extern struct ProcCmd ProcScr_GreenTextColor[];

void EndGreenText(void)
{
    Proc_EndEach(ProcScr_GreenTextColor);
}
