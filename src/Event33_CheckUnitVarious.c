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

//! FE8U = 0x08010110
u8 Event33_CheckUnitVarious(struct EventEngineProc * proc)
{
    u8 subcmd = EVT_SUB_CMD(proc->pEventCurrent);

    int pid = EVT_CMD_ARGV(proc->pEventCurrent)[0];
    struct Unit * unit = GetUnitStructFromEventParameter(pid);

    switch (subcmd) {
    case EVSUBCMD_CHECK_EXISTS:
        if (unit)
            gEventSlots[0xC] = 1;
        else
            gEventSlots[0xC] = 0;

        break;

    case EVSUBCMD_CHECK_STATUS:
        if (!unit)
            return EVC_ERROR;

        gEventSlots[0xC] = unit->pCharacterData->visit_group;

        break;

    case EVSUBCMD_CHECK_ALIVE:
        if (!unit)
        {
            gEventSlots[0xC] = 0;
            break;
        }

        if (unit->state & US_DEAD)
            gEventSlots[0xC] = 0;
        else
            gEventSlots[0xC] = 1;

        break;

    case EVSUBCMD_CHECK_DEPLOYED:
        if (!unit)
            return EVC_ERROR;

        if (unit->state & US_NOT_DEPLOYED)
            gEventSlots[0xC] = 0;
        else
        {
            if (unit->xPos >= 0)
                gEventSlots[0xC] = 1;
            else
                gEventSlots[0xC] = 0;
        }

        break;

    case EVSUBCMD_CHECK_ACTIVEID:
        if (!unit)
            return EVC_ERROR;

        if (gActiveUnit->pCharacterData->number != pid)
            gEventSlots[0xC] = 0;
        else
            gEventSlots[0xC] = 1;

        break;

    case EVSUBCMD_CHECK_ALLEGIANCE:
        if (!unit)
            return EVC_ERROR;

        switch (UNIT_FACTION(unit)) {
        case FACTION_BLUE:
            gEventSlots[0xC] = FACTION_ID_BLUE;
            break;

        case FACTION_RED:
            gEventSlots[0xC] = FACTION_ID_RED;
            break;

        default:
            gEventSlots[0xC] = FACTION_ID_GREEN;
            break;
        }

        break;

    case EVSUBCMD_CHECK_COORDS:
        if (!unit)
            return EVC_ERROR;

        ((u16 *)(gEventSlots + 0xC))[0] = unit->xPos;
        ((u16 *)(gEventSlots + 0xC))[1] = unit->yPos;

        break;

    case EVSUBCMD_CHECK_CLASS:
        if (!unit)
            return EVC_ERROR;

        gEventSlots[0xC] = unit->pClassData->number;

        break;

    case EVSUBCMD_CHECK_LUCK:
        if (!unit)
            return EVC_ERROR;

        gEventSlots[0xC] = GetUnitLuck(unit);

        break;
    }

    return EVC_ADVANCE_CONTINUE;
}
