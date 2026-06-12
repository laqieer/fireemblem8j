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

//! FE8U = 0x0804C148
void SioWarpFx_StartSioWarp(struct SioWarpProc * parent)
{
    struct SioWarpProc * proc = Proc_Start(ProcScr_SIOWARP, PROC_TREE_2);

    proc->x = parent->unit->xPos * 2;
    proc->y = parent->unit->yPos * 2;

    proc->playStepSe = parent->playStepSe;

    return;
}
