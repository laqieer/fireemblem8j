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

void const *GetExtraMapInfoReadAddr(void)
{
    if (gExtraMapSaveHead.xmap_magic != XMAP_MAGIC)
        return NULL;

    return gExtraMapSaveHead.info_sram;
}
