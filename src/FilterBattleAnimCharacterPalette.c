#include "global.h"
#include "efxbattle.h"
#include "bmitem.h"
#include "constants/items.h"

u16 * FilterBattleAnimCharacterPalette(s16 index, u16 item)
{
    switch (index)
    {
    case 0x9E:
    case 0xC9:
    case 0xCA:
    case 0xCB:
        switch (GetItemIndex(item))
        {
        case ITEM_BALLISTA_REGULAR:
            return Pal_Efxbattle_1;

        case ITEM_BALLISTA_LONG:
            return Pal_Efxbattle_0;

        case ITEM_BALLISTA_KILLER:
            return Pal_Efxbattle_2;

        default:
            return NULL;
        }
        break;

    default:
        return NULL;
    }
}
