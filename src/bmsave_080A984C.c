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

void CopyGameSave(int index_src, int index_dest)
{
    struct SaveBlockInfo chunk;
    void *src = GetSaveReadAddr(index_src);
    void *dest = GetSaveWriteAddr(index_dest);

    ReadSramFast(src, gGenericBuffer, sizeof(struct GameSaveBlock));
    WriteAndVerifySramFast(gGenericBuffer, dest, sizeof(struct GameSaveBlock));

    chunk.magic32 = SAVEMAGIC32;
    chunk.kind = SAVEBLOCK_KIND_GAME;
    WriteSaveBlockInfo(&chunk, index_dest);
}
