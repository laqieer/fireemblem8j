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

//! FE8U = 0x0800F3EC
u8 Event27_MapChange(struct EventEngineProc * proc)
{
    u8 i;
    u8 count = 1;

    u32 * mapChangeIt;

    u8 subcode = EVT_SUB_CMD(proc->pEventCurrent);
    s16 mapChangeId = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    switch (mapChangeId) {
    case (-1): // "at position in Slot B"
        mapChangeId = GetMapChangeIdAt(((u16 *)(gEventSlots + 0xB))[0], ((u16 *)(gEventSlots + 0xB))[1]);

        if (mapChangeId < 0)
            return EVC_ERROR;

        break;

    case (-2): // "at position of active unit"
        mapChangeId = GetMapChangeIdAt((u8)(gActiveUnit->xPos), (u8)(gActiveUnit->yPos));

        if (mapChangeId < 0)
            return EVC_ERROR;

        break;

    case (-3):
        mapChangeIt = gEventSlotQueue;

        mapChangeId = *mapChangeIt++;
        count = gEventSlots[0xD]; // qp

        break;
    } // switch (mapChangeId)

    if (proc->evStateBits & EV_STATE_FADEDIN)
    {
        // Quietly apply tile changes

        for (i = 0; i < count; ++i)
        {
            switch (subcode) {
            case EVSUBCMD_TILECHANGE:
                TriggerMapChanges(mapChangeId, FALSE, proc);
                break;

            case EVSUBCMD_TILEREVERT:
                UntriggerMapChange(mapChangeId, FALSE, proc);
                break;
            } // switch (subcode)

            mapChangeId = *mapChangeIt++; // ??? potentially not initialized?
        }
    }
    else
    {
        // Display tile changes

        u8 doDisplay = TRUE;

        for (i = 0; i < count; ++i)
        {
            switch (subcode)
            {
                case 0:
                    TriggerMapChanges(mapChangeId, doDisplay, proc);
                    break;

                case 1:
                    UntriggerMapChange(mapChangeId, doDisplay, proc);
                    break;

            } // switch (subcode)

            mapChangeId = *mapChangeIt++; // ??? potentially not initialized?
            doDisplay = FALSE;            // Only display the first listed map change
        }
    }

    return EVC_ADVANCE_YIELD;
}
