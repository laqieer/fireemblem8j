#include "global.h"
#include "proc.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "event.h"
#include "eventscript.h"
#include "bm.h"

struct BattleHit * GenerateScriptBattleHitFormEventQueue(void);

u8 Event3F_ScriptBattle(struct EventEngineProc * proc)
{
    struct BattleHit * hits;
    struct ScriptedBattleProc * childProc;
    struct Unit * unitA;
    struct Unit * unitB;
    s8 scripted;

    u8 subcmd = EVT_SUB_CMD(proc->pEventCurrent);

    s16 charIdA = EVT_CMD_ARGV(proc->pEventCurrent)[0];
    s16 charIdB = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    u8 weaponId = EVT_CMD_ARGV(proc->pEventCurrent)[2];
    u8 isBallista = EVT_CMD_ARGV(proc->pEventCurrent)[2] >> 8;

    if (gEventSlots[0xd] == 0)
        hits = NULL;
    else
        hits = GenerateScriptBattleHitFormEventQueue();

    switch (subcmd) {
    case EVSUBCMD_FIGHT:
    case EVSUBCMD_FIGHT_MAP:
        if (charIdA < 0)
            charIdA = -2;

        if (charIdB < 0)
            charIdB = -2;

        unitA = GetUnitStructFromEventParameter(charIdA);
        unitB = GetUnitStructFromEventParameter(charIdB);

        if (EVENT_IS_SKIPPING(proc) || (proc->evStateBits & EV_STATE_FADEDIN))
            scripted = 0;
        else
        {
            scripted = 1;
            childProc = Proc_StartBlocking(ProcScr_ScriptBattleDeamon, proc);
            childProc->evtproc = proc;
            childProc->lock = GetGameLock();
            Proc_SetMark(proc, PROC_MARK_EVENT_ANIM);
        }

        StartEventBattle(unitA, unitB, isBallista, scripted, weaponId, hits, -subcmd || subcmd);

        return EVC_ADVANCE_YIELD;

    case EVSUBCMD_FIGHT_SCRIPT:
        SetScriptedBattle(hits);
        return EVC_ADVANCE_CONTINUE;
    }

    return EVC_ERROR;
}
