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

//! FE8U = 0x080480B4
void SioMenu_1(struct SioMenuProc * proc)
{
    int r2;
    int i;

    if (gLinkArenaSt.unk_00 == 0xFF)
    {
        Proc_Break(proc);
    }

    r2 = gLinkArenaSt.unk_00;

    if (proc->unk_54 <= 16)
    {
        for (i = 4; i >= 0; i--)
        {
            int x = Interpolate(
                INTERPOLATE_RSQUARE, gSioMenu_0[i * 2 + 0], gSioMenu_0[r2 * 2 + 0], proc->unk_54, 0x10);
            int y = Interpolate(
                INTERPOLATE_RSQUARE, gSioMenu_0[i * 2 + 1], gSioMenu_0[r2 * 2 + 1], proc->unk_54, 0x10);
            SioMenuItem_SetPosition(proc->menuItems[i], x, y);
        }
    }

    if (proc->unk_54 > 32)
    {
        Proc_Break(proc);
    }

    proc->unk_54++;

    return;
}
