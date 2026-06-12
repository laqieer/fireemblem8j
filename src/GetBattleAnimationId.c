#include "global.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "bmbattle.h"
#include "anime.h"
#include "bmitem.h"
#include "constants/items.h"

u16 GetBattleAnimationId(struct Unit * unit, const struct BattleAnimDef * anim_def, u16 wpn, u32 * out)
{
    int i, j, ret;
    u16 type;
    int idx;
    const struct BattleAnimDef * sp00, * src;

    idx = 0;

    if (!anim_def)
        return -1;

    if (GetItemType(wpn) == ITYPE_ITEM && !IsItemDisplayedInBattle(wpn))
        return -1;

    if (wpn == 0)
        type = ITYPE_ITEM;
    else
        type = GetItemType(wpn);
    sp00 = anim_def;
    *out = 0;
    for (i = 0, ret = 0; i < 2; i++)
    {
        src = sp00;
        for (j = 0; src->wtype; j++)
        {
            if ((i || src->wtype < 0x100)
                && (i != 1 || src->wtype >= 0x100)
                && (src->wtype == GetItemIndex(wpn) || (src->wtype - 0x100) == type))
            {
                idx = src->index;
                *out = j;
                ret = 1;
                break;
            }
            src++;
        }

        if (ret == 1)
            break;
    }

    return (idx - 1);
}
