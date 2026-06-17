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




void MapLatonafx_InitGfx(struct MAEffectProc * proc)
{
    if (proc->timer > 2)
    {
        DeleteAllPaletteAnimator();
        StartPaletteAnimatorNormal(Pal_MapAnimBerserkfx_1, 0x80, 0x20, 4, proc);

        if (GetItemIndex(gManimSt.actor[0].bu->weaponBefore) == ITEM_STAFF_LATONA)
            StartPaletteAnimatorNormal(Pal_MapAnimBerserkfx_2, 0x80, 0x20, 4, (struct Proc*) proc);
        else
            StartPaletteAnimatorNormal(Pal_MapAnimBerserkfx_1, 0x80, 0x20, 4, (struct Proc*) proc);

        Decompress(
            gMapanimBattleinfo_5,
            (void*)(VRAM) + GetBackgroundTileDataOffset(2) + (0x140) /* JP:0x140 not 0x160 */ * 0x20);

        NewMapLatonaShiningfx(
            proc->xDisplay/8 - 4,
            proc->yDisplay/8 - 4,
            8, 60, 0, proc);

        Proc_Break(proc);

        PlaySeSpacial(SONG_8C, proc->xDisplay); // TODO: song ids
    }
    else
    {
        int xOff = MapLatonafxLocation[proc->timer * 2 + 0];
        int yOff = MapLatonafxLocation[proc->timer * 2 + 1];

        NewMapLatonaShiningfx(
            proc->xDisplay/8 + xOff - 3,
            proc->yDisplay/8 + yOff - 3,
            6, 10, 8, proc);

        PlaySeSpacial(SONG_89, proc->xDisplay); // TODO: song ids

        proc->timer++;
    }
}
