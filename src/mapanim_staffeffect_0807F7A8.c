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



void MapLatonaShiningfx_Loop3(struct MAAnotherProc * proc)
{
    if (proc->terminator == 0)
    {
        Proc_Break(proc);
        return;
    }

    SetBlendConfig(1,
        Interpolate(0, 8, 0, proc->timer2++, proc->terminator), 0x10, 0);

    if (proc->timer2 >= proc->terminator)
    {
        proc->timer2 = 0;
        BG_Fill(gBG2TilemapBuffer, 0);
        BG_EnableSyncByMask(BG2_SYNC_BIT);
        Proc_Break(proc);
    }
}

void MapAnimCallSpellAssocNightMarefx(struct Unit * unit)
{
    struct MAEffectProc * proc = Proc_Start(ProcScr_NightMarefx, PROC_TREE_3);

    proc->unit = unit;

    proc->xDisplay = 8 * (1 + 2 * (unit->xPos - (gBmSt.camera.x>>4)));
    proc->yDisplay = 8 * (1 + 2 * (unit->yPos - (gBmSt.camera.y>>4)));
}
