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

void efxDeadEvent_Loop_A(struct ProcEfxDead *proc)
{
    struct Anim *ais_core1 = GetAnimAnotherSide(proc->anim1);
    int ret = false;

    if (gEfxBgSemaphore == 0 && gEfxSpellAnimExists == 0) {
        if (gBanimDoneFlag[GetAnimPosition(ais_core1)] == true)
            ret = true;
    }

    if (ret != true)
        return;

    proc->timer = 7;

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE && GetAnimPosition(proc->anim1) != gEkrInitPosReal) {
        NewEfxFarAttackWithDistance(ais_core1, -1);
        proc->timer = 0;
    }

    Proc_Break(proc);
}
