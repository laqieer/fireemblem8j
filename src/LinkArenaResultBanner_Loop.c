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
/* TU-private data externs bound at their JP addresses */
extern const u16 Sprite_SioUiutils_2[];

// clang-format on

//! FE8U = 0x0804D7B0
void LinkArenaResultBanner_Loop(struct SioProc85AABD8 * proc)
{
    if (proc->y > 30 && proc->y < 153)
    {
        PutSprite(4, proc->x, proc->y, Sprite_SioUiutils_2, 0);
        UpdateLinkArenaActiveBannerObjGlow();
    }

    return;
}
