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
bool LoadAndVerfyLinkArenaStruct2(void * buf);
void WriteLinkArenaStruct2(struct bmsave_unkstruct2 * buf);

int ModifySaveLinkArenaStruct2A(void * buf, int val)
{
    struct bmsave_unkstruct2 tmp;
    struct bmsave_unkstruct2 * _buf;
    u32 _val = val;

    if (0 == buf) {
        buf = &tmp;
        LoadAndVerfyLinkArenaStruct2(&tmp);
    }

    _buf = buf;
    if (1 & (_buf->unk[val >> 5] >> (_val % 0x20)))
        return 1;
    else
        return 0;
}

void ModifySaveLinkArenaStruct2B(struct bmsave_unkstruct2 * buf, int val)
{
    struct bmsave_unkstruct2 tmp;
    u32 _val = val;
    
    if (NULL == buf) {
        buf = &tmp;
        
        if (!LoadAndVerfyLinkArenaStruct2(&tmp))
            return;
    }

    if (buf->unk[val >> 5] & (1 << (_val % 0x20)))
        return;

    buf->unk[val >> 5] |= (1 << (_val % 0x20));
    WriteLinkArenaStruct2(buf);
}
