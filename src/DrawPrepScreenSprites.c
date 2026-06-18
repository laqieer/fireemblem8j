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

s8 CheckInLinkArena(void);

void DrawPrepScreenSprites(struct PrepSpriteDrawProc * proc)
{
    int i;

    int xOam1 = 160;
    int yOam0 = 8;

    if (!CheckInLinkArena())
    {
        switch (proc->kind)
        {
        case PREP_KIND_STANDARD:
            PutPrepChapterSprite_Default(xOam1, yOam0, proc->prepChapterNum, OAM2_CHR(0x380) + OAM2_PAL(6));
            break;

        case PREP_KIND_TOWER:
            PutPrepChapterSprite_Tower(xOam1, yOam0, proc->prepChapterNum, OAM2_CHR(0x380) + OAM2_PAL(6));
            break;

        case PREP_KIND_RUINS:
            PutPrepChapterSprite_Ruins(xOam1, yOam0, proc->prepChapterNum, OAM2_CHR(0x380) + OAM2_PAL(6));
            break;

        case PREP_KIND_SKIRMISH:
            PutPrepChapterSprite_Skirmish(xOam1, yOam0, OAM2_CHR(0x380) + OAM2_PAL(6));
            break;

        case PREP_KIND_FINAL_MAP:
        default:
            break;
        }

        for (i = 0; i < 3; i++)
            PutSpriteExt(4, 128 + i * 32, 24, gObject_32x16, OAM2_CHR(0x2C0) + OAM2_LAYER(1) + OAM2_PAL(11) + 4 * i);

        if (proc->buttonStartSolid || (1 & (proc->timer >> 2)))
            PutSpriteExt(4, 20, 140, Sprite_PrepStartButton, OAM2_CHR(0x300));

        if (proc->buttonBSolid || (1 & (proc->timer >> 2)))
            PutSpriteExt(4, 100, 140, Sprite_PrepBButton, OAM2_CHR(0x300));

        PutPrepInformationSprite(116, 40, OAM2_CHR(0x380) + OAM2_PAL(9));
    }
    else
    {
        if (Prep_HasUnitDeployed())
            PutSpriteExt(4, 20, 140, obj_PrepUnitselect_1, OAM2_CHR(0x300));

        PutPrepInformationSprite(116, 32, OAM2_CHR(0x380) + OAM2_PAL(9));
    }
}
