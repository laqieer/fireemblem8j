#include "global.h"
#include "proc.h"
#include "bm.h"
#include "ctc.h"
#include "hardware.h"

void BG_EnableSync(int bg)
{
    sModifiedBGs |= 1 << bg;
}
