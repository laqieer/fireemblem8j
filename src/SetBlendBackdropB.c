#include "global.h"
#include "proc.h"
#include "bm.h"
#include "ctc.h"
#include "hardware.h"

void SetBlendBackdropB(int a)
{
    gLCDControlBuffer.bldcnt.target2_bd_on = a;
}
