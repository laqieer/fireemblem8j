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

void *GetSaveWriteAddr(int index)
{
    switch (index) {
        case SAVE_ID_GAME0:
            return &gSram->gameSaveBlocks[0];
            break;

        case SAVE_ID_GAME1:
            return &gSram->gameSaveBlocks[1];
            break;

        case SAVE_ID_GAME2:
            return &gSram->gameSaveBlocks[2];
            break;

        case SAVE_ID_SUSPEND:
            return &gSram->suspendSaveBlocks[0];
            break;

        case SAVE_ID_SUSPEND_ALT:
            return &gSram->suspendSaveBlocks[1];
            break;

        case SAVE_ID_ARENA:
            return &gSram->multiArenaBlock;
            break;

        case SAVE_ID_XMAP:
            return CART_SRAM + SRAM_OFFSET_XMAP;
            break;

        default:
            return NULL;
            break;
    }
}
