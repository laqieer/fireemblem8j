#include "global.h"
#include "bmunit.h"
#include "bmitem.h"
#include "spellassoc.h"
#include "bmbattle.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "constants/classes.h"
#include "constants/items.h"

void UnsetMapStaffAnim(s16 * out, u16 pos, u16 weapon)
{
    u16 item = GetItemIndex(weapon);
    if (*out == -1)
        *out = 0;

    if (gEkrInitialHitSide == pos)
        return;

    switch (item) {
    case ITEM_STAFF_WARP:
    case ITEM_STAFF_RESCUE:
    case ITEM_STAFF_TORCH:
    case ITEM_STAFF_UNLOCK:
        *out = 0;
    }
}
