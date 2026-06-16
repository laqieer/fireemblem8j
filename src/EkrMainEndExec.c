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

void NewEkrbattleending(void);
void EkrMainEndExec(void)
{
    if (GetBattleAnimArenaFlag() == true) {
        ExecBattleAnimArenaExit();
        return;
    }

    if (CheckBanimHensei() == true) {
        ExecEkrHenseiEnd();
        return;
    }

    NewEkrbattleending();
    SetMainUpdateRoutine(MainUpdate_0);
}
