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

//! FE8U = 0x08069400
void efxDarkGradoBG02_Loop_B(struct ProcEfxBG * proc)
{
    s16 ret;

    int x = proc->terminator >> 1;

    if (GetAnimPosition(proc->anim) != 0)
    {
        x = -x;
    }

    BG_SetPosition(BG_1, x, 0);

    proc->terminator++;

    ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsa = proc->tsal;
        u16 ** img = proc->img;
        SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
        SpellFx_WriteBgMapExt(proc->anim, *(tsa + ret), 0x20, 0x14);
    }
    else
    {
        if (ret == -1)
        {
            SpellFx_ClearBG1();
            gEfxBgSemaphore--;
            SetDefaultColorEffects_();
            Proc_Break(proc);
        }
    }

    return;
}
