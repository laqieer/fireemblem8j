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

// clang-format on

//! FE8U = 0x0804C2EC
void StartLinkArenaButtonSpriteDraw(int x, int y, ProcPtr parent)
{
    struct SioProc85AA954 * proc;

    Proc_EndEach(ProcScr_LAButtonSpriteDraw);

    proc = Proc_Start(ProcScr_LAButtonSpriteDraw, parent);

    proc->x = x;
    proc->y = y;

    return;
}
