#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "sysutil.h"

#include "opanim.h"

//! FE8U = 0x080C8554
void OpAnimScrollBg3Loop(void)
{
    gLCDControlBuffer.bgoffset[BG_3].x += 2;
    return;
}
