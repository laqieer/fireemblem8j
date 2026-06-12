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

//! FE8U = 0x08048418
void XMapTransfer_2(ProcPtr proc)
{
    u8 buf[4];

    if (GetTalkChoiceResult() == 1)
    {
        gUnk_Sio_15 = 0;
    }
    else
    {
        gUnk_Sio_15 = 1;
    }

    buf[0] = gUnk_Sio_15;
    SioEmitData(buf, sizeof(buf));

    if (gUnk_Sio_15 != 0)
    {
        Nop_Scene_0(proc, 5);
    }

    return;
}
