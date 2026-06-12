#include "global.h"
#include "anime.h"
#include "bmlib.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrclasschg.h"
#include "ekrdragon.h"
#include "efxmagic.h"
#include "hardware.h"
#include "proc.h"

extern EWRAM_OVERLAY(banim) struct ProcEkrClasschg * gpProcEkrClasschg;

void EfxClasschgBgMain(struct ProcEfxBG * proc)
{
    struct Anim * anim1 = GetAnimAnotherSide(proc->anim);
    int ret = EfxAdvanceFrameLut(&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsal = proc->tsal;
        u16 ** tsar = proc->tsar;
        u16 ** img  = proc->img;
        u16 ** pal  = proc->pal;

        SpellFx_RegisterBgGfx(img[ret], 0x2000);
        SpellFx_RegisterBgPal(pal[ret], 0x20);
        SpellFx_WriteBgMap(anim1, tsal[ret], tsar[ret]);
        return;
    }

    if (ret == -1)
    {
        SpellFx_ClearBG1();
        SetDefaultColorEffects_();
        Proc_End(proc);
        return;
    }
}
