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
void * SramOffsetToAddr(u16 off);
bool ReadSaveBlockInfo(struct SaveBlockInfo *chunk, int index);

void *GetSaveReadAddr(int index)
{
    struct SaveBlockInfo chunk;
    ReadSaveBlockInfo(&chunk, index);
    return SramOffsetToAddr(chunk.offset);
}
