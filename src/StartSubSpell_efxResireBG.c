#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern u16 * ImgArray_NosferatuBg[];
extern struct ProcCmd ProcScr_efxResireBG[];
extern u16 * TsaArray_NosferatuBg[];

// clang-format on

//! FE8U = 0x0805F4B0
void StartSubSpell_efxResireBG(struct Anim * anim, int type)
{
    // clang-format off
    static const u16 frames[] =
    {
         1, 3,
         2, 2,
         3, 2,
         4, 2,
         5, 2,
         6, 2,
         7, 1,
         8, 1,
         9, 1,
        10, 1,
        11, 1,
        12, 1,
        13, 1,
        14, 1,
        15, 1,
        16, 1,
        17, 1,
        18, 1,
        19, 1,
        20, 1,
        21, 1,
        22, 1,
        23, 1,
        24, 1,
        25, 1,
        26, 1,
        27, 1,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxResireBG, PROC_TREE_3);
    proc->anim = anim;
    proc->unk29 = type;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;
    proc->tsal = TsaArray_NosferatuBg;
    proc->tsar = TsaArray_NosferatuBg;
    proc->img = ImgArray_NosferatuBg;

    SpellFx_RegisterBgPal(Pal_NosferatuBg, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE)
    {
        if (GetAnimPosition(proc->anim) == EKR_POS_L)
        {
            BG_SetPosition(BG_1, 24, 0);
        }
        else
        {
            BG_SetPosition(BG_1, 232, 0);
        }
    }

    return;
}
