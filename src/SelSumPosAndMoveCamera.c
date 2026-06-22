#include "global.h"
#include "functions.h"
#include "variables.h"
#include "hardware.h"
#include "bm.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmitem.h"
#include "bmmap.h"
#include "proc.h"
#include "soundwrapper.h"
#include "rng.h"
#include "bmmind.h"
#include "constants/classes.h"
#include "constants/characters.h"
#include "constants/items.h"
#include "mapanim.h"
#include "constants/songs.h"

s8 CheckCanSummon(struct SumProc* proc);
s8 SelectSummonPos(int x, int y, struct SumThing* result);

//! FE8U = 0x0807D544
void SelSumPosAndMoveCamera(struct SumProc* proc, s8 x, s8 y, short arg3)
{
    struct SumThing thing;
    int ix = x;
    int iy = y;
    int iarg3 = arg3;
    if (CheckCanSummon(proc))
        return;

    if (SelectSummonPos(ix, iy, &thing) == -1 || thing.boolAvailable == -1) {
        proc->monsters++;
        Proc_Goto(proc, iarg3);
    } else {
        proc->x = thing.x;
        proc->y = thing.y;

        EnsureCameraOntoPosition(proc, proc->x, proc->y);
    }
}
