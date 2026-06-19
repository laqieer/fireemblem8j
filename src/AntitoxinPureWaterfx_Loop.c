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

void AntitoxinPureWaterfx_Loop(struct MAEffectProc * proc)
{
    static u8 CONST_DATA lut[] =
    {
         0,  1,  2,  3,
         4,  5,  6,  7,
         8,  9, 10, 11,
        12, 13, 14, 15,
        16, 17, 18, 19,

        UINT8_MAX, // end
    };

    PutTmAnimFrame(
        gBG2TilemapBuffer,
        proc->xDisplay / 8 - 3,
        proc->yDisplay / 8 - 3,
        TILEREF(0x140, BGPAL_MANIM_4),
        6, 6,
        gMapanimBattleinfo_1,
        lut[proc->frame / 2]);

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    proc->frame++;

    if (lut[proc->frame / 2] == UINT8_MAX)
    {
        Proc_Break(proc);
    }
}
