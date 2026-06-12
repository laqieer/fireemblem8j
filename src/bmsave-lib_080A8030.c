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

void GetGlobalSupportListFromSave(int unitId, u8* data, struct GlobalSaveInfo* info)
{
    struct GlobalSaveInfo local_info;
    struct SupportTalkEnt* ptr;
    int i;
    int j;

    if (gCharacterData[unitId-1].pSupportData == 0) {
        for (i = 0; i < UNIT_SUPPORT_MAX_COUNT; data++, i++)
            *data = 0;

        return;
    }

    j = 0;
    ptr = GetSupportTalkList();

    if (info == NULL) {
        info = &local_info;
        ReadGlobalSaveInfo(info);
    }

    for (; ; j++, ptr++) {
        int tmp1, tmp2;

        if (ptr->unitA == 0xFFFF)
            break;

        if ((ptr->unitA != unitId) && (ptr->unitB != unitId))
            continue;

        tmp1 = j >> 2;
        tmp2 = (j & 3) << 1;

        for (i = 0; i < gCharacterData[unitId-1].pSupportData->supportCount; i++) {

            if ((ptr->unitA != gCharacterData[unitId-1].pSupportData->characters[i]) &&
                (ptr->unitB != gCharacterData[unitId-1].pSupportData->characters[i])) {
                continue;
            }

            data[i] = (info->SuppordRecord[tmp1] >> (tmp2)) & 3;

            break;
        }
    }

    for (i = gCharacterData[unitId-1].pSupportData->supportCount; i < UNIT_SUPPORT_MAX_COUNT; i++) {
        data[i] = 0;
    }

    return;
}
