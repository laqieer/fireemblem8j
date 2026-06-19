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




void NightMarefx_Loop(struct MAEffectProc * proc)
{
    if (proc->timer == 0)
    {
        if (proc->frame == 0)
            PlaySeSpacial(SONG_384, proc->xDisplay);
        else if (proc->frame > 0x21)
        {
            Proc_Break(proc);
            return;
        }

        if (NigtMarefxConf[proc->frame].tsa_idx < 0)
        {
            BG_Fill(gBG2TilemapBuffer, 0);
            BG_EnableSyncByMask(BG2_SYNC_BIT);
        }
        else
        {
            Decompress(TsaSet_NightMareMapAnimfx[NigtMarefxConf[proc->frame].tsa_idx], gGenericBuffer);

            AddAttr2dBitMap(
                gBG2TilemapBuffer,
                (void *)gGenericBuffer,
                proc->xDisplay / 8 - 9,
                proc->yDisplay / 8 - 9,
                TILEREF(0x140, BM_BGPAL_BANIM_UNK4));

            BG_EnableSyncByMask(BG2_SYNC_BIT);
        }
        SetBlendConfig(1, NigtMarefxConf[proc->frame].blend, 0x10, 0);

        proc->timer = NigtMarefxConf[proc->frame].duration;
        proc->frame++;
    }
    proc->timer--;
}
