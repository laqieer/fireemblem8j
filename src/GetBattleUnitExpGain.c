#include "global.h"

#include "rng.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmmind.h"

void ModifyUnitSpecialExp(struct Unit* actor, struct Unit* target, int* exp);



int GetBattleUnitExpGain(struct BattleUnit* actor, struct BattleUnit* target) {
    int result;

    if (!CanBattleUnitGainLevels(actor) || (actor->unit.curHP == 0) || UNIT_CATTRIBUTES(&target->unit) & CA_NEGATE_LETHALITY)
        return 0;

    if (!actor->nonZeroDamage)
        return 1;

    result = GetUnitRoundExp(&actor->unit, &target->unit);
    result += GetUnitKillExpBonus(&actor->unit, &target->unit);

    if (result > 100)
        result = 100;

    if (result < 1)
        result = 1;

    ModifyUnitSpecialExp(&actor->unit, &target->unit, &result);

    return result;
}
