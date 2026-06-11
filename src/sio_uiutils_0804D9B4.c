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

//! FE8U = 0x0804CC14
void PutLinkArenaTeamSprites(int x, int y, int yMax, int yMin, int count, ProcPtr parent)
{
    struct LATeamSpriteDrawProc * proc;

    Proc_EndEach(ProcScr_LinkArenaTeamSpriteDraw);
    proc = Proc_Start(ProcScr_LinkArenaTeamSpriteDraw, parent);

    proc->numTeams = count;

    proc->xBase = x;
    proc->yBase = y;

    proc->yMin = yMin;
    proc->yMax = yMax;

    return;
}

//! FE8U = 0x0804CC5C
void ScrollMultiArenaTeamSprites(int amount)
{
    struct LATeamSpriteDrawProc * proc = Proc_Find(ProcScr_LinkArenaTeamSpriteDraw);
    proc->yBase += amount;

    return;
}

//! FE8U = 0x0804CC78
void UpdateNameEntrySpriteGlow(void)
{
    int r2;
    int i;

    u16 * ptr = gUnkData_11;

    if (gUnk_Sio_22 == 0)
    {
        r2 = (GetGameClock() % 0x20);
        r2 = r2 >> 1;

        for (i = 0; i < 5; i++)
        {
            PAL_OBJ_COLOR(9, 11 + i) = ptr[(r2 + i) & 0xf];
        }

        EnablePaletteSync();
    }

    return;
}
