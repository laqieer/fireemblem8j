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

s8 CheckInLinkArena(void);

void PrepSpriteDraw_Loop(struct PrepSpriteDrawProc * proc)
{
    DrawPrepScreenSprites(proc);
    proc->timer++;
}

void PrepSpriteDraw_OnEnd(struct PrepSpriteDrawProc * proc)
{
    APProc_Delete(proc->apProc);
}

void PrepSpriteDraw_BlinkButtonStart(void)
{
    struct PrepSpriteDrawProc * proc = Proc_Find(ProcScr_PrepScreenSpriteDraw);

    if (proc != NULL)
        proc->buttonStartSolid = false;
}

void PrepSpriteDraw_BlinkButtonB(void)
{
    struct PrepSpriteDrawProc * proc = Proc_Find(ProcScr_PrepScreenSpriteDraw);

    if (proc != NULL)
        proc->buttonBSolid = false;
}

ProcPtr StartPrepScreenSpriteDraw(ProcPtr parent)
{
    Proc_End(Proc_Find(ProcScr_PrepScreenSpriteDraw));
    return Proc_Start(ProcScr_PrepScreenSpriteDraw, parent);
}

void EndPrepScreenSpriteDraw(void)
{
    Proc_End(Proc_Find(ProcScr_PrepScreenSpriteDraw));
}

void PrepDebugDrawWindowPosition(int a1, int a2)
{
    int val1, val2, val4, r5, r6, _r8;
    int r7;
    int r8;
    int val3;

    val1 = a1 - 56;
    if (val1 < 0)
    {
        r7 = 0;
        r6 = a1;
    }
    else
    {
        val2 = a1 + 56;
        if (val2 > 240)
        {
            r7 = 0xF;
            r6 = a1 - 120;
        }
        else
        {
            r7 = val1 >> 3;
            r6 = a1 - ((val1 >> 3) << 3);
        }
    }

    val3 = a2 - 40;
    if (a2 + 48 > 160)
    {
        r5 = 8;
        _r8 = a2 - 0x40;
    }
    else
    {
        val4 = val3;
        if (val4 < 0)
            val4 = a2 - 0x21;

        r5 = val4 >> 3;
        _r8 = a2 - 8 * (val4 >> 3);
    }
    r8 = _r8;

    PutNumberOrBlank(TILEMAP_LOCATED(gBG0TilemapBuffer, 4, 0), TEXT_COLOR_SYSTEM_BLUE, r7);
    PutNumberOrBlank(TILEMAP_LOCATED(gBG0TilemapBuffer, 4, 2), TEXT_COLOR_SYSTEM_BLUE, r5);
    PutNumberOrBlank(TILEMAP_LOCATED(gBG0TilemapBuffer, 4, 4), TEXT_COLOR_SYSTEM_BLUE, r6);
    PutNumberOrBlank(TILEMAP_LOCATED(gBG0TilemapBuffer, 4, 6), TEXT_COLOR_SYSTEM_BLUE, r8);

    BG_EnableSyncByMask(BG0_SYNC_BIT);
}
