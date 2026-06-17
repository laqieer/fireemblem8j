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




void efxDead_Loop_A(struct ProcEfxDead *proc)
{
    int hp;

    if (GetBanimDragonStatusType() == EKRDRGON_TYPE_DRACO_ZOMBIE && GetAnimPosition(proc->anim1) == EKR_POS_L) {
        hp = GetEfxHp(gEfxHpLutOff[GetAnimPosition(proc->anim1)] * 2 + GetAnimPosition(proc->anim1));
    } else
        hp = 1;

    if (gEfxBgSemaphore == false && gEfxSpellAnimExists == false) {
        if (GetBanimDragonStatusType() == EKRDRGON_TYPE_DEMON_KING)
            SetEkrDragonDead(proc->anim1);
        else if (hp == 0)
            SetEkrDragonSkipTransfer(proc->anim1);
        else
            NewEfxDeadPika(proc->anim1, proc->anim2);

        proc->terminator = 0x32;
        Proc_Break(proc);
    }
}
