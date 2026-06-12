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

u8 Event19_Checks(struct EventEngineProc * proc)
{
    u8 subcode = EVT_SUB_CMD(proc->pEventCurrent);
    switch (subcode) {
    case EVSUBCMD_CHECK_MODE: // Check Mode
        gEventSlots[0xC] = gPlaySt.chapterModeIndex;
        break;

    case EVSUBCMD_CHECK_CHAPTER_NUMBER: // Check (Next?) Chapter Index
        gEventSlots[0xC] = proc->chapterIndex;
        break;

    case EVSUBCMD_CHECK_HARD: // Check Difficult Mode
        if (!(gPlaySt.chapterStateBits & PLAY_FLAG_HARD))
            gEventSlots[0xC] = FALSE;
        else
            gEventSlots[0xC] = TRUE;

        break;

    case EVSUBCMD_CHECK_TURNS: // Check Turn Number
        gEventSlots[0xC] = gPlaySt.chapterTurnNumber;
        break;

    case EVSUBCMD_CHECK_ENEMIES: // Check Red Unit Count
        gEventSlots[0xC] = CountRedUnits();
        break;

    case EVSUBCMD_CHECK_OTHERS: // Check Green Unit Count
        gEventSlots[0xC] = CountGreenUnits();
        break;

    case EVSUBCMD_CHECK_SKIRMISH: // Check Chapter Type?
        gEventSlots[0xC] = GetBattleMapKind();
        break;

    case EVSUBCMD_CHECK_TUTORIAL: // Check Some option or difficult mode
        if (gPlaySt.config.controller || (gPlaySt.chapterStateBits & PLAY_FLAG_HARD))
            gEventSlots[0xC] = FALSE;
        else
            gEventSlots[0xC] = TRUE;

        break;

    case EVSUBCMD_CHECK_MONEY: // Check gold
        gEventSlots[0xC] = GetPartyGoldAmount();
        break;

    case EVSUBCMD_19CHECK_EVENTID: // Check Event Trigger ID
        gEventSlots[0xC] = GetEventTriggerId(proc->pEventStart);
        break;

    case EVSUBCMD_CHECK_POSTGAME: // Check Game Complete
        if (gPlaySt.chapterStateBits & PLAY_FLAG_COMPLETE)
            gEventSlots[0xC] = TRUE;
        else
            gEventSlots[0xC] = FALSE;

        break;

    default:
        break;
    } // switch (subcode)

    return EVC_ADVANCE_CONTINUE;
}
