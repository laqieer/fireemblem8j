#include "global.h"
#include "cp_common.h"
#include "bmidoten.h"
#include "bmmap.h"
#include "bmunit.h"
#include "bmphase.h"
#include "bmitem.h"
#include "bmarch.h"
#include "rng.h"
#include "cp_utility.h"
#include "cp_data.h"
#include "cp_script.h"
#include "constants/items.h"
#include "constants/terrains.h"

//! FE8U = 0x0803EC98
int StoreItemAndGetUnitAttack(struct Unit* unit, u16* itemOut) {
    u16 item = GetUnitEquippedWeapon(unit);
    *itemOut = item;
    return GetUnitPower(unit) + GetItemMight(item);
}
