#include "global.h"
#include "proc.h"
#include "bm.h"
#include "ctc.h"
#include "hardware.h"

void SetBlendBackdropA(int a)
{
    gLCDControlBuffer.bldcnt.target1_bd_on = a;
}
