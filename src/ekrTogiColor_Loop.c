#include "global.h"
#include "hardware.h"
#include "efxbattle.h"
#include "bmlib.h"
#include "bm.h"
#include "ekrbattle.h"
#include "constants/songs.h"

//! FE8U = 0x0805B394
void ekrTogiColor_Loop(struct ProcEfxBGCOL * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret > -1)
    {
        u16 ** pal = proc->pal;
        CpuFastCopy(*(pal + ret), gPaletteBuffer + 0x60, 0x80);
        EnablePaletteSync();
    }

    return;
}
