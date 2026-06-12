#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"
#include "ctc.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxHammarneOBJ[];

// clang-format on

//! FE8U = 0x08062BAC
void StartSubSpell_efxHammarneOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxHammarneOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_EfxHammarneOBJ, AnimScr_EfxHammarneOBJ, AnimScr_EfxHammarneOBJ, AnimScr_EfxHammarneOBJ);

    SpellFx_RegisterObjPal(Pal_HammerneSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_SleepSprites, 32 * 2 * CHR_SIZE);

    return;
}
