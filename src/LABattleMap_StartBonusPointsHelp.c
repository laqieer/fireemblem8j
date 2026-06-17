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




void LABattleMap_StartBonusPointsHelp(struct SioBattleMapProc * proc)
{
    int i;

    LoadHelpBoxGfx(OBJ_CHR_ADDR(0x280), 6);
    StartHelpBoxExt_Unk(64, 56, 0x6e1); // "Each unit receives 30 extra pts."

    for (i = 0; i < 4; i++)
    {
        if (!Sio_IsPlayerConnected(i))
        {
            continue;
        }

        if (gUnk_Sio_16.unk_0A[i] == 0)
        {
            continue;
        }

        proc->unk_58 = i;
    }

    proc->unk_5c = 0;

    return;
}
