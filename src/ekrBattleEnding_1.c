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

void ekrBattleEnding_1(struct ProcEkrBattleEnding * proc)
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

    UnpackChapterMapGraphics(gPlaySt.chapterIndex);
    EfxChapterMapFadeOUT(0x10);
    RenderBmMap();
    BG_SetPosition(BG_3, 0, 0);
    Proc_Break(proc);
}
