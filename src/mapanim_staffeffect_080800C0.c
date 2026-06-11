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



/* prototypes for same-file helpers called by this run */
void SetDefaultMapAnimScreenConf(void);

void MapAnimBerserkEffect(struct Unit * unit)
{
    struct MAEffectProc * proc;

    proc = Proc_Start(ProcScr_MapAnimBerserk, PROC_TREE_3);

    proc->unit = unit;
    proc->xDisplay = (SCREEN_TILE_X(unit->xPos) * 2 + 1) * 8;
    proc->yDisplay = (SCREEN_TILE_Y(unit->yPos) * 2 + 1) * 8;
}

void MapAnimBerserk_Loop(struct MAEffectProc * proc)
{
    PlaySeSpacial(SONG_87, proc->xDisplay);
    BG_SetPosition(BG_2, 0, 0);
    SetDefaultMapAnimScreenConf();
    Decompress(Img_MapAnimBerserkfx, ((void *) VRAM) + 0x10000 + CHR_SIZE * OBCHR_MANIM_1C0);
    ApplyPalette(Pal_MapAnimBerserkfx, 0x10 + OBJPAL_MANIM_4);
    APProc_Create(
        ApConf_MapAnimBerserkfx,
        proc->xDisplay,
        proc->yDisplay,
        OAM2_CHR(OBCHR_MANIM_1C0) + OAM2_PAL(OBJPAL_MANIM_4),
        0, 2);

    proc->unk48 = 1;
}

void MapAnimRepairEffect(struct Unit * unit)
{
    struct MAEffectProc * proc;

    proc = Proc_Start(ProcScr_MapAnimRepair, PROC_TREE_3);

    proc->xDisplay = SCREEN_TILE_X(unit->xPos) * 0x10 + 8;
    proc->yDisplay = SCREEN_TILE_Y(unit->yPos) * 0x10 + 8;
}
