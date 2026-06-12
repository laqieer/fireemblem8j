#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "anime.h"
#include "bmunit.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ctc.h"
#include "constants/video-banim.h"

void StartBattleAnimStatusChgHitEffects(struct Anim * anim, int type)
{
    struct Anim * anim1;

    if (GetAnimPosition(anim) == EKR_POS_L)
        anim1 = gAnims[0];
    else
        anim1 = gAnims[2];

    switch (type) {
    case EKR_HITTED:
        NewEfxStatusCHG(anim1);
        break;
    
    case EKR_MISS:
        NewEfxAvoid(anim1);
        break;
    }
}
