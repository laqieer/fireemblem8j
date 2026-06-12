#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern u16 * ImgArray_EvilEyeBg2[];
extern u16 * PalArray_EvilEyeBg2[];
extern struct ProcCmd ProcScr_efxEvilEyeBG2[];
extern u16 * TsaArray_EvilEyeBg2_Close[];
extern u16 * TsaArray_EvilEyeBg2_Far[];

// clang-format on

//! FE8U = 0x08067984
void StartSubSpell_efxEvilEyeBG2(struct Anim * anim)
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
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxEvilEyeBG2, PROC_TREE_3);
    proc->anim = GetAnimAnotherSide(anim);
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE)
    {
        proc->tsal = TsaArray_EvilEyeBg2_Far;
        proc->tsar = TsaArray_EvilEyeBg2_Far;
    }
    else
    {
        proc->tsal = TsaArray_EvilEyeBg2_Close;
        proc->tsar = TsaArray_EvilEyeBg2_Close;
    }

    proc->img = ImgArray_EvilEyeBg2;
    proc->pal = PalArray_EvilEyeBg2;

    SpellFx_RegisterBgPal(Pal_EvilEyeBg2_A, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            BG_SetPosition(BG_1, 232, 0);
        }
        else
        {
            BG_SetPosition(BG_1, 24, 0);
        }
    }

    return;
}
