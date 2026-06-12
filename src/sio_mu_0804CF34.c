#include "global.h"
#include "sio.h"
#include "hardware.h"
#include "bmlib.h"
#include "mu.h"
#include "ap.h"
#include "soundwrapper.h"
#include "m4a.h"
#include "bmunit.h"
#include "ctc.h"
#include "constants/songs.h"

// clang-format off

extern u16 * CONST_DATA PalArray_SolidColors[];

//! FE8U = 0x0804C194
void SioWarpFx_SetMUPosition(struct SioWarpProc * proc)
{
    SetMuScreenPosition(proc->muProc, proc->x * 16, proc->y * 16);

    proc->unit->xPos = proc->x;
    proc->unit->yPos = proc->y;

    return;
}
