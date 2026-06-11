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

// clang-format off

extern struct ProcCmd CONST_DATA gProcScr_PlayerPhase[];



/* The move-limit-view open animation is 6 uniform frames of 4 tiles (32x8 px) each. */
#define LIMIT_VIEW_FRAME_SIZE (4 * CHR_SIZE)

extern u8 * CONST_DATA gOpenLimitViewImgLut[];



extern struct ProcCmd CONST_DATA sProcScr_MoveLimitView[];

//! FE8U = 0x0801DBA4
void PlayerPhase_HandleAutoEnd(ProcPtr proc)
{
    if (!(gPlaySt.config.disableAutoEndTurns) && (GetPhaseAbleUnitCount(gPlaySt.faction) == 0))
    {
        Proc_Goto(proc, 3);
    }

    return;
}
