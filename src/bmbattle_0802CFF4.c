#include "global.h"
#include "rng.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmmind.h"
#include "bmreliance.h"
#include "chapterdata.h"
#include "bmtrick.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "proc.h"
#include "mu.h"
#include "bmarch.h"
#include "bmarena.h"
#include "bmsave.h"
#include "ekrbattle.h"
#include "bmbattle.h"
#include "mapanim.h"
#include "worldmap.h"
#include "constants/songs.h"
#include "constants/items.h"
#include "constants/classes.h"
#include "constants/characters.h"
#include "constants/terrains.h"
#include "constants/chapters.h"

int GetStatIncrease(int growth);

void UnitLevelUp(struct Unit* unit) {
    if (unit->level != 20) {
        int hpGain, powGain, sklGain, spdGain, defGain, resGain, lckGain;
        int growthBonus;
        int totalGain;

        unit->exp = 0;
        unit->level++;

        if (unit->level == 20)
            unit->exp = UNIT_EXP_DISABLED;

        growthBonus = (unit->state & US_GROWTH_BOOST) ? 5: 0;
        totalGain = 0;

        hpGain  = GetStatIncrease(growthBonus + unit->pCharacterData->growthHP);
        totalGain += hpGain;

        powGain = GetStatIncrease(growthBonus + unit->pCharacterData->growthPow);
        totalGain += powGain;

        sklGain = GetStatIncrease(growthBonus + unit->pCharacterData->growthSkl);
        totalGain += sklGain;

        spdGain = GetStatIncrease(growthBonus + unit->pCharacterData->growthSpd);
        totalGain += spdGain;

        defGain = GetStatIncrease(growthBonus + unit->pCharacterData->growthDef);
        totalGain += defGain;

        resGain = GetStatIncrease(growthBonus + unit->pCharacterData->growthRes);
        totalGain += resGain;

        lckGain = GetStatIncrease(growthBonus + unit->pCharacterData->growthLck);
        totalGain += lckGain;

        if (totalGain == 0) {
            for (totalGain = 0; totalGain < 2; ++totalGain) {
                hpGain = GetStatIncrease(unit->pCharacterData->growthHP);

                if (hpGain)
                    break;

                powGain = GetStatIncrease(unit->pCharacterData->growthPow);

                if (powGain)
                    break;

                sklGain = GetStatIncrease(unit->pCharacterData->growthSkl);

                if (sklGain)
                    break;

                spdGain = GetStatIncrease(unit->pCharacterData->growthSpd);

                if (spdGain)
                    break;

                defGain = GetStatIncrease(unit->pCharacterData->growthDef);

                if (defGain)
                    break;

                resGain = GetStatIncrease(unit->pCharacterData->growthRes);

                if (resGain)
                    break;

                lckGain = GetStatIncrease(unit->pCharacterData->growthLck);

                if (lckGain)
                    break;
            }
        }

        if ((unit->maxHP + hpGain) > UNIT_MHP_MAX(unit))
            hpGain = UNIT_MHP_MAX(unit) - unit->maxHP;

        if ((unit->pow + powGain) > UNIT_POW_MAX(unit))
            powGain = UNIT_POW_MAX(unit) - unit->pow;

        if ((unit->skl + sklGain) > UNIT_SKL_MAX(unit))
            sklGain = UNIT_SKL_MAX(unit) - unit->skl;

        if ((unit->spd + spdGain) > UNIT_SPD_MAX(unit))
            spdGain = UNIT_SPD_MAX(unit) - unit->spd;

        if ((unit->def + defGain) > UNIT_DEF_MAX(unit))
            defGain = UNIT_DEF_MAX(unit) - unit->def;

        if ((unit->res + resGain) > UNIT_RES_MAX(unit))
            resGain = UNIT_RES_MAX(unit) - unit->res;

        if ((unit->lck + lckGain) > UNIT_LCK_MAX(unit))
            lckGain = UNIT_LCK_MAX(unit) - unit->lck;

        unit->maxHP += hpGain;
        unit->pow += powGain;
        unit->skl += sklGain;
        unit->spd += spdGain;
        unit->def += defGain;
        unit->res += resGain;
        unit->lck += lckGain;
    }
}
