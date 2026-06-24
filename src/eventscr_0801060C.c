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


u8 Event35_UnitClassChanging(struct EventEngineProc * proc)
{
    u8 subcmd = EVT_SUB_CMD(proc->pEventCurrent);
    s16 p0 = EVT_CMD_ARGV(proc->pEventCurrent)[0];
    s16 jid = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    s16 pid = EVT_CMD_ARGV(proc->pEventCurrent)[2];
    struct Unit * unit = GetUnitStructFromEventParameter(p0);
    if (!unit)
    {
        return EVC_ADVANCE_CONTINUE;
    }
    switch (subcmd)
    {
        case 0:
            if (jid == 0)
            {
                jid = gCharacterData[pid - 1].defaultClass;
            }
            unit->pClassData = GetClassData(jid);
            break;
        case 1:
        {
            s16 r4 = jid;
            jid = unit->pClassData->number;
            unit->pClassData = GetClassData(pid = gCharacterData[r4 - 1].defaultClass);
            unit = GetUnitFromCharId(r4);
            if (!unit)
            {
                return EVC_ADVANCE_CONTINUE;
            };
            unit->pClassData = GetClassData(jid);
            break;
        }
    }
    RefreshEntityBmMaps();
    RefreshUnitSprites();
    RenderBmMap();
    return EVC_ADVANCE_CONTINUE;
}
