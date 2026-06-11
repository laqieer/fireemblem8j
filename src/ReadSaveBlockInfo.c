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

bool ReadSaveBlockInfo(struct SaveBlockInfo *chunk, int index)
{
    struct SaveBlockInfo tmp;
    u32 magic;

    if (NULL == chunk)
        chunk = &tmp;

    ReadSramFast(&gSram->saveBlockInfo[index], chunk, sizeof(struct SaveBlockInfo));

    if (SAVEMAGIC16 != chunk->magic16)
        return false;

    switch (index) {
    case SAVE_ID_GAME0:
    case SAVE_ID_GAME1:
    case SAVE_ID_GAME2:
        magic = SAVEMAGIC32;
        break;

    case SAVE_ID_SUSPEND:    
    case SAVE_ID_SUSPEND_ALT:
        magic = SAVEMAGIC32;
        break;

    case SAVE_ID_ARENA:
        magic = SAVEMAGIC32_ARENA;
        break;

    case SAVE_ID_XMAP:
        magic = SAVEMAGIC32_XMAP;
        break;
    
    default:
        return false;
        break;
    } /* switch */

    if (chunk->magic32 != magic)
        return false;

    return VerifySaveBlockChecksum(chunk);
}
