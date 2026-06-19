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

u8 Event45_GlowingCross(struct EventEngineProc * proc)
{
    u8 subcmd = EVT_SUB_CMD(proc->pEventCurrent);

    struct Unit * unit = GetUnitStructFromEventParameter(EVT_CMD_ARGV(proc->pEventCurrent)[0]);
    if (!unit)
    {
        return EVC_ERROR;
    }

    switch (subcmd)
    {
        case EVSUBCMD_GLOWINGCROSS:
            if (!EVENT_IS_SKIPPING(proc))
            {
                StartGlowingCross(proc, unit);
            }

            break;

        case EVSUBCMD_GLOWINGCROSS_END:
            if (!EVENT_IS_SKIPPING(proc))
            {
                RemoveGlowingCrossDirectlyWithAnim(proc, 0x78);
                return EVC_ADVANCE_YIELD;
            }

            RemoveGlowingCrossDirectly();

            break;
    }

    return EVC_ADVANCE_CONTINUE;
}
