#include "global.h"
#include "constants/items.h"
#include "proc.h"
#include "mu.h"
#include "bmunit.h"
#include "fontgrp.h"
#include "statscreen.h"
#include "bmbattle.h"
#include "bmtrick.h"
#include "bmitem.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmmap.h"
#include "bmarch.h"
#include "bmusailment.h"
#include "bmudisp.h"
#include "bmsave.h"
#include "eventinfo.h"
#include "bmmind.h"
#include "bmtrap.h"
#include "popup.h"
#include "constants/songs.h"

int GetPickTrapType(struct Unit * unit)
{
    struct Trap * trap;

    if ((trap = GetTrapAt(unit->xPos, unit->yPos)) == NULL)
        return TRAP_NONE;

    switch (trap->type) {
    case TRAP_BALLISTA:
        return TRAP_NONE;

    case TRAP_FIRETILE:
        if ((UNIT_CATTRIBUTES(unit) & CA_THIEF))
            return TRAP_FIRE_THIEF;

        break;

    case TRAP_MINE:
        if ((UNIT_CATTRIBUTES(unit) & CA_ASSASSIN))
        {
            if (GetUnitItemCount(unit) != UNIT_ITEM_COUNT)
                return TRAP_MINE_ASSASSIN;

            return TRAP_NONE;
        } else if ((UNIT_CATTRIBUTES(unit) & CA_STEAL))
            return TRAP_NONE;

        break;
    }

    return trap->type;
}
