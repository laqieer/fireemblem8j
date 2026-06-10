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

u32 GetExtraMapInfoSize(void)
{
    if (gExtraMapSaveHead.xmap_magic != XMAP_MAGIC)
        return 0;

    return gExtraMapSaveHead.info_size;
}
