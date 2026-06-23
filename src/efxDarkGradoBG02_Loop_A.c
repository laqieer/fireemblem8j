#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"

void efxDarkGradoBG02_Loop_A(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsa = proc->tsal;
        u16 ** img = proc->img;
        u16 ** pal = proc->pal;

        SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
        SpellFx_RegisterBgPal(*(pal + ret), PLTT_SIZE_4BPP);
        SpellFx_WriteBgMapExt(proc->anim, *(tsa + ret), 0x20, 20);
    }
    else
    {
        if (ret == -6)
        {
            StartSubSpell_efxDarkGradoPalFlash();
            proc->frame++;
        }
        else if (ret == -1)
        {
            Proc_Break(proc);
        }
    }

    return;
}
