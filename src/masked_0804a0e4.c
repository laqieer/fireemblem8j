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

//! FE8U = 0x080492E8
void LinkArenaBattleMap_AdvancePhase(int faction)
{
    int current = faction;
    int next = FACTION_ID_BLUE;

    while (1)
    {
        switch (current)
        {
            case FACTION_ID_BLUE:
                next = FACTION_ID_RED;
                break;

            case FACTION_ID_GREEN:
                next = FACTION_ID_PURPLE;
                break;

            case FACTION_ID_RED:
                next = FACTION_ID_GREEN;
                break;

            case FACTION_ID_PURPLE:
                next = FACTION_ID_BLUE;
                break;

            case 0xFF:
                next = 0xFF;
                break;
        }

        if (gUnk_Sio_16.unk_0A[next] != 0 || next == 0xFF)
        {
            break;
        }

        current = next;
    }

    gUnk_Sio_16.unk_01 = next;

    return;
}
