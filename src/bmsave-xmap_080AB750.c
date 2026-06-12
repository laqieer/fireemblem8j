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

void NullBmMapHidden_(void)
{
    GetGlobalCompletionCount();
    gBmMapHidden = NULL;
}
