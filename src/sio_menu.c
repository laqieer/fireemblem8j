#include "global.h"

#include "bmsave.h"
#include "bmlib.h"
#include "face.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmio.h"
#include "uiutils.h"

#include "sio_core.h"
#include "sio.h"

#include "constants/faces.h"
#include "constants/msg.h"
#include "constants/songs.h"

//! FE8U = 0x08047EF8
void SioMenu_HandleDPadInput(struct SioMenuProc * proc, u8 b)
{
    if (proc->unk_48 == 1)
    {
        if ((gKeyStatusPtr->newKeys & DPAD_LEFT) != 0)
        {

            gLinkArenaSt.unk_05--;
            if (gLinkArenaSt.unk_05 > 2)
            {
                gLinkArenaSt.unk_05 = 2;
            }

            SioMenuItem_SetArrowConfig(proc->menuItems[1], -6, 0x34, 0x1f, 4);
            SioPlaySoundEffect(3);
        }

        if ((gKeyStatusPtr->newKeys & DPAD_RIGHT) != 0)
        {
            gLinkArenaSt.unk_05++;
            gLinkArenaSt.unk_05 = gLinkArenaSt.unk_05 % 3;

            SioMenuItem_SetArrowConfig(proc->menuItems[1], 0, 0x3a, 4, 0x1f);
            SioPlaySoundEffect(3);
        }
    }

    if (((gKeyStatusPtr->repeatedKeys & DPAD_UP) != 0) &&
        ((proc->unk_48 > proc->unk_4c) || (gKeyStatusPtr->repeatedKeys == gKeyStatusPtr->newKeys)))
    {
        do
        {
            proc->unk_48--;
            if (proc->unk_48 < 0)
            {
                proc->unk_48 = b - 1;
            }
        } while (proc->menuItemState[proc->unk_48] == 0);
    }

    if (((gKeyStatusPtr->repeatedKeys & DPAD_DOWN) != 0) &&
        ((proc->unk_48 < proc->unk_50) || (gKeyStatusPtr->repeatedKeys == gKeyStatusPtr->newKeys)))
    {
        do
        {
            proc->unk_48++;
            proc->unk_48 = proc->unk_48 % b;
        } while (proc->menuItemState[proc->unk_48] == 0);
    }
    return;
}

//! FE8U = 0x08047FF8
void SioMenu_Loop_HandleKeyInput(struct SioMenuProc * proc)
{
    int idx;

    idx = proc->unk_48;
    SioMenu_HandleDPadInput(proc, 5);

    if (idx != proc->unk_48)
    {
        struct SioMenuItemProc * child;

        SioPlaySoundEffect(3);

        child = proc->menuItems[idx];
        child->state = 1;

        child = proc->menuItems[proc->unk_48];
        child->state = 2;

        StartSioMenuBurstFx(child, child->xBase, child->yBase);

        PutSioText(SioMenu_GetItemHelpText(proc, 0), 0);
        PutSioText(SioMenu_GetItemHelpText(proc, 1), 1);
    }

    if ((gKeyStatusPtr->newKeys & A_BUTTON) != 0)
    {
        proc->unk_54 = 0;
        SioPlaySoundEffect(2);
        gLinkArenaSt.unk_00 = proc->unk_48;
        Proc_Break(proc);
    }

    if ((gKeyStatusPtr->newKeys & B_BUTTON) != 0)
    {
        SioPlaySoundEffect(1);
        Sound_FadeOutBGM(2);
        gLinkArenaSt.unk_00 = 0xff;
        Proc_Break(proc);
    }

    return;
}
