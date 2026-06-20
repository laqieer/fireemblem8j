#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"

void efxRestRSTMain(struct ProcEfx *proc)
{
    u8 val1;
    int val2;
    u32 i;
    u16 *buf;

    if (gEkrBg1ScrollFlip == 0)
        buf = gpBg1ScrollOffsetList2;
    else
        buf = gpBg1ScrollOffsetList1;

    val1 = proc->step;
    proc->step += proc->speed;

    for (i = 0; i < 0x78; buf++, i++) {
        val1 += proc->unk48;
        *buf = (((gEfxutils_0[val1] * (int)proc->frame) << 8) >> 0x10) + gLCDControlBuffer.bgoffset[1].x;
    }

    if (++proc->timer == proc->unk44)
        Proc_End(proc);
}
