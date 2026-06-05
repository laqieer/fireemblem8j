

#include "global.h"
#include "functions.h"
#include "variables.h"
#include "proc.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "mu.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "bmio.h"
#include "hardware.h"
#include "ap.h"
#include "bm.h"
#include "mapanim.h"

void MapEventBattle_SetUpHitData(ProcPtr proc)
{
    if (gManimSt.pCurrentRound->info & BATTLE_HIT_INFO_END) {
        Proc_Goto(proc, 1); // TODO: label definitions
        return;
    }

    MapAnim_AdvanceBattleRound();
    Proc_Break(proc);
}
