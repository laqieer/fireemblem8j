/**
 * Most "ASMCs" are here (functions called through chapter events)
 * Exceptions include the Suspend effect function and probably other
 * system (non-chapter) functions called through events
 */

#include "global.h"
#include "variables.h"
#include "functions.h"
#include "constants/video-global.h"
#include "constants/characters.h"
#include "constants/items.h"
#include "bmlib.h"
#include "proc.h"
#include "event.h"
#include "soundwrapper.h"
#include "gamecontrol.h"
#include "bmio.h"
#include "hardware.h"
#include "bmunit.h"
#include "bmmap.h"
#include "mu.h"
#include "bmreliance.h"
#include "bmtrick.h"
#include "bmdifficulty.h"
#include "ctc.h"
#include "fontgrp.h"
#include "uimenu.h"
#include "bmmind.h"
#include "uiutils.h"
#include "bmbattle.h"
#include "bmitem.h"
#include "bmudisp.h"
#include "bmsave.h"
#include "ekrbattle.h"
#include "prepscreen.h"
#include "eventinfo.h"
#include "mapanim.h"
#include "muctrl.h"
#include "scene.h"
#include "sysutil.h"

#include "eventcall.h"
#include "constants/songs.h"



void StartUnitTornOut(struct Unit * unit, ProcPtr parent)
{
    struct ProcUnitTornOut * proc;
    proc = Proc_Start(ProcScr_UnitTornOut, parent);
    proc->unit = unit;
}
