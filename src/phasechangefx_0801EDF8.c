#include "global.h"
#include "functions.h"
#include "variables.h"
#include "gbaio.h"
#include "ctc.h"
#include "hardware.h"
#include "proc.h"
#include "soundwrapper.h"
#include "uiutils.h"
#include "bmphase.h"
#include "bmunit.h"
#include "bm.h"
#include "bmlib.h"
#include "phasechangefx.h"
#include "constants/video-global.h"
#include "constants/songs.h"

/*
 * The nice phase changing animation thing and related procs/functions
 * port from fe6@StanHash
 */

int CheckInLinkArena();

/* section.data */













void PhaseIntroBlendBox_InLoop(struct PhaseIntroSubProc *proc)
{
    int yoff, blend;

    yoff = Interpolate(INTERPOLATE_RCUBIC, 16, 60, proc->timer, 0x20);

    SetWin0Box(0, 8 + yoff, DISPLAY_WIDTH, -0x60 - yoff);

    blend = Interpolate(INTERPOLATE_LINEAR, 0, 7, proc->timer, 0x20);

    gBmSt.altBlendBCa = blend;
    gBmSt.altBlendBCb = 0x10 - blend;

    proc->timer++;

    if (proc->timer == 0x20)
        Proc_Break(proc);
}
