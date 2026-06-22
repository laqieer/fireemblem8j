#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "anime.h"
#include "bmunit.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ctc.h"
#include "constants/video-banim.h"

void StartBattleAnimHitEffects(struct Anim *anim, int type, int a, int b)
{
    struct Anim *animr7, *animr9, *animr5, *animr8;
    int val1, val2;
    int roundt1, roundt2;

    if (GetAnimPosition(anim) == EKR_POS_L) {
        animr7 = gAnims[2];
        animr9 = gAnims[3];
        animr5 = gAnims[0];
        animr8 = gAnims[1];
    } else {
        animr7 = gAnims[0];
        animr9 = gAnims[1];
        animr5 = gAnims[2];
        animr8 = gAnims[3];
    }

    switch (type) {
    case EKR_HITTED:
        roundt1 = GetRoundFlagByAnim(animr7);
        roundt2 = GetRoundFlagByAnim(animr5);

        if (roundt1 & ANIM_ROUND_POISON) {
            if (GetUnitEfxDebuff(animr7) == UNIT_STATUS_NONE)
                SetUnitEfxDebuff(animr7, UNIT_STATUS_POISON);
        }

        if (roundt2 & ANIM_ROUND_POISON) {
            if (GetUnitEfxDebuff(animr5) == UNIT_STATUS_NONE)
                SetUnitEfxDebuff(animr5, UNIT_STATUS_POISON);
        }

        if (roundt1 & ANIM_ROUND_DEVIL || roundt2 & ANIM_ROUND_DEVIL) {
            struct Anim *tmp;
            tmp = animr5;
            animr5 = animr7;
            animr7 = tmp;
            animr8 = animr9;
        }

        val1 = gEfxHpLutOff[GetAnimPosition(animr5)];
        val2 = gEfxHpLutOff[GetAnimPosition(animr5)];
        val2++;

        val1 = GetEfxHp(val1 * 2 + GetAnimPosition(animr5));
        val2 = GetEfxHp(val2 * 2 + GetAnimPosition(animr5));

        if (val1 != val2) {
            NewEfxHpBar(animr5);

            if (CheckRoundCrit(animr7) == 1)
                NewEfxHitQuake(animr5, animr7, b);
            else
                NewEfxHitQuake(animr5, animr7, a);

            NewEfxFlashHPBar(animr5, 0, 5);
            NewEfxFlashUnit(animr5, 0, 8, 0);
        } else {
            NewEfxNoDamage(animr5, animr8, 0);
        }
        break;

    case EKR_MISS:
        NewEfxAvoid(animr5);
        break;
    }
}
