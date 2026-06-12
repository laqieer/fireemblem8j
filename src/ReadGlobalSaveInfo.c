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
/* TU-private data externs bound at their JP addresses */
extern const char sSaveMarker[];

bool ReadGlobalSaveInfo(struct GlobalSaveInfo *buf)
{
    struct GlobalSaveInfo local_info;

    if (!IsSramWorking())
        return false;

    if (NULL == buf)
        buf = &local_info;

    ReadSramFast(&gSram->globalSaveInfo, buf, sizeof(struct GlobalSaveInfo));

    if (0 != StringCompare(buf->name, sSaveMarker)
        && SAVEMAGIC32 == buf->magic32
        && SAVEMAGIC16 == buf->magic16
        && buf->checksum == Checksum16(buf, GLOBALSIZEINFO_SIZE_FOR_CHECKSUM))
        return true;

    return false;
}
