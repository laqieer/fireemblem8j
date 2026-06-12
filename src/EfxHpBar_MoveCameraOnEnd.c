#include "global.h"
#include "hardware.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "anime.h"
#include "ekrlevelup.h"
#include "bmitem.h"
#include "proc.h"
#include "banim_data.h"
#include "ekrdragon.h"
#include "eventinfo.h"
#include "constants/items.h"
#include "constants/songs.h"

void EfxHpBar_MoveCameraOnEnd(struct ProcEfxHpBar * proc)
{
    struct Anim * anim;

    if (gEfxBgSemaphore == 0 && gEfxSpellAnimExists == 0)
    {
        proc->timer = 0;
        proc->cur = 1;
        anim = GetAnimAnotherSide(proc->anim_this);

        if (CheckRound2(GetAnimNextRoundType(anim)) == 1)
        {
            switch (gEkrDistanceType) {
            case EKR_DISTANCE_CLOSE:
            case EKR_DISTANCE_FAR:
            case EKR_DISTANCE_MONOCOMBAT:
            case EKR_DISTANCE_PROMOTION:
                proc->cur = 16;
                NewEfxFarAttackWithDistance(GetAnimAnotherSide(anim), -1);
                break;

            case EKR_DISTANCE_FARFAR:
                proc->cur = 20;
                NewEfxFarAttackWithDistance(GetAnimAnotherSide(anim), -1);
                break;
            }
        }

        Proc_Break(proc);
    }
}
