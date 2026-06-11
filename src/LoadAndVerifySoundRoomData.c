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

bool LoadAndVerifySoundRoomData(struct SoundRoomSaveData * buf)
{
    struct SoundRoomSaveData tmp;

    if (!IsSramWorking())
        return false;

    if (NULL == buf)
        buf = &tmp;

    ReadSramFast(&gSram->soundRoomSave, buf, sizeof(struct SoundRoomSaveData));

    if (buf->magic1 != Checksum16(buf, sizeof(struct SoundRoomSaveData) - 4))
        return false;
    else
        return true;
}
