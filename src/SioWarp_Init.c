#include "global.h"
#include "sio.h"
#include "hardware.h"
#include "bmlib.h"
#include "mu.h"
#include "ap.h"
#include "soundwrapper.h"
#include "m4a.h"
#include "bmunit.h"
#include "ctc.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern u8 Img_LinkArenaWarpFx[];
extern u16 Pal_LinkArenaWarpFx[];

//! FE8U = 0x0804C02C
void SioWarp_Init(struct SioWarpProc * proc)
{
    Decompress(Img_LinkArenaWarpFx, (void *)(0x06004400));
    ApplyPalette(Pal_LinkArenaWarpFx, 3);

    proc->unk_40 = 0;

    if (proc->playStepSe)
    {
        StartPlayMuStepSe(0x7f, 2, proc->x * 8);
    }

    return;
}
