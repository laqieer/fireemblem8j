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

/* prototypes for same-file helpers called by this run */
int SramChecksum32(void *sram_src, int size);

u16 GetGameStateChecksum_Unused()
{
    int i;
    u16 ret = 0;

    for (i = 0; i < UNIT_SAVE_AMOUNT_BLUE; i++) {
        if (0 == gUnitArrayBlue[i].pCharacterData)
            continue;

        gUnitArrayBlue[i].pMapSpriteHandle = 0;
        ret += SramChecksum32(&gUnitArrayBlue[i], sizeof(struct GameSavePackedUnit));
    }

    for (i = 0; i < UNIT_SAVE_AMOUNT_RED; i++) {
        if (0 == gUnitArrayRed[i].pCharacterData)
            continue;

        gUnitArrayRed[i].pMapSpriteHandle = 0;
        ret += SramChecksum32(&gUnitArrayRed[i], sizeof(struct GameSavePackedUnit));
    }

    for (i = 0; i < UNIT_SAVE_AMOUNT_GREEN; i++) {
        if (0 == gUnitArrayGreen[i].pCharacterData)
            continue;

        gUnitArrayGreen[i].pMapSpriteHandle = 0;
        ret += SramChecksum32(&gUnitArrayGreen[i], sizeof(struct GameSavePackedUnit));
    }

    ret += SramChecksum32(GetPermanentFlagBits(), GetPermanentFlagBitsSize() / 2);

    ret += SramChecksum32(GetChapterFlagBits(), GetChapterFlagBitsSize() / 2);

    ret += SramChecksum32(GetTrap(0), (TRAP_MAX_COUNT * sizeof(struct Trap)) / 2);

    return ret;
}
