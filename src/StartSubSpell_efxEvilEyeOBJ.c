#include "global.h"
extern const struct ProcCmd ProcScr_efxEvilEyeOBJ[];
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format on

//! FE8U = 0x08067AA0
void StartSubSpell_efxEvilEyeOBJ(struct Anim * anim, int terminator)
{
    u8 pos;
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    u32 * scr;

    // clang-format off
    u32 * gUnknown_080DEA74[2] =
    {
        AnimScr_Banim_0,
        AnimScr_Banim_1,
    };
    // clang-format on

    pos = GetAnimPosition(anim);

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxEvilEyeOBJ, PROC_TREE_3);
    proc->anim = GetAnimAnotherSide(anim);
    proc->timer = 0;
    proc->terminator = terminator;

    scr = gUnknown_080DEA74[pos];

    frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;
    frontAnim->yPosition += 24;
    frontAnim->timer = 0;
    frontAnim->drawLayerPriority = 20;

    AnimSort();

    SpellFx_RegisterObjPal(Pal_Banim_6, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_Banim_15, 32 * 4 * CHR_SIZE);

    return;
}
