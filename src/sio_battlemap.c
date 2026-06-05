

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

//! FE8U = 0x08049298
void LinkArenaBattleMap_BackupUnitItems(struct Unit * unit)
{
    int i;

    for (i = 0; i < UNIT_ITEM_COUNT; i++)
    {
        gUnk_47[i] = unit->items[i];
    }

    return;
}

//! FE8U = 0x080492B8
void LinkArenaBattleMap_RestoreUnitItems(struct Unit * unit)
{
    int i;

    for (i = 0; i < UNIT_ITEM_COUNT; i++)
    {
        unit->items[i] = gUnk_47[i];
    }

    return;
}
