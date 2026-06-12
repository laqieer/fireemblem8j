#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"
#include "ctc.h"

// clang-format off



/* file-scope type definitions used by this run */


struct Proc085D84B4
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ s16 unk4C;
};

//! FE8U = 0x08068D20
void efxDarkGradoMapFadeOut_Loop(struct ProcEfx * proc)
{
    int ret = Interpolate(INTERPOLATE_SQUARE, 4, 16, proc->timer, 16);

    EfxPalBlackInOut(gPaletteBuffer, 6, 10, ret);
    EnablePaletteSync();

    proc->timer++;

    if (proc->timer == 17)
    {
        proc->timer = 0;
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}
