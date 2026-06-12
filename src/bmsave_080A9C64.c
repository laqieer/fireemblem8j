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

u32 LoadSavedBonusClaimFlags(int slot)
{
    u32 buf;
    const struct GameSaveBlock *src = GetSaveReadAddr(slot);
    ReadSramFast(&src->bonusClaimFlags, &buf, sizeof(buf));
    return buf;
}
