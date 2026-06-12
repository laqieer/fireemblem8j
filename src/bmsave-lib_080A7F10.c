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



/* prototypes for same-file helpers called by this run */
int GetUnitsAverageSupportValue(const int unitA, const int unitB);

int GetTotalAverageSupportValue()
{
    int ret = 0;
    struct SupportTalkEnt *buf = GetSupportTalkList();

    for (; 0xFFFF != buf->unitA; buf++)
        ret += GetUnitsAverageSupportValue(buf->unitA, buf->unitB);

    return ret;
}
