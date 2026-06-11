#include "global.h"
#include "anime.h"
#include "bm.h"
#include "hardware.h"
#include "ctc.h"
#include "event.h"
#include "proc.h"
#include "bmbattle.h"
#include "bmarena.h"
#include "ekrlevelup.h"
#include "ekrclasschg.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrpopup.h"
#include "ekrdragon.h"
#include "ekrtriangle.h"
#include "eventinfo.h"
#include "constants/songs.h"

void Nop_BanimEkrbattle_0(void)
{
    return;
}

void NewEkrBattle(void)
{
    AnimClearAll();
    gpProcEkrBattle = Proc_Start(gProc_ekrBattle, PROC_TREE_3);
    SetMainUpdateRoutine(InBattleMainRoutine);
    EkrEfxStatusClear();

    gEkrBattleEndFlag = 0;
    gEkrDebugTimer = 0;
    gEkrDebugUnk1 = 0;
    gEkrDebugUnk2 = 0;
    gCtrlC01Blocking = 0;

    if (0 == gEkrDebugModeMaybe)
        EkrPlayMainBGM();
}

void InBattleMainRoutine(void)
{
    UpdateKeyStatus(gKeyStatusPtr);
    
    if (gEkrDebugUnk1 == 0)
        MainUpdateEkrBattle();
    else if (gEkrDebugUnk2 == 1)
        MainUpdateEkrBattle();

    switch (gEkrBattleEndFlag) {
    case 0:
        break;

    case 1:
        if (0 == gEkrDebugModeMaybe) {
            Proc_End(gpProcEkrBattle);
            EkrMainEndExec();
        }
        break;

    case 2:
        if (0 == gEkrDebugModeMaybe) {
            Proc_End(gpProcEkrBattle);
            EkrMainEndExec();
        } else {
            Proc_End(gpProcEkrBattle);
            EndEkrGauge();
        }
        break;

    default:
        break;
    }

    gBmSt.main_loop_ended = true;
    gBmSt.prevVCount = REG_VCOUNT;
    VBlankIntrWait();
}

void MainUpdateEkrBattle(void)
{
    ClearSprites();
    UnregisterEfxSoundSeExist();

    if (GetGameLock() == 0)
        Proc_Run(gProcTreeRootArray[2]);
    
    Proc_Run(gProcTreeRootArray[3]);
    Proc_Run(gProcTreeRootArray[5]);

    PushSpriteLayerObjects(0);

    Proc_Run(gProcTreeRootArray[1]);

    AnimUpdateAll();
    BattleAIS_ExecCommands();

    Proc_Run(gProcTreeRootArray[4]);

    gEkrDebugUnk2 = 0;

    if ((gBanimDoneFlag[0] + gBanimDoneFlag[1]) != 2)
        gEkrDebugTimer++;

    PushSpriteLayerObjects(0xD);
}
