#include "global.h"
#include "fontgrp.h"
#include "statscreen.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmbattle.h"
#include "hardware.h"
#include "face.h"
#include "mu.h"
#include "icon.h"
#include "bm.h"
#include "bmlib.h"
#include "bmudisp.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmio.h"
#include "helpbox.h"
#include "worldmap.h"
#include "constants/songs.h"

struct WorldmapStatusProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ struct Unit * unit;
    /* 30 */ struct MuProc * muProc;
    /* 34 */ struct Text text[2];
};

//! FE8U = 0x080C0A10
void WorldmapStatus_GetCharDescription(struct HelpBoxProc * proc)
{
    struct WorldmapStatusProc * statusProc = Proc_Find(ProcScr_WorldmapStatusUi);

    if (statusProc->unit->pCharacterData->descTextId)
    {
        proc->mid = statusProc->unit->pCharacterData->descTextId;
    }
    else
    {
        proc->mid = 0x63F; // TODO: msgid "There are no messages for[.][NL]this menu item.[.]"
    }

    return;
}
