#include "global.h"

#include "bmitem.h"
#include "bmitemuse.h"
#include "bmunit.h"
#include "constants/items.h"

int GetItemCantUseMsgid(struct Unit* unit, int item)
{
    switch (GetItemIndex(item))
    {

    case ITEM_STAFF_TORCH:
    case ITEM_BOOSTER_HP:
    case ITEM_BOOSTER_POW:
    case ITEM_BOOSTER_SKL:
    case ITEM_BOOSTER_SPD:
    case ITEM_BOOSTER_LCK:
    case ITEM_BOOSTER_DEF:
    case ITEM_BOOSTER_RES:
    case ITEM_BOOSTER_MOV:
    case ITEM_BOOSTER_CON:
    case ITEM_VULNERARY:
    case ITEM_ELIXIR:
    case ITEM_PUREWATER:
    case ITEM_ANTITOXIN:
    case ITEM_TORCH:
    case ITEM_VULNERARY_2:
        return 0x7D7; // TODO: msgid "There's no need for that."

    case ITEM_CHESTKEY:
    case ITEM_CHESTKEY_BUNDLE:
        return 0x7DC; // TODO: msgid "There's no chest."

    case ITEM_DOORKEY:
        return 0x7DB; // TODO: msgid "There's no door."

    case ITEM_LOCKPICK:
        if (UNIT_CATTRIBUTES(gActiveUnit) & CA_THIEF)
            return 0x7DF; // TODO: msgid "No doors or chests."

        return 0x7DD; // TODO: msgid "For thieves only."

    case ITEM_HEROCREST:
    case ITEM_KNIGHTCREST:
    case ITEM_ORIONSBOLT:
    case ITEM_ELYSIANWHIP:
    case ITEM_GUIDINGRING:
    case ITEM_MASTERSEAL:
    case ITEM_HEAVENSEAL:
    case ITEM_OCEANSEAL:
    case ITEM_LUNARBRACE:
    case ITEM_SOLARBRACE:
    case ITEM_UNK_C1:
    {
        int level = gActiveUnit->level;
        int boolval;

        gActiveUnit->level = 10;
        boolval = CanUnitUsePromotionItem(gActiveUnit, item);
        gActiveUnit->level = level;

        if (boolval)
            return 0x7D9; // TODO: msgid "Must be above level 10."

        return 0x7D8; // TODO: msgid "This can't be used."
    }

    case ITEM_JUNAFRUIT:
        return 0x7DA; // TODO: msgid "Must be above level 10."

    default:
        return 0x7D8; // TODO: msgid "This can't be used."

    }
}