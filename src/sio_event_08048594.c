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

//! FE8U = 0x0804867C
bool XMapTransfer_AwaitCompletion(void)
{
    if (IsSioBigTransferActive())
    {
        return true;
    }

    PlaySoundEffect(SONG_7E);

    InitTalkTextFont();

    if (gSioSt->selfId != 0)
    {
        WriteAndVerifySramFast(gUnk_Sio_0, CART_SRAM + SRAM_OFFSET_XMAP, SRAM_SIZE_XMAP);
    }

    return false;
}
