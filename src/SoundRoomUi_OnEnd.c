#include "global.h"
#include "hardware.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "bm.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmlib.h"
#include "ctc.h"
#include "sysutil.h"
#include "bmsave.h"
#include "soundroom.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd gProcScr_VolumeGraphBuffer[];

//! FE8U = 0x080AFA94
void SoundRoomUi_OnEnd(struct SoundRoomProc * proc)
{
    EndMuralBackground();
    EndAllProcChildren(proc);
    Proc_EndEach(gProcScr_VolumeGraphBuffer);

    return;
}
