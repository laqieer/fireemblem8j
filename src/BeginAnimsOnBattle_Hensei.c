#include "global.h"
#include "bmbattle.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "hardware.h"
#include "proc.h"
#include "uiutils.h"
#include "bmlib.h"
#include "bm.h"


void BeginAnimsOnBattle_Hensei(void)
{
    int pos;
    NewEkrBattleDeamon();
    AnimClearAll();
    pos = GetBanimInitPosReal();
    gEkrInitPosReal = pos;
    NewEkrHenseiInitPROC();
    SetPrimaryHBlankHandler(NULL);
}
