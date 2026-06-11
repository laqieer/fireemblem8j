#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "mu.h"
#include "bmudisp.h"
#include "bmmap.h"
#include "ctc.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxLiveOBJ[];
extern struct ProcCmd ProcScr_efxReserveOBJ[];

// clang-format on

//! FE8U = 0x0806196C
void StartSubSpell_efxLiveOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxLiveOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 51;

    proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_EfxLiveOBJ1, AnimScr_EfxLiveOBJ1, AnimScr_EfxLiveOBJ1, AnimScr_EfxLiveOBJ1);

    SpellFx_RegisterObjPal(Pal_HealSprites_Sparkles, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_HealSprites_Sparkles, 32 * 4 * CHR_SIZE);

    return;
}

// clang-format on

//! FE8U = 0x080619CC
void StartSubSpell_efxReserveOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxReserveOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 51;
    proc->unk30 = 52;

    proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_EfxLiveOBJ1, AnimScr_EfxLiveOBJ1, AnimScr_EfxLiveOBJ1, AnimScr_EfxLiveOBJ1);

    SpellFx_RegisterObjPal(Pal_HealSprites_Sparkles, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_HealSprites_Sparkles, 32 * 4 * CHR_SIZE);

    return;
}
