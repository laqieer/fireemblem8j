#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern u16 * ImgArray_PurgeBg[];
extern u16 * PalArray_PurgeBg[];
extern struct ProcCmd ProcScr_efxPurgeBG[];
extern u16 * TsaArray_PurgeBg[];

// clang-format on

//! FE8U = 0x0805FC90
void StartSubSpell_efxPurgeBG(struct Anim * anim)
{
    // clang-format off
    const static u16 frames[] =
    {
         0, 1,
         1, 1,
         2, 1,
         3, 1,
         4, 1,
         5, 1,
         6, 1,
         7, 1,
         8, 1,
         9, 1,
        10, 1,
        11, 1,
        12, 1,
        13, 1,
        14, 1,
        15, 5,
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
        28, 1,
        29, 1,
        30, 1,
        31, 5,
        32, 1,
        33, 1,
        34, 1,
        35, 1,
        36, 1,
        37, 1,
        38, 1,
        39, 1,
        40, 1,
        41, 1,
        42, 1,
        43, 1,
        44, 1,
        45, 1,
        46, 1,
        47, 5,
        48, 1,
        49, 1,
        50, 1,
        51, 1,
        52, 1,
        53, 1,
        54, 1,
        55, 1,
        56, 1,
        57, 1,
        48, 1,
        49, 1,
        50, 1,
        51, 1,
        52, 1,
        53, 1,
        54, 1,
        55, 1,
        56, 1,
        57, 1,
        48, 1,
        49, 1,
        50, 1,
        51, 1,
        52, 1,
        53, 1,
        54, 1,
        55, 1,
        56, 1,
        57, 4,
        63, 2,
        64, 2,
        65, 2,
        66, 2,
        67, 2,
        68, 2,
        69, 2,
        70, 2,
        71, 2,
        72, 2,
        73, 2,
        74, 2,
        75, 2,
        76, 2,
        77, 2,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxPurgeBG, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_PurgeBg;
    proc->tsar = TsaArray_PurgeBg;
    proc->img = ImgArray_PurgeBg;
    proc->pal = PalArray_PurgeBg;

    SpellFx_SetSomeColorEffect();

    return;
}
