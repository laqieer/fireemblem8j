#include "global.h"

#include "bmunit.h"
#include "bmmap.h"
#include "event.h"
#include "bmitem.h"
#include "bmbattle.h"
#include "bm.h"
#include "bmsave.h"
#include "eventinfo.h"

#include "playerphase.h"

#include "constants/items.h"

s8 PlayerPhase_PrepareAction(ProcPtr proc)
{
    int cameraReturn;
    int item;

    cameraReturn = (s8)EnsureCameraOntoPosition(
        proc, GetUnit(gActionData.subjectIndex)->xPos, GetUnit(gActionData.subjectIndex)->yPos);
    cameraReturn = (s8)(cameraReturn ^ 1);

    switch (gActionData.unitActionType)
    {
        case 0:
            if (gBmSt.taken_action != 0)
            {
                gActionData.unitActionType = UNIT_ACTION_FORCE_WAIT;
                break;
            }

            PlayerPhase_BackToMove(proc);

            return 1;

        case UNIT_ACTION_TRADED:
            gBmSt.taken_action |= BM_TAKEN_ACTION_TRADE;
            PlayerPhase_CancelAction(proc);

            return 1;

        case UNIT_ACTION_TRADED_SUPPLY:
            gBmSt.taken_action |= BM_TAKEN_ACTION_SUPPLY;
            PlayerPhase_CancelAction(proc);

            return 1;

        case UNIT_ACTION_TAKE:
        case UNIT_ACTION_GIVE:
            gBmSt.taken_action |= BM_TAKEN_ACTION_TAKE;
            PlayerPhase_CancelAction(proc);

            return 1;

        case UNIT_ACTION_RIDE_BALLISTA:
        case UNIT_ACTION_EXIT_BALLISTA:
            gBmSt.taken_action |= BM_TAKEN_ACTION_BALLISTA;
            PlayerPhase_CancelAction(proc);

            return 1;

        case UNIT_ACTION_TRADED_1D:
            PlayerPhase_CancelAction(proc);

            return 1;
    }

    item = GetItemIndex(GetUnit(gActionData.subjectIndex)->items[gActionData.itemSlotIndex]);

    gBattleActor.hasItemEffectTarget = 0;

    switch (item)
    {
        case ITEM_HEAVENSEAL:
        case ITEM_HEROCREST:
        case ITEM_KNIGHTCREST:
        case ITEM_ORIONSBOLT:
        case ITEM_ELYSIANWHIP:
        case ITEM_GUIDINGRING:
        case ITEM_MASTERSEAL:
        case ITEM_OCEANSEAL:
        case ITEM_LUNARBRACE:
        case ITEM_SOLARBRACE:
        case ITEM_UNK_C1:
            return cameraReturn;
    }

    if ((gActionData.unitActionType != UNIT_ACTION_WAIT) && !gBmSt.just_resumed)
    {
        gActionData.suspendPointType = SUSPEND_POINT_DURINGACTION;
        WriteSuspendSave(SAVE_ID_SUSPEND);
    }

    return cameraReturn;
}
