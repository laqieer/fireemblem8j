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

//! FE8U = 0x0804CFB8
ProcPtr StartSioMenuBurstFx(ProcPtr parent, int x, int y)
{
    struct SioMenuBurstFxProc * proc = Proc_Start(ProcScr_SioMenuBurstFx, parent);

    proc->xBase = x;
    proc->yBase = y;
    proc->glowPalIdx = 0;

    // return proc; // BUG
}

//! FE8U = 0x0804CFE0
void LinkArenaMenuScroll_Init(struct LAMenuScrollBarProc * proc)
{
    proc->oam2Arrows[1] = 0;
    proc->oam2Arrows[0] = 0;

    proc->unk_38 = (proc->unk_34 * proc->unk_3d * 8) / proc->unk_3c;
    proc->unk_42 = (proc->unk_34 * 0x800) / (proc->unk_3c * 16);

    return;
}

// clang-format on

//! FE8U = 0x0804D01C
void LinkArenaMenuScroll_Loop(struct LAMenuScrollBarProc * proc)
{
    int i;
    int buf[2];

    int r8 = proc->xBase;
    int sl = proc->yBase + 8;
    int sp_10 = proc->unk_38 >> 3;
    int sp_14 = 8 - (proc->unk_38 & 7);
    int sp_18 = (proc->unk_3e * proc->unk_42) >> 8;

    if (proc->unk_3c > proc->unk_3d)
    {
        proc->oam2Arrows[0]++;
        proc->oam2Arrows[1]++;

        if (proc->unk_3e < proc->unk_40)
        {
            proc->oam2Arrows[0] += 2;
        }

        if (proc->unk_3e > proc->unk_40)
        {
            proc->oam2Arrows[1] += 2;
        }

        for (i = 0; i < 2; i++)
        {
            if (proc->oam2Arrows[i] > 48)
            {
                proc->oam2Arrows[i] = 0;
            }

            buf[i] = (proc->oam2Arrows[i] / 8) % 6;
        }

        if (proc->unk_3e != 0)
        {
            PutSprite(3, r8, sl - 9, Sprite_LAMenuScrollBar_DownArrow, buf[0]);
        }

        if (((proc->unk_3e / 16) + proc->unk_3d) < proc->unk_3c)
        {
            PutSprite(3, r8, proc->unk_34 * 8 + sl + 1, Sprite_LAMenuScrollBar_UpArrow, buf[1]);
        }

        // Put the "container" of the scroll bar

        for (i = 0; i < proc->unk_34; i++)
        {
            PutSprite(2, r8, sl + i * 8, Sprite_LinkArenaMenuScrollBar, 1);
        }

        // Put the active scroll bar segments

        for (i = 0; i < sp_10; i++)
        {
            PutSprite(2, r8, (sl + sp_18) + i * 8, Sprite_LinkArenaMenuScrollBar, 0);
        }

        // Put the "cap" of the scroll bar

        PutSprite(2, r8, (sl + sp_18) + (sp_10 * 8) - sp_14, Sprite_LinkArenaMenuScrollBar, 0);
        PutSprite(2, r8, sl - 8, Sprite_LinkArenaMenuScrollBar, 2);
        PutSprite(2, r8 + OAM1_VFLIP, proc->unk_34 * 8 + sl - 7, Sprite_LinkArenaMenuScrollBar, 2);

        proc->unk_40 = proc->unk_3e;
    }

    return;
}

// clang-format on

//! FE8U = 0x0804D1E0
void StartLinkArenaMenuScrollBar(int xBase, int yBase, u8 c, u8 d, u8 e, ProcPtr parent)
{
    struct LAMenuScrollBarProc * proc;

    Proc_EndEach(ProcScr_LinkArenaMenuScrollBar);
    proc = Proc_Start(ProcScr_LinkArenaMenuScrollBar, parent);

    proc->xBase = xBase;
    proc->yBase = yBase;

    proc->unk_34 = d * 2 - 2;

    proc->unk_3c = c;
    proc->unk_3d = d;
    proc->unk_3e = e;
    proc->unk_40 = e;

    return;
}
