#include "global.h"
#include "fontgrp.h"
#include "hardware.h"
#include "uiutils.h"
#include "sio.h"
#include "sio_core.h"

void SioInit(void)
{
    SioRegisterIrq();
    Sio_ResetState();

    gSioSt->unk_001 = 1;
    gSioSt->unk_004 = 0;
}
