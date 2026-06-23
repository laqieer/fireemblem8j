#include "global.h"
#include "hardware.h"
#include "proc.h"
#include "ekrbattle.h"
#include "efxbattle.h"

void sub_806166C(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, (const s16 *)proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsal = proc->tsal;
        u16 ** tsar = proc->tsar;
        u16 ** img = proc->img;

        if (proc->pal != (u16 **)*(img + ret))
            SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);

        proc->pal = (u16 **)*(img + ret);
        SpellFx_WriteBgMap(proc->anim, *(tsal + ret), *(tsar + ret));
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
}
