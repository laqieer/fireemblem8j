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

u8 Event39_ChangeAiScript(struct EventEngineProc * proc)
{
    u8 subcmd = EVT_SUB_CMD(proc->pEventCurrent);

    u8 ai1 = gEventSlots[1];
    u8 ai2 = (gEventSlots[1] >> 8);
    u8 unused = (gEventSlots[1] >> 16);

    struct Unit * unit;
    int x, y;
    int pid;

    switch (subcmd) {
    case EVTSUBCMD_CHAI:
        pid = EVT_CMD_ARGV(proc->pEventCurrent)[0];
        if (pid < 0)
            pid = (s16)gEventSlots[2];

        ChangeAiForCharacter(pid, ai1, ai2, unused);

        break;

    case EVTSUBCMD_CHAI_AT:

        x = (s8)EVT_CMD_ARGV(proc->pEventCurrent)[0];
        y = EVT_CMD_ARGV(proc->pEventCurrent)[0] >> 8;

        if (x < 0 || y < 0)
        {
            x = (s8)((u16 *)(gEventSlots + 0xB))[0];
            y = (s8)((u16 *)(gEventSlots + 0xB))[1];
        }

        if (gBmMapUnit[y][x] != 0)
            unit = GetUnit(gBmMapUnit[y][x]);
        else
            unit = NULL;

        ChangeUnitAi(unit, ai1, ai2, unused);

        break;
    }

    return EVC_ADVANCE_CONTINUE;
}
