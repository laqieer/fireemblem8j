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


struct Unknown_Sub80315C {
    u8* unk_00;
    u8 unk_04;
    u8 unk_05;
};
struct UnknownSub803F4A4 {
    u8 unk_00;
    u8 unk_01;
    u8 unk_02;
    u8 unk_03;
};
void AiMarkStaffCapabilityFlags(u16 item);

s8 AiEquipGetFlags(u16 * out)
{
    int i;
    u32 perc;

    if (GetUnitItemCount(gActiveUnit) == 0)
        return 0;

    for (i = 0; i < UNIT_ITEM_COUNT; i++)
    {
        u16 item;
        out[i] = 0;

        item = gActiveUnit->items[i];

        if (item == 0)
            break;

        if (!(GetItemAttributes(item) & (IA_WEAPON | IA_STAFF)))
            continue;

        if (GetItemAttributes(item) & IA_LOCK_3)
            continue;

        if (!CanUnitUseWeapon(gActiveUnit, item) && !CanUnitUseStaff(gActiveUnit, item))
            continue;

        if (GetItemAttributes(item) & IA_WEAPON)
        {
            if (GetItemMinRange(item) > 1)
                out[i] |= 2;

            if (GetItemMaxRange(item) == 1)
                out[i] |= 1;

            perc = Div(perc = GetItemUses(item) * 100, GetItemMaxUses(item));

            if (perc <= 10)
                out[i] |= 4;
        }
        else
        {
            AiMarkStaffCapabilityFlags(item);
            out[i] |= 8;
        }

        out[i] |= (GetItemMight(item) << 8);
    }
}
