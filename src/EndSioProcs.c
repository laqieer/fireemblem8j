#include "global.h"
#include "bmsave.h"
#include "bmunit.h"
#include "soundwrapper.h"
#include "scene.h"
#include "hardware.h"
#include "bmlib.h"
#include "face.h"
#include "rng.h"
#include "sioerror.h"
#include "sio.h"
#include "sio_core.h"
#include "constants/faces.h"
#include "constants/msg.h"
#include "constants/songs.h"

//! FE8U = 0x08045CBC
void EndSioProcs(void)
{
    Proc_EndEach(ProcScr_SIOVSYNC);
    Proc_EndEach(ProcScr_SIOMAIN);
    Proc_EndEach(ProcScr_SIOCON);
    return;
}
