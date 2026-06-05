#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"

// clang-format off



//! FE8U = 0x08063E74
void efxLunaBG2_Loop(struct ProcEfxBG * proc)
{
    gLCDControlBuffer.bgoffset[BG_1].y++;

    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        Proc_Break(proc);
    }

    return;
}
