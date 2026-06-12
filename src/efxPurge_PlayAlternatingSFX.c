#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

//! FE8U = 0x0805FB24
void efxPurge_PlayAlternatingSFX(int location, int type)
{
    if (gEfxlvup_0 & 1)
    {
        PlaySFX(0xfe, 0x100, location, type);
    }
    else
    {
        PlaySFX(0xff, 0x100, location, type);
    }

    gEfxlvup_0++;

    return;
}
