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
bool ReadGlobalSaveInfo(struct GlobalSaveInfo *buf);

int GetGlobalBestSupport(int unitA, int unitB, struct GlobalSaveInfo *info)
{
    struct GlobalSaveInfo local_info;
    int i = 0;
    int ret = 0;
    int tmp0, tmp1, tmp2, tmp3;
    unsigned char *SuppordRecord;
    struct SupportTalkEnt *cur = GetSupportTalkList();

    if (info == NULL) {
        info = &local_info;
        ReadGlobalSaveInfo(info);
    }

    for (; cur->unitA != 0xFFFF; i++, cur++) {
        
        if (cur->unitA == unitA && cur->unitB == unitB)
            break;
    
        if (cur->unitA == unitB && cur->unitB == unitA)
            break;
    }

    tmp0 =  i >> 2;
    tmp1 = (3 & i) << 1;
    ret = 3 & info->SuppordRecord[tmp0] >> tmp1;
    return ret;
}
