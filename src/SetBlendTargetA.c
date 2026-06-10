#include "global.h"
#include "proc.h"
#include "bm.h"
#include "ctc.h"
#include "hardware.h"

void SetBlendTargetA(int bg0, int bg1, int bg2, int bg3, int obj)
{
    *((u16 *) &gLCDControlBuffer.bldcnt) &= ~BLDCNT_TARGETA(1, 1, 1, 1, 1);
    *((u16 *) &gLCDControlBuffer.bldcnt) |= BLDCNT_TARGETA(bg0, bg1, bg2, bg3, obj);
}
