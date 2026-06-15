#include "global.h"
extern struct ProcCmd sProcScr_BMXFADE[];
#include "hardware.h"
#include "proc.h"
#include "bm.h"

bool8 DoesBMXFADEExist(void)
{
    return Proc_Find(sProcScr_BMXFADE)
            ? 1
            : 0;
}
