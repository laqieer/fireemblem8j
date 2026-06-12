#include "global.h"

#include "hardware.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "bmsave.h"

#include "constants/msg.h"

#include "sio.h"

//! FE8U = 0x0804720C
void SioResult_Loop_Main(struct SioResultProc * proc)
{
    if (proc->unk_38 >= 1)
    {
        proc->unk_36 -= 4;
        proc->unk_38--;

        BG_SetPosition(BG_1, 0, proc->unk_36);
        UpdateLinkArenaMenuScrollBar(10, proc->unk_36 + 56);

        return;
    }

    if (proc->unk_38 < 0)
    {
        proc->unk_36 += 4;
        proc->unk_38++;

        BG_SetPosition(BG_1, 0, proc->unk_36);
        UpdateLinkArenaMenuScrollBar(10, proc->unk_36 + 56);

        return;
    }

    if (((gKeyStatusPtr->repeatedKeys & DPAD_UP) != 0) && (proc->unk_34 != 0))
    {
        SioPlaySoundEffect(3);

        proc->unk_36 -= 4;
        proc->unk_34--;

        proc->unk_38 = 3;

        BG_SetPosition(BG_1, 0, proc->unk_36);
        UpdateLinkArenaMenuScrollBar(10, proc->unk_36 + 56);
    }

    if (((gKeyStatusPtr->repeatedKeys & DPAD_DOWN) != 0) && (proc->unk_34 + 5 < 10))
    {
        SioPlaySoundEffect(3);

        proc->unk_36 += 4;
        proc->unk_34++;

        proc->unk_38 = -3;

        BG_SetPosition(BG_1, 0, proc->unk_36);
        UpdateLinkArenaMenuScrollBar(10, proc->unk_36 + 56);
    }

    if ((gKeyStatusPtr->newKeys & B_BUTTON) != 0)
    {
        SioPlaySoundEffect(1);
        Proc_Break(proc);
    }

    return;
}
