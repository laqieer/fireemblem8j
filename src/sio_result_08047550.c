#include "global.h"

#include "hardware.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "bmsave.h"

#include "constants/msg.h"

#include "sio.h"

//! FE8U = 0x0804762C
void SioResult_NewHS_AwaitAPress(ProcPtr proc)
{
    if ((gKeyStatusPtr->newKeys & A_BUTTON) != 0)
    {
        Sound_FadeOutBGM(0);
        Proc_Break(proc);
    }

    return;
}
