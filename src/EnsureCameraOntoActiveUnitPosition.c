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

//! FE8U = 0x0801D31C
bool EnsureCameraOntoActiveUnitPosition(ProcPtr proc)
{
    int new_var;
    new_var = EnsureCameraOntoPosition(proc, gActiveUnit->xPos, gActiveUnit->yPos);
    return !new_var;
}
