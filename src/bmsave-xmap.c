#include "global.h"
#include "agb_sram.h"
#include "fontgrp.h"
#include "bmsave.h"
#include "sram-layout.h"
#include "hardware.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "chapterdata.h"
#include "bmmap.h"
#include "bmlib.h"





CONST_DATA struct ExtraMapInfo *gExtraMapInfo = (void *) EWRAM_START + 0x40000 - EWRAM_XMAP_SIZE;

/* prototypes for same-file helpers called by this run */
bool ReadExtraMapSaveHead(void);
void const *GetExtraMapInfoReadAddr(void);
u32 GetExtraMapInfoSize(void);

u16 ExtraMapChecksum(void const *data, int size)
{
    u16 const * data_u16 = data;
    int i, result = 0;

    for (i = 0; i < size / 2; i++)
        result += *data_u16++;

    return result;
}

bool IsExtraMapAvailable(void)
{
    struct ExtraMapSaveHead *buf = (struct ExtraMapSaveHead *)gGenericBuffer;

    if (!IsSramWorking())
        return FALSE;

    ReadSramFast(CART_SRAM + SRAM_OFFSET_XMAP, buf, SRAM_SIZE_XMAP);

    if (buf->xmap_magic != XMAP_MAGIC)
        return FALSE;

    if (buf->save_magic32 != SAVEMAGIC32_XMAP + (GetLang() << 24))
        return FALSE;

    if (buf->xmap_size == 0)
        return FALSE;

    if (buf->xmap_checksum != ExtraMapChecksum(&buf->save_magic32, buf->xmap_size))
        return FALSE;

    return TRUE;
}

void ReadExtraMapInfo(void)
{
    ReadExtraMapSaveHead();

    ReadSramFast(GetExtraMapInfoReadAddr(), gGenericBuffer, GetExtraMapInfoSize());
    Decompress(gGenericBuffer, gExtraMapInfo);

    gExtraMapInfo->play_st = &gPlaySt;
    gExtraMapInfo->bm_st = &gBmSt;
    gExtraMapInfo->active_unit = &gActiveUnit;
    gExtraMapInfo->unit_lut = gUnitLookup;
    gExtraMapInfo->bu_a = &gBattleActor;
    gExtraMapInfo->bu_b = &gBattleTarget;
    gExtraMapInfo->battle_hits = gBattleHitArray;
    gExtraMapInfo->traps = GetTrap(0);
    gExtraMapInfo->permanent_flags = GetPermanentFlagBits();
    gExtraMapInfo->chapter_frags = GetChapterFlagBits();
}

bool GetExtraMapEmptyString(u8 *buf)
{
    *buf = 0;
    return true;
}
