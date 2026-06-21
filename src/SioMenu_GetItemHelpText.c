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

//! FE8U = 0x08047A54
int SioMenu_GetItemHelpText(struct SioMenuProc * proc, int lineNum)
{
    // clang-format off

    int linkMenuMsgLut[] =
    {
        0x6C1, -1,
        0x6C2, 0x6C3,
        0x6C4, -1,
        0x6C5, -1,
        0x6C6, -1,
    };

    // clang-format on

    if (lineNum == 0)
    {
        if (proc->unk_58 == 0)
        {
            return 0x6C0;
        }
    }
    else
    {
        if (proc->unk_58 == 0)
        {
            return -1;
        }
    }

    return linkMenuMsgLut[proc->unk_48 * 2 + lineNum];
}
