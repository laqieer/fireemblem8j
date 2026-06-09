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



/* prototypes for same-file helpers called by this run */
void StartSioMuFadeRestore(struct MuProc * muProc);

//! FE8U = 0x0804C1D8
void SioWarpFx_1(struct SioWarpProc * proc)
{
    StartSioMuFadeRestore(proc->muProc);
    return;
}
