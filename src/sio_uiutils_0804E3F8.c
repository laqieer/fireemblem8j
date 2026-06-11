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

// clang-format on

//! FE8U = 0x0804D664
ProcPtr StartLinkArenaVersusSpriteDraw(int x, int y, ProcPtr parent)
{
    struct LAVersusSpriteDrawProc * proc;
    int i;

    Proc_EndEach(ProcScr_LAVersusSpriteDraw);
    proc = Proc_Start(ProcScr_LAVersusSpriteDraw, parent);

    proc->x = x;
    proc->yBase = y;
    proc->unk_34 = -1;
    proc->unk_38 = -1;

    for (i = 0; i < 4; i++)
    {
        proc->unk_3c[i] = 0x100;
    }

    return proc;
}

//! FE8U = 0x0804D6B4
void EndLinkArenaVersusSpriteDraw(void)
{
    Proc_EndEach(ProcScr_LAVersusSpriteDraw);
    return;
}

//! FE8U = 0x0804D6C4
ProcPtr GetLinkArenaVersusSpriteDraw(void)
{
    return Proc_Find(ProcScr_LAVersusSpriteDraw);
}

//! FE8U = 0x0804D6D4
void UpdateLinkArenaActiveBannerBgGlow(void)
{
    int idx;
    int i;

    u16 * ptr = Pal_LinkArenaActiveBannerFx;

    if (gUnk_Sio_22 == 0)
    {
        idx = GetGameClock() % 0x20;
        idx = idx >> 1;

        for (i = 0; i < 15; i++)
        {
            PAL_BG_COLOR(2, 1 + i) = ptr[(idx + i) & 15];
        }

        EnablePaletteSync();
    }

    return;
}

//! FE8U = 0x0804D724
void UpdateLinkArenaActiveBannerObjGlow(void)
{
    int idx;
    int i;

    u16 * ptr = Pal_LinkArenaActiveBannerFx;

    if (gUnk_Sio_22 == 0)
    {
        idx = GetGameClock() % 0x20;
        idx = idx >> 1;

        for (i = 0; i < 15; i++)
        {
            PAL_OBJ_COLOR(3, 1 + i) = ptr[(idx + i) & 15];
        }

        EnablePaletteSync();
    }

    return;
}
