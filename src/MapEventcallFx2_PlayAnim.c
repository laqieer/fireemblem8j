#include "global.h"
#include "mu.h"
#include "proc.h"
#include "hardware.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "ap.h"
#include "ctc.h"
#include "bmio.h"
#include "rng.h"
#include "bmlib.h"
#include "mapanim.h"
#include "bm.h"
#include "bmudisp.h"
#include "bmmap.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern const u32 gMapanimEventcall_3[];

// clang-format on

void MapEventcallFx2_PlayAnim(struct MAEffectProc* proc)
{
    if (proc->timer == 0)
    {
        struct Proc8080050* vsync;
        u8 v0 = gMapanimEventcall_5[proc->frame].unk00;

        Decompress(
            gMapanimEventcall_16[v0].img,
            (void*) VRAM + gMapanimEventcall_3[proc->unk44] * 0x20);

        Decompress(
            gMapanimEventcall_16[v0].tsa,
            gGenericBuffer);

        AddAttr2dBitMap(
            gBG2TilemapBuffer,
            (u16*) gGenericBuffer,
            0, 0,
            gMapanimEventcall_3[proc->unk44] | (gMapanimEventcall_4[proc->unk44] << 12));

        BG_EnableSyncByMask(BG2_SYNC_BIT);

        ApplyPalette(
            gMapanimEventcall_16[v0].pal,
            gMapanimEventcall_4[proc->unk44]);

        EnablePaletteSync();

        vsync = (void*) Proc_Find(ProcScr_MapanimEventcall_3);

        vsync->unk29 = 1;
        vsync->unk2A = gMapanimEventcall_5[proc->frame].unk02;

        if (proc->frame == 0)
            PlaySeSpacial(SONG_13F, proc->xDisplay);

        proc->timer = gMapanimEventcall_5[proc->frame].unk01;

        if (proc->frame > 6)
        {
            vsync->unk29 = 1;
            vsync->unk2A = 0;

            proc->frame = 0;

            Proc_Break(proc);
        }
        else
        {
            proc->frame++;
            proc->unk44 ^= 1;
        }
    }

    proc->timer--;
}
