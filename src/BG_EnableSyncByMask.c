#include "global.h"
#include "proc.h"
#include "bm.h"
#include "ctc.h"
#include "hardware.h"

void BG_EnableSyncByMask(int bg)
{
    sModifiedBGs |= bg;
}
