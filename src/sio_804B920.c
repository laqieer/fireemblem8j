#include "global.h"

#include "hardware.h"
#include "bmlib.h"

#include "sio.h"

//! FE8U = 0x0804B938
void Sio_DisableWindowAndBlend(void)
{
    SetWinEnable(0, 0, 0);
    SetBlendConfig(0, 0, 0, 0);
    return;
}

//! FE8U = 0x0804B964
void Sio_BoxTransitionHBlankHandler(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount > DISPLAY_HEIGHT)
    {
        gUnk_Sio_5 = gUnk_Sio_3;
        vcount = 0;
    }

    REG_WIN1H = (gUnk_Sio_5[vcount * 2 + 0] << 8) + gUnk_Sio_5[vcount * 2 + 1];

    return;
}

//! FE8U = 0x0804B9A4
void Sio_SwapBoxTransitionBuffers(void)
{
    s16 * swap = gUnk_Sio_3;
    gUnk_Sio_3 = gUnk_Sio_4;
    gUnk_Sio_4 = swap;

    return;
}

//! FE8U = 0x0804B9BC
void Sio_EndBoxTransitionHBlank(void)
{
    SetWinEnable(0, 0, 0);
    SetPrimaryHBlankHandler(NULL);
    return;
}
