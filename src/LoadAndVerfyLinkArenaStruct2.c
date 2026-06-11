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

bool LoadAndVerfyLinkArenaStruct2(void * buf)
{
    struct bmsave_unkstruct2 tmp, * _buf = buf;

    if (!IsSramWorking())
        return 0;

    if (0 == _buf)
        _buf = &tmp;

    ReadSramFast(&gSram->unkstruct2, (void*)_buf, sizeof(struct bmsave_unkstruct2));

    if (_buf->magic1 != Checksum16((u16*)_buf, sizeof(struct bmsave_unkstruct2) - 4))
        return 0;
    else
        return 1;
}
