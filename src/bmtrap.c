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





void ApplyTrapDamageAnim(struct ProcBmTrap * proc)
{
    struct Unit * unit = proc->unit;

    switch (proc->post_exec_type) {
    case 0:
        EndAllMus();
        break;

    case 1:
        EndAllMus();
        StartMu(gActiveUnit);
        SetAutoMuDefaultFacing();
        break;

    case 2:
        EndMu(GetUnitMu(unit));
        break;
    }

    gActionData.trapType = TRAP_TORCHLIGHT;
    BeginUnitCritDamageAnim(unit, TRAP_TORCHLIGHT);
}

void ApplyTrapDamageReal(struct ProcBmTrap * proc)
{
    struct Unit * unit = proc->unit;

    ApplyHazardHealing(proc, unit, -10, -1);

    if (GetUnitCurrentHp(unit) == 0)
    {
        struct Unit * tmp = gActiveUnit;
        gActiveUnit = unit;
        
        PidStatsRecordDefeatInfo(unit->pCharacterData->number, 0, 3);

        if (CheckForWaitEvents() != 0)
            RunWaitEvents();

        gActiveUnit = tmp;
    }
}
