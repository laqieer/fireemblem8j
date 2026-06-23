#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"

void EfxRestWINMain(struct ProcEfx *proc)
{
    u32 i;
    u16 val2;
    u16 *buf;
    s16 *buf2, *base;

    if (gEkrBg2ScrollFlip == 0)
        buf = gpBg2ScrollOffsetTable2;
    else
        buf = gpBg2ScrollOffsetTable1;

    base = proc->unk54;
    val2 = base[proc->step];
    buf2 = proc->unk58[val2];

    if (val2 != 0xFFFF) {
        proc->step++;
        for (i = 0; i < 0x78; buf2 = buf2 + 2, buf++, i++) {
            if (buf2[0] == 0x7FFF)
                buf[0] = 0;
            else {
                s16 tmp3 = buf2[0] + proc->unk32;
                s16 tmp4 = buf2[1] + proc->unk32;
                buf[0] = (tmp3 * 0x100) | tmp4;
            }
        }
    } else {
        for (i = 0; i < 0x78; i++)
            *buf++ = 0;
    }

    proc->timer++;
    if (proc->timer == proc->unk44) {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}
