#include "global.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "bmbattle.h"
#include "anime.h"
#include "bmitem.h"
#include "constants/items.h"

u16 IsWeaponLegency(u16 item)
{
    switch (GetItemIndex(item)) {
    case ITEM_ANIMA_EXCALIBUR:
    case ITEM_DARK_GLEIPNIR:
    case ITEM_SWORD_SIEGLINDE:
    case ITEM_LIGHT_IVALDI:
    case ITEM_LANCE_VIDOFNIR:
    case ITEM_SWORD_AUDHULMA:
    case ITEM_LANCE_SIEGMUND:
    case ITEM_AXE_GARM:
    case ITEM_BOW_NIDHOGG:
        return true;

    default:
        return false;
    }
}
