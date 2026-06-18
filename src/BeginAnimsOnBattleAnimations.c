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

void BeginAnimsOnBattleAnimations(void)
{
    int ret;

    if (GetBattleAnimArenaFlag() == true) {
        BeginAnimsOnBattle_Arena();
        return;
    }

    if (CheckBanimHensei() == true) {
        BeginAnimsOnBattle_Hensei();
        return;
    }

    NewEkrBattleDeamon();
    AnimClearAll();
    ret = GetBanimInitPosReal();
    gEkrInitPosReal = ret;
    NewEkrBattleStarting();

    gAnims[0] = NULL;
    gAnims[1] = NULL;
    gAnims[2] = NULL;
    gAnims[3] = NULL;

    gEkrbattle_0[0] = NULL;
    gEkrbattle_0[1] = NULL;

    SetMainUpdateRoutine(MainUpdate_0);
    SetPrimaryHBlankHandler(NULL);
}
