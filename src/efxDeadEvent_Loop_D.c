#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "event.h"
#include "bmlib.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"
#include "eventinfo.h"
#include "constants/songs.h"



void efxDeadEvent_Loop_D(struct ProcEfxDead *proc)
{
    if (BattleEventEngineExists() == false) {
        PlayDeathSoundForArena();
        NewEfxDead(proc->anim1, proc->anim2);
        EfxPrepareScreenFx();
        gBanimValid[GetAnimPosition(proc->anim1)] = false;
        BG_EnableSyncByMask(BG0_SYNC_BIT);
        NewEkrWindowAppear(0, 7);
        NewEkrNamewinAppear(0, 7, 0);

        DisableEkrGauge();
        UnAsyncEkrDispUP();
        EkrGauge_Clr4C50();
        Proc_Break(proc);
    }
}
