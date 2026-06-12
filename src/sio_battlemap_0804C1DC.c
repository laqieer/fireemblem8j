#include "global.h"

#include "bmunit.h"
#include "bmudisp.h"
#include "mu.h"
#include "bmmap.h"
#include "chapterdata.h"
#include "bmtrick.h"
#include "bmlib.h"
#include "fontgrp.h"
#include "hardware.h"
#include "bm.h"
#include "bmio.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmitem.h"
#include "icon.h"
#include "uimenu.h"
#include "bksel.h"
#include "bmbattle.h"
#include "uiutils.h"
#include "bmmind.h"
#include "popup.h"
#include "cp_common.h"
#include "cp_perform.h"
#include "ctc.h"
#include "scene.h"
#include "helpbox.h"
#include "mapanim.h"
#include "ekrbattle.h"
#include "event.h"
#include "eventcall.h"
#include "eventscript.h"
#include "EAstdlib.h"

#include "sio_core.h"
#include "sio.h"

#include "constants/msg.h"
#include "constants/songs.h"
#include "constants/terrains.h"

/* prototypes for same-file helpers called by this run */
void LinkArenaBattleMap_AdvancePhase(int faction);

//! FE8U = 0x0804B43C
void LABattleMap_Ai_HandleSurrender(struct SioBattleMapProc * proc)
{
    if (gUnk_Sio_16.unk_08 == 0)
    {
        Proc_Goto(proc, proc->unk_58);
        return;
    }

    EndAllMus();
    EndAllMus();

    gLinkArenaSt.unk_0B = 1;

    LinkArenaBattleMap_AdvancePhase(0xff);

    Proc_Goto(proc, 5);

    return;
}
