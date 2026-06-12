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
extern const u16 Sprite_SioMenuBurst_BottomLeft[];
extern const u16 Sprite_SioMenuBurst_BottomRight[];
extern const u16 Sprite_SioMenuBurst_TopLeft[];
extern const u16 Sprite_SioMenuBurst_TopRight[];
extern const s16 gSioUiutils_1[];

// clang-format on

//! FE8U = 0x0804CF04
void SioMenuBurstFx_Loop(struct SioMenuBurstFxProc * proc)
{
    int idx;
    int x;
    int y;
    int r1;

    idx = proc->glowPalIdx * 2;

    UpdateSioMenuBurstGlow(proc->glowPalIdx);

    x = gSioUiutils_1[idx + 1];
    r1 = proc->xBase - x;

    y = gSioUiutils_1[idx + 0];

    PutSprite(2, r1, proc->yBase - y, Sprite_SioMenuBurst_TopLeft, 0);
    PutSprite(2, proc->xBase + x + 16, proc->yBase - y, Sprite_SioMenuBurst_TopRight, 0);
    PutSprite(2, proc->xBase - x, proc->yBase + y, Sprite_SioMenuBurst_BottomLeft, 0);
    PutSprite(2, proc->xBase + x + 16, proc->yBase + y, Sprite_SioMenuBurst_BottomRight, 0);

    proc->glowPalIdx++;

    if (proc->glowPalIdx == 15)
    {
        Proc_Break(proc);
    }

    return;
}
