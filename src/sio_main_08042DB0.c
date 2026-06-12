#include "global.h"
#include "fontgrp.h"
#include "hardware.h"
#include "uiutils.h"
#include "sio.h"
#include "sio_core.h"

void SioPollingMsgAndAck(ProcPtr proc)
{
    u16 magic = 0x2586;
    if (SioPollingMsg() != -1)
    {
        gSioSt->unk_011 = 0;
        gSioSt->unk_004 = 5;
        gSioSt->selfId = GetSioIndex();
        SioSend16(&magic, -1);
        Proc_Break(proc);
    }
}
