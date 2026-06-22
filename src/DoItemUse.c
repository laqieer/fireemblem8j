#include "global.h"

#include "bmitem.h"
#include "bmitemuse.h"
#include "bmunit.h"
#include "bmtarget.h"
#include "uiselecttarget.h"
#include "uiutils.h"
#include "face.h"
#include "bm.h"

#include "constants/items.h"

void DoItemUse(struct Unit* unit, int item)
{
    ClearBg0Bg1();
    EndFaceById(0);

    switch (GetItemIndex(item))
    {

    case ITEM_STAFF_HEAL:
    case ITEM_STAFF_MEND:
    case ITEM_STAFF_RECOVER:
        DoUseHealStaff(unit, MakeTargetListForAdjacentHeal);
        break;

    case ITEM_STAFF_PHYSIC:
        DoUseHealStaff(unit, MakeTargetListForRangedHeal);
        break;

    case ITEM_STAFF_RESCUE:
        DoUseRescueStaff(unit, MakeTargetListForRescueStaff);
        break;

    case ITEM_STAFF_RESTORE:
        DoUseRestoreStaff(unit, MakeTargetListForRestore);
        break;

    case ITEM_STAFF_SILENCE:
        DoUseAttackStaff(unit, MakeTargetListForSilence);
        break;

    case ITEM_STAFF_SLEEP:
        DoUseAttackStaff(unit, MakeTargetListForSleep);
        break;

    case ITEM_STAFF_BERSERK:
        DoUseAttackStaff(unit, MakeTargetListForBerserk);
        break;

    case ITEM_STAFF_BARRIER:
        DoUseBarrierStaff(unit);
        break;

    case ITEM_STAFF_UNLOCK:
        DoUsePutTrap(unit, MakeTargetListForUnlock, 0x7F8); /* JP: 0x7F8 (US 0x87A) "Select a door to open." */
        break;

    case ITEM_STAFF_WARP:
        DoUseWarpStaff(unit);
        break;

    case ITEM_STAFF_REPAIR:
        DoUseRepairStaff(unit);
        break;

    case ITEM_STAFF_FORTIFY:
    case ITEM_STAFF_LATONA:
        SetStaffUseAction(unit);
        break;

    case ITEM_MINE:
        DoUsePutTrap(unit, MakeTargetListForMine, 0x7FB); /* JP: 0x7FB (US 0x87D) "Select an area to trap." */
        break;

    case ITEM_LIGHTRUNE:
        DoUsePutTrap(unit, MakeTargetListForLightRune, 0x7FC); /* JP: 0x7FC (US 0x87E) "Select an area to trap." */
        break;

    case ITEM_STAFF_TORCH:
        DoUseTorchStaff(unit);
        break;

    case ITEM_FILLAS_MIGHT:
    case ITEM_NINISS_GRACE:
    case ITEM_THORS_IRE:
    case ITEM_SETS_LITANY:
        DoUseSpecialDance(unit, MakeTargetListForDanceRing, 0x7FD); /* JP: 0x7FD (US 0x87F) "Select a character to bless." */
        break;

    default:
        SetItemUseAction(unit);
        break;

    }
}
