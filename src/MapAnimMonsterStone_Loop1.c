#include "global.h"
#include "proc.h"
#include "bmlib.h"
#include "bmio.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "mapanim.h"
#include "hardware.h"
#include "bmlib.h"
#include "bmitem.h"
#include "bmmind.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "ap.h"
#include "eventinfo.h"
#include "efxbattle.h"
#include "constants/items.h"
#include "constants/video-global.h"
#include "constants/songs.h"




void MapAnimMonsterStone_Loop1(struct MAEffectProc * proc)
{
    if (proc->timer == 0)
    {
        if (proc->frame == 0)
            PlaySeSpacial(SONG_3BA, proc->xDisplay);
        else if (proc->frame > 9)
        {
            Proc_Break(proc);
        }

        Decompress(TsaSet_MonsterStoneMapAnimfx[proc->frame], gGenericBuffer);

        AddAttr2dBitMap(
            gBG2TilemapBuffer,
            (void *)gGenericBuffer,
            proc->xDisplay / 8 - 4,
            proc->yDisplay / 8 - 4,
            TILEREF(0x140, BM_BGPAL_BANIM_UNK4));

        BG_EnableSyncByMask(BG2_SYNC_BIT);

        proc->frame++;
        proc->timer = 4;
    }
    proc->timer--;
}
