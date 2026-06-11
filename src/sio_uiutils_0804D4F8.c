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

// clang-format on

//! FE8U = 0x0804C758
ProcPtr StartSioMenuItem(ProcPtr parent, u8 xBase, u8 yBase, u8 index, u8 state)
{
    struct SioMenuItemProc * proc = Proc_Start(ProcScr_SioMenuItem, parent);

    proc->xBase = xBase;
    proc->yBase = yBase;
    proc->state = state;
    proc->index = index;
    proc->xLeftArrow = 0;
    proc->xRightArrow = 52;
    proc->rightArrowAnmCnt = 0;
    proc->leftArrowAnmCnt = 0;
    proc->rightArrowSpeed = 4;
    proc->leftArrowSpeed = 4;
    proc->unk_3e = 0;
    proc->glowFrame = 0;

    return proc;
}
