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



void MapAnimUnlockEffect(int x, int y)
{
    struct MAEffectProc * proc;

    proc = Proc_Start(ProcScr_MapAnimUnlock, PROC_TREE_3);

    proc->xDisplay = SCREEN_TILE_X(x) * 2 * 8 + 8;
    proc->yDisplay = SCREEN_TILE_Y(y) * 2 * 8 + 8;
}

void HideUnitUnlockDoor(void)
{
    GetUnit(gActionData.subjectIndex)->state |= US_HIDDEN;
    StartAvailableDoorTileEvent(gActionData.xOther, gActionData.yOther);
}

void UnhideUnit(void)
{
    GetUnit(gActionData.subjectIndex)->state &= ~US_HIDDEN;
}
