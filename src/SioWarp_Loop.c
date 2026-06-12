#include "global.h"
#include "sio.h"
#include "hardware.h"
#include "bmlib.h"
#include "mu.h"
#include "ap.h"
#include "soundwrapper.h"
#include "m4a.h"
#include "bmunit.h"
#include "ctc.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern u16 gMapanimBattleinfo_0[];

// clang-format on

//! FE8U = 0x0804C078
void SioWarp_Loop(struct SioWarpProc * proc)
{
    PutTmAnimFrame(
        gBG2TilemapBuffer, proc->x - 1, proc->y - 3, 0x3220, 4, 6, gMapanimBattleinfo_0,
        gSioMu_0[proc->unk_40]);

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    proc->unk_40++;

    if (gSioMu_0[proc->unk_40] == 0xFF)
    {
        Proc_Break(proc);
    }

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 0;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 3;

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(1, 1, 0, 1, 1);

    SetBlendAlpha(12, 12);

    return;
}
