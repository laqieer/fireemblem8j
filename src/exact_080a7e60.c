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













/* prototypes for same-file helpers called by this run */
bool LoadBonusContentData(void * buf);

bool IsExtraBonusClaimEnabled(void)
{
    struct PlaySt playSt;
    struct BonusClaimEnt * buf1;
    int i, ret;

    if (LoadBonusContentData((void *)gGenericBuffer)) {

        ret = 0;
        buf1 = (void*)gGenericBuffer;
    
        for (i = 0; i < 0x10; i++) {
            if (!buf1[i].unseen)
                continue;
    
            if (BONUSKIND_ITEM0 == buf1[i].kind)
                ret = true;

            if (BONUSKIND_MONEY == buf1[i].kind)
                ret = true;
        }

        if (0 == ret)
            return false;
        else
            return true;
    }
    return 0;
}
