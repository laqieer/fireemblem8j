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

bool ExecTrapAfterDropAction(ProcPtr proc, struct Unit * unit)
{
    if (!GetPickTrapType(unit)) {
        EndMu(GetUnitMu(unit));
        RenderBmMap();
        RefreshEntityBmMaps();
        ForceSyncUnitSpriteSheet();
        return 1;
    }

    return ExecTrap(proc, unit, 2);
}
