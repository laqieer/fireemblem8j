#include "global.h"
#include "bmunit.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "mu.h"
#include "bmmap.h"
#include "fontgrp.h"
#include "uimenu.h"
#include "statscreen.h"
#include "bmidoten.h"
#include "bmpatharrowdisp.h"
#include "event.h"
#include "bmitem.h"
#include "bmbattle.h"
#include "prepscreen.h"
#include "bmtrick.h"
#include "bmio.h"
#include "hardware.h"
#include "bmphase.h"
#include "bmmind.h"
#include "bmtrap.h"
#include "minimap.h"
#include "player_interface.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmsave.h"
#include "eventinfo.h"
#include "playerphase.h"
#include "constants/classes.h"
#include "constants/items.h"
#include "constants/songs.h"

//! FE8U = 0x0801D51C
int GetPlayerSelectKind(struct Unit * unit)
{
    u8 faction = gPlaySt.faction;

    if (!unit)
    {
        return PLAYER_SELECT_NOUNIT;
    }

    if (gBmSt.gameStateBits & BM_FLAG_PREPSCREEN)
    {
        if (!CanCharacterBePrepMoved(unit->pCharacterData->number))
        {
            return PLAYER_SELECT_4;
        }

        faction = FACTION_BLUE;
    }

    if (!unit)
    {
        return PLAYER_SELECT_NOUNIT;
    }

    if (UNIT_FACTION(unit) != faction)
    {
        return PLAYER_SELECT_NOCONTROL;
    }

    if (unit->state & US_UNSELECTABLE)
    {
        return PLAYER_SELECT_TURNENDED;
    }

    if (UNIT_CATTRIBUTES(unit) & CA_UNSELECTABLE)
    {
        return PLAYER_SELECT_TURNENDED;
    }

    if ((unit->statusIndex != UNIT_STATUS_SLEEP) && (unit->statusIndex != UNIT_STATUS_BERSERK))
    {
        return PLAYER_SELECT_CONTROL;
    }

    return PLAYER_SELECT_NOCONTROL;
}
