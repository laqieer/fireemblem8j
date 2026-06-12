#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"

void DummvRSTMain(struct ProcEfx *proc)
{
    u32 i;
    u16 *buf;

    if (gEkrBg1ScrollFlip == 0)
        buf = gpBg1ScrollOffsetList2;
    else
        buf = gpBg1ScrollOffsetList1;

    for (i = 0; i < 0x78; i++)
        buf[i] = gLCDControlBuffer.bgoffset[1].x;

    if (++proc->timer == proc->unk44)
        Proc_End(proc);
}
