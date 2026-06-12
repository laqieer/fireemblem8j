#include "global.h"
#include "fontgrp.h"
#include "hardware.h"
#include "uiutils.h"
#include "sio.h"
#include "sio_core.h"

void Sio_SyncBarrier_Loop(ProcPtr proc)
{
    gSioSt->unk_030 = 0x1286;
    if (gSioSt->unk_1B7E != 0)
        Proc_Break(proc);
}
