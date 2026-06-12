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

extern EWRAM_DATA struct ExtraMapSaveHead gExtraMapSaveHead;

extern CONST_DATA u8 *gpSramExtraData;
extern CONST_DATA struct ExtraMapInfo *gExtraMapInfo;

bool ReadExtraMapSaveHead(void)
{
    ReadSramFast(gpSramExtraData, &gExtraMapSaveHead, sizeof(struct ExtraMapSaveHead));

    if (gExtraMapSaveHead.xmap_magic != XMAP_MAGIC)
        return FALSE;

    if (gExtraMapSaveHead.save_magic32 != SAVEMAGIC32_XMAP + (GetLang() << 24))
        return FALSE;

    gExtraMapSaveHead.map_sram += (ptrdiff_t)gpSramExtraData;
    gExtraMapSaveHead.info_sram += (ptrdiff_t)gpSramExtraData;
    gPlaySt.unk_2C_0D = gExtraMapSaveHead.unk0F;

    return TRUE;
}
