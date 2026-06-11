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



void MapAnim_Loop1_0(struct MAEffectProc * proc)
{
    if (proc->unk48 >= 12)
    {
        proc->unk48--;
        Proc_Break(proc);
    }

    PrepareProfileScanlineWindow(proc->xDisplay, proc->yDisplay, ++proc->unk48, 12, gMapanimStaffeffect_0);
}

void MapAnim_Loop2_0(struct MAEffectProc * proc)
{
    if (proc->unk48 <= 0)
    {
        proc->unk48++;
        Proc_Break(proc);
    }

    PrepareProfileScanlineWindow(proc->xDisplay, proc->yDisplay, --proc->unk48, 12, gMapanimStaffeffect_0);
}

void MapAnimCallSpellAssocSilencefx(struct Unit * unit)
{
    struct MAEffectProc * proc;

    proc = Proc_Start(ProcScr_MapAnimSilencefx, PROC_TREE_3);

    proc->xDisplay = (SCREEN_TILE_X(unit->xPos) * 2 + 1) * 8;
    proc->yDisplay = (SCREEN_TILE_Y(unit->yPos) * 2 + 1) * 8;
}
