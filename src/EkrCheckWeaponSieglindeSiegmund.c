#include "global.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "bmbattle.h"
#include "anime.h"
#include "bmitem.h"
#include "constants/items.h"

s16 EkrCheckWeaponSieglindeSiegmund(u16 item)
{
    switch (GetItemIndex(item)) {
    case ITEM_SWORD_SIEGLINDE:
    case ITEM_LANCE_SIEGMUND:
        return true;

    default:
        return false;
    }
}
