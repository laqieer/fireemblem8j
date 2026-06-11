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



void MapAnimMonsterStone_Resetfx(struct MAEffectProc * proc)
{
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);
}

void StartMapAnimEffect_Unk_0(struct Unit * unit)
{
    struct MAEffectProc * proc;

    proc = Proc_Start(ProcScr_MapAnimEffect_Unk_0, PROC_TREE_3);

    proc->xDisplay = (SCREEN_TILE_X(unit->xPos) * 2 + 1) * 8;
    proc->yDisplay = (SCREEN_TILE_Y(unit->yPos)) * 16 + 18;
}
