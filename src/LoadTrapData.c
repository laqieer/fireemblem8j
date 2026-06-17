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




void LoadTrapData(const struct TrapData * data)
{
    if (!data || !data->type)
        return;

    while (data->type)
    {
        switch (data->type) {
        case TRAP_BALLISTA:
            AddBallista(data->xPos, data->yPos, data->subtype);
            break;

        case TRAP_FIRETILE:
            AddFireTile(data->xPos, data->yPos, data->turn_counter, data->turn);
            break;

        case TRAP_GAS:
            AddGasTrap(data->xPos, data->yPos, data->subtype, data->turn_counter, data->turn);
            break;

        case TRAP_8:
            AddTrap8(data->xPos, data->yPos);
            break;

        case TRAP_9:
            AddTrap9(data->xPos, data->yPos, data->subtype);
            break;

        case TRAP_MINE:
            AddTrap(data->xPos, data->yPos, data->type, 0);
            break;

        case TRAP_LIGHTARROW:
            AddArrowTrap(data->xPos, data->turn_counter, data->turn);
#if BUGFIX
            break;
#endif

        case TRAP_GORGON_EGG:
            AddGorgonEggTrap(data->xPos, data->yPos, data->subtype, data->turn_counter, data->turn);
            break;
        }
        data++;
    }
}
