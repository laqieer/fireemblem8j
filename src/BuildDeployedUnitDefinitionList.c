extern int GetNextDeployedPlayerUnitId();
#include "global.h"
#include "bmunit.h"
#include "prepscreen.h"
#include "chapterdata.h"
#include "fontgrp.h"
#include "hardware.h"
#include "bmlib.h"
#include "bm.h"
#include "bmusemind.h"
#include "cp_common.h"
#include "cp_perform.h"
#include "bmudisp.h"
#include "bmmap.h"
#include "bmitem.h"
#include "bmmind.h"
#include "bmbattle.h"
#include "mu.h"
#include "ekrbattle.h"
#include "mapanim.h"
#include "bmtrick.h"
#include "ctc.h"
#include "muctrl.h"
#include "cgtext.h"
#include "eventcall.h"
#include "constants/items.h"

//! FE8U = 0x080125C0
void BuildDeployedUnitDefinitionList(struct UnitDefinition * uDef)
{
    int pid = GetPlayerLeaderPid();
    struct Unit * unit = GetUnitFromCharId(pid);

    if (unit)
    {
        if (!(unit->state & US_NOT_DEPLOYED))
        {
            uDef->charIndex = unit->pCharacterData->number;
            uDef->classIndex = unit->pClassData->number;
            uDef->autolevel = 0;

            uDef++;
        }
    }

    pid = 0;

    while (uDef->charIndex != 0)
    {
        pid = GetNextDeployedPlayerUnitId(pid);

        if (pid == 0)
        {
            break;
        }

        unit = GetUnit(pid);

        pid++;

        uDef->charIndex = unit->pCharacterData->number;
        uDef->classIndex = unit->pClassData->number;
        uDef->autolevel = 0;

        uDef++;
    }

    uDef->charIndex = 0;

    return;
}
