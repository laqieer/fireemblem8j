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

int SioMenu_GetItemHelpText(struct SioMenuProc * proc, int lineNum);

// clang-format on

//! FE8U = 0x08047C60
void SioMenu_0(struct SioMenuProc * proc)
{
    int i;

    int x = Interpolate(INTERPOLATE_RSQUARE, -80, gSioMenu_0[0], proc->unk_54, 32);
    int y = Interpolate(INTERPOLATE_RCUBIC, 160, gSioMenu_0[1], proc->unk_54, 32);

    for (i = 4; i >= 0; i--)
    {
        SioMenuItem_SetPosition(proc->menuItems[i], x, y);
    }

    if (proc->unk_54 >= 32)
    {
        proc->unk_54 = 0;

        PutSioText(SioMenu_GetItemHelpText(proc, 0), 0);
        PutSioText(SioMenu_GetItemHelpText(proc, 1), 1);

        Proc_Break(proc);
    }

    proc->unk_54++;

    return;
}
