#include "global.h"
#include "agb_sram.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmcontainer.h"
#include "bmreliance.h"
#include "bmsave.h"
#include "sram-layout.h"
#include "bmlib.h"
#include "eventinfo.h"
#include "bonusclaim.h"

void SramInit()
{
    u32 buf[2];
    buf[0] = 0x12345678;
    buf[1] = 0x87654321;

    SetSramFastFunc();
    REG_IE |= INTR_FLAG_GAMEPAK;
    WriteSramFast((u8 *)&buf[0], gSram->reserved, sizeof(gSram->reserved));
    ReadSramFast(gSram->reserved, &buf[1], sizeof(buf[1]));
    
    gBoolSramWorking = (buf[1] == buf[0])
                     ? true
                     : false;
}
