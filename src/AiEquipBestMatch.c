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

//! FE8U = 0x0803EBA4
void AiEquipBestMatch(int equip_flag, u16 * equip_flags)
{
    int i;

    int itemSlot = -1;
    u16 unk = 0;

    for (i = 0; i < UNIT_ITEM_COUNT; equip_flags++, i++)
    {
        if (*equip_flags == 0)
            continue;

        if (!(*equip_flags & equip_flag))
            continue;

        if ((*equip_flags & 0xff00) > unk)
        {
            unk = *equip_flags & 0xff00;
            itemSlot = i;
        }
    }

    if (itemSlot > 0)
        EquipUnitItemSlot(gActiveUnit, itemSlot);
}
