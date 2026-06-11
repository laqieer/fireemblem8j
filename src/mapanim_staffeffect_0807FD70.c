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



void MapSpellAnim_CommonEnd(ProcPtr proc)
{
    DeleteAllPaletteAnimator();

    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);

    SetDefaultColorEffects();
    SetWinEnable(0, 0, 0);
}

void MapSpellAnim_EndWithHBlank(ProcPtr proc)
{
    SetPrimaryHBlankHandler(NULL);

    DeleteAllPaletteAnimator();

    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);

    SetDefaultColorEffects();
    SetWinEnable(0, 0, 0);
}

void StartWarpFlashy(struct Unit * unit, int arg_04, int arg_08)
{
    struct MAEffectProc * proc;

    proc = Proc_Start(ProcScr_MapAnimWarpFlashy, PROC_TREE_3);

    proc->unit = unit;
    proc->xDisplay = SCREEN_TILE_X(unit->xPos) * 2;
    proc->yDisplay = SCREEN_TILE_Y(unit->yPos) * 2;
}
