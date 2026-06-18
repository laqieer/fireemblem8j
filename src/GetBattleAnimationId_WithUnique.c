#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"
#include "banim_data.h"
#include "hardware.h"
#include "bmlib.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "chapterdata.h"
#include "spellassoc.h"
#include "constants/characters.h"
#include "constants/classes.h"
#include "constants/items.h"
#include "constants/terrains.h"


u16 GetBattleAnimationId_WithUnique(struct Unit * unit, const struct BattleAnimDef * pBattleAnimDef, u16 item, int * out)
{
    const struct BattleAnimDef * animDef;
    int i;
    int j;
#if NONMATCHING
    int ret;
#else
    register int ret asm("sl");
#endif
    int idx;
    int found;
    u16 itemType;

    ret = 0;

    if (pBattleAnimDef == NULL)
    {
        return -1;
    }

    if (GetItemType(item) == ITYPE_ITEM && !IsItemDisplayedInBattle(item))
    {
        return -1;
    }

    if (item == 0)
    {
        itemType = ITYPE_ITEM;
    }
    else
    {
        itemType = GetItemType(item);
    }

    animDef = pBattleAnimDef;

    idx = unit->pCharacterData->_u25[(UNIT_CATTRIBUTES(unit) >> 8 & 1)];

    if (idx != 0)
    {
        animDef = gUnitSpecificBanimConfigs[idx];
    }

    *out = 0;
    i = 0;
    found = 0;

    while (i < 2)
    {
        const struct BattleAnimDef * it = animDef;
        do
        {
            for (j = 0; it->wtype != 0; it++, j++)
            {
                if (i == 0 && it->wtype >= 0x100)
                {
                    continue;
                }

                if (i == 1 && it->wtype < 0x100)
                {
                    continue;
                }

                if (it->wtype == GetItemIndex(item) || (it->wtype - 0x100 == itemType))
                {
                    ret = it->index;
                    *out = j;
                    found = 1;
                    break;
                }
            }
        } while (0);

        if (found == 1)
        {
            break;
        }

        i++;
    }

    return (ret - 1);
}
