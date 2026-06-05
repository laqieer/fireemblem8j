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



void MapLatonaBlinkingfx_Init(struct MAEffectProc * proc)
{
    DeleteAllPaletteAnimator();

    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);

    SetBlendTargetA(1, 1, 1, 1, 1);
    SetBlendBackdropA(1);

    proc->unk64 = 0x40;

    MapLatonaBlinkingfx_Main(proc);
}

void MapLatonaBlinkingfx_Main(struct MAEffectProc * proc)
{
    SetBlendConfig(2, 0, 0, (proc->unk64--) >> 2);

    if (proc->unk64 == 0)
    {
        SetDefaultColorEffects();
        Proc_Break(proc);
    }
}

void NewMapLatonaShiningfx(int x, int y, int c, int duration, int e, ProcPtr parent)
{
    struct MAAnotherProc * proc =
        Proc_StartBlocking(ProcScr_MapLatonaShiningfx, parent);

    proc->x = x;
    proc->y = y;
    proc->unk54 = c;
    proc->terminator = e;
    proc->timer = duration;
}

void MapLatonaShiningfx_End(void)
{
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);
}

void MapLatonaShiningfx_Init(void)
{
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);
}
