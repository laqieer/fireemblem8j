#include "global.h"
#include "bmlib.h"
#include "mu.h"
#include "bmbattle.h"
#include "bmudisp.h"
#include "bm.h"

extern struct ProcCmd sProc_DelayedBMapDispResume[];

void BMapDispResume_FromBattleDelayed(void) {
    LoadObjUIGfx();
    StartMu(&gBattleActor.unit);
    SetAutoMuDefaultFacing();
    Proc_Start(sProc_DelayedBMapDispResume, PROC_TREE_3);
}
