#include "global.h"
#include "functions.h"
#include "variables.h"
#include "proc.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "mu.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "bmio.h"
#include "hardware.h"
#include "ap.h"
#include "bmmap.h"
#include "bmudisp.h"
#include "mapanim.h"
#include "bmlib.h"
#include "bmtrick.h"
#include "rng.h"
#include "constants/classes.h"
#include "constants/characters.h"
#include "constants/songs.h"




void MapAnim_GorgonHatch_Loop(struct MAEffectProc * proc)
{
    if (proc->timer == 0)
    {
        if (proc->frame == 0)
            PlaySeSpacial(SONG_3CA, proc->xDisplay);

        else if (proc->frame == 1)
            LoadGorgonFromEgg(proc);

        else if (proc->frame > 6)
        {
            Proc_Break(proc);
            return;
        }

        Decompress(
            TsaLut_GorgonHatchCloud[proc->frame],
            gGenericBuffer);

        AddAttr2dBitMap(
            gBG2TilemapBuffer,
            (void *)gGenericBuffer,
            proc->xDisplay / 8 - 8,
            proc->yDisplay / 8 - 7,
            TILEREF(0x140, BM_BGPAL_BANIM_UNK4));

        BG_EnableSyncByMask(BG2_SYNC_BIT);

        proc->frame++;
        proc->timer = 5;
    }

    proc->timer--;
}
