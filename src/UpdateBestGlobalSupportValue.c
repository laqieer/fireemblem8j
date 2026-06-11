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

void WriteGlobalSaveInfo(struct GlobalSaveInfo *header);

bool UpdateBestGlobalSupportValue(int unitA, int unitB, int supportRank) {
    int convo;
    int var0;
    int var1;
    struct GlobalSaveInfo info;
    struct SupportTalkEnt* ptr;

    supportRank = supportRank & 3;

    if (!ReadGlobalSaveInfo(&info)) {
        return 0;
    }

    convo = 0;

    for (ptr = GetSupportTalkList(); ; ptr++) {

        if (ptr->unitA == 0xFFFF)
            break;

        if ((ptr->unitA == unitA) && (ptr->unitB == unitB))
            break;

        if ((ptr->unitA == unitB) && (ptr->unitB == unitA))
            break;

        convo++;
    }

    var0 = convo >> 2;
    var1 = (convo & 3) << 1;

    if (((info.SuppordRecord[var0] >> var1) & 3) >= (supportRank))
        return false;

    info.SuppordRecord[var0] &= ~(3 << var1);
    info.SuppordRecord[var0] += (supportRank << var1);

    WriteGlobalSaveInfo(&info);

    return true;
}
