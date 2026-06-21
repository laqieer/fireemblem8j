#include "global.h"

#include "constants/classes.h"
#include "constants/items.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmitem.h"
#include "proc.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "mu.h"
#include "rng.h"
#include "bmusemind.h"

//! FE8U = 0x0802F728
int ApplyStatBoostItem(struct Unit* unit, int itemIdx) {
    const struct ItemStatBonuses* statBonuses;
    int messageId = 0;

    int item = unit->items[itemIdx];

    if (GetItemIndex(item) == ITEM_METISSTOME) {
        unit->state |= US_GROWTH_BOOST;
        UnitUpdateUsedItem(unit, itemIdx);
        return 0x81A;
    }

    statBonuses = GetItemStatBonuses(item);

    unit->maxHP += statBonuses->hpBonus;
    unit->curHP += statBonuses->hpBonus;
    unit->pow += statBonuses->powBonus;
    unit->skl += statBonuses->sklBonus;
    unit->spd += statBonuses->spdBonus;
    unit->def += statBonuses->defBonus;
    unit->res += statBonuses->resBonus;
    unit->lck += statBonuses->lckBonus;
    unit->movBonus += statBonuses->movBonus;
    unit->conBonus += statBonuses->conBonus;

    UnitCheckStatCaps(unit);
    UnitUpdateUsedItem(unit, itemIdx);

    switch (GetItemIndex(item)) {
        case ITEM_BOOSTER_SKL:
            messageId = 0x812;
            break;
        case ITEM_BOOSTER_LCK:
            messageId = 0x814;
            break;
        case ITEM_BOOSTER_HP:
            messageId = 0x819;
            break;
        case ITEM_BOOSTER_DEF:
            messageId = 0x815;
            break;
        case ITEM_BOOSTER_SPD:
            messageId = 0x813;
            break;
        case ITEM_BOOSTER_RES:
            messageId = 0x816;
            break;
        case ITEM_BOOSTER_MOV:
            messageId = 0x817;
            break;
        case ITEM_BOOSTER_CON:
            messageId = 0x818;
            break;
        case ITEM_BOOSTER_POW:
            messageId = UnitHasMagicRank(unit) ? 0x811 : 0x810;
            break;
    }

    return messageId;
}
