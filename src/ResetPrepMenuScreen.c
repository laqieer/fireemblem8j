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

void ResetPrepMenuScreen(void)
{
    struct ProcPrepMenu * proc = Proc_Find(ProcScr_PrepMenu);

    if (proc != NULL)
    {
        TileMap_FillRect(TILEMAP_LOCATED(gBG0TilemapBuffer, proc->xPos, proc->yPos), 9, proc->max_index * 2 + 2, 0);

        TileMap_FillRect(TILEMAP_LOCATED(gBG1TilemapBuffer, proc->xPos, proc->yPos), 9, proc->max_index * 2 + 2, 0);

        BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);
    }
}
