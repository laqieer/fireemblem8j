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

void ekrBattleEnding_2(struct ProcEkrBattleEnding * proc)
{
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

    EfxChapterMapFadeOUT(Interpolate(INTERPOLATE_LINEAR, 0x10, 0x4, proc->timer, 0x8));

    if (++proc->timer == 0x9) {
        proc->timer = 0;
        Proc_Break(proc);
    }
}
