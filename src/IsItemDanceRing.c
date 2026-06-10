#include "global.h"
#include "constants/items.h"
#include "bmitem.h"

extern inline int GetItemIndex(int item) {
    return ITEM_INDEX(item);
}

s8 IsItemDanceRing(int item) {
    switch (GetItemIndex(item)) {

    case ITEM_HOPLON_SHIELD: // ????????
    case ITEM_FILLAS_MIGHT:
    case ITEM_NINISS_GRACE:
    case ITEM_THORS_IRE:
    case ITEM_SETS_LITANY:
        return TRUE;

    default:
        return FALSE;

    } // switch (GetItemIndex(item))
}
