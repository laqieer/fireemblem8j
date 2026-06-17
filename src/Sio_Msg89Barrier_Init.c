#include "global.h"
#include "fontgrp.h"
#include "hardware.h"
#include "uiutils.h"
#include "sio.h"
#include "sio_core.h"




void Sio_Msg89Barrier_Init(void)
{
    gSioSt->unk_00A = 1 << gSioSt->selfId;
}
