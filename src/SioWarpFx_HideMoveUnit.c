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

//! FE8U = 0x0804C188
void SioWarpFx_HideMoveUnit(struct SioWarpProc * proc)
{
    HideMu(proc->muProc);
    return;
}
