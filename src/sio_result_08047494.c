#include "global.h"

#include "hardware.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "bmsave.h"

#include "constants/msg.h"

#include "sio.h"

//! FE8U = 0x08047570
void SioResult_NewHS_LoopScroll(struct SioResultProc * proc)
{
    struct SioResultProcUnk2C * otherProc = proc->unk_2c;

    proc->unk_40++;

    if (proc->unk_40 < 60)
    {
        return;
    }

    if (proc->unk_35 == 5)
    {
        Proc_Break(proc);
    }

    if (proc->unk_38 >= 1)
    {
        proc->unk_36 -= 2;
        proc->unk_38--;

        BG_SetPosition(BG_1, 0, proc->unk_36);
        UpdateLinkArenaMenuScrollBar(10, proc->unk_36 + 56);

        otherProc->unk_30 += 2;
    }
    else
    {
        if (proc->unk_35 != proc->unk_34)
        {
            proc->unk_36 -= 2;
            proc->unk_34--;

            proc->unk_38 = 7;

            BG_SetPosition(BG_1, 0, proc->unk_36);
            UpdateLinkArenaMenuScrollBar(10, proc->unk_36 + 56);

            otherProc->unk_30 += 2;
        }

        if ((proc->unk_38 == 0) && (proc->unk_34 == proc->unk_35))
        {
            Proc_Break(proc);
        }
    }

    return;
}
