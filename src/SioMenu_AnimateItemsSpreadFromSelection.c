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
/* TU-private data externs bound at their JP addresses */
extern const u8 gSioMenu_0[];

//! FE8U = 0x08047CF0
void SioMenu_AnimateItemsSpreadFromSelection(struct SioMenuProc * proc)
{
    int i;

    int idx = proc->unk_48 * 2;

    for (i = 4; i >= 0; i--)
    {
        int x = Interpolate(
            INTERPOLATE_RSQUARE, gSioMenu_0[idx + 0], gSioMenu_0[i * 2 + 0], proc->unk_54, 16);
        int y = Interpolate(
            INTERPOLATE_RSQUARE, gSioMenu_0[idx + 1], gSioMenu_0[i * 2 + 1], proc->unk_54, 16);
        SioMenuItem_SetPosition(proc->menuItems[i], x, y);
    }

    if (proc->unk_54 >= 16)
    {
        Proc_Break(proc);
    }

    proc->unk_54++;

    return;
}
