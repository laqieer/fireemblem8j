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

// TODO: Should be in "bmsave.h", but doing so causes a non-match (implicit declaration?) in "bonusclaim.c"
bool LoadBonusContentData(void *buf);


extern EWRAM_DATA bool gBoolSramWorking;






extern CONST_DATA struct SaveBlocks *gSram;



void WipeSram()
{
    u32 buf[0x10];
    int i;

    for (i = 0; i < 0x10; i++)
        buf[i] = 0xFFFFFFFF;

    for (i = 0; i < 0x200; i++)
        WriteAndVerifySramFast(buf, (u8 *)gSram + i * 0x40, 0x40);
}
