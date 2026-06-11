#include "global.h"
#include "gbafe.h"

int CheckEkrWpnDemonLight(struct Anim * anim)
{
    struct BattleUnit *bu;
    if (GetAnimPosition(anim) == 0)
        bu = gpEkrBattleUnitLeft;
    else
        bu = gpEkrBattleUnitRight;

    if (bu->weaponBefore == ITEM_DEMONLIGHT)
        return true;
    else
        return false;
}
