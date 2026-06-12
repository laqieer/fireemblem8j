#include "global.h"

#include "fontgrp.h"
#include "uiutils.h"
#include "hardware.h"
#include "bmsave.h"
#include "scene.h"
#include "soundwrapper.h"
#include "m4a.h"
#include "agb_sram.h"
#include "sram-layout.h"
#include "face.h"
#include "event.h"

#include "EAstdlib.h"

#include "sio_core.h"
#include "sio.h"
#include "constants/songs.h"

//! FE8U = 0x08048460
bool XMapTransfer_3(ProcPtr proc)
{
    u16 got;
    int i;
    u8 buf[4];
    u8 bufSenderId[4];

    int numTimeouts = 0;

    for (i = 0; i < 4; i++)
    {
        if (gSioSt->timeoutClock[i] > 60)
        {
            numTimeouts++;
        }
    }

    if (!Sio_CheckLinkAlive() || (gSioSt->unk_01E > 60) || (numTimeouts != 0))
    {
        Nop_Scene_0(proc, 0);
        return 0;
    }

    got = SioReceiveData(buf, bufSenderId, NULL);

    if (got != 0)
    {
        if (buf[0] != 0)
        {
            Nop_Scene_0(proc, 5);
        }

        return false;
    }

    return true;
}
