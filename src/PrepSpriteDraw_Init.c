#include "global.h"
#include "ap.h"
#include "bm.h"
#include "bmbattle.h"
#include "bmcontainer.h"
#include "bmudisp.h"
#include "bmunit.h"
#include "bmusemind.h"
#include "cgtext.h"
#include "chapterdata.h"
#include "classchg.h"
#include "ctc.h"
#include "fontgrp.h"
#include "hardware.h"
#include "prepscreen.h"
#include "soundwrapper.h"
#include "statscreen.h"
#include "sysutil.h"
#include "uiutils.h"
#include "worldmap.h"
#include "constants/chapters.h"
#include "constants/songs.h"



bool CheckInLinkArena(void);

void PrepSpriteDraw_Init(struct PrepSpriteDrawProc * proc)
{
    u32 chIndex;

    proc->unk2A = 0;
    proc->timer = 0;

    ForceSyncUnitSpriteSheet();

    if (CheckInLinkArena())
    {
        proc->apProc =
            APProc_Create(AP_DrawPreparationsBanner, 60, 16, OAM2_CHR(0x240) + OAM2_LAYER(3) + OAM2_PAL(9), 1, 13);
    }
    else
    {
        proc->apProc =
            APProc_Create(AP_DrawPreparationsBanner, 60, 16, OAM2_CHR(0x240) + OAM2_LAYER(3) + OAM2_PAL(9), 0, 13);

        chIndex = gPlaySt.chapterIndex;
        if ((chIndex - CHAPTER_T_01) < 10)
            proc->kind = PREP_KIND_TOWER;
        else if ((chIndex - CHAPTER_R_01) < 10)
            proc->kind = PREP_KIND_RUINS;
        else if (IsChapterMonsterSpawnActive(chIndex))
            proc->kind = PREP_KIND_SKIRMISH;
        else if (chIndex == CHAPTER_E_21 || chIndex == CHAPTER_E_21X || chIndex == CHAPTER_I_21 || chIndex == CHAPTER_I_21X)
            proc->kind = PREP_KIND_FINAL_MAP;
        else
            proc->kind = PREP_KIND_STANDARD;

        proc->prepChapterNum = GetROMChapterStruct(chIndex)->prepScreenNumber;
    }

    proc->unk2B = 0;
    proc->buttonStartSolid = true;
    proc->buttonBSolid = true;
}
