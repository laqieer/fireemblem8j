#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "anime.h"
#include "ctc.h"
#include "ekrdragon.h"
#include "banim_data.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "banim_data.h"
#include "constants/classes.h"

void InitMainAnims(void)
{
    struct Anim * anim1, *anim2;

    switch (gEkrDistanceType) {
    case EKR_DISTANCE_CLOSE:
    case EKR_DISTANCE_MONOCOMBAT:
    case EKR_DISTANCE_PROMOTION:
        InitBattleAnimFrame(ANIM_ROUND_TAKING_HIT_CLOSE, ANIM_ROUND_TAKING_HIT_CLOSE);
        break;

    case EKR_DISTANCE_FAR:
        InitBattleAnimFrame(ANIM_ROUND_TAKING_HIT_FAR, ANIM_ROUND_TAKING_HIT_FAR);
        break;

    case EKR_DISTANCE_FARFAR:
        InitBattleAnimFrame(ANIM_ROUND_TAKING_HIT_FAR, ANIM_ROUND_TAKING_HIT_FAR);

        if (GetBanimInitPosReal() == EKR_POS_L) {
            anim1 = gAnims[2];
            anim1->xPosition = 0x180;

            anim2 = gAnims[3];
            anim2->xPosition = 0x180;
        } else {
            anim1 = gAnims[0];
            anim1->xPosition = 0x180;

            anim2 = gAnims[1];
            anim2->xPosition = 0x180;
        }
        break;

    default:
        break;
    }

    gEfxHpLutOff[0] = 0;
    gEfxHpLutOff[1] = 0;
}
