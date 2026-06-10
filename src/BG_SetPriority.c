#include "global.h"
#include "proc.h"
#include "bm.h"
#include "ctc.h"
#include "hardware.h"

void BG_SetPriority(int bg, int priority)
{
    sBGControlStructPtrs[bg]->priority = priority;
}
