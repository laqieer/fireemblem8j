#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxNaglfarOBJ2[];
/* JP-specific AnimScr roots (UNNAMED in sym_jp) */
extern u32 AnimScr_efxNaglfarOBJ2_0[];
extern u32 AnimScr_efxNaglfarOBJ2_1[];
extern u32 AnimScr_efxNaglfarOBJ2_2[];
extern u32 AnimScr_efxNaglfarOBJ2_3[];

// clang-format on

//! FE8U = 0x0806823C
void StartSubSpell_efxNaglfarOBJ2(struct Anim * anim, int terminator, u8 c)
{
    u8 pos;
    struct ProcEfxOBJ * proc;
    u32 * scr;
    struct Anim * frontAnim;

    // clang-format off
    u32 * gUnknown_080DEC30[4] =
    {
        AnimScr_efxNaglfarOBJ2_0, AnimScr_efxNaglfarOBJ2_2,
        AnimScr_efxNaglfarOBJ2_1, AnimScr_efxNaglfarOBJ2_3,
    };
    // clang-format on

    pos = GetAnimPosition(anim);
    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxNaglfarOBJ2, PROC_TREE_3);
    proc->anim = GetAnimAnotherSide(anim);
    proc->timer = 0;
    proc->terminator = terminator;

    scr = gUnknown_080DEC30[((pos * 4) + (c * 8)) >> 2];
    frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;
    frontAnim->yPosition += 24;

    SpellFx_RegisterObjPal(Pal_NaglfarSprites_B, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_NaglfarSprites_B, 32 * 4 * CHR_SIZE);

    return;
}
