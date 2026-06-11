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

EWRAM_DATA u8 gUnused_BmsaveLib_0[10] = { 0 };






extern CONST_DATA struct SaveBlocks *gSram;



//! FE8U = 0x080A2C2C
u8 * BmSave_GetUnusedBuffer(void)
{
    gUnused_BmsaveLib_0[0] = 0;
    return gUnused_BmsaveLib_0;
}
