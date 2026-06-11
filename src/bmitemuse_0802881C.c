
#include "global.h"

#include "m4a.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "ctc.h"
#include "fontgrp.h"
#include "ap.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmbattle.h"
#include "bmtarget.h"
#include "bmtrick.h"
#include "uiutils.h"
#include "uimenu.h"
#include "uiselecttarget.h"
#include "playerphase.h"
#include "bb.h"
#include "face.h"
#include "bm.h"
#include "unitinfowindow.h"
#include "eventinfo.h"
#include "bmmenu.h"
#include "menu_def.h"
#include "menuitempanel.h"
#include "bmmind.h"
#include "worldmap.h"
#include "constants/characters.h"
#include "constants/items.h"
#include "constants/terrains.h"

#include "bmitemuse.h"
#include "constants/songs.h"

extern struct Unit gStatGainSimUnit;

// clang-format off





/* prototypes for same-file helpers called by this run */
s8 HasSelectTarget(struct Unit* unit, void(*func)(struct Unit*));
s8 CanUnitUseHealItem(struct Unit* unit);
s8 CanUnitUsePureWaterItem(struct Unit* unit);
s8 CanUnitUseTorchItem(struct Unit* unit);
s8 CanUnitUseAntitoxinItem(struct Unit* unit);
s8 CanUnitUseChestKeyItem(struct Unit* unit);
s8 CanUnitUseDoorKeyItem(struct Unit* unit);
s8 CanUnitUseLockpickItem(struct Unit* unit);
s8 CanUnitUsePromotionItem(struct Unit* unit, int item);
s8 CanUnitUseStatGainItem(struct Unit* unit, int item);
s8 CanUnitUseFruitItem(struct Unit* unit);

// clang-format on

s8 CanUnitUseItem(struct Unit* unit, int item)
{
    if ((GetItemAttributes(item) & IA_STAFF) && !CanUnitUseStaff(unit, item))
        return FALSE;

    switch (GetItemIndex(item))
    {

    case ITEM_STAFF_HEAL:
    case ITEM_STAFF_MEND:
    case ITEM_STAFF_RECOVER:
        return HasSelectTarget(unit, MakeTargetListForAdjacentHeal);

    case ITEM_STAFF_PHYSIC:
        return HasSelectTarget(unit, MakeTargetListForRangedHeal);

    case ITEM_STAFF_FORTIFY:
        return HasSelectTarget(unit, MakeTargetListForRangedHeal);

    case ITEM_STAFF_RESTORE:
        return HasSelectTarget(unit, MakeTargetListForRestore);

    case ITEM_STAFF_RESCUE:
        return HasSelectTarget(unit, MakeTargetListForRescueStaff);

    case ITEM_STAFF_BARRIER:
        return HasSelectTarget(unit, MakeTargetListForBarrier);

    case ITEM_STAFF_SILENCE:
        return HasSelectTarget(unit, MakeTargetListForSilence);

    case ITEM_STAFF_SLEEP:
        return HasSelectTarget(unit, MakeTargetListForSleep);

    case ITEM_STAFF_BERSERK:
        return HasSelectTarget(unit, MakeTargetListForBerserk);

    case ITEM_STAFF_WARP:
        return HasSelectTarget(unit, MakeTargetListForWarp);

    case ITEM_STAFF_REPAIR:
        return HasSelectTarget(unit, MakeTargetListForHammerne);

    case ITEM_STAFF_UNLOCK:
        return HasSelectTarget(unit, MakeTargetListForUnlock);

    case ITEM_BOOSTER_HP:
    case ITEM_BOOSTER_POW:
    case ITEM_BOOSTER_SKL:
    case ITEM_BOOSTER_SPD:
    case ITEM_BOOSTER_LCK:
    case ITEM_BOOSTER_DEF:
    case ITEM_BOOSTER_RES:
    case ITEM_BOOSTER_MOV:
    case ITEM_BOOSTER_CON:
        return CanUnitUseStatGainItem(unit, item);

    case ITEM_HEROCREST:
    case ITEM_KNIGHTCREST:
    case ITEM_ORIONSBOLT:
    case ITEM_ELYSIANWHIP:
    case ITEM_GUIDINGRING:
    case ITEM_MASTERSEAL:
    case ITEM_HEAVENSEAL:
    case ITEM_OCEANSEAL:
    case ITEM_LUNARBRACE:
    case ITEM_SOLARBRACE:
    case ITEM_UNK_C1:
        return CanUnitUsePromotionItem(unit, item);

    case ITEM_VULNERARY:
    case ITEM_ELIXIR:
    case ITEM_VULNERARY_2:
        return CanUnitUseHealItem(unit);

    case ITEM_PUREWATER:
        return CanUnitUsePureWaterItem(unit);

    case ITEM_TORCH:
        return CanUnitUseTorchItem(unit);

    case ITEM_ANTITOXIN:
        return CanUnitUseAntitoxinItem(unit);

    case ITEM_CHESTKEY:
    case ITEM_CHESTKEY_BUNDLE:
        return CanUnitUseChestKeyItem(unit);

    case ITEM_DOORKEY:
        return CanUnitUseDoorKeyItem(unit);

    case ITEM_LOCKPICK:
        return CanUnitUseLockpickItem(unit);

    case ITEM_STAFF_LATONA:
        return HasSelectTarget(unit, MakeTargetListForLatona);

    case ITEM_MINE:
        return HasSelectTarget(unit, MakeTargetListForMine);

    case ITEM_LIGHTRUNE:
        return HasSelectTarget(unit, MakeTargetListForLightRune);

    case ITEM_STAFF_TORCH:
        return gPlaySt.chapterVisionRange != 0;

    case ITEM_FILLAS_MIGHT:
    case ITEM_NINISS_GRACE:
    case ITEM_THORS_IRE:
    case ITEM_SETS_LITANY:
        return HasSelectTarget(unit, MakeTargetListForDanceRing);

    case ITEM_METISSTOME:
        if (unit->state & US_GROWTH_BOOST)
            return FALSE;

        return TRUE;

    case ITEM_JUNAFRUIT:
        return CanUnitUseFruitItem(unit);

    default:
        return FALSE;

    }
}
