#include "global.h"
#include "proc.h"
#include "bm.h"
#include "ctc.h"
#include "hardware.h"

int BG_GetPriority(int bg)
{
    return sBGControlStructPtrs[bg]->priority;
}
