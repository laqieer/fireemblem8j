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


void StartXMapTransfer(struct SioBigSendProc * proc)
{
    SetTextFont(&Font_0);
    InitSystemTextFont();

    if (gSioSt->selfId == 0)
    {
        ReadSramFast(CART_SRAM + SRAM_OFFSET_XMAP, gUnk_Sio_0, SRAM_SIZE_XMAP);
        StartSioBigSend(gUnk_Sio_0, SRAM_SIZE_XMAP, DrawXMapSendProgress, 0, proc);
    }
    else
    {
        StartSioBigReceive(gUnk_Sio_0, DrawXMapReceiveProgress, proc);
    }

    return;
}
