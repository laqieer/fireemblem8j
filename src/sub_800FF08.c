#include "global.h"
#include "bmunit.h"
#include "bmmap.h"
#include "event.h"
#include "eventscript.h"
#include "muctrl.h"

//! FE8U = 0x0800FD8C  (fe8u eventscr.c Event2F_MoveUnit)
// JP region-different codegen: built with -mjp-promote (ldrsh `speed`), and the
// JP coloring pins proc->r8/unit->r7. Two live-range devices reproduce it exactly:
//   * `new_var = proc;` splits proc's live range across the switch/tail so it colors r8.
//   * routing arg1 through the s16 `targetPid` local matches the JP scratch-reg order.
u8 Event2F_MoveUnit(struct EventEngineProc * proc)
{
    struct EventEngineProc * new_var;
    s8 xIn;
    s8 yIn;
    u8 subcmd;
    s8 subHi;
    s16 speed;
    u16 direction;
    u16 flags;
    struct Unit * unit;
    struct Unit * targetUnit;
    s16 targetPid;
    s8 xOut;
    s8 yOut;
    void * queue;

    subcmd = EVT_SUB_CMD_LO(proc->pEventCurrent);
    subHi = EVT_SUB_CMD_HI(proc->pEventCurrent);

    speed = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    targetPid = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    unit = GetUnitStructFromEventParameter(targetPid);
    if (!unit)
    {
        return EVC_ADVANCE_CONTINUE;
    }

    xIn = unit->xPos;
    yIn = unit->yPos;

    new_var = proc;

    if (!(unit->state & US_BIT22))
    {
        if (unit->state & US_DEAD)
        {
            return EVC_ADVANCE_CONTINUE;
        }
    }

    switch (subcmd) {
    case EVSUBCMD_MOVE:
        xOut = EVT_CMD_ARGV(new_var->pEventCurrent)[2];
        yOut = EVT_CMD_ARGV(new_var->pEventCurrent)[2] >> 8;

        queue = NULL;

        break;

    case EVSUBCMD_MOVEONTO:
        targetPid = EVT_CMD_ARGV(new_var->pEventCurrent)[2];
        if (targetPid < 0)
        {
            targetPid = 0;
        }

        targetUnit = GetUnitStructFromEventParameter(targetPid);
        if (!targetUnit)
        {
            return EVC_ERROR;
        }

        xOut = targetUnit->xPos;
        yOut = targetUnit->yPos;

        queue = NULL;

        break;

    case EVSUBCMD_MOVE_1STEP:
        direction = EVT_CMD_ARGV(new_var->pEventCurrent)[2];
        xOut = xIn;
        yOut = yIn;

        switch (direction) {
        case 3:
            yOut--;
            break;

        case 2:
            yOut++;
            break;

        case 0:
            xOut--;
            break;

        case 1:
            xOut++;
            break;
        }
        queue = NULL;
        break;

    case EVSUBCMD_MOVE_DEFINED:
        queue = gEventSlotQueue;
        break;
    }

    flags = ModifyMoveUnitFlag(new_var, subHi);

    BmMapFill(gBmMapOther, 0);

    if (EVENT_IS_SKIPPING(new_var) || (speed < 0))
    {
        MoveUnit_(unit, xOut, yOut, flags);
        return EVC_ADVANCE_CONTINUE;
    }

    if (!TryPrepareEventUnitMovement(new_var, xIn, yIn))
    {
        return EVC_STOP_YIELD;
    }

    if (queue == NULL)
    {
        MuCtr_StartMoveTowards(unit, xOut, yOut, speed, flags);
    }
    else
    {
        MuCtr_StartDefinedMove(unit, queue, gEventSlots[0xD] / 2, flags);
    }

    return EVC_ADVANCE_CONTINUE;
}

// Retain the pre-carve symbol name so the (still-descriptive-asm) frontier data
// table `src/data/frontier_df4_uistuff` continues to resolve to this function.
asm(".global sub_800FF08\n"
    ".thumb_set sub_800FF08, Event2F_MoveUnit\n");
