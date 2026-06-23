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
extern struct ProcCmd ProcScr_efxMaohFlashEyeFire1OBJ1[];
/* JP-specific AnimScr roots (UNNAMED in sym_jp) */
extern u32 AnimScr_MaohFlashEyeFire1OBJ1_0[];
extern u32 AnimScr_MaohFlashEyeFire1OBJ1_1[];
extern u16 Pal_DemonLightSprites_efxMaohFlashEyeFire[];
extern u16 Img_DemonLightSprites_efxMaohFlashEyeFire1OBJ[];

// clang-format on

//! FE8U = 0x08066FC4
void StartSubSpell_efxMaohFlashEyeFire1OBJ1(struct Anim * anim, int terminator, s16 x, s16 y)
{
    register int a asm("r0");
    u8 pos;
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    struct Anim * ref;

    u32 * scr;
    // clang-format off
    u32 * gUnknown_080DE900[2] =
    {
        AnimScr_MaohFlashEyeFire1OBJ1_0,
        AnimScr_MaohFlashEyeFire1OBJ1_1,
    };
    // clang-format on

    pos = GetAnimPosition(anim);

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMaohFlashEyeFire1OBJ1, PROC_TREE_3);
    proc->anim = GetAnimAnotherSide(anim);
    proc->timer = 0;
    proc->terminator = terminator;

    scr = gUnknown_080DE900[pos];

    frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;
    ref = frontAnim;

    if (pos != 0)
    {
        a = (efxMaohFlash_GetSideXOffset(pos) + DISPLAY_WIDTH);
        a = a - x;
    }
    else
    {
        a = x + efxMaohFlash_GetSideXOffset(0);
    }

    ref->xPosition = frontAnim->xPosition = a;
    proc->anim2->yPosition = frontAnim->yPosition = y;

    frontAnim->oam2Base &= ~OAM2_LAYER(3);
    frontAnim->oam2Base |= OAM2_LAYER(1);

    SpellFx_RegisterObjPal(Pal_DemonLightSprites_efxMaohFlashEyeFire, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_DemonLightSprites_efxMaohFlashEyeFire1OBJ, 32 * 4 * CHR_SIZE);

    return;
}
