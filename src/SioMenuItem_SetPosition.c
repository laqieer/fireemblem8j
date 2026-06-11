#include "global.h"
#include "hardware.h"
#include "bm.h"
#include "bmlib.h"
#include "ctc.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "uiutils.h"
#include "prepscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "phasechangefx.h"
#include "sio_core.h"
#include "sio.h"
#include "constants/songs.h"

//! FE8U = 0x0804C7DC
void SioMenuItem_SetPosition(struct SioMenuItemProc * proc, s16 x, s16 y)
{
    proc->xBase = x;
    proc->yBase = y;

    return;
}
