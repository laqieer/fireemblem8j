#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern u16 * ImgArray_DivineBg[];
extern struct ProcCmd ProcScr_efxDivineBG[];
extern u16 * TsaArray_DivineBg[];

// clang-format on

//! FE8U = 0x0805FFB0
void StartSubSpell_efxDivineBG(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
         0, 2,
         1, 2,
         2, 2,
         3, 2,
         4, 2,
         5, 2,
         7, 1,
         5, 1,
         7, 1,
         5, 1,
         7, 1,
         5, 1,
         7, 1,
         6, 2,
         7, 2,
         8, 2,
         9, 2,
        10, 2,
        11, 2,
        12, 2,
        13, 2,
        14, 2,
        15, 2,
        16, 2,
        17, 2,
        18, 2,
        19, 2,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDivineBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;
    proc->tsal = TsaArray_DivineBg;
    proc->tsar = TsaArray_DivineBg;
    proc->img = ImgArray_DivineBg;

    SpellFx_RegisterBgPal(Pal_DivineBg, PLTT_SIZE_4BPP);

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE)
    {
        if (GetAnimPosition(proc->anim) == EKR_POS_L)
        {
            BG_SetPosition(BG_1, 232, 0);
        }
        else
        {
            BG_SetPosition(BG_1, 24, 0);
        }
    }

    SpellFx_SetSomeColorEffect();

    return;
}
