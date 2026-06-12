#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "bm.h"
#include "bmlib.h"
#include "bmio.h"
#include "mu.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"

void MainUpdate_0(void)
{
    UpdateKeyStatus(gKeyStatusPtr);
    ClearSprites();

    Proc_Run(gProcTreeRootArray[1]);

    if (GetGameLock() == 0)
        Proc_Run(gProcTreeRootArray[2]);
    
    Proc_Run(gProcTreeRootArray[3]);
    Proc_Run(gProcTreeRootArray[5]);

    PushSpriteLayerObjects(0);
    Proc_Run(gProcTreeRootArray[4]);

    AnimUpdateAll();
    BattleAIS_ExecCommands();

    PushSpriteLayerObjects(0xD);

    gBmSt.main_loop_ended = true;
    gBmSt.prevVCount = REG_VCOUNT;
    VBlankIntrWait();
}
