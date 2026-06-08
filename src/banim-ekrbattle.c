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



































































































/* EWRAM data */
EWRAM_DATA int gBanimLinkArenaFlag = 0;
EWRAM_DATA int gBattleDeamonActive = 0;
EWRAM_DATA struct ProcEkrBattleDeamon * gpProcEkrBattleDeamon = NULL;

void SetBanimLinkArenaFlag(int flag)
{
    gBanimLinkArenaFlag = flag;
}

int GetBanimLinkArenaFlag(void)
{
    return gBanimLinkArenaFlag;
}

void NewEkrBattleDeamon(void)
{
    gpProcEkrBattleDeamon = Proc_Start(gProc_ekrBattleDeamon, PROC_TREE_3);
    gBattleDeamonActive = true;
    LockGame();
}

void EndEkrBattleDeamon(void)
{
    Proc_End(gpProcEkrBattleDeamon);
}
