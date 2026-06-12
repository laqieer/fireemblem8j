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

//! FE8U = 0x0804C1E4
void SioWarpFx_AwaitSioWarp(ProcPtr proc)
{
    s8 found = Proc_Find(ProcScr_SIOWARP) != NULL;

    if (!found)
    {
        Proc_Break(proc);
    }

    return;
}
