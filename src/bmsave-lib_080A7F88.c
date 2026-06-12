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
int GetTotalAverageSupportValue();
int GetTotalGlobalSupportValue(struct GlobalSaveInfo * buf);

int GetTotalSupportCollection(void)
{
    int tmp0 = GetTotalGlobalSupportValue(0);
    int tmp1 = GetTotalAverageSupportValue();

    if ((tmp0 > 0) && (0 == ((tmp0 * 100) / tmp1)))
            tmp0 = 1;
    else
        tmp0 = (tmp0 * 100) / tmp1;

    if (tmp0 > 100)
        tmp0 = 100;
    
    return tmp0;
}
