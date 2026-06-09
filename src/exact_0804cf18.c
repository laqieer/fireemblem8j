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
void StartSioMuFadeToColor(struct MuProc * muProc, int palIdx);

//! FE8U = 0x0804C178
void SioWarpFx_0(struct SioWarpProc * proc)
{
    StartSioMuFadeToColor(proc->muProc, 0);
    return;
}
