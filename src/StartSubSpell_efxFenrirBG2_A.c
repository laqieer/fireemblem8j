#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"
/* TU-private data externs bound at their JP addresses */
extern u16 * ImgArray_FenrirBg[];
extern struct ProcCmd ProcScr_efxFenrirBG2[];
extern u16 * TsaArray_FenrirBg[];

// clang-format on

//! FE8U = 0x08060CAC
void StartSubSpell_efxFenrirBG2_A(struct Anim * anim)
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
         3, 2,
         6, 2,
         7, 2,
         8, 2,
         9, 2,
        10, 2,
        11, 2,
         9, 2,
        12, 2,
        13, 2,
        14, 2,
        15, 2,
        16, 2,
        17, 2,
        15, 2,
        18, 2,
        19, 2,
        20, 2,
        21, 2,
        22, 2,
        23, 2,
        21, 2,
        24, 2,
        25, 2,
        26, 2,
        27, 2,
        28, 2,
        29, 2,
        27, 2,
        30, 2,
        31, 2,
        32, 2,
        33, 2,
        34, 2,
        35, 2,
        33, 2,
        36, 2,
        37, 2,
        38, 2,
        39, 2,
        40, 2,
        41, 2,
        39, 2,
        42, 2,
        43, 2,
        44, 2,
        45, 2,
        46, 2,
        47, 2,
        45, 2,
        46, 2,
        47, 2,
        45, 2,
        46, 2,
        47, 2,
        48, 1,
        49, 1,
        50, 1,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFenrirBG2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_FenrirBg;
    proc->tsar = TsaArray_FenrirBg;
    proc->img = ImgArray_FenrirBg;
    proc->pal = NULL;

    SpellFx_RegisterBgPal(Pal_FenrirBg, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    BG_SetPosition(BG_1, 0, 0);

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
