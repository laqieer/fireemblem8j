#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "anime.h"
#include "bmunit.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ctc.h"
#include "constants/video-banim.h"




void StartBattleAnimResireHitEffects(struct Anim * anim, int type)
{
    int val1, val2, off;
    struct Anim * animR7, * animR5, * animR8;

    if (GetAnimPosition(anim) == EKR_POS_L) {
        animR7 = gAnims[2];
        animR5 = gAnims[0];
        animR8 = gAnims[1];
    } else {
        animR7 = gAnims[0];
        animR5 = gAnims[2];
        animR8 = gAnims[3];
    }

    val1 = gEfxHpLutOff[GetAnimPosition(animR5)];
    val2 = gEfxHpLutOff[GetAnimPosition(animR5)];
    val2++;

    {
        val1 = GetEfxHp(val1 * 2 + GetAnimPosition(animR5));
        val2 = GetEfxHp(val2 * 2 + GetAnimPosition(animR5));
    }

    switch (type) {
    case EKR_HITTED:
        if (val1 != val2) {
            NewEfxHpBarResire(animR5);

            if (CheckRoundCrit(animR7) == 1)
                NewEfxHitQuake(animR5, animR7, 4);
            else
                NewEfxHitQuake(animR5, animR7, 3);
            
            NewEfxFlashHPBar(animR5, 0, 5);
            NewEfxFlashUnit(animR5, 0, 8, 0);
        } else {
            gEfxHpBarResireFlag = 2;
            NewEfxNoDamage(animR5, animR8, 1);
        }
        break;

    case EKR_MISS:
        NewEfxAvoid(animR5);
        break;
    }
}
