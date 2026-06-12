#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"

struct Proc085D8CE4
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ s16 unk4C;
};

//! FE8U = 0x0806C154
void EfxmagicDemonsurgeFlash_Loop_White(struct Proc085D8CE4 * proc)
{
    u16 * src;
    int i;
    int j;

    u16 * src_ = gEfxPal;

    for (i = 0, src = gEfxPal; i < 0x20; i++)
    {
        src_++;
        for (j = 0; j < 0xf; j++)
        {
            *src_ = 0x00007FFF;
            src_++;
        }
    }

    CpuFastCopy(src, (void *)PLTT, 0x400);
    DisablePaletteSync();

    if (proc->unk4C == 8)
    {
        proc->unk4C = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->unk4C++;
    }

    return;
}
