#include "global.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmarch.h"
#include "bmitem.h"

void SetBattleUnitWeaponBallista(struct BattleUnit* bu) {
    bu->weapon = GetBallistaItemAt(bu->unit.xPos, bu->unit.yPos);

    bu->weaponBefore = bu->weapon;
    bu->weaponAttributes = GetItemAttributes(bu->weapon);
    bu->weaponType = GetItemType(bu->weapon);

    bu->canCounter = FALSE;
}
