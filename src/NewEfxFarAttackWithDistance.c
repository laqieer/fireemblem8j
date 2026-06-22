#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "ekrdragon.h"
#include "bmlib.h"
#include "hardware.h"
#include "ctc.h"

#include "efxbattle.h"

void NewEfxFarAttackWithDistance(struct Anim * anim, s16 arg)
{
    struct ProcEfxFarAttack * proc;
    u32 val;
    int a = arg;

    switch (gEkrDistanceType)
    {
        case EKR_DISTANCE_FAR:
        case EKR_DISTANCE_FARFAR:
            proc = Proc_Start(gProc_efxFarAttack, PROC_TREE_3);
            proc->pos = GetAnimPosition(anim);
            proc->timer = 0;

            if (a != -1)
            {
                proc->unk_2e = a >> 1;
                proc->terminator = a - (a >> 1);
            }
            else
            {
                if (gEkrDistanceType == EKR_DISTANCE_FAR)
                {
                    proc->unk_2e = 5;
                    proc->terminator = 5;
                }
                else
                {
                    proc->unk_2e = 7;
                    proc->terminator = 7;
                }
            }

            if (gEkrDistanceType == EKR_DISTANCE_FAR)
            {
                val = 0x20;
            }
            else
            {
                val = 0xf0;
            }

            if (proc->pos == POS_L)
            {
                proc->unk_32 = -val;
                proc->unk_34 = (-val >> 1);
                proc->unk_36 = (-val >> 1);
                proc->unk_38 = 0;
            }
            else
            {
                proc->unk_32 = 0;
                proc->unk_34 = (-val >> 1);
                proc->unk_36 = (-val >> 1);
                proc->unk_38 = -val;
            }

            gEkrBgPosition = proc->unk_32;
            gEfxFarAttackExist = 1;

            break;

        case EKR_DISTANCE_CLOSE:
        case EKR_DISTANCE_MONOCOMBAT:
        case EKR_DISTANCE_PROMOTION:
            break;
    }

    return;
}
