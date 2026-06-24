#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxIvaldiOBJ1[];
/* JP-specific AnimScr roots (UNNAMED in sym_jp) = fe8u AnimScr_EfxIvald_L1..R4 */
extern u32 AnimScr_EfxIvald_L1[];
extern u32 AnimScr_EfxIvald_R1[];
extern u32 AnimScr_EfxIvald_L2[];
extern u32 AnimScr_EfxIvald_R2[];
extern u32 AnimScr_EfxIvald_L3[];
extern u32 AnimScr_EfxIvald_R3[];
extern u32 AnimScr_EfxIvald_L4[];
extern u32 AnimScr_EfxIvald_R4[];

// clang-format on

//! FE8U = 0x08066258
void StartSubSpell_efxIvaldiOBJ1(struct Anim * anim, int terminator, s16 x, s16 y, u8 kind)
{
    struct ProcEfxOBJ * proc;
    u32 * scr;
    struct Anim * frontAnim;

    // clang-format off
    u32 * gUnknown_080DE5E4[6][2] =
    {
        {
            AnimScr_EfxIvald_L1,
            AnimScr_EfxIvald_R1,
        },
        {
            AnimScr_EfxIvald_L2,
            AnimScr_EfxIvald_R2,
        },
        {
            AnimScr_EfxIvald_L3,
            AnimScr_EfxIvald_R3,
        },
        {
            AnimScr_EfxIvald_L4,
            AnimScr_EfxIvald_R4,
        },
        {
            AnimScr_EfxIvald_L4,
            AnimScr_EfxIvald_R4,
        },
        {
            AnimScr_EfxIvald_L4,
            AnimScr_EfxIvald_R4,
        }
    };
    // clang-format on

    u8 pos = GetAnimPosition(anim);

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxIvaldiOBJ1, PROC_TREE_3);

    proc->anim = GetAnimAnotherSide(anim);
    proc->timer = 0;
    proc->terminator = terminator;

    switch (kind)
    {
        case 1:
            scr = gUnknown_080DE5E4[1][pos];
            break;

        case 2:
            scr = gUnknown_080DE5E4[2][pos];
            break;

        case 3:
            scr = gUnknown_080DE5E4[3][pos];
            break;

        case 4:
            scr = gUnknown_080DE5E4[4][pos];
            break;

        case 5:
            scr = gUnknown_080DE5E4[5][pos];
            break;

        case 0:
        default:
            scr = gUnknown_080DE5E4[0][pos];
            break;
    }

    frontAnim = EfxCreateFrontAnim(proc->anim, scr, scr, scr, scr);

    proc->anim2 = frontAnim;

    frontAnim->xPosition = x;
    frontAnim->yPosition = y;

    frontAnim->oam2Base &= ~0xC00;
    frontAnim->oam2Base |= 0x400;

    return;
}
