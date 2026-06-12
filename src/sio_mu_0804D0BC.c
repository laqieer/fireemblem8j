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

//! FE8U = 0x0804C31C
void EndLinkArenaButtonSpriteDraw(void)
{
    if (Proc_Find(ProcScr_LAButtonSpriteDraw) != NULL)
    {
        Proc_EndEach(ProcScr_LAButtonSpriteDraw);
    }

    return;
}
