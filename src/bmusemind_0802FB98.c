#include "global.h"
#include "constants/classes.h"
#include "constants/items.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmitem.h"
#include "proc.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "mu.h"
#include "rng.h"
#include "uiselecttarget.h"
#include "prepscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmtrick.h"
#include "bmtrap.h"
#include "bmtarget.h"
#include "popup.h"
#include "bmudisp.h"
#include "classchg.h"
#include "eventinfo.h"
#include "bmmind.h"
#include "bmusemind.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_ExecNightmareStaff[];
extern struct ProcCmd ProcScr_SetTargetStatus[];

void ExecElixirItem(ProcPtr proc);
void ExecLatona(ProcPtr proc);
void ExecPureWaterItem(ProcPtr proc);
void ExecRestore(ProcPtr proc);
void ExecStatBoostItem(ProcPtr proc);
void ExecStatusStaff(ProcPtr proc);

void ActionStaffDoorChestUseItem(ProcPtr proc) {
    int itemId = GetItemIndex(GetUnit(gActionData.subjectIndex)->items[gActionData.itemSlotIndex]);

    gBattleActor.hasItemEffectTarget = 0;

    switch (itemId) {
        case ITEM_STAFF_HEAL:
        case ITEM_STAFF_MEND:
        case ITEM_STAFF_RECOVER:
        case ITEM_STAFF_PHYSIC:
            ExecStandardHeal(proc);
            break;
        case ITEM_STAFF_SILENCE:
        case ITEM_STAFF_SLEEP:
        case ITEM_STAFF_BERSERK:
            ExecStatusStaff(proc);
            break;
        case ITEM_NIGHTMARE:
            ExecNightmare(proc);
            break;
        case ITEM_STAFF_FORTIFY:
            ExecFortify(proc);
            break;
        case ITEM_STAFF_RESTORE:
            ExecRestore(proc);
            break;
        case ITEM_STAFF_RESCUE:
            ExecRescueStaff(proc);
            break;
        case ITEM_STAFF_BARRIER:
            ExecBarrierStaff(proc);
            break;
        case ITEM_STAFF_WARP:
            ExecWarpStaff(proc);
            break;
        case ITEM_STAFF_UNLOCK:
            ExecUnlockStaff(proc);
            break;
        case ITEM_STAFF_REPAIR:
            ExecHammerne(proc);
            break;
        case ITEM_TORCH:
            ExecTorchItem(proc);
            break;
        case ITEM_VULNERARY:
        case ITEM_VULNERARY_2:
            ExecVulneraryItem(proc, 10);
            break;
        case ITEM_ELIXIR:
            ExecElixirItem(proc);
            break;
        case ITEM_PUREWATER:
            ExecPureWaterItem(proc);
            break;
        case ITEM_ANTITOXIN:
            ExecAntitoxinItem(proc);
            break;
        case ITEM_CHESTKEY:
        case ITEM_DOORKEY:
        case ITEM_LOCKPICK:
        case ITEM_CHESTKEY_BUNDLE:
            ExecKeyItem();
            break;
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
            gBattleActor.weaponBefore = gBattleTarget.weaponBefore = GetUnit(gActionData.subjectIndex)->items[gActionData.itemSlotIndex];

            gBattleActor.weapon = gBattleTarget.weapon = GetUnitEquippedWeapon(GetUnit(gActionData.subjectIndex));

            gBattleTarget.statusOut = -1;

            StartBmPromotion(proc);
            break;
        case ITEM_BOOSTER_HP:
        case ITEM_BOOSTER_POW:
        case ITEM_BOOSTER_SKL:
        case ITEM_BOOSTER_SPD:
        case ITEM_BOOSTER_LCK:
        case ITEM_BOOSTER_DEF:
        case ITEM_BOOSTER_RES:
        case ITEM_BOOSTER_MOV:
        case ITEM_BOOSTER_CON:
        case ITEM_METISSTOME:
            ExecStatBoostItem(proc);
            break;
        case ITEM_STAFF_LATONA:
            ExecLatona(proc);
            break;
        case ITEM_MINE:
            ExecMine(proc);
            break;
        case ITEM_LIGHTRUNE:
            ExecLightRune(proc);
            break;
        case ITEM_STAFF_TORCH:
            ExecTorchStaff(proc);
            break;
        case ITEM_FILLAS_MIGHT:
        case ITEM_NINISS_GRACE:
        case ITEM_THORS_IRE:
        case ITEM_SETS_LITANY:
            ExecDanceRing(proc);
            break;
        case ITEM_JUNAFRUIT:
            ExecJunaFruitItem(proc);
    }

    if (itemId == ITEM_NIGHTMARE) {
        Proc_StartBlocking(ProcScr_ExecNightmareStaff, proc);
        return;
    }

    if (gBattleTarget.statusOut >= 0) {
        Proc_StartBlocking(ProcScr_SetTargetStatus, proc);
    }

    return;
}
