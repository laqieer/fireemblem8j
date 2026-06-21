#include "global.h"
#include "constants/items.h"
#include "bmunit.h"
#include "bmitem.h"

extern inline const struct ItemData* GetItemData(int itemIndex) { return gItemData + itemIndex; }
extern inline int GetItemAttributes(int item) { return GetItemData(ITEM_INDEX(item))->attributes; }
extern inline const u8* GetItemEffectiveness(int item) { return GetItemData(ITEM_INDEX(item))->pEffectiveness; }

//! FE8U = 0x08016994
s8 IsItemEffectiveAgainst(u16 item, struct Unit* unit)
{
    if (unit->pClassData)
    {
        int classId = unit->pClassData->number;
        const u8* effList = GetItemEffectiveness(item);

        if (!effList)
            return FALSE;

        for (; *effList; ++effList)
            if (*effList == classId)
                // NOTE: maybe there's a better way to make this work (using an inline maybe?)
                goto check_flying_effectiveness_negation;

        return FALSE;

        check_flying_effectiveness_negation: {
            u32 attributes;
            int i;

            if (GetItemEffectiveness(item) != ItemEffectiveness_Flier)
                if (GetItemEffectiveness(item) != ItemEffectiveness_FlierAndMonsters)
                    return TRUE;

            attributes = 0;

            for (i = 0; i < UNIT_ITEM_COUNT; ++i)
                attributes = attributes | GetItemAttributes(unit->items[i]);

            if (!(attributes & IA_NEGATE_FLYING))
                return TRUE;
            else
                return FALSE;
        }
    }

    return FALSE;
}
