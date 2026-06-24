#include "global.h"
#include "hardware.h"
#include "proc.h"
#include "gba/syscall.h"
#include "ekrbattle.h"
#include "efxbattle.h"

void sub_8055F90(struct ProcEfxBG * proc)
{
    u16 * tsa_buf = &gEkrTsaBuffer[0x1000];
    s16 ret = EfxAdvanceFrameLut(&proc->timer, (s16 *)&proc->frame, (const s16 *)proc->frame_config);

    if (ret >= 0)
    {
        LZ77UnCompWram(proc->tsal[ret], tsa_buf);
        EfxTmCpyBG(tsa_buf, gBG3TilemapBuffer, 0x1E, 0x14, 6, 0);
        BG_EnableSyncByMask(BG3_SYNC_BIT);
    }

    if (proc->unk29 == 2)
    {
        BG_Fill(gBG3TilemapBuffer, 0x601F);
        BG_EnableSyncByMask(BG3_SYNC_BIT);
        EfxPalBlackInOut(gPaletteBuffer, 6, 0xA, 0x10);
        EnablePaletteSync();
        Proc_Break(proc);
    }
}
