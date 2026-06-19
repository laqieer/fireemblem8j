#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "hardware.h"
#include "proc.h"




void NewEfxPierceCriticalEffectBG(struct Anim * anim)
{
    struct ProcEfxBG * proc;
    proc = Proc_Start(ProcScr_efxPierceCriticalEffectBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    SpellFx_RegisterBgGfx(Img_EfxPierceCriticalEffectBG, 0x2000);
    SpellFx_RegisterBgPal(Pal_EfxPierceCriticalEffectBG, 0x20);
    SpellFx_WriteBgMap(proc->anim, TsaL_EfxPierceCriticalEffectBG, TsaR_EfxPierceCriticalEffectBG);
    SpellFx_SetSomeColorEffect();
}
