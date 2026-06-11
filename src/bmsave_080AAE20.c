#include "global.h"

#include "bmitem.h"
#include "agb_sram.h"
#include "bmbattle.h"
#include "bmcontainer.h"
#include "bmdifficulty.h"
#include "fontgrp.h"
#include "uimenu.h"
#include "bmmind.h"
#include "event.h"
#include "bmtrick.h"
#include "functions.h"
#include "bmreliance.h"
#include "bmunit.h"
#include "bmsave.h"
#include "sram-layout.h"
#include "eventinfo.h"

/* variables */
extern EWRAM_DATA u32 gBonusContentClaimFlags;
extern EWRAM_DATA u8 gSuspendSaveIdOffset;

int SramChecksum32(void *sram_src, int size)
{
    ReadSramFast(sram_src, gGenericBuffer, size);
    return ComputeChecksum32((const u32*)gGenericBuffer, size);
}

bool VerifySaveBlockChecksum(struct SaveBlockInfo *buf)
{
    int size = buf->size;
    void *sram_dest = SramOffsetToAddr(buf->offset);
    int check_sum = SramChecksum32(sram_dest, size);

    if (buf->checksum32 != check_sum)
        return false;
    else
        return true;
}
