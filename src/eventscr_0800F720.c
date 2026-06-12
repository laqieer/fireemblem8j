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

//! FE8U = 0x0800F528
s8 ShouldUNITBeLoaded(const struct UnitDefinition * unitDefinition, u8 unk)
{
    const u8 tmp = unk; // needed to match :/

    if (unitDefinition->allegiance == 0 && tmp != 1)
    {
        struct Unit * unit = GetUnitFromCharId(unitDefinition->charIndex);

        if (unit && (unit->state & US_DEAD))
        {
            switch (tmp)
            {

                case 0:
                    return FALSE;

                case 2:
                    if (IsSethLArachelMyrrhInnes(unitDefinition->charIndex))
                        break;

                    return FALSE;
            }
        }
    }

    if (unitDefinition->allegiance != FACTION_ID_RED)
        return TRUE;

    if (!unitDefinition->sumFlag && !unitDefinition->redaCount)
    {
        if (gBmMapUnit[unitDefinition->yPosition][unitDefinition->xPosition])
            return FALSE;
    }

    if (IsUnitSlotAvailable(0x80))
        return TRUE;

    return FALSE;
}
