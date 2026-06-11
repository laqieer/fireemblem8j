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



void StartMapAnimEffect_Unk_2(struct Unit * unit)
{
    struct MAEffectProc * proc;

    proc = Proc_Start(ProcScr_MapanimStaffeffect_0, PROC_TREE_3);

    proc->xDisplay = SCREEN_TILE_X(unit->xPos) * 16 + 8;
    proc->yDisplay = SCREEN_TILE_Y(unit->yPos) * 16 + 8;
}

void MapAnimEffect_Unk_2_PlaySe(struct MAEffectProc * proc)
{
    PlaySeSpacial(SONG_10F, proc->xDisplay);
}

void NewMapAnimEffectAnimator(struct Unit * unit, void const * img, void const * pal, u16 song)
{
    struct ProcMapAnimator * proc;

    proc = Proc_Start(ProcScr_MapAnimEffectAnimator, PROC_TREE_3);

    proc->unit = unit;
    proc->img = img;
    proc->pal = pal;
    proc->song = song;
}
