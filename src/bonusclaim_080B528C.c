#include "global.h"

#include "ctc.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "uiutils.h"
#include "hardware.h"
#include "fontgrp.h"
#include "icon.h"
#include "bm.h"
#include "bmcontainer.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmitem.h"
#include "bmsave.h"
#include "prepscreen.h"
#include "helpbox.h"
#include "bmlib.h"
#include "sysutil.h"
#include "savemenu.h"
#include "bonusclaim.h"

#include "constants/characters.h"
#include "constants/items.h"
#include "constants/songs.h"




 // maybe lower

extern struct BonusClaimEnt * CONST_DATA gpBonusClaimData;
extern struct BonusClaimItemEnt * CONST_DATA gpBonusClaimItemList;
extern int* CONST_DATA gpBonusClaimItemCount;
extern struct BonusClaimConfig * CONST_DATA gpBonusClaimConfig;

int LoadBonusContentData(void*);

//! FE8U = 0x080B0674
void BonusClaim_DrawChapterTitle(void)
{
    u32 flags = (-(gPlaySt.chapterStateBits & 0x40) >> 0x1f) & 4;

    if (gPlaySt.config.controller == 0)
    {
        if (gPlaySt.chapterModeIndex == CHAPTER_MODE_COMMON)
            flags |= 0x10;

        if (gPlaySt.chapterModeIndex == CHAPTER_MODE_EIRIKA)
            flags |= 0x20;

        if (gPlaySt.chapterModeIndex == CHAPTER_MODE_EPHRAIM)
            flags |= 0x40;
    }
    else
    {
        if (gPlaySt.chapterModeIndex == CHAPTER_MODE_EPHRAIM)
            flags |= 0x40;
        else
            flags |= 0x20;
    }

    ApplyChapterTitlePal(flags | 1, 0x18);
    ApplyChapterTitlePal(flags, 0x19);

    EnablePaletteSync();

    PutChapterTitleBG(0xac0);
    PutChapterTitleGfx(0xb40, GetChapterTitleExtra(&gPlaySt));

    return;
}
