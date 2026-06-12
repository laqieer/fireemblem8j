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

void BgChangeChr(int, int);

/* file-scope type definitions used by this run */


struct MapCursorProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x64);

    /* 64 */ s16 x;
    /* 66 */ s16 y;
    /* 68 */ u16 subcmd;
    /* 6A */ u16 timer;
};

struct ProcEventPromote
{
    /* 00 */ PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x58);

    /* 58 */ struct EventEngineProc * event_engine;

    /* 5C */ STRUCT_PAD(0x5c, 0x64);

    /* 64 */ s16 lock;
};

//! FE8U = 0x08010298
u8 Event34_MessWithUnitState(struct EventEngineProc * proc)
{
    int i;

    const u8 allegianceLookup[3] = {
        [FACTION_ID_BLUE] = FACTION_BLUE,
        [FACTION_ID_GREEN] = FACTION_GREEN,
        [FACTION_ID_RED] = FACTION_RED,
    };

    u8 subcmd = EVT_SUB_CMD(proc->pEventCurrent);

    struct Unit * unit = GetUnitStructFromEventParameter(EVT_CMD_ARGV(proc->pEventCurrent)[0]);

    switch (subcmd) {
    case EVSUBCMD_CLEA:
    case EVSUBCMD_CLEN:
    case EVSUBCMD_CLEE:
        break;

    case EVSUBCMD_KILL:
    case EVSUBCMD_DISA_IF:
    case EVSUBCMD_DISA:
        if (!unit)
            return EVC_ADVANCE_CONTINUE;

        break;

    default:
        if (!unit)
            return EVC_ERROR;

        break;
    }

    switch (subcmd) {
    case EVSUBCMD_REMU:
        unit->state |= (US_HIDDEN | US_BIT16 | US_BIT26);
        break;

    case EVSUBCMD_REVEAL:
        unit->state &= ~(US_HIDDEN | US_BIT16 | US_BIT26);
        break;

    case EVSUBCMD_CUSA:
    case EVSUBCMD_CUSN:
    case EVSUBCMD_CUSE:
        UnitChangeFaction(unit, allegianceLookup[subcmd - 2]);
        break;

    case EVSUBCMD_SET_HP:
        SetUnitHp(unit, gEventSlots[1]);
        if (gEventSlots[1] == 0)
            unit->state |= US_DEAD;

        break;

    case EVSUBCMD_SET_ENDTURN:
        unit->state |= US_UNSELECTABLE;
        break;

    case EVSUBCMD_3427:
        unit->state |= US_HAS_MOVED;
        break;

    case EVSUBCMD_SET_STATE:
        switch (gEventSlots[1]) {
        case 1:
            unit->state &= ~US_NOT_DEPLOYED;
            break;

        case 0:
            unit->state |= US_NOT_DEPLOYED;
            break;

        case -1:
            if (unit->state & US_BIT21)
                unit->state |= US_NOT_DEPLOYED;
            else
                unit->state &= ~US_NOT_DEPLOYED;

            break;
        }

        break;

    case EVSUBCMD_3529:
        break;

    case EVSUBCMD_CLEA:
        EndAllMus();

        for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++)
        {
            struct Unit * it = GetUnit(i);
            if (!UNIT_IS_VALID(it))
                continue;

            it->state |= US_HIDDEN;
            it->state &= ~US_UNSELECTABLE;
            it->state &= ~(US_RESCUING | US_RESCUED);
        }
        ClearCutsceneUnits();
        break;

    case EVSUBCMD_CLEN:
        EndAllMus();

        for (i = FACTION_GREEN + 1; i < FACTION_RED; i++)
        {
            struct Unit * it = GetUnit(i);
            if (!UNIT_IS_VALID(it))
                continue;

            ClearUnit(it);
        }
        break;

    case EVSUBCMD_CLEE:
        EndAllMus();
        for (i = FACTION_RED + 1; i < FACTION_PURPLE; i++)
        {
            struct Unit * it = GetUnit(i);

            if (!UNIT_IS_VALID(it))
                continue;

            ClearUnit(it);
        }
        break;

    case EVSUBCMD_KILL:
        if (!EVENT_IS_SKIPPING(proc))
        {
            struct MuProc * muProc;

            HideUnitSprite(unit);
            unit->state |= US_HIDDEN;
            muProc = StartMu(unit);
            SetAutoMuDefaultFacing();
            MU_StartDeathFade(muProc);

            return EVC_ADVANCE_YIELD;
        }

        return EVC_ADVANCE_CONTINUE;

    case EVSUBCMD_DISA_IF:
    {
        s8 a = Proc_Find(ProcScr_MuDeathFade) != 0;
        if (-a | a)
            return EVC_STOP_YIELD;
    }

    // Fall through

    case EVSUBCMD_DISA:
        ClearUnit(unit);
        break;
    }

    RefreshEntityBmMaps();
    RefreshUnitSprites();
    RenderBmMap();

    return EVC_ADVANCE_CONTINUE;
}
