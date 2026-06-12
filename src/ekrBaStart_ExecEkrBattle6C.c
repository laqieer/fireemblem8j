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

void ekrBaStart_ExecEkrBattle6C(struct ProcEkrBattleStarting *proc)
{
    if (++proc->timer > 0xB) {
        if (gBanimBG == 0 || GetBanimDragonStatusType() != EKRDRGON_TYPE_NORMAL) {

            /* In normal battle, here will directly end the proc */
            NewEkrBattle();
            Proc_End(proc);
        } else {
            proc->timer = 0;
            NewEkrBattle();
            Proc_Break(proc);
        }
    }
}
