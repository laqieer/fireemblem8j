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

//! FE8U = 0x0804C1B8
void SioWarpFx_ShowMoveUnit(struct SioWarpProc * proc)
{
    if (proc->facing != -1)
    {
        SetMuFacing(proc->muProc, proc->facing);
    }

    ShowMu(proc->muProc);

    return;
}
