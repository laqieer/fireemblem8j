#include "global.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "bmbattle.h"
#include "anime.h"
#include "bmitem.h"
#include "constants/items.h"

u16 IsItemDisplayedInBattle(u16 item)
{
    if (GetItemIndex(item) == ITEM_FILLAS_MIGHT)
        return true;

    if (GetItemIndex(item) == ITEM_NINISS_GRACE)
        return true;

    if (GetItemIndex(item) == ITEM_THORS_IRE)
        return true;

    if (GetItemIndex(item) == ITEM_SETS_LITANY)
        return true;

    return false;
}
