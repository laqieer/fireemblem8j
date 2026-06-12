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
extern u16 * ImgArray_DemonLightBg1_Close[];
extern u16 * ImgArray_DemonLightBg1_Far[];
extern u16 * PalArray_DemonLightBg1_Close[];
extern u16 * PalArray_DemonLightBg1_Far[];
extern struct ProcCmd ProcScr_efxMaohFlashBG1[];
extern u16 * TsaArray_DemonLightBg1_Close[];
extern u16 * TsaArray_DemonLightBg1_Far[];

// clang-format on

//! FE8U = 0x080666D0
void StartSubSpell_efxMaohFlashBG1(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
        0, 4,
        1, 4,
        2, 4,
        3, 4,
        4, 4,
        5, 4,
        6, 4,
        7, 4,
        8, 4,
        9, 4,
        10, 4,
        11, 4,
        12, 4,
        13, 4,
        14, 4,
        15, 4,
        16, 6,
        17, 6,
        18, 6,
        19, 6,
        20, 5,
        21, 5,
        22, 5,
        23, 5,
        24, 4,
        25, 4,
        26, 4,
        27, 4,
        28, 3,
        29, 3,
        30, 3,
        31, 3,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMaohFlashBG1, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE)
    {
        proc->tsal = TsaArray_DemonLightBg1_Far;
        proc->tsar = TsaArray_DemonLightBg1_Far;
        proc->img = ImgArray_DemonLightBg1_Far;
        proc->pal = PalArray_DemonLightBg1_Far;
    }
    else
    {
        proc->tsal = TsaArray_DemonLightBg1_Close;
        proc->tsar = TsaArray_DemonLightBg1_Close;
        proc->img = ImgArray_DemonLightBg1_Close;
        proc->pal = PalArray_DemonLightBg1_Close;
    }

    BG_SetPosition(BG_1, 0, 0);
    SpellFx_SetSomeColorEffect();

    return;
}
