#include "global.h"
#include <stdlib.h>
#include "proc.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "icon.h"
#include "fontgrp.h"
#include "bmio.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmreliance.h"
#include "uiutils.h"
#include "mu.h"
#include "face.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmsave.h"
#include "prepscreen.h"
#include "helpbox.h"
#include "bmlib.h"
#include "constants/classes.h"
#include "statscreen.h"
#include "constants/songs.h"

void HbPopulate_SSStatus(struct HelpBoxProc* proc)
{
    switch (gStatScreen.unit->statusIndex)
    {

    case UNIT_STATUS_NONE:
        proc->mid = 0x4E7; // TODO: mid constants
        break;

    case UNIT_STATUS_POISON:
        proc->mid = 0x4E8; // TODO: mid constants
        break;

    case UNIT_STATUS_SLEEP:
        proc->mid = 0x4E9; // TODO: mid constants
        break;

    case UNIT_STATUS_SILENCED:
        proc->mid = 0x4EB; // TODO: mid constants
        break;

    case UNIT_STATUS_BERSERK:
        proc->mid = 0x4EA; // TODO: mid constants
        break;

    case UNIT_STATUS_ATTACK:
        proc->mid = 0x4ED; // TODO: mid constants
        break;

    case UNIT_STATUS_DEFENSE:
        proc->mid = 0x4EE; // TODO: mid constants
        break;

    case UNIT_STATUS_CRIT:
        proc->mid = 0x4EF; // TODO: mid constants
        break;

    case UNIT_STATUS_AVOID:
        proc->mid = 0x4F0; // TODO: mid constants
        break;

    case UNIT_STATUS_PETRIFY:
    case UNIT_STATUS_13:
        proc->mid = 0x4EC; // TODO: mid constants
        break;

    } // switch (gStatScreen.unit->statusIndex)
}
