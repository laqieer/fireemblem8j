#include "global.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"
#include "bmlib.h"
#include "hardware.h"
#include "proc.h"
#include "bmmap.h"
#include "bm.h"
#include "bmudisp.h"
#include "bmio.h"
#include "sio.h"

void ekrBattleEnding_0(struct ProcEkrBattleEnding * proc)
{
    int ret;

    if (gBanimBG == 0) {
        Proc_Break(proc);
        return;
    }

    switch (GetBanimDragonStatusType()) {
    case EKRDRGON_TYPE_DRACO_ZOMBIE:
    case EKRDRGON_TYPE_DEMON_KING:
        Proc_Break(proc);
        return;
    
    case EKRDRGON_TYPE_MYRRH:
        break;
    }

    ret = Interpolate(INTERPOLATE_LINEAR, 0, 0x10, proc->timer, 0x8);
    PutBanimBgPAL(gBanimBG - 1);
    EfxPalBlackInOut(gPaletteBuffer, 0x6, 0xA, ret);
    EnablePaletteSync();

    if (++proc->timer == 0x9) {
        proc->timer = 0;
        Proc_Break(proc);
    }
}
