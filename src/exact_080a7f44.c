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
bool ReadGlobalSaveInfo(struct GlobalSaveInfo *buf);

int GetTotalGlobalSupportValue(struct GlobalSaveInfo * buf)
{
    int i, j, tmp1, tmp2, ret = 0;
    unsigned char *SuppordRecord;
    struct GlobalSaveInfo tmp_header;

    if (0 == buf) {
        buf = &tmp_header;
        ReadGlobalSaveInfo(buf);
    }

    for (i = 0; i < 0x20; i++) {
        for (j = 0; j < 4; j++) {
            tmp1 = 1 + i;
            tmp2 = buf->SuppordRecord[tmp1 - 1];
            ret += (tmp2 >> (j << 1)) & 3;
        }
    }

    return ret;
}
