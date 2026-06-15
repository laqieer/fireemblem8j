#include "global.h"
#include "ctc.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "uiutils.h"
#include "bmunit.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "sio_core.h"
#include "sio.h"
#include "constants/songs.h"

//! FE8U = 0x08048A94
extern struct ProcCmd ProcScr_LinkArenaPointsBox[];

void EndLinkArenaPointsBox(void)
{
    Proc_EndEach(ProcScr_LinkArenaPointsBox);
    ClearBg0Bg1();

    return;
}
