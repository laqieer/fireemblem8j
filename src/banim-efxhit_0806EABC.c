#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "hardware.h"
#include "proc.h"

/**
 * Hit effect for normal atk, pierce and ctr atk
 */

extern CONST_DATA struct ProcCmd ProcScr_efxDamageMojiEffect[];

void NewEfxCriricalEffectBG(struct Anim * anim)
{
    struct ProcEfxBG * proc;
    proc = Proc_Start(ProcScr_efxCriricalEffectBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    SpellFx_RegisterBgGfx(Img_EfxCriricalEffectBG, 0x2000);
    SpellFx_RegisterBgPal(Pal_EfxCriricalEffectBG, 0x20);
    SpellFx_WriteBgMap(proc->anim, Tsa_EfxCriricalEffectBG_L, Tsa_EfxCriricalEffectBG_R);
    SpellFx_SetSomeColorEffect();
}
