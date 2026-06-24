#include "global.h"
#include "proc.h"
#include "rng.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "bmio.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmitem.h"
#include "bmtrick.h"
#include "bmidoten.h"
#include "mu.h"
#include "chapterdata.h"
#include "face.h"
#include "scene.h"
#include "bm.h"
#include "bmlib.h"
#include "bmudisp.h"
#include "gamecontrol.h"
#include "uimenu.h"
#include "prepscreen.h"
#include "playerphase.h"
#include "bmbattle.h"
#include "popup.h"
#include "muctrl.h"
#include "mapanim.h"
#include "helpbox.h"
#include "worldmap.h"
#include "cgtext.h"
#include "bmmind.h"
#include "eventinfo.h"
#include "event.h"
#include "eventscript.h"
#include "EAstdlib.h"
#include "constants/backgrounds.h"
#include "eventcall.h"
#include "bmdifficulty.h"
#include "bmfx.h"
#include "colorfade.h"
#include "constants/songs.h"

u16 GetLoadUnitsAmount(const struct UnitDefinition * unitDefinition);
struct UnitDefinition * GetUnitDefinitionFormEventScr(struct UnitDefinition * source, short count, u8 arg2, s8 arg3, s8 arg4);
void EventLoadUnitWithMovement(struct EventEngineProc * proc);

u8 Event2C_LoadUnits(struct EventEngineProc * proc)
{
    u8 subcode = EVT_SUB_CMD(proc->pEventCurrent);
    u8 argument = EVT_CMD_ARGV(proc->pEventCurrent)[0];
    const struct UnitDefinition * ud = (const struct UnitDefinition *)EVT_CMD_ARG32_LE(proc->pEventCurrent);

    s16 count = proc->unitLoadCount;

    switch (subcode) {
    case 1:
        argument = 2;

    case 0:
    case 2:
        if ((int)(ud) < 0)
            ud = (const struct UnitDefinition *)(gEventSlots[2]);

        break;

    case 3:
        ud = GetChapterEnemyUnitDefinitions();

        break;
    } // switch (subcode)

    if (count == 0)
        count = GetLoadUnitsAmount(ud);

    ud = GetUnitDefinitionFormEventScr((void *)ud, count, proc->chance, subcode == 2, proc->diable_REDA);

    BmMapFill(gBmMapOther, 0);

    if (EVENT_IS_SKIPPING(proc) || (proc->evStateBits & EV_STATE_FADEDIN))
    {
        EventLoadUnitSliently(ud, count, argument);

        proc->unitLoadCount = 0;
        proc->chance = 0;
    }
    else
    {
        proc->pUnitLoadData = ud;
        proc->unitLoadCount = count;
        proc->unitLoadParameter = argument;

        proc->pCallback = EventLoadUnitWithMovement;
        proc->pCallback(proc);
    }

    proc->diable_REDA = FALSE;
    return EVC_ADVANCE_YIELD;
}
