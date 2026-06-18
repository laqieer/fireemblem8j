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

/* prototypes for same-file helpers called by this run */
void PutXMapProgressPercent(struct Text * th, const char * str, int number);

//! FE8U = 0x08048594
void DrawXMapSendProgress(struct SioBigSendProc * proc)
{
    if (proc->unk_3C < proc->completionPercent)
    {
        PlaySoundEffect(SONG_7D);
        proc->unk_3C++;

        PutXMapProgressPercent(&gUnk_Sio_7[0], "受信中" /* "Receiving" */, proc->unk_3C);
        DrawStatBarGfx(
            0x100, 0xe, TILEMAP_LOCATED(gBG0TilemapBuffer, 14, 15), 0x6000, 100, proc->unk_3C, 100 - proc->unk_3C);
        BG_EnableSyncByMask(BG0_SYNC_BIT);
    }

    return;
}
