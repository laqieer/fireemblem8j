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









extern CONST_DATA struct SaveBlocks *gSram;



/* prototypes for same-file helpers called by this run */
u16 SramAddrToOffset(void * addr);
void *GetSaveWriteAddr(int index);

void WriteSaveBlockInfo(struct SaveBlockInfo *chunk, int index)
{

    chunk->magic16 = SAVEMAGIC16;
#if BUGFIX
    chuck->offset = SramAddrToOffset(GetSaveWriteAddr(index));
#else
    chunk->offset = (uintptr_t)GetSaveWriteAddr(index);
#endif

    if (index >= SAVE_ID_MAX)
        return;

    switch (chunk->kind) {
    case SAVEBLOCK_KIND_GAME:
        chunk->size = sizeof(struct GameSaveBlock);
        break;

    case SAVEBLOCK_KIND_SUSPEND:
        chunk->size = SRAM_SIZE_SUSPEND;
        break;

    case SAVEBLOCK_KIND_ARENA:
        chunk->size = SRAM_SIZE_MARENA;
        break;

    case SAVEBLOCK_KIND_XMAP:
        chunk->size = SRAM_SIZE_XMAP;
        break;

    case (u8)SAVEBLOCK_KIND_INVALID:
        chunk->size = 0;
        chunk->offset = 0;
        chunk->magic16 = 0;
        break;

    default:
        return;
    }

    PopulateSaveBlockChecksum(chunk);
    WriteAndVerifySramFast(chunk, &gSram->saveBlockInfo[index], sizeof(struct SaveBlockInfo));
}

void EraseSaveBlockInfo(int index)
{
    struct SaveBlockInfo chunk;

    if (index < SAVE_ID_MAX) {
        CpuFill16(0xFFFF, &chunk, sizeof(struct SaveBlockInfo));
        WriteAndVerifySramFast(
            &chunk,
            &gSram->saveBlockInfo[index],
            sizeof(struct SaveBlockInfo));
    }
}
