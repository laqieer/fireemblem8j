#include "global.h"
extern struct ProcCmd ProcScr_SIORESULT_NewHighScore[];
#include "hardware.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "bmsave.h"
#include "constants/msg.h"
#include "sio.h"

// clang-format on

//! FE8U = 0x08047654
void StartSioResultNewHighScore(int value, ProcPtr parent)
{
    struct SioResultProc * proc = Proc_StartBlocking(ProcScr_SIORESULT_NewHighScore, parent);

    proc->unk_3c = value;

    return;
}
