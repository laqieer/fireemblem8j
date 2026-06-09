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

//! FE8U = 0x0801098C
struct BattleHit * GenerateScriptBattleHitFormEventQueue(void)
{
    u8 i;
    u32 * queueIt = gEventSlotQueue;
    struct BattleHit * bhIt = gActionData.script_hits;

    for (i = 0; i < gEventSlots[0xd] && ((u8 *)(queueIt))[0] != 0xff; bhIt++, queueIt++, i++)
    {
        bhIt->attributes = ((u16 *)(queueIt))[1];
        bhIt->info = 0;

        if (i == 0)
            bhIt->info |= BATTLE_HIT_INFO_BEGIN;

        if (((u8 *)(queueIt))[0] == 1)
            bhIt->info |= BATTLE_HIT_INFO_RETALIATION;

        bhIt->hpChange = ((u8 *)(queueIt))[1];
    }

    bhIt->info = BATTLE_HIT_INFO_END;
    return gActionData.script_hits;
}
