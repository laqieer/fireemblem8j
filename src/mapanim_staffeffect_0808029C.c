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



void MapAnimRepair_Loop2(struct MAEffectProc * proc)
{
    u8 blend_coef_list[] =
    {
        16, 14, 12, 10, 8, 10, 12, 14, 16,
        16, 14, 12, 10, 8, 10, 12, 14, 16,
        UINT8_MAX, // end
    };

    SetBlendAlpha(blend_coef_list[proc->frame_idx++], 0x10);

    if (blend_coef_list[proc->frame_idx] == UINT8_MAX)
    {
        proc->frame_idx = 0;
        Proc_Break(proc);
    }
}

void MapAnimRepair_Loop3(struct MAEffectProc * proc)
{
    enum { DURATION = 30 };

    SetBlendAlpha(
        Interpolate(INTERPOLATE_LINEAR, 0x10, 0, proc->frame_idx++, DURATION), 0x10);

    if (proc->frame_idx > DURATION)
    {
        Proc_Break(proc);
    }
}

void MapAnimRestoreEffect(struct Unit * unit)
{
    struct MAEffectProc * proc;

    proc = Proc_Start(ProcScr_MapAnimRestore, PROC_TREE_3);

    proc->xDisplay = (SCREEN_TILE_X(unit->xPos) * 2 + 1) * 8;
    proc->yDisplay = (SCREEN_TILE_Y(unit->yPos) * 2 + 1) * 8;
}

void MapAnimRestore_Init(struct MAEffectProc * proc)
{
    PlaySeSpacial(SONG_82, proc->xDisplay);
    ApplyPalette(Pal_MapAnimRestore, BGPAL_MANIM_4);
}
