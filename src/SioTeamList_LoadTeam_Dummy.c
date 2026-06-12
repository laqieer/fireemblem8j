#include "global.h"
#include "bmunit.h"
#include "bmsave.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "bmudisp.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "unitlistscreen.h"
#include "uiutils.h"
#include "prepscreen.h"
#include "sio_core.h"
#include "sio.h"
#include "constants/msg.h"
#include "constants/songs.h"

//! FE8U = 0x08044530
void SioTeamList_LoadTeam_Dummy(struct SioTeamListProc * proc)
{
    // Probably dummied-out logic for the FE6 Link Arena password

    char buf[16];

    ReadMultiArenaSaveTeam(proc->unk_40, GetUnit(1), buf);

    return;
}
