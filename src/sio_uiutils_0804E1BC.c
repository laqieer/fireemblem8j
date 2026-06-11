#include "global.h"

#include "hardware.h"
#include "bm.h"
#include "bmlib.h"
#include "ctc.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "uiutils.h"
#include "prepscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "phasechangefx.h"

#include "sio_core.h"
#include "sio.h"

#include "constants/songs.h"

//! FE8U = 0x0804D428
void UpdateLinkArenaVersusBannerGlow(void)
{
    int idx;
    int i;

    u16 * ptr = Pal_LinkArenaActiveBannerFx;

    if (gUnk_Sio_22 == 0)
    {
        idx = (GetGameClock() % 0x20);
        idx = idx >> 1;

        for (i = 0; i < 15; i++)
        {
            PAL_OBJ_COLOR(9, 1 + i) = ptr[(idx + i) & 15];
        }

        EnablePaletteSync();
    }

    return;
}
